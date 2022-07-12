Imports System.Data.SqlClient

Public Class Inicio_Adm
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Response.AddHeader("Refresh", Convert.ToString((Session.Timeout * 240) + 5))
        Session.Timeout = 4
        If Session("usuario_Adm") = "" Then
            MsgBox("Expiró la sesión...")
            Session.Remove("usuario_Adm")
            Response.Redirect("Login_Adm.aspx")
        Else
            Label1.Text = "Bienvenido(a) al sitio" + " " + Session("usuario_Adm").ToString
        End If
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Session.Remove("usuario_Adm")
        Response.Redirect("Login_Adm.aspx")
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        If IsPostBack Then
            Dim path As String = Server.MapPath("~/Imagenes/")
            Dim fileOK As Boolean = False
            If FileUpload1.HasFile Then
                Dim fileExtension As String
                fileExtension = System.IO.Path.GetExtension(FileUpload1.FileName).ToLower()
                Dim allowedExtensions As String() = {".jpg", ".jpeg", ".png", ".gif"}
                For i As Integer = 0 To allowedExtensions.Length - 1
                    If fileExtension = allowedExtensions(i) Then
                        fileOK = True
                    End If
                Next
                If fileOK Then
                    Try
                        FileUpload1.PostedFile.SaveAs(path & FileUpload1.FileName)
                    Catch ex As Exception
                        MsgBox("La portada No se Pudo Almacenar!!", 0, "Error")
                    End Try
                Else
                    MsgBox("Portada No Valida!", 0, "Error!!")
                End If
            End If
        End If

        Dim cn As New SqlConnection
        cn.ConnectionString = SqlDataSource1.ConnectionString
        Dim cmd As New SqlCommand("INSERT INTO productos (descripcion,categoria, precio, foto, cantidad) VALUES (@desc,@cate,@pre,@foto, @cant)", cn)
        cmd.Parameters.AddWithValue("@desc", SqlDbType.VarChar).Value = Me.TextBox1.Text
        cmd.Parameters.AddWithValue("@cate", SqlDbType.VarChar).Value = Me.DropDownList1.Text
        cmd.Parameters.AddWithValue("@pre", SqlDbType.Money).Value = Me.TextBox2.Text
        cmd.Parameters.AddWithValue("@foto", SqlDbType.VarChar).Value = "~/Imagenes/" + FileUpload1.FileName
        cmd.Parameters.AddWithValue("@cant", SqlDbType.Int).Value = Me.TextBox3.Text
        Dim cant As Integer
        Using cn
            cn.Open()
            cant = cmd.ExecuteNonQuery
        End Using
        MsgBox("Datos Guardados!!", 0, "Datos Guardados")

        GridView1.DataBind()
        DropDownList2.DataBind()
    End Sub
End Class