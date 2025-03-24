using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Datos;

namespace Clinica
{
    public class GestionProvincia
    {
        DatosProvincia datosProv = new DatosProvincia();
        public GestionProvincia()
        {
        }

        public DataTable obtenerTabla()
        {
            
            return datosProv.ObtenerTablaProvincia();
        }

        public string ObtenerCodigoProvincia(string nombreProvincia)
        {
            return datosProv.ObtenerCodigoProvincia(nombreProvincia);
        }
    }
}