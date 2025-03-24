using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Clinica;

namespace Vistas.Administrador
{
    public partial class GestionTurnos : System.Web.UI.Page
    {
        UtilidadWebControls utiWeb = new UtilidadWebControls();
        Entidades.Utilidades uti = new Entidades.Utilidades();

        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (Session["nombreUsuario"] == null || string.IsNullOrEmpty(Session["nombreUsuario"].ToString()))
            {
                Response.Redirect("~/Login.aspx");
            }
            else lblUsuario.Text = Session["nombreUsuario"].ToString();

            if (!IsPostBack)
            {
                utiWeb.FncCargarEspecialidades(ddlEspecialidad);
                utiWeb.FncCargarPacientes(ddlPaciente);
                utiWeb.FncMedicosEspecialidad(ddlMedico, false);
                utiWeb.FncHorarioMedico(ddlHorarios, false);

            }

            lblMensaje.Text = "";
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }

        protected void ddlEspecialidad_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEspecialidad.SelectedValue != "-1")
            {
                
                utiWeb.FncCargarDDLMedicos(ddlMedico, ddlEspecialidad);
                utiWeb.FncMedicosEspecialidad(ddlMedico, true);
            }
            else
            {
                ddlMedico.Enabled = false;
                ddlMedico.SelectedValue = "-1";
            }
            ddlHorarios.Enabled = false;
            ddlHorarios.SelectedValue = "-1";
        }

        protected void ddlMedico_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlMedico.SelectedValue != "-1")
            {
                ddlHorarios.Items.Clear();
                utiWeb.FncRangoHorarioMedico(ddlHorarios, ddlMedico.SelectedValue);
                utiWeb.FncHorarioMedico(ddlHorarios, true);
            }
            ddlHorarios.SelectedValue = "-1";
        }

        protected void cvFecha_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = false;
            DateTime seleccion = DateTime.Parse(txtFecha.Text);
            if (seleccion.Date >= DateTime.Today.Date && seleccion.Date.Year <=2025)
            {
                args.IsValid = true;
            }
        }

        protected void btnAsignar_Click(object sender, EventArgs e)
        {
            if (cvFecha.IsValid   && cvFechaDisponible.IsValid  && cvDiaMedicoAtiende.IsValid )
            {
                FncResultado(FncAgregarUnTurno());
                utiWeb.FncMedicosEspecialidad(ddlMedico, false);
                utiWeb.FncHorarioMedico(ddlHorarios, false);
                FncSetDefault();
            }
        }

        protected void FncResultado(bool resTurno)
        {
            if (resTurno) lblMensaje.Text = "Turno agregado correctamente";
            else lblMensaje.Text = "No fue posible agregar el turno";

        }

        protected bool FncAgregarUnTurno()
        {
            Clinica.C_GestionTurnos gesTurnos = new Clinica.C_GestionTurnos();
            Entidades.Turno turno = new Entidades.Turno();

            turno = gesTurnos.CargarTurno(ddlEspecialidad.SelectedValue.ToString(), ddlMedico.SelectedValue.ToString(), ddlHorarios.Text.ToString(), txtFecha.Text.ToString(), ddlPaciente.SelectedValue.ToString(), false);
            return gesTurnos.agregarTurno(turno);

        }

        protected void FncSetDefault()
        {
            ddlEspecialidad.SelectedIndex = 0;
            ddlMedico.SelectedIndex = 0;
            ddlHorarios.SelectedIndex = 0;
            txtFecha.Text = "";
            ddlPaciente.SelectedIndex = 0;
        }

        protected void cvFechaDisponible_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = false;
            if(utiWeb.turnoDisponible(ddlMedico.SelectedValue, txtFecha.Text, ddlHorarios.Text) && utiWeb.turnoDisponible(ddlPaciente.SelectedValue, txtFecha.Text, ddlHorarios.Text)) args.IsValid = true;
        }

        protected void cvDiaMedicoAtiende_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = false;
            DateTime seleccion = DateTime.Parse(txtFecha.Text);
            string diaSeleccionado = seleccion.DayOfWeek.ToString();

            Entidades.Dia dia = new Entidades.Dia();
            GestionDias gesDias = new GestionDias();
            dia.Legajo = uti.dividirCadenaEn4(ddlMedico.SelectedValue.ToString());
            gesDias.ObtenerDiaEspecifico(dia);

            if (utiWeb.FncDiaHabilitadoParaTurno(diaSeleccionado, dia))
            {
                args.IsValid = true;
            }

        }

    }
}