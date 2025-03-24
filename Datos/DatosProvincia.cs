using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Entidades;

namespace Datos
{
    public class DatosProvincia
    {
        AccesoDatos ds = new AccesoDatos();

        public DatosProvincia()
        {
        }

        public DataTable ObtenerTablaProvincia()
        {
            DataTable tabla = ds.CargarTabla("select * from PROVINCIAS", "Provincia");
            return tabla;
        }

        public string ObtenerCodigoProvincia(string nombreProvincia)
        {
            DataTable tabla = ds.CargarTabla("select Codigo from provincias where Nombre = '" + nombreProvincia + "'", "Provincia");
            return tabla.Rows[0][0].ToString();
        }
    }
}