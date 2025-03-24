using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using System.Data;

namespace Datos
{
    public class DatosPaciente
    {
        AccesoDatos ds = new AccesoDatos();
        public DatosPaciente()
        {

        }

        public DataTable ObtenerTablaPaciente(string consulta)
        {
            DataTable tabla = ds.CargarTabla(consulta, "Paciente");
            return tabla;
        }

        public bool ExistePaciente(Paciente pacient)
        {
            string dni = new string(pacient.Dni);
            string consulta = "select DNI from PACIENTES where dni='" + dni + "'";
            return ds.Existe(consulta);
        }

        public bool AgregarPaciente(Paciente pacient)
        {
            bool exito = false;
            if (!ExistePaciente(pacient))
            {
                string dni = new string(pacient.Dni);
                string cod_prov = new string(pacient.Cod_Provincia);
                string cod_loc = new string(pacient.Cod_Localidad);

                string consulta = "insert into PACIENTES (DNI,Nombre,Apellido,ID_Sexo,Nacionalidad,FechaDeNacimiento,Direccion,Cod_Localidad,Cod_Provincia,CorreoElectronico,Telefono,Activo) VALUES ('" + dni + "', '" + pacient.Nombre.ToString() + "', '" + pacient.Apellido.ToString() + "', '" + pacient.Id_Sexo.ToString() + "', '" + pacient.Nacionalidad.ToString() + "',CONVERT(DATE,'" + pacient.FechaDeNacimiento.ToString() + "', 103),'" + pacient.Direccion.ToString() + "', '" + cod_loc + "', '" + cod_prov + "', '" + pacient.CorreoElectronico.ToString() + "', '" + pacient.Telefono.ToString() + "', '" + pacient.Activo.ToString() + "')";
                int fueAgregado = ds.EjecutarConsulta(consulta);
                if (fueAgregado != 0) { exito = true; }
            }
            return exito;
        }

        public bool PacienteActivo(Paciente pacient)
        {
            string dni = new string(pacient.Dni);
            string consulta = "Select DNI from PACIENTES where DNI='" + dni + "' and Activo != 0";
            return ds.Existe(consulta);
        }

        public bool EliminarPaciente(Paciente pacient)
        {
            bool exito = false;
            if (ExistePaciente(pacient) && PacienteActivo(pacient))
            {
                string dni = new string(pacient.Dni);

                string consulta = "update PACIENTES set Activo = 0 where DNI ='" + dni + "'";
                int fueEliminado = ds.EjecutarConsulta(consulta);
                if (fueEliminado != 0) { exito = true; }
            }
            return exito;
        }

        public bool EliminarPacientes(string[] DNIs)
        {
            bool exito = false;
            bool flagPrimera = true;
            string consulta = "update PACIENTES set Activo = 0  ";
            Paciente pacienteObj = new Paciente();
            Utilidades uti = new Utilidades();
            foreach (string dni in DNIs)
            {
                pacienteObj.Dni = uti.dividirCadenaEn8(dni);
                if (ExistePaciente(pacienteObj) && PacienteActivo(pacienteObj))
                {
                    string dniConsulta = new string(pacienteObj.Dni);
                    if (flagPrimera)
                    {
                        consulta += "where DNI = '" + dniConsulta + "' ";
                        flagPrimera = false;
                    }
                    else consulta += "or DNI = '" + dniConsulta + "' ";

                }
                int fueEliminado = ds.EjecutarConsulta(consulta);
                if (fueEliminado != 0) { exito = true; }
            }


            return exito;
        }

        public bool ActualizarPaciente(Paciente pacient)
        {
            bool exito = false;
            if (ExistePaciente(pacient) && PacienteActivo(pacient))
            {
                string cod_loc = new string(pacient.Cod_Localidad);
                string cod_prov = new string(pacient.Cod_Provincia);
                string dni = new string(pacient.Dni);
                string consulta = "update PACIENTES set Nombre = '" + pacient.Nombre.ToString() + "', Apellido= '" + pacient.Apellido.ToString() + "',ID_Sexo= '" + pacient.Id_Sexo.ToString() + "',Nacionalidad= '" + pacient.Nacionalidad.ToString() + "',FechaDeNacimiento= CONVERT(DATE,'" + pacient.FechaDeNacimiento.ToString() + "', 103),Direccion= '" + pacient.Direccion.ToString() + "',Cod_Localidad= '" + cod_loc + "',Cod_Provincia= '" + cod_prov + "',CorreoElectronico= '" + pacient.CorreoElectronico.ToString() + "',Telefono= '" + pacient.Telefono.ToString() + "',Activo= '" + pacient.Activo.ToString() + "' WHERE DNI='" + dni + "'";
                int fueActualizado = ds.EjecutarConsulta(consulta);
                if (fueActualizado != 0) { exito = true; }
            }
            return exito;
        }
    }
}