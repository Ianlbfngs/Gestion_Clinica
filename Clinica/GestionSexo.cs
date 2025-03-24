using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using Datos;
using System.Data;


namespace Clinica
{
    public class GestionSexo
    {
        DatosSexo daoSexo = new DatosSexo();
       
        public GestionSexo()
        {
        }

        public DataTable obtenerSexos()
        {
            return daoSexo.ObtenerTablaSexos();
        }

        public string ObtenerCodigoSexo(string nombreSexo)
        {
            return daoSexo.ObtenerCodigoSexo(nombreSexo);
        }



    }
}
