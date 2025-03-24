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
    public class GestionLocalidades
    {
        public GestionLocalidades()
        {
        }
        Utilidades uti = new Utilidades();
        Provincia prov = new Provincia();
        DatosLocalidad datosLoc = new DatosLocalidad();
        public DataTable obtenerTabla(string codProv)
        {
            
            prov.Codigo = uti.dividirCadenaEn2(codProv);
            return datosLoc.ObtenerLocalidades(prov);
        }

        public string ObtenerCodigoLocalidad(string nombreLoc, string codigoProv)
        {
            return datosLoc.ObtenerCodigoLocalidad(nombreLoc, codigoProv);

        }
    }
}