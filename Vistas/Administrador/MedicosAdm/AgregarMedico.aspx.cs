using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Entidades;
using Clinica;
using System.Text.RegularExpressions;

namespace Vistas.Administrador.MedicosAdm
{
    public partial class AgregarMedico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            UtilidadWebControls utiWeb = new UtilidadWebControls();

            if (Session["nombreUsuario"] == null || string.IsNullOrEmpty(Session["nombreUsuario"].ToString()))
            {
                Response.Redirect("~/Login.aspx");
            }
            else lblUsuario.Text = Session["nombreUsuario"].ToString();
            if (!IsPostBack)
            {
                
                utiWeb.FncCargarProvincias(ddlProvincia,ddlLocalidad);
                utiWeb.FncCargarSexo(ddlSexo);
                utiWeb.FncCargarEspecialidades(ddlEspecialidad);
                utiWeb.FncCargarHorarios(ddlInicio,ddlFinal);
                utiWeb.FncContraseñaProvincia(tbContraseña, tbChequeoContraseña, false);

            }



        }


        protected bool FncAgregarUsuarioMedico()
        {
            GestionMedico gesMed = new GestionMedico();
            Entidades.Medico med = new Entidades.Medico();
           
            med = gesMed.CargarObjetoMedico(tbLegajo.Text,tbDNI.Text, Regex.Replace(tbNombre.Text.Trim(), @"\s+", " "), Regex.Replace(tbApellido.Text.Trim(), @"\s+", " "),ddlSexo.SelectedValue.ToString(), Regex.Replace(tbNacionalidad.Text.Trim(), @"\s+", " "),tbNacimiento.Text, Regex.Replace(tbDireccion.Text.Trim(), @"\s+", " "), ddlLocalidad.SelectedValue.ToString(),ddlProvincia.SelectedValue.ToString(),tbCorreo.Text.Trim(),tbTelefono.Text.Trim(),tbUsuario.Text.Trim(),tbContraseña.Text.Trim(),ddlEspecialidad.SelectedValue.ToString(),ddlInicio.Text,ddlFinal.Text);
            return gesMed.AgregarMedico(med);

        }

        protected bool FncAgregarRegistroDias()
        {
            GestionDias gesDias = new GestionDias();
            Dia dia = new Dia();
            bool[] dias = new bool[7];
            dias[0] = cblDias.Items.FindByValue("0").Selected;
            dias[1] = cblDias.Items.FindByValue("1").Selected;
            dias[2] = cblDias.Items.FindByValue("2").Selected;
            dias[3] = cblDias.Items.FindByValue("3").Selected;
            dias[4] = cblDias.Items.FindByValue("4").Selected;
            dias[5] = cblDias.Items.FindByValue("5").Selected;
            dias[6] = cblDias.Items.FindByValue("6").Selected;
            dia = gesDias.CargarDias(tbLegajo.Text,dias[0], dias[1], dias[2], dias[3], dias[4], dias[5], dias[6]);
            return gesDias.AgregarDia(dia);
        }

        protected bool FncValidaciones()
        {
            bool validado = false;
            if(cvDias.IsValid ==true &&cvDNI.IsValid == true && cvLegajo.IsValid == true && cvHorario.IsValid == true && cvUsuario.IsValid == true && cvMedicoExistente.IsValid == true && cvFecha.IsValid == true)
            {
                validado = true;
            }
            return validado;
        }
        protected void FncResultado(bool resMed, bool resDia)
        {
            if (resMed && resDia) lblResultadoMed.Text = "Medico agregado correctamente";
            else lblResultadoMed.Text = "No fue posible agregar el medico";

        }

        protected void btnCrear_Click(object sender, EventArgs e)
        {
            if (FncValidaciones())
            {
                UtilidadWebControls utiWeb = new UtilidadWebControls();
                FncResultado(FncAgregarUsuarioMedico(),FncAgregarRegistroDias()) ;
                utiWeb.FncContraseñaProvincia(tbContraseña, tbChequeoContraseña, false);
                FncLimpiarTextBoxs();
                FncSetDDLDefault();
                
                
            }
            
        }

        protected void ddlProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(ddlProvincia.SelectedValue != "-1")
            {
                UtilidadWebControls utiWeb = new UtilidadWebControls();
                utiWeb.FncCargarLocalidades(ddlLocalidad,ddlProvincia);
                utiWeb.FncContraseñaProvincia(tbContraseña,tbChequeoContraseña,true);
            }
            


        }


        protected void cvDNI_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string Texto = tbDNI.Text.Trim();
            string resultTexto = Texto.Replace(" ", string.Empty);

            if (resultTexto.Count() == 8) args.IsValid = true;
            else args.IsValid = false;
        }

        protected void cvLegajo_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string Texto = tbLegajo.Text.Trim();
            string resultTexto = Texto.Replace(" ", string.Empty);
            if (resultTexto.Count() == 4) args.IsValid = true;
            else args.IsValid = false;
        }

        protected void cvHorario_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (ddlInicio.SelectedValue == ddlFinal.SelectedValue) args.IsValid = false;
            else args.IsValid = true;
        }

        protected void cvUsuario_ServerValidate(object source, ServerValidateEventArgs args)
        {
            GestionMedico gesMed = new GestionMedico();
            GestionAdministrador gesAdmin = new GestionAdministrador();
            Entidades.Administrador admin = new Entidades.Administrador();
            admin.Usuario = tbUsuario.Text;
            if (gesMed.existeUsuarioMedico(tbUsuario.Text) || gesAdmin.ExisteUsuario(admin)) args.IsValid = false;
            else args.IsValid=true;


        }


        protected void cvMedicoExistente_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = false;
            cvMedicoExistente.Text = "*El medico ya esta registrado en la base de datos (Legajo y/o DNI)";
            GestionMedico gesmed = new GestionMedico();
            Entidades.Medico med = new Entidades.Medico();
            Utilidades uti = new Utilidades();
            if (tbLegajo.Text.Length == 4 && tbDNI.Text.Length == 8)
            {
                med.Legajo = uti.dividirCadenaEn4(tbLegajo.Text);
                med.Dni = uti.dividirCadenaEn8(tbDNI.Text);
                args.IsValid = !(gesmed.ExisteMedico(med));
            }
            else 
            { 
                args.IsValid = false;
                cvMedicoExistente.Text = "*Formato de legajo y/o DNI invalido";
            }
            
            
        }

        protected void cvFecha_ServerValidate(object source, ServerValidateEventArgs args)
        {
            DateTime fechaMin = new DateTime(1874, 1, 1);
            DateTime seleccion = DateTime.Parse(tbNacimiento.Text);
            if (seleccion.Date > DateTime.Today.Date || seleccion.Date < fechaMin.Date) args.IsValid = false;
            else args.IsValid = true;
        }

        protected void cvDias_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = false;
            foreach(ListItem item in cblDias.Items)
            {
                if (item.Selected) args.IsValid = true;
            }
            
            
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }

        protected void FncLimpiarTextBoxs()
        {
            tbApellido.Text = "";
            tbChequeoContraseña.Text = "";
            tbContraseña.Text = "";
            tbCorreo.Text = "";
            tbDireccion.Text = "";
            tbDNI.Text = "";
            tbLegajo.Text = "";
            tbNacimiento.Text = "";
            tbNacionalidad.Text = "";
            tbNombre.Text = "";
            tbTelefono.Text = "";
            tbUsuario.Text = "";

        }

        protected void FncSetDDLDefault()
        {
            ddlEspecialidad.SelectedIndex = 0;
            ddlFinal.SelectedIndex = 0;
            ddlInicio.SelectedIndex = 0;
            ddlLocalidad.Items.Clear();
            ddlLocalidad.Items.Add(new ListItem("-- Eliga una Provincia --", "-1"));
            ddlLocalidad.SelectedIndex = 0;
            ddlProvincia.SelectedIndex = 0;
            ddlSexo.SelectedIndex = 0;
            cblDias.ClearSelection();
        }

    }
}