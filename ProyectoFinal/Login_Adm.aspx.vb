Imports System.Data.SqlClient

Public Class Adm
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim cn As New SqlConnection("Data Source=LAPTOP-5QUJAHEF;Initial Catalog=bd_Abarrote;Integrated Security=True")
        Dim adapter As New SqlDataAdapter("SELECT * FROM adm", cn)
        Dim dst As New DataSet
        Dim file As DataRow
        Dim nombre As String = ""
        adapter.SelectCommand.CommandText = "SELECT * FROM adm WHERE usuario_Adm = '" & Me.TextBox1.Text & "' and password = '" & Me.TextBox2.Text & "'"
        adapter.Fill(dst, "Dato")
        If dst.Tables("Dato").Rows.Count = 0 Then
            MsgBox("Usuario o contraseña no válidos, usted no es un administrador.")
            Response.Redirect("Login_Adm.aspx")
        End If
        For Each file In dst.Tables("Dato").Rows
            nombre = file("usuario_Adm")
        Next
        Session.Add("usuario_Adm", nombre)
        Response.Redirect("Inicio_Adm.aspx")
    End Sub
End Class