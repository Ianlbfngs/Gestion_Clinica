using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Provincia
    {
        private char[] _Codigo = new char[2];
        private string _Nombre;
        
            
            
        public Provincia() {
           
        }

        public char[] Codigo { get => _Codigo; set => _Codigo = value; }
        public string Nombre { get => _Nombre; set => _Nombre = value; }
    }
}

