Public Class studentInfo1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("coordinator_password") Is Nothing Then

            MsgBox("please login in")

            Response.Redirect("~/login.aspx")
        End If
        Label1.Text = Session("programme_name")
    End Sub

   

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.SelectedIndexChanged
        Chart1.Visible = True
        Dim XValue(Me.GridView1.Columns.Count - 5) As String
        Dim YValue(Me.GridView1.Columns.Count - 5) As Integer
        Dim dv_learningAttribute As Data.DataView = SqlDataSource2.Select(New DataSourceSelectArguments)



        For i As Integer = 3 To Me.GridView1.Columns.Count - 2
            XValue(i - 3) = Me.GridView1.Columns(i).ToString
            YValue(i - 3) = Me.GridView1.SelectedRow.Cells(i).Text
        Next



        Chart1.Series("learning record").Points.DataBindXY(XValue, YValue)
    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton1.Click
        Response.Redirect("home.aspx")
    End Sub
End Class