using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Clinica;
using System.Data;

namespace Vistas.Administrador.PacientesAdm
{
    public partial class ListarPacientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (Session["nombreUsuario"] == null || string.IsNullOrEmpty(Session["nombreUsuario"].ToString()))
            {
                Response.Redirect("~/Login.aspx");
            }
            else lblUsuario.Text = Session["nombreUsuario"].ToString();

            lblGrdVacio.Text = string.Empty;
            lblACTUALIZAR.Text = string.Empty;
            if (!IsPostBack)
            {
                UtilidadWebControls utiWeb = new UtilidadWebControls();
                utiWeb.FncCargarProvincias(ddlProvincia);
                utiWeb.FncCargarTablaPacientes(grvPacientes);
                Session["filtro"] = string.Empty;
                if (grvPacientes.Rows.Count == 0) lblGrdVacio.Text = "*NO HAY REGISTROS CARGADOS DE PACIENTES EN LA BASE DE DATOS*";
            }



        }


        protected void BtnFiltPaciente_Click(object sender, EventArgs e)
        {
            UtilidadWebControls utiWeb = new UtilidadWebControls();
            grvPacientes.EditIndex = -1;
            if (txtDNI.Text.Length != 0 || txtApellido.Text.Length != 0 || ddlProvincia.SelectedValue.ToString() != "-1")
            {
                string consulta = "SELECT P.DNI,P.Nombre,P.Apellido,S.Descripcion AS Sexo,P.Nacionalidad,FORMAT(P.FechaDeNacimiento,'dd/MM/yyyy')AS [FechaDeNacimiento],P.Direccion,L.Nombre AS Localidad,PROV.Nombre AS Provincia,P.CorreoElectronico,P.Telefono FROM (((PACIENTES AS P INNER JOIN SEXOS AS S ON P.ID_Sexo = S.ID)  INNER JOIN LOCALIDADES AS L ON P.Cod_Localidad = L.Codigo)INNER JOIN PROVINCIAS AS PROV ON P.Cod_Provincia = PROV.Codigo)  WHERE P.Activo != 0";
                consulta = FncFiltrarConsulta(consulta);
                utiWeb.FncCargarTablaPacientes(consulta, grvPacientes);
                Session["filtro"] = consulta;

                txtDNI.Text = "";
                txtApellido.Text = "";
                ddlProvincia.SelectedIndex = 0;
                

            }
            else
            {
                Session["filtro"] = string.Empty;
                utiWeb.FncCargarTablaPacientes(grvPacientes);
            }
            if (grvPacientes.Rows.Count == 0) { lblGrdVacio.Text = "* NO HAY NINGUNA COINCIDENCIA *"; }
            
        }

        protected string FncFiltrarConsulta(string consult)
        {
            UtilidadWebControls utiWeb = new UtilidadWebControls();
            string[] palabrasDivididas;
            string agregado = "";
            bool flagPrimero = true;
            //FILTRO DE DNI
            if (!string.IsNullOrEmpty(txtDNI.Text.Trim()))
            {
                palabrasDivididas = utiWeb.FncSepararPalabrasEnStrings(txtDNI);
                foreach(string palabra in palabrasDivididas)
                {
                    if (flagPrimero)
                    {
                        agregado = "and (P.DNI LIKE '" + palabra + "%' ";
                        flagPrimero = false;
                    }
                    else agregado += "or P.DNI LIKE'" + palabra + "%' ";
                }
                consult += agregado + ")";
            }
            //FILTRO DE APELLIDO
            if (!string.IsNullOrEmpty(txtApellido.Text.Trim()))
            {
                agregado = "and P.Apellido LIKE '" + txtApellido.Text.Trim() + "%' ";
                consult += agregado;
            }
            if (ddlProvincia.SelectedValue.ToString() != "-1")
            {
                agregado = "AND P.Cod_Provincia = '" + ddlProvincia.SelectedValue.ToString() + "'";
                consult += agregado;
            }
            return consult;
        }

        protected void grvPacientes_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //se buscan los valores "Originales" de la fila

            Label IdSexo = (Label)grvPacientes.Rows[e.NewEditIndex].FindControl("lblSexo");
            Label codLocalidad = (Label)grvPacientes.Rows[e.NewEditIndex].FindControl("lblLocalidad");
            Label codProvincia = (Label)grvPacientes.Rows[e.NewEditIndex].FindControl("lblProvinciaGrd");


            //se pasa la GRD a modo edicion
            grvPacientes.EditIndex = e.NewEditIndex;

            //carga los datos de la GRD 

            FncRecargarTabla();

            //funcion para setear los datos "originales" en los ddl
            FncCargarDDLsGDVEditar(codProvincia.Text, codLocalidad.Text, IdSexo.Text);
        }

        protected void grvPacientes_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GestionPacientes gesPac = new GestionPacientes();
            Entidades.Paciente paci = new Entidades.Paciente();

            //Controles edit          
            Label DNI = (Label)grvPacientes.Rows[grvPacientes.EditIndex].FindControl("lbl_eit_Dni");
            TextBox nombre = (TextBox)grvPacientes.Rows[grvPacientes.EditIndex].FindControl("txtNombre");
            TextBox apellido = (TextBox)grvPacientes.Rows[grvPacientes.EditIndex].FindControl("txtApellido");
            DropDownList sexo = (DropDownList)grvPacientes.Rows[grvPacientes.EditIndex].FindControl("ddlSexo");
            TextBox nacionalidad = (TextBox)grvPacientes.Rows[grvPacientes.EditIndex].FindControl("txtNacionalidad");
            TextBox fechaNacimiento = (TextBox)grvPacientes.Rows[grvPacientes.EditIndex].FindControl("txtFechaNacimiento");
            TextBox direccion = (TextBox)grvPacientes.Rows[grvPacientes.EditIndex].FindControl("txtDireccion");
            DropDownList localidad = (DropDownList)grvPacientes.Rows[grvPacientes.EditIndex].FindControl("ddlLocalidad");
            DropDownList provincia = (DropDownList)grvPacientes.Rows[grvPacientes.EditIndex].FindControl("ddlProvincia");
            TextBox email = (TextBox)grvPacientes.Rows[grvPacientes.EditIndex].FindControl("txtEmail");
            TextBox telefono = (TextBox)grvPacientes.Rows[grvPacientes.EditIndex].FindControl("txtTelefono");

            DateTime fechaMin = new DateTime(1874, 1, 1);
            if (DateTime.ParseExact(fechaNacimiento.Text, "dd/MM/yyyy", null) <= DateTime.Today && DateTime.ParseExact(fechaNacimiento.Text, "dd/MM/yyyy", null) > fechaMin)
            {
                paci = gesPac.CargarObjetoPaciente(DNI.Text, nombre.Text.Trim(), apellido.Text.Trim(), sexo.SelectedValue, nacionalidad.Text.Trim(), fechaNacimiento.Text, direccion.Text.Trim(), localidad.SelectedValue, provincia.SelectedValue, email.Text.Trim(), telefono.Text.Trim());
                if(gesPac.ActualizarPaciente(paci))
                {
                    lblACTUALIZAR.ForeColor = System.Drawing.Color.Green;
                    lblACTUALIZAR.Text = "REGISTRO DE PACIENTE ACTUALIZADO CORRECTAMENTE";
                }
                else
                {
                    lblACTUALIZAR.ForeColor = System.Drawing.Color.Red;
                    lblACTUALIZAR.Text = "No fue posible actualizar el registro del paciente deseado";
                }

                grvPacientes.EditIndex = -1;

                FncRecargarTabla();
            }
            else lblGrdVacio.Text = "* INGRESE UNA FECHA LOGICA *";
            
        }

        protected void FncCargarDDLsGDVEditar(string nombreProv, string nombreLoc, string nombreSexo)
        {
            //Los parametros son los datos "originales" de la fila
            //utiweb para no repetir tantas funciones de carga
            UtilidadWebControls utiWeb = new UtilidadWebControls();
            //PROVINCIAS Y LOCALIDADES

            //Primero se buscan los DDL de los EditItemTemplate
            DropDownList ddlLoc = (DropDownList)grvPacientes.Rows[grvPacientes.EditIndex].FindControl("ddlLocalidad");
            DropDownList ddlProv = (DropDownList)grvPacientes.Rows[grvPacientes.EditIndex].FindControl("ddlProvincia");

            //Segundo se busca el codigo de la provincia "original" y se selecciona en el DDL
            GestionProvincia gesProv = new GestionProvincia();
            ddlProv.SelectedValue = gesProv.ObtenerCodigoProvincia(nombreProv);

            //Tercero se cargan las localidades de la provincia "original"
            utiWeb.FncCargarLocalidades(ddlLoc,ddlProv);

            //Cuarto y ultimo se selecciona la localidad "original en el DDL
            GestionLocalidades gesLoc = new GestionLocalidades();
            ddlLoc.SelectedValue = gesLoc.ObtenerCodigoLocalidad(nombreLoc, ddlProv.SelectedValue.ToString());

            //DLL SEXO

            //Sexo
            DropDownList ddlSexo = (DropDownList)grvPacientes.Rows[grvPacientes.EditIndex].FindControl("ddlSexo");
            GestionSexo gesSex = new GestionSexo();
            ddlSexo.SelectedValue = gesSex.ObtenerCodigoSexo(nombreSexo);
        }
        protected void grvPacientes_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grvPacientes.EditIndex = -1;
            FncRecargarTabla();
        }
        protected void grvPacientes_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grvPacientes.EditIndex = -1;
            grvPacientes.PageIndex = e.NewPageIndex;
            FncRecargarTabla();


        }
        protected void ddlProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            UtilidadWebControls utiWeb = new UtilidadWebControls();
            DropDownList ddlLoc = (DropDownList)grvPacientes.Rows[grvPacientes.EditIndex].FindControl("ddlLocalidad");
            DropDownList ddlProv = (DropDownList)grvPacientes.Rows[grvPacientes.EditIndex].FindControl("ddlProvincia");

            utiWeb.FncCargarLocalidades(ddlLoc, ddlProv);
        }
        protected void FncRecargarTabla()
        {
            UtilidadWebControls utiWeb = new UtilidadWebControls();
            if (string.IsNullOrEmpty(Session["filtro"].ToString())) utiWeb.FncCargarTablaPacientes(grvPacientes);
            else utiWeb.FncCargarTablaPacientes(Session["filtro"].ToString(), grvPacientes);
        }

        protected void BtnCerrarSesion_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }
    }
}