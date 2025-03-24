<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListarPacientes.aspx.cs" Inherits="Vistas.Administrador.PacientesAdm.ListarPacientes" %>

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
            width: 42px;
        }
        .auto-style3 {
            width: 1640px;
        }
        .auto-style4 {
            width: 151px;
        }
        .auto-style5 {
            margin-left: 51px;
        }
        .auto-style6 {
            width: 100%;
            height: 216px;
        }
        .auto-style7 {
            width: 183px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
         <div>
             <table class="auto-style1">
                 <tr>
                     <td class="auto-style2">&nbsp;</td>
                     <td class="auto-style3">
            <asp:HyperLink ID="hlAgregarPaciente" runat="server" NavigateUrl="~/Administrador/PacientesAdm/AgregarPaciente.aspx">Agregar paciente</asp:HyperLink>
            
&nbsp;&nbsp;&nbsp;
                        
            <asp:HyperLink ID="hlListarPacientes" runat="server" NavigateUrl="~/Administrador/PacientesAdm/ListarPacientes.aspx">Listar pacientes</asp:HyperLink>
            
&nbsp;&nbsp;&nbsp;
                        
            <asp:HyperLink ID="hlEliminarPaciente" runat="server" NavigateUrl="~/Administrador/PacientesAdm/EliminarPacientes.aspx">Eliminar paciente</asp:HyperLink>
            
            &nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="hlMenuAdministrador" runat="server" NavigateUrl="~/Administrador/MenuAdmin.aspx">Menu Administrador</asp:HyperLink>
                         &nbsp;&nbsp;&nbsp;</td>
                     <td>Usuario en uso:&nbsp; <asp:Label ID="lblUsuario" runat="server" Text="Matias" Font-Bold="True"></asp:Label>
                     </td>
                 </tr>
                 <tr>
                     <td class="auto-style2">&nbsp;</td>
                     <td class="auto-style3">&nbsp;</td>
                     <td>&nbsp;</td>
                 </tr>
                 <tr>
                     <td class="auto-style2">&nbsp;</td>
                     <td class="auto-style3">
            <asp:Label ID="lblMenuAdm" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Listar pacientes"></asp:Label>
                     </td>
                     <td>
            <asp:Button ID="BtnCerrarSesion" runat="server" Text="Cerrar sesion" ValidationGroup="2" Height="36px" OnClick="BtnCerrarSesion_Click" Width="151px" />
                     </td>
                 </tr>
             </table>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<table class="auto-style6">
                 <tr>
                     <td class="auto-style2">&nbsp;</td>
                     <td class="auto-style4">DNI:&nbsp;&nbsp;&nbsp;&nbsp;</td>
                     <td class="auto-style7">
             <asp:TextBox ID="txtDNI" runat="server"></asp:TextBox>
                     </td>
                     <td>
                         &nbsp;</td>
                 </tr>
                 <tr>
                     <td class="auto-style2">&nbsp;</td>
                     <td class="auto-style4">Apellido:</td>
                     <td class="auto-style7">
             <asp:TextBox ID="txtApellido" runat="server"></asp:TextBox>
                     </td>
                     <td>
                         &nbsp;</td>
                 </tr>
                 <tr>
                     <td class="auto-style2">&nbsp;</td>
                     <td class="auto-style4">Provincia:</td>
                     <td class="auto-style7">
             <asp:DropDownList ID="ddlProvincia" runat="server" Height="22px" Width="177px">
             </asp:DropDownList>
                     </td>
                     <td>
                         &nbsp;</td>
                 </tr>
                 <tr>
                     <td class="auto-style2">&nbsp;</td>
                     <td class="auto-style4">&nbsp;</td>
                     <td class="auto-style7">&nbsp;</td>
                     <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         <asp:Label ID="lblACTUALIZAR" runat="server"></asp:Label>
                     </td>
                 </tr>
                 <tr>
                     <td class="auto-style2">&nbsp;</td>
                     <td class="auto-style4">&nbsp;</td>
                     <td class="auto-style7">
             <asp:Button ID="BtnFiltPaciente" runat="server" Text="Filtrar" Height="36px" Width="151px" OnClick="BtnFiltPaciente_Click" />
                     </td>
                     <td>
             <asp:GridView ID="grvPacientes" runat="server" Height="174px" Width="257px" CssClass="auto-style5" AllowPaging="True" AutoGenerateColumns="False" AutoGenerateEditButton="True" PageSize="5" OnPageIndexChanging="grvPacientes_PageIndexChanging" OnRowCancelingEdit="grvPacientes_RowCancelingEdit" OnRowEditing="grvPacientes_RowEditing" OnRowUpdating="grvPacientes_RowUpdating">
                 <Columns>
                     <asp:TemplateField HeaderText="DNI">
                         <EditItemTemplate>
                             <asp:Label ID="lbl_eit_Dni" runat="server" Text='<%# Bind("DNI") %>'></asp:Label>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="lblDni" runat="server" Text='<%# Bind("DNI") %>'></asp:Label>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="NOMBRE">
                         <EditItemTemplate>
                             <asp:TextBox ID="txtNombre" runat="server" MaxLength="50" Text='<%# Bind("Nombre") %>'></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator" runat="server" ControlToValidate="txtNombre" Display="Dynamic" ForeColor="Red">* Ingrese un nombre</asp:RequiredFieldValidator>
                             <asp:RegularExpressionValidator ID="revNombre" runat="server" ControlToValidate="txtNombre" Display="Dynamic" ForeColor="Red" ValidationExpression="[^0-9]+">*No ingrese numeros</asp:RegularExpressionValidator>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="APELLIDO">
                         <EditItemTemplate>
                             <asp:TextBox ID="txtApellido" runat="server" Text='<%# Bind("Apellido") %>'></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtApellido" Display="Dynamic" ForeColor="Red">* Ingrese un apellido</asp:RequiredFieldValidator>
                             <asp:RegularExpressionValidator ID="revApellido" runat="server" ControlToValidate="txtApellido" Display="Dynamic" ForeColor="Red" ValidationExpression="[^0-9]+">*No ingrese numeros</asp:RegularExpressionValidator>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="lblApellido" runat="server" Text='<%# Bind("Apellido") %>'></asp:Label>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="SEXO">
                         <EditItemTemplate>
                             <asp:DropDownList ID="ddlSexo" runat="server" DataSourceID="SqlSexo" DataTextField="Descripcion" DataValueField="ID">
                             </asp:DropDownList>
                             <asp:SqlDataSource ID="SqlSexo" runat="server" ConnectionString="<%$ ConnectionStrings:ClinicaTPI_PROG3ConnectionString %>" SelectCommand="SELECT [ID], [Descripcion] FROM [SEXOS]"></asp:SqlDataSource>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlSexo" Display="Dynamic" ForeColor="Red" InitialValue="-1">* Seleccione un sexo</asp:RequiredFieldValidator>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="lblSexo" runat="server" Text='<%# Bind("Sexo") %>'></asp:Label>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="NACIONALIDAD">
                         <EditItemTemplate>
                             <asp:TextBox ID="txtNacionalidad" runat="server" MaxLength="50" Text='<%# Bind("Nacionalidad") %>'></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtNacionalidad" Display="Dynamic" ForeColor="Red">*Ingrese una nacionalidad</asp:RequiredFieldValidator>
                             <asp:RegularExpressionValidator ID="revNacionalidad" runat="server" ControlToValidate="txtNacionalidad" Display="Dynamic" ForeColor="Red" ValidationExpression="[^0-9]+">*No ingrese numeros</asp:RegularExpressionValidator>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="lblNacionalidad" runat="server" Text='<%# Bind("Nacionalidad") %>'></asp:Label>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="FECHA DE NACIMIENTO">
                         <EditItemTemplate>
                             <asp:TextBox ID="txtFechaNacimiento" runat="server" Text='<%# Bind("FechaDeNacimiento") %>'></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtFechaNacimiento" Display="Dynamic" ForeColor="Red">* Ingrese una fecha de nacimiento</asp:RequiredFieldValidator>
                             <asp:RegularExpressionValidator ID="revFechaEDIT" runat="server" ControlToValidate="txtFechaNacimiento" Display="Dynamic" ForeColor="Red" ValidationExpression="^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/([0-9]{4})$">*Formato de fecha invalido</asp:RegularExpressionValidator>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="lblFechaN" runat="server" Text='<%# Bind("FechaDeNacimiento") %>'></asp:Label>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="DIRECCION">
                         <EditItemTemplate>
                             <asp:TextBox ID="txtDireccion" runat="server" MaxLength="50" Text='<%# Bind("Direccion") %>'></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtDireccion" Display="Dynamic" ForeColor="Red">* Ingrese una direccion</asp:RequiredFieldValidator>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="lblDireccion" runat="server" Text='<%# Bind("Direccion") %>'></asp:Label>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="PROVINCIA">
                         <EditItemTemplate>
                             <asp:DropDownList ID="ddlProvincia" runat="server" DataSourceID="SqlProvincia" DataTextField="Nombre" DataValueField="Codigo" AutoPostBack="True" OnSelectedIndexChanged="ddlProvincia_SelectedIndexChanged">
                             </asp:DropDownList>
                             <asp:SqlDataSource ID="SqlProvincia" runat="server" ConnectionString="<%$ ConnectionStrings:ClinicaTPI_PROG3ConnectionString %>" SelectCommand="SELECT [Codigo], [Nombre] FROM [PROVINCIAS]"></asp:SqlDataSource>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ddlProvincia" Display="Dynamic" ForeColor="Red" InitialValue="-1">* Seleccione una provincia</asp:RequiredFieldValidator>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="lblProvinciaGrd" runat="server" Text='<%# Bind("Provincia") %>'></asp:Label>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="LOCALIDAD">
                         <EditItemTemplate>
                             <asp:DropDownList ID="ddlLocalidad" runat="server">
                             </asp:DropDownList>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ddlLocalidad" Display="Dynamic" ForeColor="Red" InitialValue="-1">* Seleccione una localidad</asp:RequiredFieldValidator>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="lblLocalidad" runat="server" Text='<%# Bind("Localidad") %>'></asp:Label>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="EMAIL">
                         <EditItemTemplate>
                             <asp:TextBox ID="txtEmail" runat="server" MaxLength="50" Text='<%# Bind("CorreoElectronico") %>'></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red">* Ingrese un correo electronico</asp:RequiredFieldValidator>
                             <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*Ingrese un formato de EMAIL valido</asp:RegularExpressionValidator>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="lblEmail" runat="server" Text='<%# Bind("CorreoElectronico") %>'></asp:Label>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="TELEFONO">
                         <EditItemTemplate>
                             <asp:TextBox ID="txtTelefono" runat="server" MaxLength="50" Text='<%# Bind("Telefono") %>' TextMode="Phone"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtTelefono" Display="Dynamic" ForeColor="Red">* Ingrese un numero de telefono</asp:RequiredFieldValidator>
                             <asp:RegularExpressionValidator ID="revTelefono" runat="server" ControlToValidate="txtTelefono" Display="Dynamic" ForeColor="Red" ValidationExpression="^[0-9]*$">*Ingrese solo numeros</asp:RegularExpressionValidator>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="lblTelefono" runat="server" Text='<%# Bind("Telefono") %>'></asp:Label>
                         </ItemTemplate>
                     </asp:TemplateField>
                 </Columns>
                 <PagerSettings PageButtonCount="5" />
                 <PagerStyle HorizontalAlign="Center" />
                 <RowStyle HorizontalAlign="Center" />
             </asp:GridView>
                     </td>
                 </tr>
             </table>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblGrdVacio" runat="server" ForeColor="Red"></asp:Label>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <br />
             <br />
            
        </div>
    </form>
</body>
</html>