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

namespace Vistas.Administrador
{
    public partial class Informes : System.Web.UI.Page
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
                utiWeb.FncCargarEspecialidades(ddlEspecialidad);
                utiWeb.FncCargarAños(ddlAño1);
                utiWeb.FncCargarAños(ddlAño2);
            }

        }

        protected void btnInforme1_Click(object sender, EventArgs e)
        {
            if (cvAños.IsValid)
            {
                C_GestionTurnos gesTur = new C_GestionTurnos();
                lblInforme1.Text = gesTur.PrimerInforme(ddlAño1.SelectedValue.ToString(), ddlAño2.SelectedValue.ToString());
                ddlAño1.Enabled = false;
                ddlAño2.Enabled = false;
                btnInforme1.Enabled = false;
            }
            
        }


        protected void btnInforme2_Click(object sender, EventArgs e)
        {
            C_GestionTurnos gesTur = new C_GestionTurnos();
            lblInforme2.Text=gesTur.SegundoInforme(ddlEspecialidad.SelectedItem.Text);
            ddlEspecialidad.Enabled = false;
            btnInforme2.Enabled = false;
        }


        protected void btnInforme3_Click(object sender, EventArgs e)
        {
            C_GestionTurnos gesTur = new C_GestionTurnos();
            lblInforme3.Text = gesTur.TercerInforme(txtInforme3.Text);
            txtInforme3.Enabled = false;
            btnInforme3.Enabled = false;
        }

        protected void btnLimpiarInformes_Click(object sender, EventArgs e)
        {
            foreach(ListItem item in cblInformes.Items)
            {
                if (item.Selected)
                {
                    switch (item.Value)
                    {
                        case "1":
                            lblInforme1.Text = string.Empty;
                            FncHabilitarDDl(ddlAño1);
                            FncHabilitarDDl(ddlAño2);
                            ddlAño1.Enabled = true;
                            ddlAño2.Enabled = true;
                            ddlAño1.SelectedValue = "-1";
                            ddlAño2.SelectedValue = "-1";
                            btnInforme1.Enabled = true;
                            break;
                        case "2":
                            ddlEspecialidad.SelectedIndex = 0;
                            ddlEspecialidad.Enabled = true;
                            lblInforme2.Text = string.Empty;
                            btnInforme2.Enabled = true;
                            break;
                        case "3":
                            txtInforme3.Enabled = true;
                            txtInforme3.Text = string.Empty;
                            lblInforme3.Text = string.Empty;
                            btnInforme3.Enabled = true;
                            break;
                        default:
                            break;
                    }
                }
            }
            cblInformes.ClearSelection();
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }

        protected void ddlAño1_SelectedIndexChanged(object sender, EventArgs e)
        {
            FncHabilitarDDl(ddlAño2);
            if (ddlAño1.SelectedValue != "-1") ddlAño2.Items.FindByValue(ddlAño1.SelectedValue).Enabled = false;
        }

        protected void ddlAño2_SelectedIndexChanged(object sender, EventArgs e)
        {
                FncHabilitarDDl(ddlAño1);
                if(ddlAño2.SelectedValue !="-1")ddlAño1.Items.FindByValue(ddlAño2.SelectedValue).Enabled = false;
        }

        protected void cvAños_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = false;
            if (ddlAño1.SelectedValue != "-1" && ddlAño2.SelectedValue != "-1") args.IsValid = true;
        }

        protected void FncHabilitarDDl(DropDownList ddl)
        {
            foreach (ListItem item in ddl.Items)
            {
                item.Enabled = true;
            }
        }
    }
}