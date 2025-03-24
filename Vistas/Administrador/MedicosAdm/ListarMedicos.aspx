<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListarMedicos.aspx.cs" Inherits="Vistas.Administrador.MedicosAdm.ListarMedicos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 1640px;
        }
        .auto-style3 {
            width: 41px;
        }
        .auto-style5 {
            width: 123px;
        }
        .auto-style6 {
            width: 100%;
            height: 425px;
        }
        .auto-style7 {
            width: 146px;
        }
        .auto-style8 {
            margin-top: 0px;
        }
        .auto-style9 {
            width: 146px;
            height: 181px;
        }
        .auto-style10 {
            width: 123px;
            height: 181px;
        }
        .auto-style11 {
            height: 181px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style2">
            <asp:HyperLink ID="hlAgregarMedicos" runat="server" NavigateUrl="~/Administrador/MedicosAdm/AgregarMedico.aspx">Agregar Médicos</asp:HyperLink>
&nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="hlListarMedicos" runat="server" NavigateUrl="~/Administrador/MedicosAdm/ListarMedicos.aspx">Listar Médicos</asp:HyperLink>
&nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="hlEliminarMedicos" runat="server" NavigateUrl="~/Administrador/MedicosAdm/EliminarMedico.aspx">Eliminar Médicos</asp:HyperLink>
            &nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="hlMenuAdministrador" runat="server" NavigateUrl="~/Administrador/MenuAdmin.aspx">Menu Administrador</asp:HyperLink>
                        &nbsp;&nbsp;</td>
                    <td>Usuario en uso:&nbsp;
            <asp:Label ID="lblUsuario" runat="server" Text="Matias" Font-Bold="True"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style2">
            <asp:Label ID="lblMenuAdm" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Listar medicos"></asp:Label>
                    </td>
                    <td>
            <asp:Button ID="btnCerrarSesion" runat="server" Text="Cerrar Sesion" Height="36px" OnClick="btnCerrarSesion_Click" Width="151px" />
                    </td>
                </tr>
            </table>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<table class="auto-style6">
                <tr>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style5">Especialidad:</td>
                    <td>
            <asp:TextBox ID="tbEspecialidad" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style5">Legajo:</td>
                    <td>
            <asp:TextBox ID="tbLegajo" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style5">DNI:&nbsp;&nbsp;</td>
                    <td>
            <asp:TextBox ID="tbDNI" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style5">Apellido:&nbsp;&nbsp;&nbsp;</td>
                    <td>
            <asp:TextBox ID="tbApellido" runat="server"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblACTUALIZADO" runat="server" ForeColor="Green"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">Dias de atencion:</td>
                    <td class="auto-style10">
            <asp:CheckBoxList ID="cblFiltroDias" runat="server">
                <asp:ListItem>Lunes</asp:ListItem>
                <asp:ListItem>Martes</asp:ListItem>
                <asp:ListItem>Miercoles</asp:ListItem>
                <asp:ListItem>Jueves</asp:ListItem>
                <asp:ListItem>Viernes</asp:ListItem>
                <asp:ListItem>Sabado</asp:ListItem>
                <asp:ListItem>Domingo</asp:ListItem>
            </asp:CheckBoxList>
                    </td>
                    <td class="auto-style11">
            <asp:GridView ID="grdMedicos" runat="server" Height="158px" Width="249px" AllowPaging="True" PageSize="5" AutoGenerateEditButton="True" OnPageIndexChanging="grdMedicos_PageIndexChanging" OnRowCancelingEdit="grdMedicos_RowCancelingEdit" OnRowEditing="grdMedicos_RowEditing" OnRowUpdating="grdMedicos_RowUpdating" AutoGenerateColumns="False">
            <Columns>
                <asp:TemplateField HeaderText="Legajo">
                    <EditItemTemplate>
                        <asp:Label ID="lblLegajoEdit" runat="server" Text='<%# Bind("Legajo") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Legajo") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="DNI">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtDniGRD" runat="server" Text='<%# Bind("DNI") %>' TextMode="Number" MaxLength="8"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDniGRD" Display="Dynamic" ForeColor="Red">*Ingrese un DNI</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("DNI") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="Nombre" SortExpression="Nombre">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtNombreGRD" MaxLength="50" runat="server" Text='<%# Bind("Nombre") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtNombreGRD" Display="Dynamic" ForeColor="Red">*Ingrese un nombre</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revNombre" runat="server" ControlToValidate="txtNombreGRD" Display="Dynamic" ForeColor="Red" ValidationExpression="[^0-9]+">*No ingrese numeros</asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblNombreGRD" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Apellido">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtApellidoGRD" runat="server" MaxLength="50" Text='<%# Bind("Apellido") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtApellidoGRD" Display="Dynamic" ForeColor="Red">*Ingrese un apellido</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revApellido" runat="server" ControlToValidate="txtApellidoGRD" Display="Dynamic" ForeColor="Red" ValidationExpression="[^0-9]+">*No ingrese numeros</asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Apellido") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Sexo">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlSexoGRD" runat="server" DataSourceID="sqldsS" DataTextField="SEXO" DataValueField="ID">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="sqldsS" runat="server" ConnectionString="<%$ ConnectionStrings:ClinicaTPI_PROG3ConnectionString %>" SelectCommand="SELECT [ID], [Descripcion] AS SEXO FROM [SEXOS]"></asp:SqlDataSource>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlSexoGRD" Display="Dynamic" ForeColor="Red" InitialValue="-1">*Seleccione un sexo</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblSexoGRD" runat="server" Text='<%# Bind("Sexo") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Nacionalidad">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtNacionalidadGRD" runat="server" MaxLength="50" Text='<%# Bind("Nacionalidad") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtNacionalidadGRD" Display="Dynamic" ForeColor="Red">*Ingrese una nacionalidad</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revNacionalidad" runat="server" ControlToValidate="txtNacionalidadGRD" Display="Dynamic" ForeColor="Red" ValidationExpression="[^0-9]+">*No ingrese numeros</asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Nacionalidad") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Fecha de nacimiento">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtFechaNacimiento" runat="server" Text='<%# Bind("[Fecha de nacimiento]") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtFechaNacimiento" Display="Dynamic" ForeColor="Red">*Ingrese una fecha de nacimiento</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revFechaEDIT" runat="server" ControlToValidate="txtFechaNacimiento" Display="Dynamic" ForeColor="Red" ValidationExpression="^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/([0-9]{4})$">*Formato de fecha invalido</asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblFechaNGRD" runat="server" Text='<%# Bind("[Fecha de nacimiento]") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Direccion">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtDireccionGRD" runat="server" MaxLength="50" Text='<%# Bind("Direccion") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtDireccionGRD" Display="Dynamic" ForeColor="Red">*Ingrese una direccion</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("Direccion") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Localidad">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlLocalidadesGRD" runat="server">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="ddlLocalidadesGRD" Display="Dynamic" ForeColor="Red" InitialValue="-1">*Seleccione una localidad</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblLocalidadGRD" runat="server" Text='<%# Bind("Localidad") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Provincia">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlProvinciaGRD" runat="server" AutoPostBack="True" DataSourceID="sqlDsP" DataTextField="Provincia" DataValueField="Codigo" OnSelectedIndexChanged="ddlProvinciaGRD_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="sqlDsP" runat="server" ConnectionString="<%$ ConnectionStrings:ClinicaTPI_PROG3ConnectionString %>" SelectCommand="SELECT [Codigo] ,[Nombre] as Provincia FROM [PROVINCIAS]"></asp:SqlDataSource>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="ddlProvinciaGRD" Display="Dynamic" ForeColor="Red" InitialValue="-1">*Seleccione una provincia</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblProvinciaGRD" runat="server" Text='<%# Bind("Provincia") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Correo Electronico">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEmailGRD" runat="server" MaxLength="50" Text='<%# Bind("[Correo Electronico]") %>' TextMode="Email"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtEmailGRD" Display="Dynamic" ForeColor="Red">*Ingrese un emaill</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revEmail" runat="server" Display="Dynamic" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmailGRD">*Ingrese un formato de EMAIL valido</asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label16" runat="server" Text='<%# Bind("[Correo Electronico]") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Telefono">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtTelefonoGRD" MaxLength="50" runat="server" Text='<%# Bind("Telefono") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtTelefonoGRD" Display="Dynamic" ForeColor="Red">*Ingrese un telefono</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revTelefono" runat="server" ControlToValidate="txtTelefonoGRD" Display="Dynamic" ForeColor="Red" ValidationExpression="^[0-9]*$">*Ingrese solo numeros</asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label15" runat="server" Text='<%# Bind("Telefono") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Usuario">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtUsuarioGRD" MaxLength="50" runat="server" Text='<%# Bind("Usuario") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtUsuarioGRD" Display="Dynamic" ForeColor="Red">*Ingrese un usuario</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label14" runat="server" Text='<%# Bind("Usuario") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Contraseña">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtContraseñaGRD" MaxLength="50" runat="server" Text='<%# Bind("Contraseña") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtContraseñaGRD" Display="Dynamic" ForeColor="Red">*Ingrese una contraseña</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label13" runat="server" Text='<%# Bind("Contraseña") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Especialidad">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlEspecialidadGRD" runat="server" DataSourceID="sqldsEspecialidades" DataTextField="Especialidad" DataValueField="Codigo">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="sqldsEspecialidades" runat="server" ConnectionString="<%$ ConnectionStrings:ClinicaTPI_PROG3ConnectionString %>" SelectCommand="SELECT [Codigo], [Nombre] as Especialidad FROM [ESPECIALIDADES]"></asp:SqlDataSource>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="ddlEspecialidadGRD" Display="Dynamic" ForeColor="Red" InitialValue="-1">*Seleccione una especialidad</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblEspecialidadGRD" runat="server" Text='<%# Bind("Especialidad") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Inicio de jornada">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlHoraInGRD" runat="server">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="ddlHoraInGRD" Display="Dynamic" ForeColor="Red" InitialValue="-1">*Seleccione un horario</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblHInicio" runat="server" Text='<%# Bind("[Inicio de jornada]") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Fin de jornada">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlHoraFinGRD" runat="server" CssClass="auto-style12">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="ddlHoraFinGRD" Display="Dynamic" ForeColor="Red" InitialValue="-1">*Seleccione un horario</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblHFin" runat="server" Text='<%# Bind("[Fin de jornada]") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
         </Columns>
                <PagerStyle HorizontalAlign="Center" />
                <RowStyle HorizontalAlign="Center" />
            </asp:GridView>
                        <asp:Label ID="lblAVISO" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style5">
            <asp:Button ID="btnFiltro" runat="server" Text="Filtrar" Height="36px" Width="151px" OnClick="btnFiltro_Click" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style7">Filtrar dias de atencion                     <br />
&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Legajo:<br />
                        <br />
                        <br />
                    </td>
                    <td class="auto-style5">
                        <br />
                        <br />
                        <asp:TextBox ID="txtFiltroDia" runat="server" Height="27px"></asp:TextBox>
                        <br />
                        <br />
                        <br />
                        <asp:Button ID="btnFiltrarDia" runat="server" CssClass="auto-style8" Height="25px" OnClick="btnFiltrarDia_Click" Text="Filtrar dias" Width="144px" />
                    </td>
                    <td>
                        <asp:GridView ID="grdDias" runat="server" AllowPaging="True" AutoGenerateEditButton="True" PageSize="5" OnPageIndexChanging="grdDias_PageIndexChanging" OnRowCancelingEdit="grdDias_RowCancelingEdit" OnRowEditing="grdDias_RowEditing" AutoGenerateColumns="False" OnRowUpdating="grdDias_RowUpdating">
                            <Columns>
                                <asp:TemplateField HeaderText="Legajo">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Legajo") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblLegajoDias" runat="server" Text='<%# Bind("Legajo") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Lunes">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="cbLunesDiasE" runat="server" Checked='<%# Bind("Lunes") %>' />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Lunes") %>' Enabled="False" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Martes">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="cbMartesDiasE" runat="server" Checked='<%# Bind("Martes") %>' />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("Martes") %>' Enabled="False" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Miercoles">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="cbMiercolesDiasE" runat="server" Checked='<%# Bind("Miercoles") %>' />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox3" runat="server" Checked='<%# Bind("Miercoles") %>' Enabled="False" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Jueves">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="cbJuevesDiasE" runat="server" Checked='<%# Bind("Jueves") %>' />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox4" runat="server" Checked='<%# Bind("Jueves") %>' Enabled="False" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Viernes">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="cbViernesDiasE" runat="server" Checked='<%# Bind("Viernes") %>' />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox5" runat="server" Checked='<%# Bind("Viernes") %>' Enabled="False" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Sabado">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="cbSabadoDiasE" runat="server" Checked='<%# Bind("Sabado") %>' />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox6" runat="server" Checked='<%# Bind("Sabado") %>' Enabled="False" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Domingo">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="cbDomingoDiasE" runat="server" Checked='<%# Bind("Domingo") %>' />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox7" runat="server" Checked='<%# Bind("Domingo") %>' Enabled="False" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <PagerStyle HorizontalAlign="Center" />
                            <RowStyle HorizontalAlign="Center" />
                        </asp:GridView>
                    </td>
                </tr>
            </table>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
        </div>
        </form>
</body>
</html>
    
