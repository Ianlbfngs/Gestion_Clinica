using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Administrador
    {
        private int _ID;
        private string _Usuario;
        private string _Contraseña;

        public Administrador() { }

        public int ID { get => _ID; set => _ID = value; }
        public string Usuario { get => _Usuario; set => _Usuario = value; }
        public string Contraseña { get => _Contraseña; set => _Contraseña = value; }
    }
}
