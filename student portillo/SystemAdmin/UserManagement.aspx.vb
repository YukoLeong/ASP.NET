
Partial Class SystemAdmin_UserManagement
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
        Dim dv_verify As Data.DataView = SqlDataSource2.Select(New DataSourceSelectArguments)

        If Session("Role_Type") Is Nothing Then

            Response.Write("<script>alert('Please Log In !'); window.location.href='../login.aspx'; </script>")
            Response.End()
        End If


        If dv_verify.Item(0).Item("um") = "False" Then

            Response.Write("<script>alert('You do not have Permission to view it !');window.history.back(-1); </script>")

        End If
        End If
    End Sub

    Private Sub UserDilView_ItemDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewDeletedEventArgs) Handles UserDilView.ItemDeleted
        userGView.DataBind()
    End Sub
    Private Sub UserDilView_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles UserDilView.ItemUpdated
        Dim programme As DropDownList = UserDilView.FindControl("DropDownList3")
        SqlDataSource6.UpdateCommand = "update [useraccount] set Programme=@Programme where ID='" & userGView.SelectedValue & "'"
        SqlDataSource6.UpdateParameters.Add("Programme", programme.Text)
        SqlDataSource6.Update()

        userGView.DataBind()
    End Sub


    Protected Sub UserDilView_ItemDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewDeleteEventArgs) Handles UserDilView.ItemDeleting
        Dim answer As Object
        answer = MsgBox("Are you sure you want to delete the user?", vbYesNo)
        If answer = vbNo Then
            e.Cancel = True
        Else
            If Me.userGView.SelectedValue.ToString = "admin" Then
                MsgBox("you cannot delete default admin!")
                e.Cancel = True
            End If
        End If

    End Sub


    Protected Sub UserDilView_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles UserDilView.ItemInserted
        userGView.DataBind()

    End Sub







    Protected Sub DropDownList2_PreRender(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim school As DropDownList = UserDilView.FindControl("DropDownList2")
        ''Dim tex As TextBox = UserDilView.FindControl("TextBox4")
        Dim programme As DropDownList = UserDilView.FindControl("DropDownList3")
        If school.Text = "Not define" Then
            programme.Items.Clear()
            programme.Items.Add(New ListItem("Not define", "Not define"))
        Else

            SqlDataSource6.SelectCommand = "SELECT distinct [PROGRAM_COMPOSITE_EN] FROM [program_info] where school_en= '" + school.Text + "'"
            Dim dv_programme As Data.DataView = SqlDataSource6.Select(New DataSourceSelectArguments)
            programme.Items.Clear()
            programme.Items.Add(New ListItem(dv_programme.Item(0).Item("PROGRAM_COMPOSITE_EN"), dv_programme.Item(0).Item("PROGRAM_COMPOSITE_EN")))
        End If
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Response.Redirect("home.aspx")
    End Sub
End Class
