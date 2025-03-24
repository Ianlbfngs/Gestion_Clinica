using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Sexo
    {
        private int _ID;
        private string _Descripcion;

        public Sexo()
        {
        }

        public int ID { get => _ID; set => _ID = value; }
        public string Descripcion { get => _Descripcion; set => _Descripcion = value; }
    }
}
