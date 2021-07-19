Public Class accountManagement
    Inherits System.Web.UI.Page

  
    Private Sub UserDilView_ItemDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewDeletedEventArgs) Handles UserDilView.ItemDeleted
        userGView.DataBind()
    End Sub
    Private Sub UserDilView_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles UserDilView.ItemUpdated
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


End Class