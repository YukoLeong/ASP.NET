Public Class homepage4
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("teacherCode") Is Nothing Then

            MsgBox("please login in")

            Response.Redirect("~/login.aspx")
        End If
        Label1.Text = Session("teacher_name")

    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton1.Click
        Session.Clear()
        Response.Redirect("~/login.aspx")
    End Sub
End Class