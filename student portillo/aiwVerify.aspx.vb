Imports System.Data
Imports System.Data.SqlClient
Partial Class aiwVerify
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim conn As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString)
        conn.Open()
        Dim cmd As SqlCommand = New SqlCommand("insert into testsingle(guid,UserId)values(NEWID(),@user)", conn)
        cmd.Parameters.AddWithValue("@user", "csctest1")
        cmd.ExecuteNonQuery()

        Dim strSQL As String = "select TOP 1 guid FROM testsingle where UserId=@UserId"
        Using cmd1 As New SqlCommand()
            cmd1.Connection = conn
            cmd1.CommandText = strSQL
            cmd1.Parameters.AddWithValue("@UserId", "csctest1")
            Dim reader As SqlDataReader = cmd1.ExecuteReader()
            If reader.HasRows Then
                While reader.Read()
                    Response.Redirect("http://172.26.122.66/aiweb/verify.asp?guid=" + reader("guid").ToString())
                End While

            End If
        End Using
        conn.Close()
    End Sub
End Class
