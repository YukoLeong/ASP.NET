
Partial Class VenueTable
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Role_Type") Is Nothing Then

            Response.Write("<script>alert('Please Log In !'); window.location.href='http://172.26.122.66/siweb/logout.asp'; </script>")

        End If

    End Sub
    Protected Sub ChnBtn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ChnBtn.Click
        MultiView1.ActiveViewIndex = "0"


    End Sub

    Protected Sub EngBtn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles EngBtn.Click
        MultiView1.ActiveViewIndex = "1"
    End Sub

    Protected Sub ImageButton2_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton2.Click
        Response.Redirect("home.aspx")
    End Sub
End Class
