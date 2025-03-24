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
    public class GestionAdministrador
    {
        DatosAdministrador daoAdmin = new DatosAdministrador();
        public GestionAdministrador() { }

        public bool ExisteUsuario(Administrador admin)
        {
            return daoAdmin.ExisteAdministrador(admin);
        }

    }
}
