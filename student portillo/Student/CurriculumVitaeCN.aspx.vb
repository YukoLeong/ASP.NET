Imports Microsoft.Reporting.WebForms
Imports System.Data
Partial Class Student_CurriculumVitaeCN
    Inherits System.Web.UI.Page


   Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        '  If Not IsPostBack Then
        Dim dv_verify As Data.DataView = SqlDataSource4.Select(New DataSourceSelectArguments)
        Dim dv_verifyStaff As Data.DataView = SqlDataSource14.Select(New DataSourceSelectArguments)
        If Session("Role_Type") Is Nothing Then

            Response.Write("<script>alert('Please Log In !'); window.location.href='http://172.26.122.66/siweb/logout.asp'; </script>")
            Response.End()
        
        End If

        If Session("Role_Type") = "student" Then
            If dv_verify.Item(0).Item("cv") = "False" Then

                Response.Write("<script>alert('You do not have Permission to view it !');window.history.back(-1); </script>")

            End If
        End If

        If Session("position") = "studentview" Then
            If dv_verifyStaff.Item(0).Item("cv") = "False" Then

                Response.Write("<script>alert('You do not have Permission to view it !');window.history.back(-1); </script>")

            End If
        End If

        '  End If
        ReportViewer1.LocalReport.EnableExternalImages = True
        If IsPostBack = False Then
            Dim conn As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString)
            Dim tmp_da As New SqlClient.SqlDataAdapter("Select pess_cod from StudentPic  where pess_cod='" & Session("pess_cod") & "'", conn)
            Dim tmp_ds As New DataSet
            tmp_da.Fill(tmp_ds, "StudentPic")
            tmp_da.FillSchema(tmp_ds, SchemaType.Source, "StudentPic")
            If tmp_ds.Tables("StudentPic").Rows.Count <> 0 Then
                SqlDataSource1.SelectCommand = "Select path from StudentPic where pess_cod='" & Session("pess_cod") & "'"
                Dim dv_path As Data.DataView = SqlDataSource1.Select(New DataSourceSelectArguments)
                If Not IsDBNull(dv_path.Item(0).Item("path")) Then
                    Dim Param As New ReportParameter
                    Param.Name = "ReportParameter1"
                    Param.Values.Add(dv_path.Item(0).Item("path"))

                    ReportViewer1.LocalReport.SetParameters(Param)
                    ReportViewer1.LocalReport.EnableExternalImages = True
                    ReportViewer1.LocalReport.Refresh()


                End If
            End If

            Dim dv_school As Data.DataView = SqlDataSource15.Select(New DataSourceSelectArguments)
            Dim dv_program As Data.DataView = SqlDataSource16.Select(New DataSourceSelectArguments)
            Dim a As String = dv_school.Item(0).Item("school_en")
            Dim b As String = dv_program.Item(0).Item("PROGRAM_EN")
            Dim aa As String() = a.Split(" ")
            Dim bb As String() = b.Split(" ")
            Dim result As String = String.Empty
            Dim result1 As String = String.Empty


            For Each s As String In aa
                result += s.Substring(0, 1) + s.Substring(1).ToLower() + " "
            Next


            For Each s1 As String In bb
                result1 += s1.Substring(0, 1) + s1.Substring(1).ToLower() + " "
            Next
            'TextBox1.Text = result
            Dim Param1 As New ReportParameter
            Param1.Name = "ReportParameter2"
            Param1.Values.Add(result)

            ReportViewer1.LocalReport.SetParameters(Param1)

            Dim Param2 As New ReportParameter
            Param2.Name = "ReportParameter3"
            Param2.Values.Add(result1)
            ReportViewer1.LocalReport.SetParameters(Param2)
            ReportViewer1.LocalReport.Refresh()


        End If
         Me.ReportViewer1.LocalReport.DisplayName = Session("netid")+"-CV"
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        If IsPostBack Then

            Dim Path As String = Server.MapPath("~/Student/StudentImages/")

            Dim FileOk As Boolean = False
            Dim fileExtension As String
            Dim i As Integer
            If Me.FileUpload1.HasFile Then
                fileExtension = IO.Path.GetExtension(Me.FileUpload1.FileName).ToLower
                Dim allowedExtensions As String() = {".jpg", ".jpeg", ".png", ".gif"}
                For i = 0 To allowedExtensions.Length - 1
                    If fileExtension = allowedExtensions(i) Then
                        FileOk = True
                    End If
                Next
                If FileOk Then
                    Try
                        If (System.IO.Directory.Exists(Path & Session("pess_cod")) = False) Then
                            System.IO.Directory.CreateDirectory(Path & Session("pess_cod"))
                        End If

                        Dim conn As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString)
                        Dim tmp_da As New SqlClient.SqlDataAdapter("Select * from StudentPic where pess_cod='" & Session("pess_cod") & "'", conn)
                        Dim tmp_ds As New DataSet
                        tmp_da.Fill(tmp_ds, "StudentPic")

                        If tmp_ds.Tables("StudentPic").Rows.Count <> 0 Then

                            SqlDataSource1.SelectCommand = "Select path from StudentPic where pess_cod='" & Session("pess_cod") & "'"
                            Dim dv_path As Data.DataView = SqlDataSource1.Select(New DataSourceSelectArguments)
                            If Not IsDBNull(dv_path.Item(0).Item("path")) Then
                                System.IO.File.Delete(dv_path.Item(0).Item("path"))
                            End If
                            Me.FileUpload1.PostedFile.SaveAs(Path & Session("pess_cod") & "\" & Me.FileUpload1.FileName)
                            SqlDataSource1.UpdateCommand = "update StudentPic set path='" & Path & Session("pess_cod") & "\" & Me.FileUpload1.FileName & "' where  pess_cod='" & Session("pess_cod") & "'"
                            SqlDataSource1.Update()
                            Me.Label1.Text = "Upload Success!!"
                            Me.Label1.Visible = True
                            Dim Param As New ReportParameter
                            Param.Name = "ReportParameter1"
                            Param.Values.Add(Path & Session("pess_cod") & "\" & Me.FileUpload1.FileName)
                            ReportViewer1.LocalReport.SetParameters(Param)
                            ReportViewer1.LocalReport.EnableExternalImages = True
                            ReportViewer1.LocalReport.Refresh()
                        End If
                        If tmp_ds.Tables("StudentPic").Rows.Count = 0 Then


                            Me.FileUpload1.PostedFile.SaveAs(Path & Session("pess_cod") & "\" & Me.FileUpload1.FileName)
                            SqlDataSource1.InsertCommand = "INSERT INTO StudentPic(pess_cod,path)VALUES('" & Session("pess_cod") & "','" & Path & Session("pess_cod") & "\" & Me.FileUpload1.FileName & "')"
                            SqlDataSource1.Insert()
                            Me.Label1.Text = "Upload Success!!"
                            Me.Label1.Visible = True
                            Dim Param As New ReportParameter
                            Param.Name = "ReportParameter1"
                            Param.Values.Add(Path & Session("pess_cod") & "\" & Me.FileUpload1.FileName)
                            ReportViewer1.LocalReport.SetParameters(Param)
                            ReportViewer1.LocalReport.EnableExternalImages = True
                            ReportViewer1.LocalReport.Refresh()

                        End If



                    Catch ex As Exception
                        Me.Label1.Text = "Upload False!! <br>" + ex.Message

                    End Try
                Else
                    Me.Label1.Text = "picture upload failed, confirm the type please !!"
                End If
            End If
        End If



    End Sub


    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton1.Click

        If Session("Role_Type") = "student" Then
            Response.Redirect("home.aspx")
        End If

        If Session("Role_Type") = "teacher" Or Session("Role_Type") = "tutor" Or Session("Role_Type") = "coordinator" Or Session("Role_Type") = "director" Then
            Response.Redirect("schoolStaff.aspx")
        End If

        Response.Write("<script>alert('Please Log In !'); window.location.href='../home.aspx'; </script>")

    End Sub



    Protected Sub verEn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles verEn.Click
        Response.Redirect("CurriculumVitae.aspx")
    End Sub

    Protected Sub verChn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles verChn.Click
        Response.Redirect("CurriculumVitaeCN.aspx")
    End Sub
End Class
