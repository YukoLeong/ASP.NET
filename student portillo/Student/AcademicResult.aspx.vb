Imports System.Data.SqlClient
Imports System.Data

Partial Class Student_AcademicResult
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Role_Type") Is Nothing Then

            Response.Write("<script>alert('Please Log In !'); window.location.href='../staff.aspx'; </script>")
            Response.End()

        End If
        If IsDBNull(Session("stdNameV1")) = False Then
            stdNameV1.Text = Session("stdNameV1")
        End If
        If IsDBNull(Session("stdNameV2")) = False Then
            stdNameV2.Text = Session("stdNameV1")
        End If
        If Session("academic") = "True" Then

            MultiView1.ActiveViewIndex = 1
          Else
               MultiView1.ActiveViewIndex = 0
            End If


    End Sub

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        For i = 0 To GridView1.Rows.Count - 1
            Dim status As Label = GridView1.Rows(i).FindControl("Label1")
            If status.Text = "Pass" Then
                status.ForeColor = System.Drawing.Color.Blue
            Else
                status.ForeColor = System.Drawing.Color.Red
            End If


        Next

    End Sub


    Protected Sub ImageButton2_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton2.Click
        Response.Redirect("schoolStaff.aspx")


    End Sub

    Protected Sub GridView2_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView2.RowDataBound
        Dim dv_check As Data.DataView = SqlDataSource9.Select(New DataSourceSelectArguments)

        For i = 0 To GridView2.Rows.Count - 1
            Dim status As Label = GridView2.Rows(i).FindControl("Label1")
            Dim courseWork As Label = GridView2.Rows(i).FindControl("Label2")
            Dim exam As Label = GridView2.Rows(i).FindControl("Label3")
            Dim score As Label = GridView2.Rows(i).FindControl("Label4")
            Dim grade As Label = GridView2.Rows(i).FindControl("Label5")
            Dim subject As Label = GridView2.Rows(i).FindControl("Label6")
            For j = 0 To dv_check.Count - 1

                If subject.Text = dv_check.Item(j).Item("SUBJECT_CODE") Then
                    subject.ForeColor = Drawing.Color.Black
                End If

                If subject.Text = dv_check.Item(j).Item("SUBJECT_CODE") And status.Text = "Pass" Then

                    status.ForeColor = System.Drawing.Color.Blue

                End If
                If subject.Text = dv_check.Item(j).Item("SUBJECT_CODE") And status.Text = "Fail" Then

                    status.ForeColor = System.Drawing.Color.Red

                End If

            Next
            If subject.ForeColor <> Drawing.Color.Black Then
                status.Text = "*"
                courseWork.Text = "*"
                exam.Text = "*"
                score.Text = "*"
                grade.Text = "*"
            End If

        
        Next

    End Sub
End Class

