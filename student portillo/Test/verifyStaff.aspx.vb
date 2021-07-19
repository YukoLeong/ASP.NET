Imports System.Data
Imports System.Data.SqlClient
Imports System.Net
Imports System.IO

Partial Class verifyStaff
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim conn As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString)
        'Dim flag As Boolean = False
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
                    Dim tmp_da As SqlDataAdapter = New SqlDataAdapter()
                    Dim tmp_ds As New DataSet
                    Dim tmp_dr As DataRow

                    Dim cmd As SqlCommand = New SqlCommand("Select * from SystemAdmin where uid=@id", conn)

                    cmd.Parameters.AddWithValue("@id", tmp_id)
                    tmp_da.SelectCommand = cmd
                    tmp_da.Fill(tmp_ds, "SystemAdmin")
                    If tmp_ds.Tables("SystemAdmin").Rows.Count <> 0 Then
                        tmp_dr = tmp_ds.Tables("SystemAdmin").Rows(0)

                        Session.Add("Role_Type", "sysadmin")
                        Response.Redirect("~/SystemAdmin/home.aspx")
                    End If
                    Dim cmd1 As SqlCommand = New SqlCommand("Select * from Staff_Info where uid=@id", conn)
                    cmd1.Parameters.AddWithValue("@id", tmp_id)

                    tmp_da.SelectCommand = cmd1
                    tmp_da.Fill(tmp_ds, "Staff_Info")


                    If tmp_ds.Tables("Staff_Info").Rows.Count <> 0 Then
					     For i As Integer = 0 To tmp_ds.Tables("Staff_Info").Rows.Count - 1
                       ' flag = True
                        tmp_dr = tmp_ds.Tables("Staff_Info").Rows(i)

                        If Trim(tmp_dr("cat_type")) = "proc" And (Trim(tmp_dr("COD")) = "ESA" Or Trim(tmp_dr("COD")) = "ESCE" Or Trim(tmp_dr("COD")) = "ESAP" Or Trim(tmp_dr("COD")) = "ESLT" Or Trim(tmp_dr("COD")) = "ESEFD" Or Trim(tmp_dr("COD")) = "ESS") Then

                            Session.Add("Role_Type", "director")
                            Session.Add("School_code", tmp_dr("COD"))
                            Session.Add("CODE", tmp_dr("staff_no"))
                            Response.Redirect("~/Instructor/home.aspx")
                        End If


                        If Trim(tmp_dr("cat_type")) = "extr" And (Trim(tmp_dr("COD")) = "ESA" Or Trim(tmp_dr("COD")) = "ESCE" Or Trim(tmp_dr("COD")) = "ESAP" Or Trim(tmp_dr("COD")) = "ESLT" Or Trim(tmp_dr("COD")) = "ESEFD" Or Trim(tmp_dr("COD")) = "ESS") Then

                            Session.Add("Role_Type", "coordinator")
                            Session.Add("School_code", tmp_dr("COD"))
                            Session.Add("Programme", tmp_dr("program_info"))
                            Session.Add("CODE", tmp_dr("staff_no"))

                            Dim tmp_da4 As New SqlClient.SqlDataAdapter("Select * from RoleAccount where uid='" & tmp_id & "'", conn)
                            Dim tmp_ds4 As New DataSet
                            Dim tmp_dr4 As DataRow


                            tmp_da4.Fill(tmp_ds4, "RoleAccount")


                            If tmp_ds4.Tables("RoleAccount").Rows.Count <> 0 Then
                                tmp_dr4 = tmp_ds4.Tables("RoleAccount").Rows(0)


                                If tmp_dr4("position") = "tutor" Then
                                    Session.Add("Tutor_Year", tmp_dr4("tutor_year"))
                                    Session.Add("position", "tutor")
                                    Response.Redirect("~/Instructor/home.aspx")
                                End If
                            End If

                            Response.Redirect("~/Instructor/home.aspx")
                        End If


                        Dim tmp_da3 As New SqlClient.SqlDataAdapter("Select * from RoleAccount where uid='" & tmp_id & "'", conn)
                        Dim tmp_ds3 As New DataSet
                        Dim tmp_dr3 As DataRow


                        tmp_da3.Fill(tmp_ds3, "RoleAccount")


                        If tmp_ds3.Tables("RoleAccount").Rows.Count <> 0 Then
                            tmp_dr3 = tmp_ds3.Tables("RoleAccount").Rows(0)

                            If tmp_dr3("position") = "operator" Then
                                Session.Add("Role_Type", "operator")
                                Session.Add("ID", tmp_id)
                                Response.Redirect("~/Operator/home.aspx")
                            End If

                            If tmp_dr3("position") = "tutor" Then
                                Session.Add("Role_Type", "tutor")
                                Session.Add("School_code", tmp_dr("COD"))
                                Session.Add("Tutor_Year", tmp_dr3("tutor_year"))
                                Session.Add("CODE", tmp_dr("staff_no"))
                                Response.Redirect("~/YearTutor/home.aspx")
                            End If
                        End If


                        If Trim(tmp_dr("cat_type")) = "basi" And (Trim(tmp_dr("COD")) = "ESA" Or Trim(tmp_dr("COD")) = "ESCE" Or Trim(tmp_dr("COD")) = "ESAP" Or Trim(tmp_dr("COD")) = "ESLT" Or Trim(tmp_dr("COD")) = "ESEFD" Or Trim(tmp_dr("COD")) = "ESS") Then

                            Dim tmp_da2 As New SqlClient.SqlDataAdapter("Select * from teacher_course_info where NET_ID='" & tmp_id & "'", conn)
                            Dim tmp_ds2 As New DataSet
                            Dim tmp_dr2 As DataRow


                            tmp_da2.Fill(tmp_ds2, "teacher_course_info")


                            If tmp_ds2.Tables("teacher_course_info").Rows.Count <> 0 Then

                                tmp_dr2 = tmp_ds2.Tables("teacher_course_info").Rows(0)
                                Session.Add("CODE", tmp_dr2("CODE"))
                                Session.Add("teacher_name", tmp_dr2("NAME_CH"))
                                Session.Add("Role_Type", "teacher")
                                Response.Redirect("~/Instructor/home.aspx")
                            End If
                        End If

	               Next

                    End If


                Catch ex As Exception

                    Response.Write("<script>alert('Incorre account or password!'); location.href='staff.aspx'; </script>")
                End Try
                conn.Close()


                Response.Write("<script>alert('Incorrect account or password!'); location.href='staff.aspx'; </script>")
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

