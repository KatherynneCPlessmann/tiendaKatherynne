<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Inicio_Adm.aspx.vb" Inherits="ProyectoFinal.Inicio_Adm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 50%;
        }
        .auto-style2 {
            height: 26px;
        }
        .auto-style3 {
            height: 29px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h1>Bienvenido Administrador</h1>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
         <br />
        <asp:Button ID="Button1" runat="server" Text="Cerrrar sesión" style="height: 29px" />
        <br /><br />
    </div>
        <table class="auto-style1">
            <tr>
                <td colspan="2">
                    <h2>Ingrese Los Datos</h2>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label2" runat="server" Text="Descripción"></asp:Label>
                    :</td>
                <td class="auto-style3">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Categorías:</td>
                <td class="auto-style2">
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem>Enlatados</asp:ListItem>
                        <asp:ListItem>Origen animal</asp:ListItem>
                        <asp:ListItem>Harinas</asp:ListItem>
                        <asp:ListItem>Bebidas</asp:ListItem>
                        <asp:ListItem>Higiene</asp:ListItem>
                        <asp:ListItem>Frutas y verduras</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label3" runat="server" Text="Precio"></asp:Label>
                    :</td>
                <td class="auto-style3">
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label4" runat="server" Text="Cantidad"></asp:Label>
                    :</td>
                <td class="auto-style3">
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Foto:</td>
                <td>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Button ID="Button2" runat="server" Text="Guardar" />
                </td>

            </tr>
            </table>
         <br /><br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:bd_AbarroteConnectionString %>" SelectCommand="SELECT * FROM [productos]" DeleteCommand="DELETE FROM [productos] WHERE [id_producto] = @id_producto" InsertCommand="INSERT INTO [productos] ([descripcion], [categoria], [precio], [foto], [cantidad]) VALUES (@descripcion, @categoria, @precio, @foto, @cantidad)" UpdateCommand="UPDATE [productos] SET [descripcion] = @descripcion, [categoria] = @categoria, [precio] = @precio, [foto] = @foto, [cantidad] = @cantidad WHERE [id_producto] = @id_producto">
            <DeleteParameters>
                <asp:Parameter Name="id_producto" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="descripcion" Type="String" />
                <asp:Parameter Name="categoria" Type="String" />
                <asp:Parameter Name="precio" Type="Decimal" />
                <asp:Parameter Name="foto" Type="String" />
                <asp:Parameter Name="cantidad" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="descripcion" Type="String" />
                <asp:Parameter Name="categoria" Type="String" />
                <asp:Parameter Name="precio" Type="Decimal" />
                <asp:Parameter Name="foto" Type="String" />
                <asp:Parameter Name="cantidad" Type="Int32" />
                <asp:Parameter Name="id_producto" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_producto" DataSourceID="SqlDataSource1" Width="404px">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="id_producto" HeaderText="id_producto" InsertVisible="False" ReadOnly="True" SortExpression="id_producto" />
                <asp:BoundField DataField="descripcion" HeaderText="descripcion" SortExpression="descripcion" />
                <asp:BoundField DataField="categoria" HeaderText="categoria" SortExpression="categoria" />
                <asp:BoundField DataField="precio" HeaderText="precio" SortExpression="precio" />
                <asp:BoundField DataField="cantidad" HeaderText="cantidad" SortExpression="cantidad" />
                <asp:ImageField DataImageUrlField="foto" HeaderText="Foto">
                    <ControlStyle Height="200px" Width="170px" />
                </asp:ImageField>
            </Columns>
        </asp:GridView>
        <br />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:bd_AbarroteConnectionString %>" SelectCommand="SELECT DISTINCT categoria FROM productos"></asp:SqlDataSource>
        <br />
        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="categoria" DataValueField="categoria">
        </asp:DropDownList>
        <br />
        <br />
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="id_producto" DataSourceID="SqlDataSource3">
            <Columns>
                <asp:BoundField DataField="id_producto" HeaderText="id_producto" InsertVisible="False" ReadOnly="True" SortExpression="id_producto" />
                <asp:BoundField DataField="descripcion" HeaderText="descripcion" SortExpression="descripcion" />
                <asp:BoundField DataField="categoria" HeaderText="categoria" SortExpression="categoria" />
                <asp:BoundField DataField="precio" HeaderText="precio" SortExpression="precio" />
                <asp:BoundField DataField="cantidad" HeaderText="cantidad" SortExpression="cantidad" />
                <asp:ImageField DataImageUrlField="foto" HeaderText="Foto">
                    <ControlStyle Height="200px" Width="170px" />
                </asp:ImageField>
            </Columns>
        </asp:GridView>
        <br />
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:bd_AbarroteConnectionString %>" SelectCommand="SELECT * FROM [productos] WHERE ([categoria] = @categoria)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList2" Name="categoria" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <br />
    
    </form>
</body>
</html>
