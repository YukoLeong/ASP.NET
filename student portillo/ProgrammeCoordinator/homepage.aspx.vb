
Partial Class ProgrammeCoordinator_homepage
    Inherits System.Web.UI.Page

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton1.Click
        Session.Clear()
        Response.Redirect("~/login.aspx")
    End Sub
End Class
