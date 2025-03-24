using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using System.Data;

namespace Datos
{
    public class DatosAdministrador
    {
        AccesoDatos ds = new AccesoDatos();

        public DatosAdministrador ()
        {
        }

        public bool ExisteAdministrador(Administrador admin)
        {
            if (!string.IsNullOrEmpty(admin.Contraseña))
            {
                string consulta = "Select * from ADMINISTRADORES where Usuario = '" + admin.Usuario + "' and Contraseña = '" + admin.Contraseña + "'";
                return ds.Existe(consulta);
            }
            else
            {
                string consulta = "Select * from ADMINISTRADORES where Usuario = '" + admin.Usuario + "'";
                return ds.Existe(consulta);
            }
            
        }

       
    }
}
