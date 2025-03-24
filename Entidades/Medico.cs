using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Medico
    {
        private char[] _Legajo = new char[4];
        private char[] _DNI = new char[8];
        private string _Nombre;
        private string _Apellido;
        private int _ID_Sexo;
        private string _Nacionalidad;
        private DateTime _FechaDeNacimiento;
        private string _Direccion;
        private char[] _Codigo_Localidad = new char[4];
        private char[] _Cod_Provincia = new char[8];
        private string _CorreoElectronico;
        private string _Telefono;
        private string _Usuario;
        private string _Contraseña;
        private char[] _Codigo_Especialidad = new char[4];
        private TimeSpan _Hora_Inicio;
        private TimeSpan _Hora_Fin;
        private bool _Activo;

        public char[] Legajo { get => _Legajo; set => _Legajo = value; }
        public char[] Dni { get => _DNI; set => _DNI = value; }
        public string Nombre { get => _Nombre; set => _Nombre = value; }
        public string Apellido { get => _Apellido; set => _Apellido = value; }
        public int ID_Sexo_ME { get => _ID_Sexo; set => _ID_Sexo = value; }
        public string Nacionalidad { get => _Nacionalidad; set => _Nacionalidad = value; }
        public DateTime FechaDeNacimiento { get => _FechaDeNacimiento; set => _FechaDeNacimiento = value; }
        public string Direccion { get => _Direccion; set => _Direccion = value; }
        public char[] Cod_Localidad_ME { get => _Codigo_Localidad; set => _Codigo_Localidad = value; }
        public char[] Cod_Provincia_ME { get => _Cod_Provincia; set => _Cod_Provincia = value; }
        public string CorreoElectronico { get => _CorreoElectronico; set => _CorreoElectronico = value; }
        public string Telefono { get => _Telefono; set => _Telefono = value; }
        public string Usuario { get => _Usuario; set => _Usuario = value; }
        public string Contraseña { get => _Contraseña; set => _Contraseña = value; }
        public char[] Cod_Especialidad_ME { get => _Codigo_Especialidad; set => _Codigo_Especialidad = value; }
        public TimeSpan HorarioInicio { get => _Hora_Inicio; set => _Hora_Inicio = value; }
        public TimeSpan HorarioFin { get => _Hora_Fin; set => _Hora_Fin = value; }
        public bool Activo { get => _Activo; set => _Activo = value; }

        public Medico(){}
    }
}
