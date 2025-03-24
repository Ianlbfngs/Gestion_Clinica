using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using System.Data;

namespace Datos
{
    public class DatosSexo
    {
        AccesoDatos ds = new AccesoDatos();

        public DatosSexo()
        {
        }

        public DataTable ObtenerTablaSexos()
        {
            DataTable tabla = ds.CargarTabla("select * from SEXOS","Sexos");
            return tabla;
        }

        public string ObtenerCodigoSexo(string nombreSexo)
        {
            DataTable tabla = ds.CargarTabla("select ID from SEXOS where Descripcion ='" + nombreSexo + "'","Sexos");
            return tabla.Rows[0][0].ToString();
        }




    }
}
