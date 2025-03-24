using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using System.Data;

namespace Datos
{
    public class DatosMedico
    {
        AccesoDatos ds = new AccesoDatos();

        public DatosMedico()
        {

        }

        public DataTable ObtenerTablaMedicos()
        {
            DataTable tabla = ds.CargarTabla("select m.Legajo,m.DNI,m.Nombre,m.Apellido,s.Descripcion as Sexo,m.Nacionalidad, FORMAT(m.FechaDeNacimiento, 'dd/MM/yyyy') as 'Fecha de nacimiento',m.Direccion,l.Nombre as Localidad, p.Nombre as Provincia, m.CorreoElectronico as 'Correo Electronico',m.Telefono,m.Usuario,m.Contraseña,e.Nombre as Especialidad,m.Horario_inicio as 'Inicio de jornada', m.Horario_Fin as 'Fin de jornada' from (((MEDICOS as m inner join SEXOS as s on m.ID_Sexo = s.ID)inner join ESPECIALIDADES as e on m.Cod_Especialidad = e.Codigo)inner join PROVINCIAS as p on m.Cod_Provincia = p.Codigo)inner join LOCALIDADES as l on m.Cod_Localidad = l.Codigo where Activo != 0 ", "Medicos");
            return tabla;
        }

        public DataTable ObtenerTablaMedicos(string consulta)
        {
            DataTable tabla = ds.CargarTabla(consulta, "Medicos");
            return tabla;
        }

        public DataTable ObtenerMedicosPorEspecialidad(Especialidad especialidad)
        {
            string codigo = new string(especialidad.Codigo);
            DataTable tabla = ds.CargarTabla("select * from Medicos where Cod_Especialidad = '" + codigo + "' and Activo !=0", "Medicos");
            return tabla;
        }

        public Medico CargarMedico(Medico Med, DataTable tabla)
        {
            Utilidades uti = new Utilidades();
                Med.Legajo = uti.dividirCadenaEn4(tabla.Rows[0][0].ToString());
            Med.Dni = uti.dividirCadenaEn8(tabla.Rows[0][1].ToString());
            Med.Nombre = tabla.Rows[0][2].ToString();
            Med.Apellido = tabla.Rows[0][3].ToString();
            Med.ID_Sexo_ME = int.Parse(tabla.Rows[0][4].ToString());
            Med.Nacionalidad = tabla.Rows[0][5].ToString();
            Med.FechaDeNacimiento = DateTime.Parse(tabla.Rows[0][6].ToString());
            Med.Direccion = tabla.Rows[0][7].ToString();
            Med.Cod_Localidad_ME = uti.dividirCadenaEn4(tabla.Rows[0][8].ToString());
            Med.Cod_Provincia_ME = uti.dividirCadenaEn2(tabla.Rows[0][9].ToString());
            Med.CorreoElectronico = tabla.Rows[0][10].ToString();
            Med.Telefono = tabla.Rows[0][11].ToString();
            Med.Usuario = tabla.Rows[0][12].ToString();
            Med.Contraseña = tabla.Rows[0][13].ToString();
            Med.Cod_Especialidad_ME = uti.dividirCadenaEn4(tabla.Rows[0][14].ToString());
            Med.HorarioInicio = TimeSpan.Parse(tabla.Rows[0][15].ToString());
            Med.HorarioFin = TimeSpan.Parse(tabla.Rows[0][16].ToString());
            Med.Activo = bool.Parse(tabla.Rows[0][17].ToString());
            return Med;
        }

        public Medico ObtenerMedicoEspecifico(Medico medico, int variacion)
        {
            DataTable tabl;
            if (variacion == 0)
            {
                tabl = ds.CargarTabla("select * from MEDICOS where Usuario ='" + medico.Usuario.ToString() + "' and Activo != 0", "Medico");
            }
            else
            {
                string legajo = new string(medico.Legajo);
                tabl = ds.CargarTabla("select * from MEDICOS where Legajo ='" + legajo + "' and Activo != 0", "Medico");
            }
            return CargarMedico(medico, tabl);
        }



        public bool ExisteMedico(Medico med)
        {
            string legajo = new string(med.Legajo);
            
            string consulta = "select Legajo from Medicos where Legajo='" + legajo + "'";
            if (ds.Existe(consulta) == false)
            {
                string dni = new string(med.Dni);
                consulta = "select DNI from Medicos where DNI='" + dni + "'";
                return ds.Existe(consulta);
            }
            else
            {
                return true;
            }
        }

        public bool ExisteDNI(string dni, string legajo)
        {
            return ds.Existe("select * from MEDICOS where DNI ='" + dni + "' and Legajo != '"+legajo+"'");
        }

        public bool AgregarMedico(Medico med)
        {
            bool exito = false;
            if (!ExisteMedico(med))
            {
                string legajo = new string(med.Legajo);
                string dni = new string(med.Dni);
                string cod_Prov = new string(med.Cod_Provincia_ME);
                string cod_Loc = new string(med.Cod_Localidad_ME);
                string cod_Especialidad = new string(med.Cod_Especialidad_ME);


                string consulta = "insert into MEDICOS(Legajo, DNI, Nombre, Apellido, ID_Sexo, Nacionalidad, FechaDeNacimiento, Direccion, Cod_Localidad, Cod_Provincia, CorreoElectronico, Telefono, Usuario, Contraseña, Cod_Especialidad, Horario_Inicio, Horario_Fin, Activo) VALUES('"+legajo+"', '"+ dni + "', '"+med.Nombre.ToString() + "', '"+med.Apellido.ToString()+"', '"+med.ID_Sexo_ME.ToString()+"', '"+med.Nacionalidad.ToString()+ "', CONVERT(DATE, '" + med.FechaDeNacimiento.ToString() + "', 103), '" + med.Direccion.ToString()+ "', '"+ cod_Loc + "', '"+ cod_Prov + "', '"+med.CorreoElectronico.ToString()+"', '"+med.Telefono.ToString()+"', '"+med.Usuario.ToString()+"', '"+med.Contraseña.ToString()+"', '"+ cod_Especialidad + "', '"+med.HorarioInicio.ToString()+"', '"+med.HorarioFin.ToString()+"', '"+med.Activo.ToString()+"')";
                int fueAgregado = ds.EjecutarConsulta(consulta);
                if(fueAgregado != 0) { exito = true; }
            }
            return exito;
        }


        public bool MedicoActivo(Medico med)
        {
                string legajo = new string(med.Legajo);
                string consulta = "select Legajo from MEDICOS where Legajo='" + legajo + "' and Activo != 0";
                return ds.Existe(consulta);
        }


        public bool EliminarMedicos(string[] Legajos)
        {
            bool exito = false;
            bool flagPrimera = true;
            string consulta = "update MEDICOS set Activo = 0   ";
            Medico medicoObj = new Medico();
            Utilidades uti = new Utilidades();
            foreach(string legajoInd in Legajos)
            {
                medicoObj.Legajo = uti.dividirCadenaEn4(legajoInd);
                if (ExisteMedico(medicoObj) && MedicoActivo(medicoObj))
                {
                    string legajoConsulta = new string(medicoObj.Legajo);
                    if (flagPrimera)
                    {
                        consulta += "where Legajo = '" + legajoConsulta + "' ";
                        flagPrimera = false;
                    }
                    else consulta += "or Legajo = '" + legajoConsulta + "' ";
                    
                }
                int fueEliminado = ds.EjecutarConsulta(consulta);
                if (fueEliminado != 0) { exito = true; }
            }

            
            return exito;
        }

        public bool ActualizarMedico(Medico med)
        {
            bool exito = false;
            if (ExisteMedico(med) && MedicoActivo(med))
            {
                string legajo = new string(med.Legajo);
                string dni = new string(med.Dni);
                string cod_Prov = new string(med.Cod_Provincia_ME);
                string cod_Loc = new string(med.Cod_Localidad_ME);
                string cod_Especialidad = new string(med.Cod_Especialidad_ME);
                string nacimiento = med.FechaDeNacimiento.ToString("yyyy/MM/dd");

                string consulta = "update MEDICOS set DNI = '"+ dni + "',Nombre = '"+med.Nombre.ToString()+"',Apellido = '"+med.Apellido.ToString()+"',ID_Sexo = '"+med.ID_Sexo_ME.ToString()+"',Nacionalidad = '"+med.Nacionalidad.ToString()+"',FechaDeNacimiento = '"+nacimiento+"',Direccion = '"+med.Direccion.ToString()+"',Cod_Localidad = '"+cod_Loc+"',Cod_Provincia = '"+ cod_Prov + "',CorreoElectronico = '"+med.CorreoElectronico.ToString()+"',Telefono = '"+med.Telefono.ToString()+"',Usuario = '"+med.Usuario.ToString()+"',Contraseña = '"+med.Contraseña.ToString()+"',Cod_Especialidad = '"+cod_Especialidad+"',Horario_inicio = '"+med.HorarioInicio.ToString()+"',Horario_Fin = '"+med.HorarioFin.ToString()+"' where Legajo = '" + legajo + "'";
                int fueActualizado = ds.EjecutarConsulta(consulta);
                if(fueActualizado != 0) { exito = true; }
            }
            return exito;
        }

        public bool ExisteUsuario(string usuario, string legajo)
        {
            return ds.Existe("select * from MEDICOS where usuario ='"+usuario+"' and Legajo !='"+legajo+"'");
        }
    }
}
