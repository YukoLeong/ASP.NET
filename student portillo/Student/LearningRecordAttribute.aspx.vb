
Partial Class LearningRecordAttribute
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
       ' If Not IsPostBack Then
        Dim dv_verify As Data.DataView = SqlDataSource3.Select(New DataSourceSelectArguments)
            Dim dv_verifyStaff As Data.DataView = SqlDataSource4.Select(New DataSourceSelectArguments)
        If Session("Role_Type") Is Nothing Then

            Response.Write("<script>alert('Please Log In !'); window.location.href='../home.aspx'; </script>")
            Response.End()
        
        End If


            If Session("Role_Type") = "student" Then
                If dv_verify.Item(0).Item("lra") = "False" Then

                    Response.Write("<script>alert('You do not have Permission to view it !');window.history.back(-1); </script>")

                End If
            End If

            If Session("position") = "studentview" Then
                If dv_verifyStaff.Item(0).Item("lra") = "False" Then

                    Response.Write("<script>alert('You do not have Permission to view it !');window.history.back(-1); </script>")

                End If
            End If
       ' End If
    End Sub
    'Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton1.Click
    '  If Session("Role_Type") = "student" Then
    '        Response.Redirect("home.aspx")
    '    End If

    '    If Session("Role_Type") = "teacher" Or Session("Role_Type") = "tutor" Or Session("Role_Type") = "coordinator" Or Session("Role_Type") = "director" Then
    '        Response.Redirect("schoolStaff.aspx")
    '    End If

    '        Response.Write("<script>alert('Please Log In !'); window.location.href='../home.aspx'; </script>")

    'End Sub

    Protected Sub ImageButton2_Click1(sender As Object, e As ImageClickEventArgs) Handles ImageButton2.Click
        If Session("Role_Type") = "student" Then
            Response.Redirect("home.aspx")
        End If

        If Session("Role_Type") = "teacher" Or Session("Role_Type") = "tutor" Or Session("Role_Type") = "coordinator" Or Session("Role_Type") = "director" Then
            Response.Redirect("schoolStaff.aspx")
        End If

        Response.Write("<script>alert('Please Log In !'); window.location.href='../home.aspx'; </script>")
    End Sub

End Class
