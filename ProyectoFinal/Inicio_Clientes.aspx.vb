Public Class Inicio_Clientes
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Response.AddHeader("Refresh", Convert.ToString((Session.Timeout * 60) + 5))
        Session.Timeout = 1
        If Session("usuario_Cliente") = "" Then
            MsgBox("Expiro la sesion...")
            Session.Remove("usuario_Cliente")
            Response.Redirect("Login_Clientes.aspx")
        Else
            Label1.Text = "Bienvenido(a) al sitio" + " " + Session("usuario_Cliente").ToString
        End If
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Session.Remove("usuario_Cliente")
        Response.Redirect("Login_Clientes.aspx")
    End Sub

    
    Protected Sub GridView2_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView2.SelectedIndexChanged
        Dim i As Integer
        i = GridView2.SelectedIndex
        TextBox1.Text = Page.Server.HtmlDecode(GridView2.Rows(i).Cells(2).Text)
        'TextBox1.Text = GridView2.SelectedRow.Cells(2).Text.ToString
        TextBox2.Text = GridView2.SelectedRow.Cells(3).Text.ToString
        TextBox3.Text = GridView2.SelectedRow.Cells(4).Text.ToString
        TextBox4.Text = GridView2.SelectedRow.Cells(5).Text.ToString

    End Sub

End Class