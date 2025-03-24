using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Dia
    {
        private int _ID;
        private char[] _Legajo_Medico = new char[4];
        private bool _Lunes;
        private bool _Martes;
        private bool _Miercoles;
        private bool _Jueves;
        private bool _Viernes;
        private bool _Sabado;
        private bool _Domingo;
      
        public int ID { get => _ID; set => _ID = value; }
        public char[] Legajo { get => _Legajo_Medico; set => _Legajo_Medico = value; }
        public bool Lunes { get => _Lunes; set => _Lunes = value; }
        public bool Martes { get => _Martes; set => _Martes = value; }
        public bool Miercoles { get => _Miercoles; set => _Miercoles = value; }
        public bool Jueves { get => _Jueves; set => _Jueves = value; }
        public bool Viernes { get => _Viernes; set => _Viernes = value; }
        public bool Sabado { get => _Sabado; set => _Sabado = value; }
        public bool Domingo { get => _Domingo; set => _Domingo = value; }

        public Dia() { }

    }
}
