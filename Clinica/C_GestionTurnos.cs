using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;
using Entidades;
using System.Data;


namespace Clinica
{

    public class C_GestionTurnos
    {
        public C_GestionTurnos() { }

        DatosTurnos DatosTur = new DatosTurnos();
        public DataTable ObtenerTablaTurnos()
        {
            return DatosTur.ObtenerTablaTurnos();
        }

        public DataTable ObtenerTablaTurnos(Turno Tur)
        {
            return DatosTur.ObtenerTablaTurnos(Tur);
        }

        public DataTable ObtenerTablaTurnos(string consulta)
        {
            return DatosTur.ObtenerTablaTurnos(consulta);
        }

        public Turno ObtenerTurnoEspecifico(string id)
        {
            return DatosTur.ObtenerTurnoEspecifico(id);
        }

        public bool agregarTurno(Turno Tur)
        {
            return DatosTur.AgregarTurno(Tur);
        }

        public Turno CargarTurno(string Cod_Especialidad, string Legajo_Medico, string horario, string Dia, string Dni_Paciente, bool presente)
        {
            Utilidades uti = new Utilidades();
            Turno Tur = new Turno();
            Tur.Cod_Especialidad = uti.dividirCadenaEn4(Cod_Especialidad);
            Tur.Legajo_Medico = uti.dividirCadenaEn4(Legajo_Medico);
            Tur.Horario = TimeSpan.Parse(horario);
            Tur.Dia_Horario = DateTime.Parse(Dia);
            Tur.Dni_Paciente = uti.dividirCadenaEn8(Dni_Paciente);
            Tur.Presente = presente;
            return Tur;
        }
        public bool ActualizarTurno(Turno Tur)
        {
            return DatosTur.ActualizarTurno(Tur);
        }

        public string PrimerInforme(string año1, string año2)
        {
            return DatosTur.PrimerInforme(año1, año2);
        }
        public string SegundoInforme(string especialidad)
        {
            return DatosTur.SegundoInforme(especialidad);
        }

        public string TercerInforme(string dni)
        {
            return DatosTur.TercerInforme(dni);
        }

        public bool diaHorarioHablitadoParaTurno(Turno turno)
        {
            return DatosTur.diaHorarioHablitadoParaTurno(turno);
        }
    }
}
