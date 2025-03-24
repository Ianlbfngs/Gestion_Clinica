using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Entidades;
using Datos;

namespace Clinica
{
    public class GestionEspecialidades
    {
        DatosEspecialidades daoEsp = new DatosEspecialidades();
        public GestionEspecialidades()
        {
        }

        public DataTable obtenerTabla()
        {
            return daoEsp.ObtenerTablaEspecialidad();
        }

        public string ObtenerCodigoEspecialidad(string nombre)
        {
            return daoEsp.ObtenerCodigoEspecialidad(nombre);
        }
    }
}
