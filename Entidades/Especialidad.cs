using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Especialidad
    {
        private char[] _codigo = new char[4];
        private string _nombre;

        public Especialidad()
        {
        }

       
        public string Nombre { get => _nombre; set => _nombre = value; }
        public char[] Codigo { get => _codigo; set => _codigo = value; }
    }
}
