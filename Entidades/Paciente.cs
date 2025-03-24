using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Paciente
    {
        private char[] _Dni = new char[8];
        private string _Nombre;
        private string _Apellido;
        private int _Id_Sexo;
        private string _Nacionalidad;
        private DateTime _FechaDeNacimiento;
        private string _Direccion;
        private char[] _Cod_Provincia = new char[2];
        private char[] _Cod_Localidad = new char[4];
        private string _CorreoElectronico;
        private string _Telefono;
        private bool _Activo;

        public Paciente() { }

        public char[] Dni { get => _Dni; set => _Dni = value; }
        public string Nombre { get => _Nombre; set => _Nombre = value; }
        public string Apellido { get => _Apellido; set => _Apellido = value; }
        public int Id_Sexo { get => _Id_Sexo; set => _Id_Sexo = value; }
        public string Nacionalidad { get => _Nacionalidad; set => _Nacionalidad = value; }
        public DateTime FechaDeNacimiento { get => _FechaDeNacimiento; set => _FechaDeNacimiento = value; }
        public string Direccion { get => _Direccion; set => _Direccion = value; }
        public char[] Cod_Provincia { get => _Cod_Provincia; set => _Cod_Provincia = value; }
        public char[] Cod_Localidad { get => _Cod_Localidad; set => _Cod_Localidad = value; }
        public string CorreoElectronico { get => _CorreoElectronico; set => _CorreoElectronico = value; }
        public string Telefono { get => _Telefono; set => _Telefono = value; }
        public bool Activo { get => _Activo; set => _Activo = value; }
    }
}
