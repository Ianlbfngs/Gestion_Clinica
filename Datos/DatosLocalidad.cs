using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using System.Data;

namespace Datos
{
    public class DatosLocalidad
    {
        AccesoDatos ds = new AccesoDatos();

        public DatosLocalidad()
        {
        }


        public DataTable ObtenerLocalidades(Provincia prov)
        {
            string codigo = new string(prov.Codigo);
            DataTable tabla = ds.CargarTabla("select * from LOCALIDADES where Cod_Provincia = '"+codigo+"'", "Localidades");
            return tabla;
        }


        public string ObtenerCodigoLocalidad(string nombre, string codProv)
        {
            DataTable tabla = ds.CargarTabla("Select Codigo from LOCALIDADES where Nombre ='" + nombre + "' and Cod_Provincia = '" + codProv+"'","Localidad");
            return tabla.Rows[0][0].ToString();
        }

    }
}



