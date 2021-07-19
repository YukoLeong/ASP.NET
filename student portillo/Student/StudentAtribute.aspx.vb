Public Class StudentAtribute
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("pess_cod") Is Nothing Then

            MsgBox("please login in")

            Response.Redirect("~/login.aspx")
        End If
    End Sub

  Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton1.Click
        Response.Redirect("home.aspx")
    End Sub
End Class