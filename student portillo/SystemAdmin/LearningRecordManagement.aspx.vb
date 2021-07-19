
Partial Class SystemAdmin_LearningRecordManagement
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim dv_verify As Data.DataView = SqlDataSource4.Select(New DataSourceSelectArguments)

            If Session("Role_Type") Is Nothing Then

                Response.Write("<script>alert('Please Log In !'); window.location.href='../staff.aspx'; </script>")
                Response.End()
            End If


            If dv_verify.Item(0).Item("lram") = "False" Then

                Response.Write("<script>alert('You do not have Permission to view it !');window.history.back(-1); </script>")

            End If
        End If
    End Sub

    Protected Sub DetailsView1_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles DetailsView1.ItemUpdated
        GridView1.DataBind()
        GridView1.Visible = True
        DetailsView1.Visible = False
        Button1.Visible = False
    End Sub

    Protected Sub DetailsView1_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles DetailsView1.ItemInserted
        GridView1.DataBind()
        GridView1.Visible = True
        DetailsView1.Visible = False
        Button1.Visible = False
    End Sub

    Protected Sub DetailsView1_ItemDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewDeletedEventArgs) Handles DetailsView1.ItemDeleted
        GridView1.DataBind()
        GridView1.Visible = True
        DetailsView1.Visible = False
        Button1.Visible = False
    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton1.Click
        Response.Redirect("home.aspx")
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged
        GridView1.Visible = False
        DetailsView1.Visible = True
        Button1.Visible = True
        DetailsView1.DataBind()

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        GridView1.Visible = True
        DetailsView1.Visible = False
        Button1.Visible = False
    End Sub

    Protected Sub DetailsView1_ItemDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewDeleteEventArgs) Handles DetailsView1.ItemDeleting
        If (message.Value = "No") Then
            e.Cancel = True
            Return
        End If
    End Sub

    Protected Sub DetailsView1_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertEventArgs) Handles DetailsView1.ItemInserting
        Dim dv_ID As Data.DataView = SqlDataSource3.Select(New DataSourceSelectArguments)
        For i As Integer = 0 To dv_ID.Count - 1
            If dv_ID.Item(i).Item("id") = CType(Me.DetailsView1.FindControl("TextBox1"), TextBox).Text.Trim Then
                e.Cancel = True
                Response.Write(<script>alert("The Learning Experience id is existed,type another one please!")</script>)

            End If

        Next

    End Sub
End Class
