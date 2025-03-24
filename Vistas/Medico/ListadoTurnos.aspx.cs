using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Entidades;
using Clinica;

namespace Vistas.Medico
{
    public partial class ListadoTurnos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (Session["nombreUsuario"] == null || string.IsNullOrEmpty(Session["nombreUsuario"].ToString()))
            {
                Response.Redirect("~/Login.aspx");
            }
            else lblUsuario.Text = Session["nombreUsuario"].ToString();

            lblAVISO.Text = string.Empty;
            lblActualizado.Text = string.Empty;

            if (!IsPostBack)
            {
                UtilidadWebControls utiWeb = new UtilidadWebControls();
                utiWeb.FncCargarTablaTurnos(grdTurnos, FncCargarLegajoTurno());
                utiWeb.FncRangoHorarioMedico(ddlHorario, Session["Legajo"].ToString());
                if (grdTurnos.Rows.Count == 0) lblAVISO.Text = "*NO HAY REGISTROS CARGADOS DE TURNOS EN LA BASE DE DATOS*";
                Session["filtro"] = string.Empty;

            }
            

        }

        protected Turno FncCargarLegajoTurno()
        {
            //funcion que le carga el legajo del usuario que inicio sesion a un objeto turno
            Turno turno = new Turno();
            Utilidades uti = new Utilidades();
            turno.Legajo_Medico = uti.dividirCadenaEn4(Session["Legajo"].ToString());
            return turno;
        }

        protected bool FncTodosLosFiltrosVacios()
        {
            bool exito = false;
            if (string.IsNullOrEmpty(txtDNIfiltro.Text) && ddlHorario.SelectedValue == "-1" && cblDias.SelectedIndex == -1) exito = true;
            return exito;
            
        }

        protected void FncLimpiarFiltros()
        {
            txtDNIfiltro.Text = string.Empty;
            ddlHorario.SelectedValue = "-1";
            cblDias.ClearSelection();
        }

       
        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            UtilidadWebControls utiWeb = new UtilidadWebControls();
            if (FncTodosLosFiltrosVacios())
            {
                Session["filtro"] = string.Empty;
                
                utiWeb.FncCargarTablaTurnos(grdTurnos, FncCargarLegajoTurno());
            }
            else
            {
                string consulta = "set language spanish; select T.ID as ID, FORMAT(T.Fecha, 'dd/MM/yyyy') as Fecha, T.Horario as Horario, T.DNI_Paciente as [DNI del paciente], P.Apellido as [Apellido del paciente], T.Presente, T.Observacion from TURNOS as T inner join PACIENTES as P ON T.DNI_Paciente = P.DNI where T.Legajo_Medico ='" + Session["Legajo"].ToString()+"' ";
                consulta = FncFiltrarConsulta(consulta);
                utiWeb.FncCargarTablaTurnos(consulta,grdTurnos);
                Session["filtro"] = consulta;
            }
            if (grdTurnos.Rows.Count == 0) lblAVISO.Text = "* NO HAY NINGUNA COINCIDENCIA *";
            FncLimpiarFiltros();
        }
        protected string FncFiltrarConsulta(string consult)
        {
            bool flagDiaAND = true;
            if (!string.IsNullOrEmpty(txtDNIfiltro.Text.Trim()))
            {
                consult += "and T.DNI_Paciente like '" + txtDNIfiltro.Text.Trim() + "%' ";
            }
            if (ddlHorario.SelectedValue != "-1")
            {
                consult += "and T.Horario like '" + ddlHorario.SelectedItem.ToString() + "'";
            }
            if (cblDias.SelectedIndex != -1)
            {
                foreach (ListItem item in cblDias.Items)
                {
                    if (item.Selected)
                    {
                        if (flagDiaAND)
                        {
                            consult += "and (DATENAME(weekday,T.Fecha) ='" + item.Text.ToString() + "' ";
                            flagDiaAND = false;
                        }
                        else
                        {
                            consult += "or DATENAME(weekday,T.Fecha) ='" + item.Text.ToString() + "'";
                        }

                    }
                }
                consult += ")";
            }

            return consult;
        }
        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
           
        }
        protected void grdTurnos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grdTurnos.EditIndex = e.NewEditIndex;
            FncRecargarTabla();
            CheckBox cbPresente = (CheckBox)grdTurnos.Rows[grdTurnos.EditIndex].FindControl("cbPresenteE");
            TextBox txtObservacion = (TextBox)grdTurnos.Rows[grdTurnos.EditIndex].FindControl("txtObservacionE");
            Label fecha = (Label)grdTurnos.Rows[grdTurnos.EditIndex].FindControl("lblFechaEdit");
            if (DateTime.Parse(fecha.Text) > DateTime.Today) cbPresente.Enabled = false;
            if (!cbPresente.Checked) txtObservacion.Enabled = false;
        }

        protected void grdTurnos_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            C_GestionTurnos gesTur = new C_GestionTurnos();
            
            Label lblID = (Label)grdTurnos.Rows[grdTurnos.EditIndex].FindControl("lblIDTURNOEdit");
            CheckBox cbPresente = (CheckBox)grdTurnos.Rows[grdTurnos.EditIndex].FindControl("cbPresenteE");
            TextBox txtObservacion = (TextBox)grdTurnos.Rows[grdTurnos.EditIndex].FindControl("txtObservacionE");

            Turno turnoActualizar = gesTur.ObtenerTurnoEspecifico(lblID.Text);
            turnoActualizar.Presente = cbPresente.Checked;
            turnoActualizar.Observacion = txtObservacion.Text.Trim();
            if (gesTur.ActualizarTurno(turnoActualizar))
            {
                lblActualizado.ForeColor = System.Drawing.Color.Green;
                lblActualizado.Text = "CAMBIO AGREGADO CORRECTAMENTE";
            }
            else
            {
                lblActualizado.ForeColor = System.Drawing.Color.Red;
                lblActualizado.Text = "No fue posible realizar el cambio deseado";
            }
            grdTurnos.EditIndex = -1;
            FncRecargarTabla();
        }


        protected void FncRecargarTabla()
        {
            UtilidadWebControls utiWeb = new UtilidadWebControls();
            if (string.IsNullOrEmpty(Session["filtro"].ToString())) utiWeb.FncCargarTablaTurnos(grdTurnos, FncCargarLegajoTurno());
            else utiWeb.FncCargarTablaTurnos(Session["filtro"].ToString(),grdTurnos);

        }

        protected void grdTurnos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdTurnos.EditIndex = -1;
            grdTurnos.PageIndex = e.NewPageIndex;
            FncRecargarTabla();
        }

        protected void grdTurnos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grdTurnos.EditIndex = -1;
            FncRecargarTabla();
        }

        protected void cbPresenteE_CheckedChanged(object sender, EventArgs e)
        {
            
            TextBox txtObservacion = (TextBox)grdTurnos.Rows[grdTurnos.EditIndex].FindControl("txtObservacionE");
            CheckBox chckBox = (CheckBox)sender;
            if (chckBox.Checked)
            {
                txtObservacion.Enabled = true;
            }
            else
            {
                txtObservacion.Text = string.Empty;
                txtObservacion.Enabled = false;
            }
        }
    }
}