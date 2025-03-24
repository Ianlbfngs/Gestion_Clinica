<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionTurnos.aspx.cs" Inherits="Vistas.Administrador.GestionTurnos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style2 {
            width: 100%;
        }
        .auto-style3 {
            width: 42px;
        }
        .auto-style4 {
            width: 1640px;
        }
        .auto-style5 {
            width: 119px;
        }
        .auto-style6 {
            width: 100%;
            height: 251px;
        }
        .auto-style7 {
            margin-left: 185px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style2">
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style4">
            <asp:HyperLink ID="hlMenuAdministrador" runat="server" NavigateUrl="~/Administrador/MenuAdmin.aspx">Menu Administrador</asp:HyperLink>
                        </td>
                    <td>Usuario en uso:&nbsp;
            <asp:Label ID="lblUsuario" runat="server" Text="Matias" Font-Bold="True"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style4">
            <asp:Label ID="lblMenuAdm" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Asignacion de turnos"></asp:Label>
                    </td>
                    <td>
            <asp:Button ID="btnCerrarSesion" runat="server" Text="Cerrar Sesion" Height="36px" OnClick="btnCerrarSesion_Click" Width="151px" />
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <br />
        <table class="auto-style6">
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style5">Especialidad:</td>
                <td>
                    <asp:DropDownList ID="ddlEspecialidad" runat="server" Height="22px" Width="178px" AutoPostBack="True" OnSelectedIndexChanged="ddlEspecialidad_SelectedIndexChanged">
                    </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvEspecialidad" runat="server" ControlToValidate="ddlEspecialidad" ValidationGroup="Grupo 1" InitialValue="-1">*Por favor, seleccione una de las especialidades correspondientes</asp:RequiredFieldValidator>
                    </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style5">Medico:</td>
                <td>
                    <asp:DropDownList ID="ddlMedico" runat="server" Height="22px" Width="178px" AutoPostBack="True" OnSelectedIndexChanged="ddlMedico_SelectedIndexChanged">
                    </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvMedico" runat="server" ControlToValidate="ddlMedico" ValidationGroup="Grupo 1" InitialValue="-1">*Por favor, seleccione una de los medicos correspondientes</asp:RequiredFieldValidator>
                    </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style5">Horarios:</td>
                <td>
                    <asp:DropDownList ID="ddlHorarios" runat="server" Height="22px" Width="178px">
                    </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvHorarios" runat="server" ControlToValidate="ddlHorarios" ValidationGroup="Grupo 1" Display="Dynamic" InitialValue="-1">*Por favor, seleccione uno de los horarios correspondientes</asp:RequiredFieldValidator>
                    </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style5">Fecha:</td>
                <td> <asp:TextBox ID="txtFecha" runat="server" TextMode="Date" Height="23px" Width="173px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvFecha" runat="server" ControlToValidate="txtFecha" ValidationGroup="Grupo 1" Display="Dynamic">*Por favor, seleccione una fecha</asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="cvFecha" runat="server" ControlToValidate="txtFecha" OnServerValidate="cvFecha_ServerValidate" Display="Dynamic" ValidationGroup="Grupo 1">*Ingrese una fecha mayor a la actual y menor a al año 2026</asp:CustomValidator>
                    <asp:CustomValidator ID="cvFechaDisponible" runat="server" ControlToValidate="txtFecha" Display="Dynamic" ErrorMessage="*El turno en la fecha y hora especificadas no se encuentra disponible" OnServerValidate="cvFechaDisponible_ServerValidate" ValidationGroup="Grupo 1"></asp:CustomValidator>
                    <asp:CustomValidator ID="cvDiaMedicoAtiende" runat="server" ControlToValidate="txtFecha" Display="Dynamic" ErrorMessage="*El medico no atiende el dia seleccionado" OnServerValidate="cvDiaMedicoAtiende_ServerValidate" ValidationGroup="Grupo 1"></asp:CustomValidator>
                    </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style5">Paciente:</td>
                <td>
                    <asp:DropDownList ID="ddlPaciente" runat="server" Height="22px" Width="178px">
                    </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvPaciente" runat="server" ControlToValidate="ddlPaciente" ValidationGroup="Grupo 1" InitialValue="-1">*Por favor, seleccione un paciente</asp:RequiredFieldValidator>
                    </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="auto-style7" DataSourceID="SqlDataSource1" Width="324px">
                        <Columns>
                            <asp:CheckBoxField DataField="Lunes" HeaderText="Lunes" SortExpression="Lunes" />
                            <asp:CheckBoxField DataField="Martes" HeaderText="Martes" SortExpression="Martes" />
                            <asp:CheckBoxField DataField="Miercoles" HeaderText="Miercoles" SortExpression="Miercoles" />
                            <asp:CheckBoxField DataField="Jueves" HeaderText="Jueves" SortExpression="Jueves" />
                            <asp:CheckBoxField DataField="Viernes" HeaderText="Viernes" SortExpression="Viernes" />
                            <asp:CheckBoxField DataField="Sabado" HeaderText="Sabado" SortExpression="Sabado" />
                            <asp:CheckBoxField DataField="Domingo" HeaderText="Domingo" SortExpression="Domingo" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ClinicaTPI_PROG3ConnectionString %>" SelectCommand="SELECT [Lunes], [Martes], [Miercoles], [Jueves], [Viernes], [Sabado], [Domingo] FROM [DiasDeAtencion] WHERE ([Legajo_Medico] = @Legajo_Medico)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlMedico" Name="Legajo_Medico" PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td>
        <asp:Button ID="btnAsignar" runat="server" Text="Asignar Turno" Height="36px" ValidationGroup="Grupo 1" Width="151px" OnClick="btnAsignar_Click" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lblMensaje" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        <br />
    </form>
</body>
</html>