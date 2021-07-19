Imports System.Security.Cryptography
Imports System.Data.SqlClient
Partial Class Operator_SeminarMark
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load



        If Not IsPostBack Then
            TextBox1.Focus()
            'If hashOfString(Request.Form("loginID") + HttpContext.Current.Request.UserHostAddress + key) <> Request.Form("verify") Then
            If Session("loginID") = "" Or Session("verify") = "" Then


                Response.Write("<script>alert('Invaild Visit!'); location.href='SeminarReg.aspx'; </script>")
                Response.End()


            End If
        End If
    End Sub


    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        Application.Lock()

        Dim dv_pesscod As Data.DataView = SqlDataSource3.Select(New DataSourceSelectArguments)
        Try
            Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
            Using mycon As New SqlConnection(con)
                mycon.Open()
                Dim strSQL As String = "insert into Seminar (pess_cod,Seminar_info_id,Operator)values(@pess_cod,@Seminar_info_id,@Operator);"
                strSQL = strSQL + "update Learning_Records_Correspond set count = count + 1 where pess_cod=@pesscod and experience_id='1'"
                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL
                    cmd.Parameters.AddWithValue("@pess_cod", dv_pesscod.Item(0).Item(0).ToString)
                    cmd.Parameters.AddWithValue("@Seminar_info_id", Session("topicID"))
                    cmd.Parameters.AddWithValue("@Operator", Session("loginID"))
                    cmd.Parameters.AddWithValue("@pesscod", dv_pesscod.Item(0).Item(0).ToString)
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
