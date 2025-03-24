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
    public class GestionPacientes
    {
        DatosPaciente datosPac = new DatosPaciente();
        public GestionPacientes()
        {
        }
        public DataTable obtenerTabla(string consulta)
        {
            return datosPac.ObtenerTablaPaciente(consulta);
        }

        public DataTable obtenerTabla()
        {
            string consulta = "SELECT P.DNI,P.Nombre,P.Apellido,S.Descripcion AS Sexo,P.Nacionalidad,FORMAT(P.FechaDeNacimiento,'dd/MM/yyyy')AS [FechaDeNacimiento],P.Direccion,L.Nombre AS Localidad,PROV.Nombre AS Provincia,P.CorreoElectronico,P.Telefono FROM (((PACIENTES AS P INNER JOIN SEXOS AS S ON P.ID_Sexo = S.ID)  INNER JOIN LOCALIDADES AS L ON P.Cod_Localidad = L.Codigo)INNER JOIN PROVINCIAS AS PROV ON P.Cod_Provincia = PROV.Codigo)  WHERE P.Activo != 0";
            return datosPac.ObtenerTablaPaciente(consulta);
        }

        public bool eliminarPacientes(string[] pac)
        {

            return datosPac.EliminarPacientes(pac);
        }

        public bool agregarPaciente(Paciente Pac)
        {
            return datosPac.AgregarPaciente(Pac);
        }

        public Paciente CargarObjetoPaciente(string Dni, string Nombre, string Apellido, string Id_Sexo, string Nacionalidad, string FechaDeNacimiento, string Direccion, string Cod_Localidad, string Cod_Provincia, string CorreoElectronico, string telefono)
        {
            Paciente Pac = new Paciente();
            Utilidades uti = new Utilidades();
            Pac.Dni = uti.dividirCadenaEn8(Dni);
            Pac.Nombre = Nombre;
            Pac.Apellido = Apellido;
            Pac.Id_Sexo = Convert.ToInt32(Id_Sexo);
            Pac.Nacionalidad = Nacionalidad;
            Pac.FechaDeNacimiento = DateTime.Parse(FechaDeNacimiento);
            Pac.Direccion = Direccion;
            Pac.Cod_Localidad = uti.dividirCadenaEn4(Cod_Localidad);
            Pac.Cod_Provincia = uti.dividirCadenaEn2(Cod_Provincia);
            Pac.CorreoElectronico = CorreoElectronico;
            Pac.Telefono = telefono;
            Pac.Activo = true;
            return Pac;
        }

        public bool ActualizarPaciente(Paciente Pac)
        {
            return datosPac.ActualizarPaciente(Pac);
        }

        public bool existePaciente(Paciente pac)
        {
            return datosPac.ExistePaciente(pac);
        }
    }
}