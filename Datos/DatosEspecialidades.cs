using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using System.Data;

namespace Datos
{
    public class DatosEspecialidades
    {
        AccesoDatos ds = new AccesoDatos();

        public DatosEspecialidades()
        {
        }

        public DataTable ObtenerTablaEspecialidad()
        {
            DataTable tabla = ds.CargarTabla("select * from ESPECIALIDADES", "Especialidad");
            return tabla;

        }

        public string ObtenerCodigoEspecialidad(string nombre)
        {
            DataTable tabla = ds.CargarTabla("select Codigo from ESPECIALIDADES where Nombre ='" + nombre + "'", "Especialidad");
            return tabla.Rows[0][0].ToString();
        }
    }
}