<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Login_Clientes.aspx.vb" Inherits="ProyectoFinal.Clientes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/> 

    <title></title>
</head>

<body>
    <form id="form1" runat="server">
    <div>
    <h1> cliente</h1>
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
                        
            </tr>
             <tr>
                <td>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Registro_Cliente.aspx" Text="Registrar cliente"></asp:HyperLink>
                    <br />
                    <br />

                </td>
                   
            </tr>
             <tr>
                <td>
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Login_Adm.aspx" Text="¡Si eres admnistrador, ingresa aquí!"></asp:HyperLink>

                </td>
                   
            </tr>
           </table>
    </div>
    </form>
</body>
</html>
