using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Clinica;
using Entidades;

namespace Vistas
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            lblErrorIngreso.Visible = false;
            Session["nombreUsuario"] = string.Empty;
            Session["Legajo"] = string.Empty;

        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {

            
            Entidades.Administrador admin = new Entidades.Administrador();
            Entidades.Medico med = new Entidades.Medico();

            GestionAdministrador gesAdmin = new GestionAdministrador();
            GestionMedico gesMed = new GestionMedico();

            
            admin.Usuario = txtUsuario.Text.Trim();
            admin.Contraseña = txtContraseña.Text.Trim();

            med.Usuario = txtUsuario.Text.Trim();
            med.Contraseña = txtContraseña.Text.Trim();

            
            if (gesAdmin.ExisteUsuario(admin))
            {
                Session["nombreUsuario"] = txtUsuario.Text;
                Response.Redirect("~/Administrador/MenuAdmin.aspx");
            }
            else if (gesMed.existeUsuarioMedico(med))
            {
                med = gesMed.ObtenerMedicoEspecifico(med,0);
                string legajo = new string(med.Legajo);
                Session["Legajo"] = legajo;
                Session["nombreUsuario"] = txtUsuario.Text;
                Response.Redirect("~/Medico/ListadoTurnos.aspx");
            }
            else
            {
                lblErrorIngreso.Visible = true;
                txtUsuario.Text = "";
            }
            
        }
    }
}