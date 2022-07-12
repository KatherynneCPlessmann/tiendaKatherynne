Imports System.Data.SqlClient

Public Class Registro_Cliente
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim cn As New SqlConnection("Data Source=LAPTOP-5QUJAHEF;Initial Catalog=bd_Abarrote;Integrated Security=True")
        Dim cmd As New SqlCommand("INSERT INTO cliente(usuario_Cliente, password, nombre, apellidoPaterno, apellidoMaterno, direccion, telefono, edad, tipo, correo) VALUES (@usc, @pas, @nom, @app, @apm, @dir, @tel, @edad, @tip, @cor)", cn)

        cmd.Parameters.AddWithValue("@usc", TextBox9.Text)
        cmd.Parameters.AddWithValue("@pas", TextBox10.Text)
        cmd.Parameters.AddWithValue("@nom", TextBox1.Text)
        cmd.Parameters.AddWithValue("@app", TextBox2.Text)
        cmd.Parameters.AddWithValue("@apm", TextBox3.Text)
        cmd.Parameters.AddWithValue("@dir", TextBox4.Text)
        cmd.Parameters.AddWithValue("@tel", TextBox5.Text)
        cmd.Parameters.AddWithValue("@edad", TextBox6.Text)
        cmd.Parameters.AddWithValue("@tip", DropDownList1.Text)
        cmd.Parameters.AddWithValue("@cor", TextBox7.Text)

        Dim cant As Integer
        Using cn
            cn.Open()
            cant = cmd.ExecuteNonQuery
            If (cant = 1) Then
                MsgBox("Se almaceno correctamente")
            Else
                MsgBox("No se almaceno")
            End If
        End Using
        Response.Redirect("Login_Clientes.aspx")
    End Sub

    Protected Sub CustomValidator1_ServerValidate(source As Object, args As ServerValidateEventArgs) Handles CustomValidator1.ServerValidate
        If Len(args.Value) < 6 Or Len(args.Value) > 8 Then
            args.IsValid = False
        Else
            args.IsValid = True
        End If
    End Sub

    Protected Sub TextBox6_TextChanged(sender As Object, e As EventArgs) Handles TextBox6.TextChanged

    End Sub
End Class