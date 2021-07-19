Imports System.Data
Imports System.Data.SqlClient
Imports System.Net
Imports System.IO

Partial Class verify
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim conn As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString)
        Dim USE_CAS As Boolean = ConfigurationManager.AppSettings("USE_CAS")
        Dim CASHOST As String = ConfigurationManager.AppSettings("CASHOST")
        If Not USE_CAS Then
            Exit Sub

        End If
        Dim tkt As String = Request.QueryString("ticket")
        Dim service As String = Request.Url.GetLeftPart(UriPartial.Path)
        If tkt Is Nothing Then
            Dim redir As String = CASHOST & "login?" & "service=" + service
            Response.Redirect(redir)
            Exit Sub

        End If

        Dim validateurl As String = CASHOST & "serviceValidate?" & "ticket=" & tkt & "&" & "service=" & service
        Dim client As New WebClient
        Dim data As Stream = client.OpenRead(validateurl)
        Dim reader As New StreamReader(data)
        Dim s As String = reader.ReadToEnd
        reader.Close()
        data.Close()
        Dim tmp_id As String = ""
        Dim cas_ind As String = "<cas:user>"
        Dim ind As Integer = s.IndexOf(cas_ind)

        If ind > 0 Then
            tmp_id = s.Substring(ind + cas_ind.Length, s.IndexOf("</cas:user>") - ind - cas_ind.Length).Trim
            If tmp_id.Length > 0 Then

                Try
                    conn.Open()
                    Dim tmp_da1 As SqlDataAdapter = New SqlDataAdapter()
                    Dim tmp_ds1 As New DataSet
                    Dim tmp_dr1 As DataRow


                    Dim cmd2 As SqlCommand = New SqlCommand("Select TOP 1 * from student_academic_info where netid=@id order by ALUN_NUMERO_SEQ desc ", conn)
                    cmd2.Parameters.AddWithValue("@id", tmp_id)
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
                        Session.Add("school", tmp_dr1("SCHOOL_CODE"))
                        Session.Add("programme", tmp_dr1("PROGRAM_CODE"))
                        Session.Add("programForAbility", tmp_dr1("PROGRAM_COMPOSITE_CODE"))
                        Session.Add("netid", tmp_dr1("netid"))
                        Session.Add("studid", tmp_dr1("student_id"))
                        Session.Add("qualified_year", tmp_dr1("qualified_year"))
                        Session.Add("Role_Type", "student")
                        Session.Add("Position", "student")
                        Session.Add("cv", "true")
                      
                       
                        Response.Redirect("http://172.26.122.66/siweb/siweb_sso.asp")

                        'Response.Redirect("~/Student/home.aspx")
                    End If


                Catch ex As Exception

                    Response.Write("<script>alert('Incorrect account or password!'); location.href='home.aspx'; </script>")
                End Try
                conn.Close()

                Response.Write("<script>alert('Incorrect account or password!'); location.href='home.aspx'; </script>")

            End If


        End If

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
