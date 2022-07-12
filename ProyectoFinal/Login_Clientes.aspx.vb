Imports System.Data.SqlClient

Public Class Clientes
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim cn As New SqlConnection("Data Source=LAPTOP-5QUJAHEF;Initial Catalog=bd_Abarrote;Integrated Security=True")
        Dim adapter As New SqlDataAdapter("SELECT * FROM cliente", cn)
        Dim dst As New DataSet
        Dim file As DataRow
        Dim nombre As String = ""
        adapter.SelectCommand.CommandText = "SELECT * FROM cliente WHERE usuario_Cliente = '" & Me.TextBox1.Text & "' and password = '" & Me.TextBox2.Text & "'"
adapter.Fill(dst, "Dato")
        If dst.Tables("Dato").Rows.Count = 0 Then
            MsgBox("Usuario o contraseña no válidos")
            Response.Redirect("Login_Clientes.aspx")
        End If
        For Each file In dst.Tables("Dato").Rows
            nombre = file("usuario_Cliente")
        Next
        Session.Add("usuario_Cliente", nombre)
        Response.Redirect("Inicio_Clientes.aspx")

    End Sub
End Class