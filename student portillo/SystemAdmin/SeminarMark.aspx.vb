Imports System.Data.SqlClient
Imports System.Security.Cryptography
Partial Class SystemAdmin_SeminarMark
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load




        TextBox1.Focus()
        'If hashOfString(Request.Form("loginID") + HttpContext.Current.Request.UserHostAddress + key) <> Request.Form("verify") Then
        If Session("loginID") = "" Or Session("verify") = "" Then


            Response.Write("<script>alert('Invaild Visit!'); location.href='SeminarReg.aspx'; </script>")



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
                Dim strSQL As String = "insert into Seminar (pess_cod,topicName,category,startDate,duration,organizer,mpi_gen,Operator)values(@pess_cod,@topic,@category,@startDate,@duration,@organizer,@mpi_gen,@Operator)"
                Dim strSQL1 As String = "update Learning_Records_Correspond set Seminar_Conference = Seminar_Conference + 1 where PESS_COD=@pess_cod1"
                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL
                    cmd.Parameters.AddWithValue("@pess_cod", dv_pesscod.Item(0).Item(0).ToString)
                    cmd.Parameters.AddWithValue("@topic", dv_seminar.Item(0).Item("topicName").ToString)
                    cmd.Parameters.AddWithValue("@category", dv_seminar.Item(0).Item("category").ToString)
                    cmd.Parameters.AddWithValue("@startDate", dv_seminar.Item(0).Item("startDate").ToString)
                    cmd.Parameters.AddWithValue("@duration", dv_seminar.Item(0).Item("duration").ToString)
                    cmd.Parameters.AddWithValue("@organizer", dv_seminar.Item(0).Item("organizer").ToString)
                    cmd.Parameters.AddWithValue("@mpi_gen", dv_seminar.Item(0).Item("mpi_gen").ToString)
                    cmd.Parameters.AddWithValue("@Operator", Session("loginID"))
                    cmd.ExecuteNonQuery()
                    cmd.CommandText = strSQL1
                    cmd.Parameters.AddWithValue("@pess_cod1", dv_pesscod.Item(0).Item(0).ToString)
                    cmd.ExecuteNonQuery()
                End Using
                mycon.Close()
            End Using
        Catch ex As Exception
            Application.UnLock()
            'Response.Write("<script>alert('Invaild Student ID Or The student have been taken, check it please!')</script>")
            Label1.Text = ""
            Label4.Text = "Invaild Student ID Or The student have been taken, check it please!"
            TextBox1.Text = ""
            Return

        End Try
        Application.UnLock()
        Label4.Text = ""
        Label1.Text = "Insert Successfully"
        ' Response.Write("<script>alert('Insert Successfully')</script>")
        TextBox1.Text = ""
    End Sub

    Public Function hashOfString(ByVal stringToHash As String) As String
        Dim sha1 As New SHA1CryptoServiceProvider

        Dim bytesToHash() As Byte = System.Text.Encoding.ASCII.GetBytes(stringToHash)

        bytesToHash = sha1.ComputeHash(bytesToHash)

        Dim strResult As String = ""

        For Each b As Byte In bytesToHash

            strResult += b.ToString("x2")
        Next

        Return strResult

    End Function

    Public Function GetIPAddress()

        Dim b As System.Net.IPHostEntry = System.Net.Dns.GetHostEntry(System.Net.Dns.GetHostName)

        Return b.AddressList.GetValue(1).ToString

    End Function
End Class
