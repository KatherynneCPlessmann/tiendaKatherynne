<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Login_Adm.aspx.vb" Inherits="ProyectoFinal.Adm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h1> ADM</h1>
                 <table>
            <tr>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" placeholder="Usuario"></asp:TextBox>
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                     <asp:TextBox ID="TextBox2" runat="server" placeholder="Password" TextMode="Password" ></asp:TextBox>
                     <br />
                     <br />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="Ingresar" /> 

                </td>
                        <br />
                        <br />
            </tr>
             <tr>
                <td>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login_Clientes.aspx" Text="Regresar"></asp:HyperLink>
                    <br />
                    <br />

                </td>
                   
            </tr>
            </table>
    </div>
    </form>
</body>
</html>
