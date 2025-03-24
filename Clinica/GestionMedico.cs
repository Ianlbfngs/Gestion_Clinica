using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Datos;
using Entidades;

namespace Clinica
{
    public class GestionMedico
    {
        DatosMedico daoMed = new DatosMedico();
        Especialidad especialidad = new Especialidad();
        Utilidades uti = new Utilidades();

        public GestionMedico() { }

        public DataTable ObtenerTablaMedicos()
        {
            return daoMed.ObtenerTablaMedicos();
        }


        public DataTable ObtenerTablaMedicos(string consulta)
        {
            return daoMed.ObtenerTablaMedicos(consulta);
        }

        public Medico ObtenerMedicoEspecifico(Medico med, int variacion = 1)
        {
            return daoMed.ObtenerMedicoEspecifico(med,variacion);
            
        }
        public DataTable ObtenerMedicosPorEspecialidad(string codEspe)
        {
            especialidad.Codigo = uti.dividirCadenaEn4(codEspe);
            return daoMed.ObtenerMedicosPorEspecialidad(especialidad);
        }

        public bool AgregarMedico(Medico med)
        {
            return daoMed.AgregarMedico(med);
        }

        public Medico CargarObjetoMedico(string legajo, string dni, string nombre, string apellido, string id_sexo, string nacionalidad, string fechaNac, string direccion , string cod_loc, string cod_prov, string correo, string telefono, string usuario, string contraseña, string cod_esp, string horarioIn, string horarioFin)
        {
            Utilidades uti = new Utilidades();
            Medico Med = new Medico();
            Med.Legajo = uti.dividirCadenaEn4(legajo);
            Med.Dni = uti.dividirCadenaEn8(dni);
            Med.Nombre = nombre;
            Med.Apellido = apellido;
            Med.ID_Sexo_ME = int.Parse(id_sexo);
            Med.Nacionalidad = nacionalidad;
            Med.FechaDeNacimiento = DateTime.Parse(fechaNac);
            Med.Direccion = direccion;
            Med.Cod_Localidad_ME = uti.dividirCadenaEn4(cod_loc);
            Med.Cod_Provincia_ME = uti.dividirCadenaEn2(cod_prov);
            Med.CorreoElectronico = correo;
            Med.Telefono = telefono;
            Med.Usuario = usuario;
            Med.Contraseña = contraseña;
            Med.Cod_Especialidad_ME = uti.dividirCadenaEn4(cod_esp);
            Med.HorarioInicio = TimeSpan.Parse(horarioIn);
            Med.HorarioFin = TimeSpan.Parse(horarioFin);
            Med.Activo = true;
            return Med;
        }

        public bool EliminarMedicos(string[] meds)
        {
            return daoMed.EliminarMedicos(meds);
        }

        public bool ActualizarMedico(Medico med)
        {
            return daoMed.ActualizarMedico(med);
        }
        public bool existeUsuarioMedico(Medico med)
        {
            bool existe = false;
            DataTable tabla = new DataTable();
            tabla = ObtenerTablaMedicos();

            foreach (DataRow fila in tabla.Rows)
            {
                if (fila["Usuario"].ToString() == med.Usuario.ToString() && fila["Contraseña"].ToString() == med.Contraseña.ToString())
                {
                    existe = true;
                    break;
                }
            }
            return existe;
        }

        public bool existeUsuarioMedico(string usuario)
        {
            bool existe = false;
            DataTable tabla = new DataTable();
            tabla = ObtenerTablaMedicos();
            foreach(DataRow fila in tabla.Rows)
            {
                if(fila["Usuario"].ToString() == usuario)
                {
                    existe = true;
                    break;
                }
            }
            return existe;
        }

        public bool existeUsuarioMedico(string usuario, string legajo)
        {
            return daoMed.ExisteUsuario(usuario, legajo);
        }

        public bool ExisteMedico(Medico med)
        {
            return daoMed.ExisteMedico(med);
        }

        public bool ExisteDNI(string dni, string legajo)
        {
            return daoMed.ExisteDNI(dni, legajo);
        }
    }
}
