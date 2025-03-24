using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using Entidades;
using Clinica;

namespace Vistas.Administrador.PacientesAdm
{
    public partial class EliminarPacientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (Session["nombreUsuario"] == null || string.IsNullOrEmpty(Session["nombreUsuario"].ToString()))
            {
                Response.Redirect("~/Login.aspx");
            }
            else lblUsuario.Text = Session["nombreUsuario"].ToString();
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            if (CustomValidator1.IsValid)
            {
                FncCargarTablaPacientes();
                if (grdEliminacion.Rows.Count == 0)
                {
                    lblResultado0.Text = "No existen pacientes con los DNIs solicitados, en nuestra base de datos";
                    lblResultado0.ForeColor = System.Drawing.Color.Red;
                    btnConfirmar.Visible = false;
                    txtDNI.Text = string.Empty;
                }
                else
                {
                    txtDNI.Enabled = false;
                    btnConfirmar.Visible = true;
                    btnCancelar.Visible = true;
                    lblResultado0.ForeColor = System.Drawing.Color.Black;
                    grdEliminacion.Visible = true;
                    btnEliminar.Enabled = false;
                    lblResultado0.Text = "¿Desea eliminar los siguientes paciente?";
                }
                lblResultado0.Visible = true;
            }

        }

        protected void FncCargarTablaPacientes()
        {
            UtilidadWebControls utiWeb = new UtilidadWebControls();
            string[] DNIs = utiWeb.FncSepararPalabrasEnStrings(txtDNI);
            string consulta = "SELECT P.DNI,P.Nombre,P.Apellido,S.Descripcion AS Sexo,P.Nacionalidad,FORMAT(P.FechaDeNacimiento,'dd/MM/yyyy')AS [FechaDeNacimiento],P.Direccion,L.Nombre AS Localidad,PROV.Nombre AS Provincia,P.CorreoElectronico,P.Telefono FROM (((PACIENTES AS P INNER JOIN SEXOS AS S ON P.ID_Sexo = S.ID)  INNER JOIN LOCALIDADES AS L ON P.Cod_Localidad = L.Codigo)INNER JOIN PROVINCIAS AS PROV ON P.Cod_Provincia = PROV.Codigo)  WHERE P.Activo != 0 ";
            bool flagAnd = true;
            foreach (string dni in DNIs)
            {
                if (flagAnd) { consulta += "and (P.DNI = '" + dni + "'"; flagAnd = false; }
                else { consulta += "or P.DNI = '" + dni + "'"; }
            }
            consulta += ")";
            utiWeb.FncCargarTablaPacientes(consulta, grdEliminacion);
        }

        protected void ChequeoEliminacion(bool CheckEliminacion)
        {
            if (CheckEliminacion)
            {
                lblResultado0.Text = "LOS PACIENTES SOLICITADOS HAN SIDO ELIMINADOS CON EXITO";
                lblResultado0.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                lblResultado0.Text = "Error al eliminar los pacientes y/o pacientes inexistente";
                lblResultado0.ForeColor = System.Drawing.Color.Red;
            }
            lblResultado0.Visible = true;
            btnConfirmar.Visible = false;
            txtDNI.Text = string.Empty;
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            UtilidadWebControls utiWeb = new UtilidadWebControls();
            string[] DNIs = utiWeb.FncSepararPalabrasEnStrings(txtDNI);
            args.IsValid = true;
            foreach(string dni in DNIs)
            {
                if(dni.Length != 8)
                {
                    args.IsValid = false;
                    CustomValidator1.Text = "Los DNIs deben tener exactamente 8 caracteres";
                    break;
                    
                }
            }

        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            UtilidadWebControls utiWeb = new UtilidadWebControls();
            string[] DNIs = utiWeb.FncSepararPalabrasEnStrings(txtDNI);
            GestionPacientes gesPac = new GestionPacientes();
            ChequeoEliminacion(gesPac.eliminarPacientes(DNIs));
            txtDNI.Enabled = true;
            btnConfirmar.Visible = false;
            btnCancelar.Visible = false;
            lblResultado0.Visible = true;
            grdEliminacion.Visible = false;
            txtDNI.Text = string.Empty;
            btnEliminar.Enabled = true;
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            txtDNI.Enabled = true;
            btnConfirmar.Visible = false;
            btnCancelar.Visible = false;
            lblResultado0.Visible = false;
            grdEliminacion.Visible = false;
            txtDNI.Text = string.Empty;
            btnEliminar.Enabled = true;
        }
        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }
    }
}