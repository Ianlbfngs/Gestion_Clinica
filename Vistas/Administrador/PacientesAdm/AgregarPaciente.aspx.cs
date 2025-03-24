using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Clinica;
using System.Data;
using System.Text.RegularExpressions;

namespace Vistas.Administrador.PacientesAdm
{
    public partial class AgregarPaciente : System.Web.UI.Page
    {
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
                UtilidadWebControls utiWeb = new UtilidadWebControls();
                utiWeb.FncCargarSexo(ddlSexo);
                utiWeb.FncCargarProvincias(ddlProvincia,ddlLocalidad);
            }

        }

        protected void ddlProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlProvincia.SelectedValue != "-1")
            {
                UtilidadWebControls utiWeb = new UtilidadWebControls();
                utiWeb.FncCargarLocalidades(ddlLocalidad,ddlProvincia);
            }
        }

        protected void cvDNI_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string Texto = TbDNIPaciente.Text.Trim();
            string resultTexto = Texto.Replace(" ", string.Empty);

            if (resultTexto.Count() == 8) args.IsValid = true;
            else args.IsValid = false;
        }

        protected void cvPacienteExistente_ServerValidate(object source, ServerValidateEventArgs args)
        {
            GestionPacientes gesPaci = new GestionPacientes();
            Paciente pac = new Paciente();
            Utilidades uti = new Utilidades();

            if (cvDNI.IsValid)
            {
                pac.Dni = uti.dividirCadenaEn8(TbDNIPaciente.Text);
                args.IsValid = !gesPaci.existePaciente(pac);
            }
            else args.IsValid = true;
        }

        protected void cvFecha_ServerValidate(object source, ServerValidateEventArgs args)
        {
            DateTime fechaMin = new DateTime(1874, 1, 1);
            DateTime seleccion = DateTime.Parse(TbNacimientoPaciente.Text);
            if (seleccion.Date > DateTime.Today.Date || seleccion.Date <fechaMin ) args.IsValid = false;
            else args.IsValid = true;
        }

        protected bool FncValidaciones()
        {
            bool validado = false;
            if (cvPacienteExistente.IsValid == true && cvFecha.IsValid == true && cvDNI.IsValid == true)
            {
                validado = true;
            }
            return validado;
        }

        protected void FncLimpiarTextBoxs()
        {
            TbDNIPaciente.Text = "";
            TbNamePaciente.Text = "";
            TbApellidoPaciente.Text = "";
            TbNacionPaciente.Text = "";
            TbTelPaciente.Text = "";
            TbEmailPaciente.Text = "";
            TbDirecPaciente.Text = "";
            TbNacimientoPaciente.Text = "";
        }

        protected void FncSetDDLDefault()
        {
            ddlLocalidad.Items.Clear();
            ddlLocalidad.Items.Add(new ListItem("-- Eliga una Provincia --", "-1"));
            ddlLocalidad.SelectedIndex = 0;
            ddlProvincia.SelectedIndex = 0;
            ddlSexo.SelectedIndex = 0;
        }

        protected bool FncAgregarPaciente()
        {
            GestionPacientes gesPaci = new GestionPacientes();
            Paciente pac = new Paciente();
            string nombre = Regex.Replace(TbNamePaciente.Text.ToString().Trim(), @"\s+", " ");
            string apellido = Regex.Replace(TbApellidoPaciente.Text.ToString().Trim(), @"\s+", " ");
            string nacionalidad = Regex.Replace(TbNacionPaciente.Text.ToString().Trim(), @"\s+", " ");
            string direccion = Regex.Replace(TbDirecPaciente.Text.ToString().Trim(), @"\s+", " ");
            pac = gesPaci.CargarObjetoPaciente(TbDNIPaciente.Text.ToString(), nombre, apellido, ddlSexo.SelectedValue.ToString(), nacionalidad, TbNacimientoPaciente.Text.ToString(), direccion, ddlLocalidad.SelectedValue.ToString(), ddlProvincia.SelectedValue.ToString(), TbEmailPaciente.Text.ToString().Trim(), TbTelPaciente.Text.ToString().Trim());
            return gesPaci.agregarPaciente(pac);

        }

        protected void FncResultado(bool resPaciente)
        {
            if (resPaciente) lblResultado.Text = "Paciente agregado correctamente";
            else lblResultado.Text = "No fue posible agregar el paciente";

        }

        protected void BtnAgregarPaciente_Click(object sender, EventArgs e)
        {
            if (FncValidaciones())
            {
                FncResultado(FncAgregarPaciente());
                FncLimpiarTextBoxs();
                FncSetDDLDefault();
            }
        }
        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }
    }
}