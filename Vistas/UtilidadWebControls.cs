using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text.RegularExpressions;
using Entidades;
using Clinica;

namespace Vistas
{
    public class UtilidadWebControls
    {
        public UtilidadWebControls()
        {
        }

        public void FncRangoHorarioMedico(DropDownList ddl, string legajo)
        {
            TimeSpan horaSuma = new TimeSpan(1, 0, 0);
            GestionMedico gesMed = new GestionMedico();
            Entidades.Medico med = new Entidades.Medico();
            Utilidades uti = new Utilidades();

            med.Legajo = uti.dividirCadenaEn4(legajo);
            med = gesMed.ObtenerMedicoEspecifico(med);
            ddl.Items.Add(new ListItem("-- Seleccionar --", "-1"));
            while (med.HorarioInicio != (med.HorarioFin+horaSuma))
            {
                ddl.Items.Add(new ListItem(med.HorarioInicio.ToString(), med.HorarioInicio.ToString()));
                med.HorarioInicio += horaSuma;
                if((med.HorarioFin+horaSuma) != TimeSpan.FromHours(24) && med.HorarioInicio == TimeSpan.FromHours(24)) med.HorarioInicio = TimeSpan.Parse("00:00:00");
            }
        }

        public void FncCargarHorarios(DropDownList ddlIn, DropDownList ddlFin)
        {
            TimeSpan hora = new TimeSpan(0, 0, 0);
            TimeSpan horaSuma = new TimeSpan(1, 0, 0);


            ddlIn.Items.Add(new ListItem("-- Seleccionar --", "-1"));
            for (int i = 1; i <= 24; i++)
            {
                ddlIn.Items.Add(new ListItem(hora.ToString(), hora.ToString()));
                hora = hora + horaSuma;
            }

            hora = new TimeSpan(0, 0, 0);
            ddlFin.Items.Add(new ListItem("-- Seleccionar --", "-1"));
            for (int i = 1; i <= 24; i++)
            {
                ddlFin.Items.Add(new ListItem(hora.ToString(), hora.ToString()));
                hora = hora + horaSuma;
            }
            return;

        }

        public void FncCargarSexo(DropDownList ddlSexo)
        {
            GestionSexo gesSexo = new GestionSexo();
            DataTable tabla = gesSexo.obtenerSexos();
            ddlSexo.Items.Add(new ListItem("-- Seleccionar --", "-1"));
            foreach (DataRow fila in tabla.Rows)
            {
                ddlSexo.Items.Add(new ListItem(fila["Descripcion"].ToString(), fila["ID"].ToString()));
            }
        }

        public void FncCargarProvincias(DropDownList ddlProvincia, DropDownList ddlLocalidad = null)
        {
            GestionProvincia gesProv = new GestionProvincia();
            DataTable tabla = gesProv.obtenerTabla();
            ddlProvincia.Items.Add(new ListItem("-- Seleccionar --", "-1"));
            foreach (DataRow fila in tabla.Rows)
            {
                ddlProvincia.Items.Add(new ListItem(fila["Nombre"].ToString(), fila["Codigo"].ToString()));
            }
            if(ddlLocalidad != null)ddlLocalidad.Items.Add(new ListItem("-- Elija una Provincia --", "-1"));
        }

        public void FncCargarEspecialidades(DropDownList ddlEspecialidad)
        {
            GestionEspecialidades gesEspe = new GestionEspecialidades();
            DataTable tabla = gesEspe.obtenerTabla();
            ddlEspecialidad.Items.Add(new ListItem("-- Seleccionar --", "-1"));
            foreach (DataRow fila in tabla.Rows)
            {
                ddlEspecialidad.Items.Add(new ListItem(fila["Nombre"].ToString(), fila["Codigo"].ToString()));
            }

        }

        public void FncCargarLocalidades( DropDownList ddlLocalidad, DropDownList ddlProvincia)
        {
            ddlLocalidad.Items.Clear();
            GestionLocalidades gesLoc = new GestionLocalidades();
            DataTable tabla = gesLoc.obtenerTabla(ddlProvincia.SelectedValue.ToString());
            ddlLocalidad.Items.Add(new ListItem("-- Seleccionar --", "-1"));
            foreach (DataRow fila in tabla.Rows)
            {
                ddlLocalidad.Items.Add(new ListItem(fila["Nombre"].ToString(), fila["Codigo"].ToString()));
            }
            ddlLocalidad.SelectedIndex = 0;
        }

        public void FncCargarTablaMedicos(GridView grdMedicos)
        {
            GestionMedico gesMed = new GestionMedico();
            grdMedicos.DataSource = gesMed.ObtenerTablaMedicos();
            grdMedicos.DataBind();
        }

        public void FncCargarTablaMedicos(string consulta, GridView grdMedicos)
        {
            GestionMedico gesMed = new GestionMedico();
            grdMedicos.DataSource = gesMed.ObtenerTablaMedicos(consulta);
            grdMedicos.DataBind();
        }

        public void FncCargarTablaPacientes(GridView grdPacientes)
        {
            GestionPacientes gesPac = new GestionPacientes();

            grdPacientes.DataSource = gesPac.obtenerTabla();
            grdPacientes.DataBind();
        }
        public void FncCargarTablaPacientes(string consulta, GridView grdPacientes)
        {
            GestionPacientes gesPac = new GestionPacientes();

            grdPacientes.DataSource = gesPac.obtenerTabla(consulta);
            grdPacientes.DataBind();
        }


        public void FncCargarTablaDias(GridView grdDias)
        {
            GestionDias gesDias = new GestionDias();
            grdDias.DataSource = gesDias.obtenerTabla();
            grdDias.DataBind();
        }
        public void FncCargarTablaDias(string consulta, GridView grdDias)
        {
            GestionDias gesDias = new GestionDias();
            grdDias.DataSource = gesDias.obtenerTabla(consulta);
            grdDias.DataBind();
        }

        public void FncCargarTablaTurnos(GridView grdTurnos, Turno tur)
        {
            C_GestionTurnos gesTur = new C_GestionTurnos();
            grdTurnos.DataSource = gesTur.ObtenerTablaTurnos(tur);
            grdTurnos.DataBind();

        }
        public void FncCargarTablaTurnos(string consulta,GridView grdTurnos)
        {
            C_GestionTurnos gesTur = new C_GestionTurnos();
            grdTurnos.DataSource = gesTur.ObtenerTablaTurnos(consulta);
            grdTurnos.DataBind();

        }
        public void FncContraseñaProvincia(TextBox txtContraseña, TextBox txtRepetirContraseña, bool opcion)
        {
            if (opcion)
            {
                txtContraseña.Enabled = true;
                txtRepetirContraseña.Enabled = true;
                txtContraseña.Attributes.Remove("placeholder");
            }
            else
            {
                txtContraseña.Enabled = false;
                txtRepetirContraseña.Enabled = false;
                txtContraseña.Attributes["placeholder"] = "- Seleccione una provincia -";
                
            }
            
        }

        public string[] FncSepararPalabrasEnStrings(TextBox txt)
        {
            string multiplesStrings = txt.Text.Trim();
            multiplesStrings = Regex.Replace(multiplesStrings, @"\s+", " ");
            return multiplesStrings.Split(' ');
        }
        public void FncCargarPacientes(DropDownList ddlPacientes)
        {
            GestionPacientes gesPac = new GestionPacientes();
            DataTable tabla = gesPac.obtenerTabla();
            ddlPacientes.Items.Add(new ListItem("-- Seleccionar --", "-1"));
            foreach (DataRow fila in tabla.Rows)
            {
                ddlPacientes.Items.Add(new ListItem(fila["Apellido"].ToString() + ", " + fila["Nombre"].ToString(), fila["DNI"].ToString()));
            }
        }

        public void FncCargarDDLMedicos(DropDownList ddlMedicos, DropDownList ddlEspecialidades)
        {
            ddlMedicos.Items.Clear();
            GestionMedico gesMed = new GestionMedico();

            DataTable tabla = gesMed.ObtenerMedicosPorEspecialidad(ddlEspecialidades.SelectedValue.ToString());
            ddlMedicos.Items.Add(new ListItem("-- Seleccionar --", "-1"));
            foreach (DataRow fila in tabla.Rows)
            {
                ddlMedicos.Items.Add(new ListItem(fila["Apellido"].ToString() + ", " + fila["Nombre"].ToString(), fila["Legajo"].ToString()));
            }
            ddlMedicos.SelectedIndex = 0;
        }

        public bool FncDiaHabilitadoParaTurno(string nombreDia, Dia diasQueTrabaja)
        {
            bool trabajaEseDia = false;
            switch (nombreDia)
            {
                case "Monday":
                    if (diasQueTrabaja.Lunes == true) trabajaEseDia = true;
                    break;
                case "Tuesday":
                    if (diasQueTrabaja.Martes == true) trabajaEseDia = true;
                    break;
                case "Wednesday":
                    if (diasQueTrabaja.Miercoles == true) trabajaEseDia = true;
                    break;
                case "Thursday":
                    if (diasQueTrabaja.Jueves == true) trabajaEseDia = true;
                    break;
                case "Friday":
                    if (diasQueTrabaja.Viernes == true) trabajaEseDia = true;
                    break;
                case "Saturday":
                    if (diasQueTrabaja.Sabado == true) trabajaEseDia = true;
                    break;
                case "Sunday":
                    if (diasQueTrabaja.Domingo == true) trabajaEseDia = true;
                    break;
                default:
                    break;
            }
            return trabajaEseDia;
        }

        public void FncCargarAños(DropDownList ddl)
        {
            DateTime añoInicio = DateTime.ParseExact("2000","yyyy",null);
            ddl.Items.Add(new ListItem("-- Seleccionar --","-1"));
            
            while (añoInicio.Year <= DateTime.Today.Year)
            {
                ddl.Items.Add(new ListItem(añoInicio.Year.ToString(), añoInicio.Year.ToString()));
                añoInicio = añoInicio.AddYears(1);
            }
        }

        public void FncMedicosEspecialidad(DropDownList ddlMedicos, bool opcion)
        {
            if (opcion)
            {
                ddlMedicos.Enabled = true;
            }
            else
            {
                ddlMedicos.Enabled = false;
                ddlMedicos.Items.Add(new ListItem("-- Seleccione una especialidad --", "-1"));
            }
        }

        public void FncHorarioMedico(DropDownList ddlHorario, bool opcion)
        {
            if (opcion)
            {
                ddlHorario.Enabled = true;
            }
            else
            {
                ddlHorario.Enabled = false;
                ddlHorario.Items.Add(new ListItem("-- Seleccione un medico --", "-1"));
            }
        }


        public bool turnoDisponible(string identificador, string fecha, string horario)
        {
            if(identificador.Length == 4)
            {
                //es legajo
                Turno turno = new Turno();
                Utilidades uti = new Utilidades();
                C_GestionTurnos gesTurnos = new C_GestionTurnos();

                turno.Legajo_Medico = uti.dividirCadenaEn4(identificador);
                turno.Dia_Horario = DateTime.Parse(fecha);
                turno.Horario = TimeSpan.Parse(horario);
                return gesTurnos.diaHorarioHablitadoParaTurno(turno);
            }
            else
            {
                //es DNI
                Turno turno = new Turno();
                Utilidades uti = new Utilidades();
                C_GestionTurnos gesTurnos = new C_GestionTurnos();

                turno.Dni_Paciente = uti.dividirCadenaEn8(identificador);
                turno.Dia_Horario = DateTime.Parse(fecha);
                turno.Horario = TimeSpan.Parse(horario);
                return gesTurnos.diaHorarioHablitadoParaTurno(turno); 

            }
            
        }

    }
}