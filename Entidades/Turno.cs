using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Turno
    {
        private int _Codigo;
        private char[] _Cod_Especialidad = new char[4];
        private char[] _Legajo_Medico = new char[4];
        private DateTime _Dia;
        private TimeSpan _Horario;
        private char[] _Dni_Paciente = new char[8];
        private bool _Presente;
        private string _Observacion;
      

        public Turno() { }

        public int Codigo { get => _Codigo; set => _Codigo = value; }
        public char[] Cod_Especialidad { get => _Cod_Especialidad; set => _Cod_Especialidad = value; }
        public char[] Legajo_Medico { get => _Legajo_Medico; set => _Legajo_Medico = value; }
        public DateTime Dia_Horario { get => _Dia; set => _Dia = value; }
        public char[] Dni_Paciente { get => _Dni_Paciente; set => _Dni_Paciente = value; }
        public bool Presente { get => _Presente; set => _Presente = value; }
        public string Observacion { get => _Observacion; set => _Observacion = value; }
        public TimeSpan Horario { get => _Horario; set => _Horario = value; }
    }
}
