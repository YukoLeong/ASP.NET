Imports System.Data
Imports System.Data.SqlClient

Partial Class verify
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim conn As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString)
        Dim a As Integer
       

        a = Check_LDAP(ConfigurationManager.ConnectionStrings("ADServer").ConnectionString, Request("Name"), Request("Password"))
        Try
            conn.Open()
                    Dim tmp_da1 As SqlDataAdapter = New SqlDataAdapter()
                    Dim tmp_ds1 As New DataSet
                    Dim tmp_dr1 As DataRow
            If a = 1 Then
               
                    Dim cmd2 As SqlCommand = New SqlCommand("Select * from student_academic_info where netid=@id and pess_cod=@pess_cod", conn)
                    cmd2.Parameters.AddWithValue("@id", Request("Name"))
                    cmd2.Parameters.AddWithValue("@pess_cod", Request("Password"))
                    tmp_da1.SelectCommand = cmd2


                    tmp_da1.Fill(tmp_ds1, "student_academic_info")


                    If tmp_ds1.Tables("student_academic_info").Rows.Count <> 0 Then
                        tmp_dr1 = tmp_ds1.Tables("student_academic_info").Rows(0)
                        Session.Add("pess_cod", tmp_dr1("pess_cod"))
                        Session.Add("student_id", tmp_dr1("student_id"))
                        Session.Add("ALUN_NUMERO", tmp_dr1("ALUN_NUMERO"))
                        Session.Add("ALUN_NUMERO_SEQ", tmp_dr1("ALUN_NUMERO_SEQ"))
                        Session.Add("ChineseName", tmp_dr1("name_ch"))
                        Session.Add("Name_PT", tmp_dr1("name_pt"))
                        Session.Add("netid", tmp_dr1("netid"))
                        Session.Add("studid", tmp_dr1("student_id"))
                        Session.Add("qualified_year", tmp_dr1("qualified_year"))
                        Session.Add("Role_Type", "student")
                        Session.Add("Position", "student")

                        Dim cmd3 As SqlCommand = New SqlCommand("insert into testsingle(guid,UserId)values(NEWID(),@user)", conn)
                        cmd3.Parameters.AddWithValue("@user", Session("netid"))
                        cmd3.ExecuteNonQuery()

                        Dim strSQL As String = "select TOP 1 guid FROM testsingle where UserId=@UserId"
                        Using cmd4 As New SqlCommand()
                            cmd4.Connection = conn
                            cmd4.CommandText = strSQL
                            cmd4.Parameters.AddWithValue("@UserId", Session("netid"))
                            Dim reader As SqlDataReader = cmd4.ExecuteReader()
                            If reader.HasRows Then
                                While reader.Read()
                                    Response.Redirect("http://172.26.122.66/siw/verify.asp?guid=" + reader("guid").ToString())
                                End While
                          
                            End If
                        End Using

                    End If



                End If
        

        Catch ex As Exception

            Response.Write("<script>alert('Incorrect account or password!'); location.href='login.aspx'; </script>")
        End Try
        conn.Close()

         Response.Write("<script>alert('Incorrect account or password!'); location.href='login.aspx'; </script>")

    End Sub
    Protected Function Check_LDAP(ByVal ldap_server As String, ByVal tmp_userid As String, ByVal tmp_pwd As String) As Integer
        Dim entry As New DirectoryServices.DirectoryEntry(ldap_server, tmp_userid, tmp_pwd)
        Try
            Dim obj As Object = entry.NativeObject

        Catch ex As Exception
            Return 1
        Finally
            entry.Close()
        End Try
        Return 0

    End Function
End Class
