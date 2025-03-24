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

namespace Vistas.Administrador.MedicosAdm
{
    public partial class ListarMedicos : System.Web.UI.Page
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
            lblACTUALIZADO.Text = string.Empty;
            if (!IsPostBack)
            {
                UtilidadWebControls utiWeb = new UtilidadWebControls();
                utiWeb.FncCargarTablaMedicos(grdMedicos);
                utiWeb.FncCargarTablaDias(grdDias);
                if (grdMedicos.Rows.Count == 0) lblAVISO.Text = "*NO HAY REGISTROS CARGADOS DE MEDICOS EN LA BASE DE DATOS*";
                Session["FiltroMedico"] = string.Empty;
                Session["FiltroDias"] = string.Empty;

            }

        }


        protected void btnFiltro_Click(object sender, EventArgs e)
        {
            UtilidadWebControls utiWeb = new UtilidadWebControls();
            grdMedicos.EditIndex = -1;
            grdMedicos.PageIndex = 0;
            if (FncTodosLosFiltrosVacios()) {
                Session["FiltroMedico"] = string.Empty;

                utiWeb.FncCargarTablaMedicos(grdMedicos); 

            }
            else
            {

                string consulta = "select m.Legajo,m.DNI,m.Nombre,m.Apellido,s.Descripcion as Sexo,m.Nacionalidad, FORMAT(m.FechaDeNacimiento, 'dd/MM/yyyy') as 'Fecha de nacimiento',m.Direccion,l.Nombre as Localidad, p.Nombre as Provincia, m.CorreoElectronico as 'Correo Electronico',m.Telefono,m.Usuario,m.Contraseña,e.Nombre as Especialidad,m.Horario_inicio as 'Inicio de jornada', m.Horario_Fin as 'Fin de jornada' from((((MEDICOS as m inner join SEXOS as s on m.ID_Sexo = s.ID)inner join ESPECIALIDADES as e on m.Cod_Especialidad = e.Codigo)inner join PROVINCIAS as p on m.Cod_Provincia = p.Codigo)inner join LOCALIDADES as l on m.Cod_Localidad = l.Codigo)inner join DiasDeAtencion as di on m.Legajo = di.Legajo_Medico where Activo != 0 ";
                consulta = FncFiltrarConsulta(consulta);

                utiWeb.FncCargarTablaMedicos(consulta,grdMedicos);
                Session["FiltroMedico"] = consulta;
                

            }
            if (grdMedicos.Rows.Count == 0) lblAVISO.Text = "* NO HAY NINGUNA COINCIDENCIA *";
            FncLimpiarFiltros();
            
            
        }

        protected string FncFiltrarConsulta(string consult)
        {
            UtilidadWebControls utiWeb = new UtilidadWebControls();
            string[] palabrasDivididas;
            string agregado = "";
            bool flagPrimero = true;
            //FILTRO DE ESPECIALIDAD
            if (!string.IsNullOrEmpty(tbEspecialidad.Text.Trim()))
            {
                palabrasDivididas = utiWeb.FncSepararPalabrasEnStrings(tbEspecialidad);
                foreach (string palabra in palabrasDivididas)
                {
                    if (flagPrimero)
                    {
                        agregado = "and (e.Nombre like '" + palabra + "%' ";
                        flagPrimero = false;

                    }
                    else agregado += "or e.Nombre like '" + palabra + "%' ";

                }
                consult += agregado +")";
            }
            //
            flagPrimero = true;
            //FILTRO DE LEGAJO
            if (!string.IsNullOrEmpty(tbLegajo.Text.Trim()))
            {
                palabrasDivididas = utiWeb.FncSepararPalabrasEnStrings(tbLegajo);
                foreach (string palabra in palabrasDivididas)
                {
                    if (flagPrimero)
                    {
                        agregado = "and (m.Legajo like '" + palabra + "%' ";
                        flagPrimero = false;

                    }
                    else agregado += "or m.Legajo like '" + palabra + "%' ";

                }
                consult += agregado + ")";
            }
            //
            flagPrimero = true;
            //FILTRO DE DNI
            if (!string.IsNullOrEmpty(tbDNI.Text.Trim()))
            {
                palabrasDivididas = utiWeb.FncSepararPalabrasEnStrings(tbDNI);
                foreach (string palabra in palabrasDivididas)
                {
                    if (flagPrimero)
                    {
                        agregado = "and (m.DNI like '" + palabra + "%' ";
                        flagPrimero = false;

                    }
                    else agregado += "or m.DNI like '" + palabra + "%' ";

                }
                consult += agregado + ")";
            }
            //FILTRO DE APELLIDO
            if (!string.IsNullOrEmpty(tbApellido.Text.Trim()))
            {
                agregado = " and m.Apellido like '" + tbApellido.Text.Trim() + "%' ";
                consult += agregado;
            }
            //
            flagPrimero = true;
            //FILTRO DE DIAS
            if(cblFiltroDias.SelectedValue != "")
            {
                foreach (ListItem item in cblFiltroDias.Items)
                {
                    if (item.Selected)
                    {
                        if (flagPrimero)
                        {
                            agregado = "and (di." + item.Text.ToString() + " = 1 ";
                            flagPrimero = false;
                        }
                        else agregado += "and di." + item.Text.ToString() + " = 1 ";
                    }

                }
                consult += agregado + ")";
            }
            return consult;
        }

        protected bool FncTodosLosFiltrosVacios()
        {
            bool exito = false;
            if (string.IsNullOrEmpty(tbEspecialidad.Text) && string.IsNullOrEmpty(tbLegajo.Text) && string.IsNullOrEmpty(tbDNI.Text) && string.IsNullOrEmpty(tbApellido.Text) && cblFiltroDias.SelectedIndex == -1) exito = true;
            return exito;
        }

        protected void FncLimpiarFiltros()
        {
            tbDNI.Text = string.Empty;
            tbEspecialidad.Text = string.Empty;
            tbLegajo.Text = string.Empty;
            tbApellido.Text = string.Empty;
            cblFiltroDias.ClearSelection();

        }


        protected void grdMedicos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //se buscan los valores "Originales" de la fila
            Label lblProv = (Label)grdMedicos.Rows[e.NewEditIndex].FindControl("lblProvinciaGRD");
            Label lblLoc = (Label)grdMedicos.Rows[e.NewEditIndex].FindControl("lblLocalidadGRD");
            Label lblSexo = (Label)grdMedicos.Rows[e.NewEditIndex].FindControl("lblSexoGRD");
            Label lblEspe = (Label)grdMedicos.Rows[e.NewEditIndex].FindControl("lblEspecialidadGRD");
            Label lblHinicio = (Label)grdMedicos.Rows[e.NewEditIndex].FindControl("lblHInicio");
            Label lblHfin = (Label)grdMedicos.Rows[e.NewEditIndex].FindControl("lblHFin");

            //se pasa la GRD a modo edicion
            grdMedicos.EditIndex = e.NewEditIndex;

            //carga los datos de la GRD 
            FncRecargarTabla(1);
            //
            FncCargarDDLsGDVEditar(lblProv.Text, lblLoc.Text, lblSexo.Text, lblEspe.Text, lblHinicio.Text, lblHfin.Text);


        }
        protected void FncCargarDDLsGDVEditar(string nombreProv, string nombreLoc, string nombreSexo, string nombreEspecialidad, string horaInicio, string horaFinal)
        {
            //Los parametros son los datos "originales" de la fila
            //UtilidadWebControls para no repetir tanto codigo con funciones genericas
            UtilidadWebControls utiWeb = new UtilidadWebControls();
            
            //PROVINCIAS Y LOCALIDADES

            //Primero se buscan los DDL de los EditItemTemplate
            DropDownList ddlLoc = (DropDownList)grdMedicos.Rows[grdMedicos.EditIndex].FindControl("ddlLocalidadesGRD");
            DropDownList ddlProv = (DropDownList)grdMedicos.Rows[grdMedicos.EditIndex].FindControl("ddlProvinciaGRD");

            //Segundo se busca el codigo de la provincia "original" y se selecciona en el DDL
            GestionProvincia gesProv = new GestionProvincia();
            ddlProv.SelectedValue = gesProv.ObtenerCodigoProvincia(nombreProv);

            //Tercero se cargan las localidades de la provincia "original"
            utiWeb.FncCargarLocalidades(ddlLoc, ddlProv);
            //Cuarto y ultimo se selecciona la localidad "original en el DDL
            GestionLocalidades gesLoc = new GestionLocalidades();
            ddlLoc.SelectedValue = gesLoc.ObtenerCodigoLocalidad(nombreLoc, ddlProv.SelectedValue.ToString());

            //DLL SEXO, ESPECIALIDAD, INICIO Y FIN DE JORNADA

            //Sexo
            DropDownList ddlSexo = (DropDownList)grdMedicos.Rows[grdMedicos.EditIndex].FindControl("ddlSexoGRD");
            GestionSexo gesSex = new GestionSexo();
            ddlSexo.SelectedValue = gesSex.ObtenerCodigoSexo(nombreSexo);

            //Especialidad
            DropDownList ddlEspecialidad = (DropDownList)grdMedicos.Rows[grdMedicos.EditIndex].FindControl("ddlEspecialidadGRD");
            GestionEspecialidades gesEsp = new GestionEspecialidades();
            ddlEspecialidad.SelectedValue = gesEsp.ObtenerCodigoEspecialidad(nombreEspecialidad);
            //Inicio y Fin
            DropDownList ddlHInicio = (DropDownList)grdMedicos.Rows[grdMedicos.EditIndex].FindControl("ddlHoraInGRD");
            DropDownList ddlHFin = (DropDownList)grdMedicos.Rows[grdMedicos.EditIndex].FindControl("ddlHoraFinGRD");

            utiWeb.FncCargarHorarios(ddlHInicio, ddlHFin);
            ddlHInicio.SelectedValue = horaInicio;
            ddlHFin.SelectedValue = horaFinal;

        }


        protected void grdMedicos_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GestionMedico gesMed = new GestionMedico();
            Entidades.Medico med = new Entidades.Medico();
            //Controles edit
            Label legajo = (Label)grdMedicos.Rows[grdMedicos.EditIndex].FindControl("lblLegajoEdit");
            TextBox DNI = (TextBox)grdMedicos.Rows[grdMedicos.EditIndex].FindControl("txtDniGRD");
            TextBox nombre = (TextBox)grdMedicos.Rows[grdMedicos.EditIndex].FindControl("txtNombreGRD");
            TextBox apellido = (TextBox)grdMedicos.Rows[grdMedicos.EditIndex].FindControl("txtApellidoGRD");
            DropDownList sexo = (DropDownList)grdMedicos.Rows[grdMedicos.EditIndex].FindControl("ddlSexoGRD");
            TextBox nacionalidad = (TextBox)grdMedicos.Rows[grdMedicos.EditIndex].FindControl("txtNacionalidadGRD");
            TextBox fechaNacimiento = (TextBox)grdMedicos.Rows[grdMedicos.EditIndex].FindControl("txtFechaNacimiento");
            TextBox direccion = (TextBox)grdMedicos.Rows[grdMedicos.EditIndex].FindControl("txtDireccionGRD");
            DropDownList localidad = (DropDownList)grdMedicos.Rows[grdMedicos.EditIndex].FindControl("ddlLocalidadesGRD");
            DropDownList provincia = (DropDownList)grdMedicos.Rows[grdMedicos.EditIndex].FindControl("ddlProvinciaGRD");
            TextBox email = (TextBox)grdMedicos.Rows[grdMedicos.EditIndex].FindControl("txtEmailGRD");
            TextBox telefono = (TextBox)grdMedicos.Rows[grdMedicos.EditIndex].FindControl("txtTelefonoGRD");
            TextBox usuario = (TextBox)grdMedicos.Rows[grdMedicos.EditIndex].FindControl("txtUsuarioGRD");
            TextBox contraseña = (TextBox)grdMedicos.Rows[grdMedicos.EditIndex].FindControl("txtContraseñaGRD");
            DropDownList especialidad = (DropDownList)grdMedicos.Rows[grdMedicos.EditIndex].FindControl("ddlEspecialidadGRD");
            DropDownList Hinicio = (DropDownList)grdMedicos.Rows[grdMedicos.EditIndex].FindControl("ddlHoraInGRD");
            DropDownList Hfin = (DropDownList)grdMedicos.Rows[grdMedicos.EditIndex].FindControl("ddlHoraFinGRD");

            int validacion = FncValidarEdicion(legajo.Text.Trim(), DNI.Text.Trim(), fechaNacimiento.Text.Trim(), Hinicio.SelectedValue.ToString(), Hfin.SelectedValue.ToString(), usuario.Text.Trim());
            if (validacion == 0)
            {
                med = gesMed.CargarObjetoMedico(legajo.Text.Trim(), DNI.Text.Trim(), nombre.Text.Trim(), apellido.Text.Trim(), sexo.SelectedValue.ToString(), nacionalidad.Text.Trim(), fechaNacimiento.Text.Trim(), direccion.Text.Trim(), localidad.SelectedValue.ToString(), provincia.SelectedValue.ToString(), email.Text.Trim(), telefono.Text.Trim(), usuario.Text.Trim(), contraseña.Text.Trim(), especialidad.Text.ToString(), Hinicio.SelectedValue.ToString(), Hfin.SelectedValue.ToString());
                if (gesMed.ActualizarMedico(med))
                {
                    lblACTUALIZADO.ForeColor = System.Drawing.Color.Green;
                    lblACTUALIZADO.Text = "REGISTRO DE MEDICO ACTUALIZADO CORRECTAMENTE";
                }
                else
                {
                    lblACTUALIZADO.ForeColor = System.Drawing.Color.Red;
                    lblACTUALIZADO.Text = "No fue posible actualizar el registro del medico deseado";
                }
                grdMedicos.EditIndex = -1;
                FncRecargarTabla(1);
            }
            else FncValidacionFallida(validacion);

        }


        protected int FncValidarEdicion(string legajo, string dni, string fechaNac, string horarioIn, string horarioFin, string usuario)
        {
            GestionMedico gesMed = new GestionMedico();
            

            DateTime fechaMin = new DateTime(1874,1,1);
            if (dni.Length != 8) return 1; // el dni no tiene 8 caracteres
            if (DateTime.ParseExact(fechaNac, "dd/MM/yyyy", null) > DateTime.Today || DateTime.ParseExact(fechaNac, "dd/MM/yyyy", null) < fechaMin ) return 2; //la fecha no existe o tiene mas de 150 años
            if (horarioIn == horarioFin) return 3; //las horas no pueden ser iguales
            if (gesMed.ExisteDNI(dni,legajo)) return 4; //DNI repetido
            if (gesMed.existeUsuarioMedico(usuario,legajo)) return 5; //usuario repetido
            return 0; //no hay problemas
        }

        protected void FncValidacionFallida(int validacion)
        {
            switch (validacion)
            {
                case 1:
                    lblAVISO.Text = "* EL DNI DEBE TENER 8 CARACTERES *";
                    break;
                case 2:
                    lblAVISO.Text = "* LA FECHA DE NACIMIENTO DEBE SER LOGICA *";
                    break;
                case 3:
                    lblAVISO.Text = "* EL HORARIO DE INICIO Y EL DE FIN DEBEN SER DISTINTOS *";
                    break;
                case 4:
                    lblAVISO.Text = "* EL DNI YA ESTA EN USO *";
                    break;
                case 5:
                    lblAVISO.Text = "* EL USUARIO YA ESTA EN USO *";
                    break;
                default:
                    break;
            }
        }

      

        protected void btnFiltrarDia_Click(object sender, EventArgs e)
        {
            UtilidadWebControls utiWeb = new UtilidadWebControls();
            bool flagPrimero = true;
            string filtro = string.Empty;
            grdDias.EditIndex = -1;
            grdDias.PageIndex = 0;
            if (string.IsNullOrEmpty(txtFiltroDia.Text.Trim()))
            {
                Session["FiltroDias"] = string.Empty;
                utiWeb.FncCargarTablaDias(grdDias);
            }
            else
            {

                Session["FiltroDias"] = txtFiltroDia.Text.Trim();
                string[] legajos = utiWeb.FncSepararPalabrasEnStrings(txtFiltroDia);
                foreach(string legajo in legajos)
                {
                    if (flagPrimero)
                    {
                        filtro = "and (d.Legajo_Medico like '" + legajo + "%' ";
                        flagPrimero = false;
                    }
                    else filtro += "or d.Legajo_Medico like '" + legajo+"%' ";
                }
                filtro += ")";
                utiWeb.FncCargarTablaDias(filtro, grdDias);
            }
            
            txtFiltroDia.Text = string.Empty;
        }


        protected void grdDias_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Dia dias = new Dia();
            GestionDias gesTur = new GestionDias();

            Label legajo = (Label)grdDias.Rows[grdDias.EditIndex].FindControl("Label1");
            CheckBox lunes = (CheckBox)grdDias.Rows[grdDias.EditIndex].FindControl("cbLunesDiasE");
            CheckBox martes = (CheckBox)grdDias.Rows[grdDias.EditIndex].FindControl("cbMartesDiasE");
            CheckBox miercoles = (CheckBox)grdDias.Rows[grdDias.EditIndex].FindControl("cbMiercolesDiasE");
            CheckBox jueves = (CheckBox)grdDias.Rows[grdDias.EditIndex].FindControl("cbJuevesDiasE");
            CheckBox viernes = (CheckBox)grdDias.Rows[grdDias.EditIndex].FindControl("cbViernesDiasE");
            CheckBox sabado = (CheckBox)grdDias.Rows[grdDias.EditIndex].FindControl("cbSabadoDiasE");
            CheckBox domingo = (CheckBox)grdDias.Rows[grdDias.EditIndex].FindControl("cbDomingoDiasE");
            if (!(lunes.Checked == false && martes.Checked == false && miercoles.Checked == false && jueves.Checked == false && viernes.Checked == false && sabado.Checked == false && domingo.Checked == false))
            {
                dias = gesTur.CargarDias(legajo.Text, lunes.Checked, martes.Checked, miercoles.Checked, jueves.Checked, viernes.Checked, sabado.Checked, domingo.Checked);
                if (gesTur.ModificarDias(dias))
                {
                    lblACTUALIZADO.ForeColor = System.Drawing.Color.Green;
                    lblACTUALIZADO.Text = "REGISTRO DE DIAS ACTUALIZADO CORRECTAMENTE";
                }
                else
                {
                    lblACTUALIZADO.ForeColor = System.Drawing.Color.Red;
                    lblACTUALIZADO.Text = "No fue posible actualizar el registro de dias deseado";
                }
                grdDias.EditIndex = -1;
                FncRecargarTabla(0);
                
            }
            else lblAVISO.Text = "* SELECCIONE POR LO MENOS UN DIA *";
            

        }

        protected void ddlProvinciaGRD_SelectedIndexChanged(object sender, EventArgs e)
        {

            DropDownList ddlLoc = (DropDownList)grdMedicos.Rows[grdMedicos.EditIndex].FindControl("ddlLocalidadesGRD");
            DropDownList ddlProv = (DropDownList)grdMedicos.Rows[grdMedicos.EditIndex].FindControl("ddlProvinciaGRD");

            UtilidadWebControls utiWeb = new UtilidadWebControls();
            utiWeb.FncCargarLocalidades(ddlLoc,ddlProv);

        }
        protected void grdMedicos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdMedicos.EditIndex = -1;
            grdMedicos.PageIndex = e.NewPageIndex;
            FncRecargarTabla(1);
        }
        protected void grdMedicos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grdMedicos.EditIndex = -1;
            FncRecargarTabla(1);
        }
        protected void grdDias_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdDias.EditIndex = -1;
            grdDias.PageIndex = e.NewPageIndex;
            FncRecargarTabla(0);
        }
        protected void grdDias_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grdDias.EditIndex = e.NewEditIndex;
            FncRecargarTabla(0);

        }
        protected void grdDias_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grdDias.EditIndex = -1;
            FncRecargarTabla(0);
        }

        protected void FncRecargarTabla(int definidor)
        {
            UtilidadWebControls utiWeb = new UtilidadWebControls();
            if (definidor == 0)
            {
                if (string.IsNullOrEmpty(Session["FiltroDias"].ToString())) utiWeb.FncCargarTablaDias(grdDias);
                else utiWeb.FncCargarTablaDias(Session["FiltroDias"].ToString(),grdDias);
            }
            else
            {
                if (string.IsNullOrEmpty(Session["FiltroMedico"].ToString())) utiWeb.FncCargarTablaMedicos(grdMedicos);
                else utiWeb.FncCargarTablaMedicos(Session["FiltroMedico"].ToString(),grdMedicos);
            }
        }
        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }


    }

}