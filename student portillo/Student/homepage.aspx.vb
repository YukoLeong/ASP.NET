Public Class homepage5
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("pess_cod") Is Nothing Then

            MsgBox("please login in")

            Response.Redirect("~/login.aspx")
        End If
        Select Case Session("qualified_year")
            Case "1"
                Label1.Text = "First Year Student"
            Case "2"
                Label1.Text = "Second Year Student"
            Case "3"
                Label1.Text = "Third Year Student"
            Case "4"
                Label1.Text = "Fourth Year Student"
        End Select
    End Sub

  Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton1.Click
        Session.Clear()
        Response.Redirect("~/login.aspx")
    End Sub
End Class