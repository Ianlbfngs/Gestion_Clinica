using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Entidades;
using Datos;

namespace Clinica
{
   public class GestionDias
    {
        DatosDias datDias = new DatosDias();

        public GestionDias() { }

        public DataTable obtenerTabla()
        {
            return datDias.ObtenerTablaDias();
        }

        public DataTable obtenerTabla(string legajo)
        {
            return datDias.ObtenerTablaDias(legajo);
        }

        public Dia CargarDias(string legajo, bool Lunes, bool Martes, bool Miercoles, bool Jueves, bool Viernes, bool Sabado, bool Domingo)
        {
            Dia dia = new Dia();
            Utilidades uti = new Utilidades();
            dia.Legajo = uti.dividirCadenaEn4(legajo);
            dia.Lunes = Lunes;
            dia.Martes = Martes;
            dia.Miercoles = Miercoles;
            dia.Jueves = Jueves;
            dia.Viernes = Viernes;
            dia.Sabado = Sabado;
            dia.Domingo = Domingo;
            return dia;
        }

        public bool AgregarDia(Dia Dias)
        {
            return datDias.AgregarDia(Dias);
        }

        public bool ModificarDias(Dia Dias)
        {
            return datDias.ModificarDias(Dias);
        }

        public Dia ObtenerDiaEspecifico(Dia dia)
        {
            return datDias.ObtenerDiaEspecifico(dia);
        }
    }
}
