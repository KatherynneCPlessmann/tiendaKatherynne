<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Inicio_Clientes.aspx.vb" Inherits="ProyectoFinal.Inicio_Clientes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/> 
    <title></title>
    <!-- Add meta tags for mobile and IE -->
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

</head>

<script type="text/javascript">
    function autenticarme() {
        var precio = document.getElementById('<%= TextBox3.ClientID %>').value;
        var cantidad = document.getElementById('<%= TextBox5.ClientID%>').value;
        var disponible = document.getElementById('<%= TextBox4.ClientID%>').value;
            precio = parseFloat(precio);
            cantidad = parseInt(cantidad);
            disponible = parseInt(disponible);
        if (cantidad < 1) {
            alert("Debe ingresar la cantidad que desea para poderlo agregar al carrito");
            document.getElementById('<%= TextBox5.ClientID%>').value = "";

        } else if (cantidad < disponible) {
                alert(cantidad + disponible);//Hacer div donde aparezca la factura
        }
        else {
            alert("Debe de cambiar la cantidad que desea, porque es mayor de lo que hay disponible en el inventario o porque no ingresó una cantidad");
            document.getElementById('<%= TextBox5.ClientID%>').value = "";
        }
                
            }
</script>

<body>
    <form id="form1" runat="server">
    <div>
    <h1>Bienvenido</h1>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
         <br />
        <asp:Button ID="Button1" runat="server" Text="Cerrrar sesión" style="height: 29px" />
        <br />
        <br />
                <asp:Label ID="Label2" runat="server" Text="Ha seleccionado: "></asp:Label>
&nbsp;
        <asp:TextBox ID="TextBox1" runat="server" Text="vacío"></asp:TextBox>
&nbsp;
        <asp:TextBox ID="TextBox2" runat="server" Text="vacío"></asp:TextBox>
&nbsp;
        <asp:TextBox ID="TextBox3" runat="server" Text="vacío"></asp:TextBox>
&nbsp;
        <asp:Label ID="Label6" runat="server" Text="Disponible: "></asp:Label>
&nbsp;
        <asp:TextBox ID="TextBox4" runat="server" Text="vacío"></asp:TextBox>
<br /><br />
        <asp:Label ID="Label8" runat="server" Text="¿Cuántos desea comprar? : "></asp:Label>
&nbsp;
        <asp:TextBox ID="TextBox5" type="number" runat="server" Text="vacío" placeholder="Cantidad" ></asp:TextBox>
&nbsp;&nbsp;
        
        <asp:Button ID="btnEntrar" runat="server" Text="Entrar" OnClientClick="return autenticarme();" />

        <br />

        <asp:Button ID="Button2" runat="server" Text="Comprar" />
        <br />
        <br />

        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="categoria" DataValueField="categoria"></asp:DropDownList>
        <br />

        <br />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:bd_AbarroteConnectionString %>" SelectCommand="SELECT DISTINCT categoria from productos"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:bd_AbarroteConnectionString %>" SelectCommand="SELECT * FROM [productos] WHERE ([categoria] = @categoria)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="categoria" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="id_producto" DataSourceID="SqlDataSource3">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
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
        <br />

    </div>
        
    </form>
     <!-- Set up a container element for the button -->
    <div id="paypal-button-container"></div>

    <!-- Include the PayPal JavaScript SDK -->
    <script src="https://www.paypal.com/sdk/js?client-id=test&currency=USD"></script>

    <script>
        // Render the PayPal button into #paypal-button-container
        paypal.Buttons({

            // Set up the transaction
            createOrder: function (data, actions) {
                return actions.order.create({
                    purchase_units: [{
                        amount: {
                            value: '88.44'
                        }
                    }]
                });
            },

            // Finalize the transaction
            onApprove: function (data, actions) {
                return actions.order.capture().then(function (details) {
                    // Show a success message to the buyer
                    alert('Transaction completed by ' + details.payer.name.given_name + '!');
                });
            }


        }).render('#paypal-button-container');
    </script>
</body>
</html>
