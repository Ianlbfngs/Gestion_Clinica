using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Localidad
    {
        private char[] _codigo = new char[4];
        private char[] _codigo_Provincia = new char[2];
        private string _nombre;

        public Localidad()
        {
        }

        public char[] CodigoLOC { get => _codigo; set => _codigo = value; }
        public char[] CodProvinciaPR { get => _codigo_Provincia; set => _codigo_Provincia = value; }
        public string NombreLOC { get => _nombre; set => _nombre = value; }
    }
}

