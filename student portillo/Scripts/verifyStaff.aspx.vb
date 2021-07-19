Imports System.Data
Imports System.Data.SqlClient
Partial Class verifyStaff
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim conn As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString)
        Dim a As Integer
        'Dim flag As Boolean
        'flag = False

        a = Check_LDAP(ConfigurationManager.ConnectionStrings("ADServer").ConnectionString, Request("Name"), Request("Password"))
        Try
            conn.Open()
            Dim tmp_da As SqlDataAdapter = New SqlDataAdapter()
            Dim tmp_ds As New DataSet
            Dim tmp_dr As DataRow
            If a = 1 Then
                Dim cmd As SqlCommand = New SqlCommand("Select * from SystemAdmin where uid=@id and password=@password", conn)

                cmd.Parameters.AddWithValue("@id", Request("Name"))
                cmd.Parameters.AddWithValue("@password", System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(Request("Password"), System.Web.Configuration.FormsAuthPasswordFormat.SHA1.ToString()))
                tmp_da.SelectCommand = cmd
                tmp_da.Fill(tmp_ds, "SystemAdmin")
                If tmp_ds.Tables("SystemAdmin").Rows.Count <> 0 Then
                    tmp_dr = tmp_ds.Tables("SystemAdmin").Rows(0)

                    Session.Add("Role_Type", "sysadmin")
                    Response.Redirect("~/SystemAdmin/home.aspx")
                End If
                Dim cmd1 As SqlCommand = New SqlCommand("Select * from Staff_Info where uid=@id and uid=@password", conn)
                cmd1.Parameters.AddWithValue("@id", Request("Name"))
                cmd1.Parameters.AddWithValue("@password", Request("Password"))
                tmp_da.SelectCommand = cmd1
                tmp_da.Fill(tmp_ds, "Staff_Info")


                If tmp_ds.Tables("Staff_Info").Rows.Count <> 0 Then
                    'flag = True
	            For i As Integer = 0 To tmp_ds.Tables("Staff_Info").Rows.Count - 1
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

                        Dim tmp_da4 As New SqlClient.SqlDataAdapter("Select * from RoleAccount where uid='" & Request("Name") & "'", conn)
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


                    Dim tmp_da3 As New SqlClient.SqlDataAdapter("Select * from RoleAccount where uid='" & Request("Name") & "'", conn)
                    Dim tmp_ds3 As New DataSet
                    Dim tmp_dr3 As DataRow


                    tmp_da3.Fill(tmp_ds3, "RoleAccount")


                    If tmp_ds3.Tables("RoleAccount").Rows.Count <> 0 Then
                        tmp_dr3 = tmp_ds3.Tables("RoleAccount").Rows(0)

                        If tmp_dr3("position") = "operator" Then
                            Session.Add("Role_Type", "operator")
                            Session.Add("ID", Request("Name"))
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

                        Dim tmp_da2 As New SqlClient.SqlDataAdapter("Select * from teacher_course_info where NET_ID='" & Request("Name") & "'", conn)
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

             
            End If

        Catch ex As Exception

            Response.Write("<script>alert('Incorrect account or password!'); location.href='staff.aspx'; </script>")
        End Try
        conn.Close()

         Response.Write("<script>alert('Incorrect account or password!'); location.href='staff.aspx'; </script>")

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

