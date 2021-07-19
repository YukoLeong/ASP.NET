Imports System.Data.SqlClient

Public Class SeminarAdd
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("admin_password") Is Nothing Then

            MsgBox("please login in")

            Response.Redirect("~/login.aspx")
        End If
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        Application.Lock()
        Dim dv_seminar As Data.DataView = SqlDataSource2.Select(New DataSourceSelectArguments)
        Dim dv_pesscod As Data.DataView = SqlDataSource3.Select(New DataSourceSelectArguments)
        Try
            Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString1").ConnectionString
            Using mycon As New SqlConnection(con)
                mycon.Open()
                Dim strSQL As String = "insert into Seminar (pess_cod,topicName,category,startDate,duration,organizer,mpi_gen,admin_password)values(@pess_cod,@topic,@category,@startDate,@duration,@organizer,@mpi_gen,@admin_password)"
                Dim strSQL1 As String = "update Learning_Records_Correspond set Seminar_Conference = Seminar_Conference + 1 where PESS_COD=@pess_cod1"
                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL
                    cmd.Parameters.AddWithValue("@pess_cod", dv_pesscod.Item(0).Item(0).ToString)
                    cmd.Parameters.AddWithValue("@topic", DropDownList1.SelectedValue)
                    cmd.Parameters.AddWithValue("@category", dv_seminar.Item(0).Item("category").ToString)
                    cmd.Parameters.AddWithValue("@startDate", dv_seminar.Item(0).Item("startDate").ToString)
                    cmd.Parameters.AddWithValue("@duration", dv_seminar.Item(0).Item("duration").ToString)
                    cmd.Parameters.AddWithValue("@organizer", dv_seminar.Item(0).Item("organizer").ToString)
                    cmd.Parameters.AddWithValue("@mpi_gen", dv_seminar.Item(0).Item("mpi_gen").ToString)
                    cmd.Parameters.AddWithValue("@admin_password", Session("admin_password"))
                    cmd.ExecuteNonQuery()
                    cmd.CommandText = strSQL1
                    cmd.Parameters.AddWithValue("@pess_cod1", dv_pesscod.Item(0).Item(0).ToString)
                    cmd.ExecuteNonQuery()
                End Using
                mycon.Close()
            End Using
        Catch ex As Exception
            Application.UnLock()
            MsgBox("Invaild Student ID Or The student have been taken, check it please")
            Return

        End Try
        Application.UnLock()
        MsgBox("Insert Successfully ")
    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton1.Click
        Response.Redirect("home.aspx")
    End Sub
End Class