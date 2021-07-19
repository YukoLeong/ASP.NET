Imports System.Data
Imports System.Data.SqlClient
Partial Class Operator_SchoolSeminarInsert
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        If Not IsPostBack Then
            Dim dv_verify As Data.DataView = verify.Select(New DataSourceSelectArguments)

            If Session("Role_Type") Is Nothing Then

                Response.Write("<script>alert('Please Log In !'); window.location.href='../staff.aspx'; </script>")
                Response.End()
            End If


            If dv_verify.Item(0).Item("sr") = "False" Then

                Response.Write("<script>alert('You do not have Permission to view it !');window.history.back(-1); </script>")

            End If


        End If
    End Sub

    Protected Sub Insert_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Insert.Click
        Dim dv_pesscod As Data.DataView = pescod.Select(New DataSourceSelectArguments)
        Try
            Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
            Using mycon As New SqlConnection(con)
                mycon.Open()
                Dim sql As String = "insert into Seminar (pess_cod,Seminar_info_id,Operator)values(@pess_cod,@Seminar_info_id,@Operator);"
                sql = sql + "update Learning_Records_Correspond set count = count + 1 where pess_cod=@pess_cod and experience_id='1'"
                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = sql

                    cmd.Parameters.AddWithValue("@pess_cod", dv_pesscod.Item(0).Item(0).ToString)
                    cmd.Parameters.AddWithValue("@Seminar_info_id", TopicList.SelectedValue)
                    cmd.Parameters.AddWithValue("@Operator", Session("ID"))

                    cmd.ExecuteNonQuery()
                End Using
                mycon.Close()
            End Using
        Catch ex As Exception

            success.Text = ""
            fail.Text = "Invaild Student Library Number Or The student have been registered, check it please!"
            StuID_txt.Text = ""
            StuID_txt.Focus()
            Return

        End Try

        fail.Text = ""
        success.Text = "Register Successfully"
        StuID_txt.Text = ""
        StuID_txt.Focus()
    End Sub

    Protected Sub TopicList_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles TopicList.Load
        StuID_txt.Focus()
    End Sub

    'Protected Sub Home_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Home.Click
    '    Response.Redirect("home.aspx")
    'End Sub

    Protected Sub ImageButton2_Click1(ByVal sender As Object, ByVal e As ImageClickEventArgs) Handles ImageButton2.Click
        Response.Redirect("home.aspx")
    End Sub

End Class

