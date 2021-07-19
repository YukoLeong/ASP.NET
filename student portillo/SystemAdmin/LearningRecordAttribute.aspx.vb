Public Class LearningRecordAttribute
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("pess_cod") = "61140"

        '  If Session("pess_cod") Is Nothing Then

        'MsgBox("please login in")

        '  Response.Redirect("~/login.aspx")
        '  End If
    End Sub
    Protected Sub DetailsView1_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles DetailsView1.ItemUpdated
        GridView1.DataBind()
    End Sub



    Protected Sub DetailsView1_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles DetailsView1.ItemInserted
        GridView1.DataBind()
    End Sub

    Protected Sub DetailsView1_ItemDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewDeletedEventArgs) Handles DetailsView1.ItemDeleted
        GridView1.DataBind()
    End Sub


   

  

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton1.Click
        Response.Redirect("home.aspx")
    End Sub
End Class
