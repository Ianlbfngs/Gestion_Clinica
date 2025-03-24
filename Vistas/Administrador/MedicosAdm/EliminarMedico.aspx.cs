using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Text.RegularExpressions;
using Clinica;
using Entidades;

namespace Vistas.Administrador.MedicosAdm
{
    public partial class EliminarMedico : System.Web.UI.Page
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
            if (cvLegajo.IsValid)
            {

                FncCargarTablaMedicos();
                if (grdEliminacion.Rows.Count != 0)
                {
                    FncHabilitarYDeshabilitarControles(1);
                    
                }
                else
                {
                    FncHabilitarYDeshabilitarControles(3);


                }
                lblResultado0.Visible = true;

            }

        }
        protected void btnConfirmar_Click1(object sender, EventArgs e)
        {
            UtilidadWebControls utiWeb = new UtilidadWebControls();
            string[] legajos = utiWeb.FncSepararPalabrasEnStrings(txtLegajo);
            GestionMedico gesMed = new GestionMedico();
            ChequeoEliminacion(gesMed.EliminarMedicos(legajos));
            FncHabilitarYDeshabilitarControles(2);
            
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            FncHabilitarYDeshabilitarControles(2);
            lblResultado0.ForeColor = Color.Red;
            lblResultado0.Text = "* LA ELIMINACION FUE CANCELADA *";
        }


        protected void ChequeoEliminacion(bool CheckEliminacion)
        {
            if (CheckEliminacion)
            {
                
                lblResultado0.Text = "LOS MEDICOS SOLICITADOS HAN SIDO ELIMINADOS CON EXITO";
                lblResultado0.ForeColor = Color.Green;
                
            }
            else
            {
                lblResultado0.Text = "Error al eliminar los medicos y/o medicos inexistentes";
                lblResultado0.ForeColor = Color.Red;
                
            }
            lblResultado0.Visible = true;
            btnConfirmar.Visible = false;
            txtLegajo.Text = string.Empty;
            
        }

        protected void FncCargarTablaMedicos()
        {
            UtilidadWebControls utiWeb = new UtilidadWebControls();
            string[] legajos = utiWeb.FncSepararPalabrasEnStrings(txtLegajo);
            string consulta = "select m.Legajo,m.DNI,m.Nombre,m.Apellido,s.Descripcion as Sexo,m.Nacionalidad, FORMAT(m.FechaDeNacimiento, 'dd/MM/yyyy') as 'Fecha de nacimiento',m.Direccion,l.Nombre as Localidad, p.Nombre as Provincia, m.CorreoElectronico as 'Correo Electronico',m.Telefono,m.Usuario,m.Contraseña,e.Nombre as Especialidad,m.Horario_inicio as 'Inicio de jornada', m.Horario_Fin as 'Fin de jornada' from(((MEDICOS as m inner join SEXOS as s on m.ID_Sexo = s.ID)inner join ESPECIALIDADES as e on m.Cod_Especialidad = e.Codigo)inner join PROVINCIAS as p on m.Cod_Provincia = p.Codigo)inner join LOCALIDADES as l on m.Cod_Localidad = l.Codigo where Activo != 0 ";
            bool flagAnd = true;
            foreach(string legajo in legajos)
            {
                if (flagAnd) { consulta += "and (Legajo ='" + legajo + "' "; flagAnd = false; }
                else consulta += "or Legajo ='" + legajo + "' ";
            }
            consulta += ")";
            utiWeb.FncCargarTablaMedicos(consulta, grdEliminacion);

        }

        protected void FncHabilitarYDeshabilitarControles(int funcion)
        {
            switch (funcion)
            {
                case 1:
                    txtLegajo.Enabled = false;
                    btnConfirmar.Visible = true;
                    btnCancelar.Visible = true;
                    grdEliminacion.Visible = true;
                    btnEliminar.Enabled = false;
                    lblResultado0.ForeColor = Color.Black;
                    lblResultado0.Text = "¿Desea eliminar los siguientes medicos?";
                    
                    break;
                case 2:
                    txtLegajo.Enabled = true;
                    btnConfirmar.Visible = false;
                    btnCancelar.Visible = false;
                    lblResultado0.Visible = true;
                    grdEliminacion.Visible = false;
                    txtLegajo.Text = string.Empty;
                    btnEliminar.Enabled = true;
                    break;
                case 3:
                    lblResultado0.Text = "No existen medicos con los legajos solicitados";
                    lblResultado0.ForeColor = Color.Red;
                    btnConfirmar.Visible = false;
                    txtLegajo.Text = string.Empty;
                    break; 
            }
        }

        protected void cvLegajo_ServerValidate(object source, ServerValidateEventArgs args)
        {
            UtilidadWebControls utiWeb = new UtilidadWebControls();
            string[] legajos = utiWeb.FncSepararPalabrasEnStrings(txtLegajo);
            args.IsValid = true;

            foreach (string legajo in legajos)
            {
                if (legajo.Length != 4)
                {
                    args.IsValid = false;
                    cvLegajo.Text = "Los legajos deben tener exactamente 4 caracteres.";
                    break;
                }

            }

        }
        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }


    }
}