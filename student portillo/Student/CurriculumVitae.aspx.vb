Imports Microsoft.Reporting.WebForms
Imports System.Data

Partial Class Student_CurriculumVitae
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
         'If Not IsPostBack Then



        If Session("CurrentUI") = "en-US" Then
            ImageButtonapic8.ImageUrl = "~/Student/animatedmenu3/bpic9.png"
            ImageButtonapic1.ImageUrl = "~/Student/animatedmenu3/fpic1.png"
            ImageButtonapic2.ImageUrl = "~/Student/animatedmenu3/fpic2.png"

        End If

        If Session("CurrentUI") = "zh-TW" Then
            ImageButtonapic8.ImageUrl = "~/Student/animatedmenu3/homec.png"
            ImageButtonapic1.ImageUrl = "~/Student/animatedmenu3/fpic1c.png"
            ImageButtonapic2.ImageUrl = "~/Student/animatedmenu3/fpic2c.png"

        End If





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

        'End If
         End If

         End If
         ReportViewer1.LocalReport.EnableExternalImages = True
        If IsPostBack = False Then
           
            If Session("cv") = "true" And Session("CurrentUI") = "zh-TW" Then
                Response.Write("<script>alert('履歷內容包括:\n專業認證\n獎項及獎學金\n比賽/會展\n實習\n學生交流計劃\n課外活動\n工作經驗\n研討會/會議\n技術技能和能力\n社會和組織技能和能力\n語言\n興趣\n推薦人') </script>")
                Session("cv") = "false"
            End If

            If Session("cv") = "true" Then
                Response.Write("<script>alert('CV Content include:\nProfessional Certification\nAwards and Scholarships\nCompetition/Exhibition Participation\nInternship\nStudent Exchange Program\nExtracurricular Activities\nWork Experience\nSeminar/Conference\nTechnical Skills and Competences\nSocial and Organization Skills and Competences\nLanguages\nInterests\nReferences') </script>")
                Session("cv") = "false"
            End If

            Dim Path As String = Server.MapPath("~/Student/StudentImages/")
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
                    Param.Values.Add(Path & Session("pess_cod") & "\" & dv_path.Item(0).Item("path"))
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
            ' ReportViewer1.LocalReport.Refresh()


            Dim dv_pic As Data.DataView = SqlDataSource28.Select(New DataSourceSelectArguments)
            Dim showPic As Boolean
             If dv_pic.Count = 0 Then
                showPic = False
            Else

                showPic = True

            End If
            Dim PicParam As New ReportParameter
            PicParam.Name = "PicParameter"
            PicParam.Values.Add(showPic)
            ReportViewer1.LocalReport.SetParameters(PicParam)




            Dim dv_cert As Data.DataView = SqlDataSource17.Select(New DataSourceSelectArguments)
            Dim showCert As Boolean
            If dv_cert.Count = 0 Then
                showCert = False
            Else

                showCert = True
            End If

            Dim CertParam As New ReportParameter
            CertParam.Name = "CertParameter"
            CertParam.Values.Add(showCert)
            ReportViewer1.LocalReport.SetParameters(CertParam)

            Dim dv_award As Data.DataView = SqlDataSource18.Select(New DataSourceSelectArguments)
            Dim showAward As Boolean
            If dv_award.Count = 0 Then
                showAward = False


            Else
                showAward = True
            End If
            Dim AwardParam As New ReportParameter
            AwardParam.Name = "AwardParameter"
            AwardParam.Values.Add(showAward)
            ReportViewer1.LocalReport.SetParameters(AwardParam)

            Dim dv_match As Data.DataView = SqlDataSource19.Select(New DataSourceSelectArguments)
            Dim showMatch As Boolean
            If dv_match.Count = 0 Then
                showMatch = False

            Else

                showMatch = True

            End If
            Dim MatchParam As New ReportParameter
            MatchParam.Name = "MatchParameter"
            MatchParam.Values.Add(showMatch)
            ReportViewer1.LocalReport.SetParameters(MatchParam)



            Dim dv_ship As Data.DataView = SqlDataSource20.Select(New DataSourceSelectArguments)
            Dim showShip As Boolean
            If dv_ship.Count = 0 Then
                showShip = False

            Else

                showShip = True

            End If
            Dim ShipParam As New ReportParameter
            ShipParam.Name = "ShipParameter"
            ShipParam.Values.Add(showShip)
            ReportViewer1.LocalReport.SetParameters(ShipParam)





            Dim dv_study As Data.DataView = SqlDataSource21.Select(New DataSourceSelectArguments)
            Dim showStudy As Boolean
            If dv_study.Count = 0 Then
                showStudy = False

            Else

                showStudy = True

            End If
            Dim StudyParam As New ReportParameter
            StudyParam.Name = "StudyParameter"
            StudyParam.Values.Add(showStudy)
            ReportViewer1.LocalReport.SetParameters(StudyParam)






            Dim dv_activity As Data.DataView = SqlDataSource22.Select(New DataSourceSelectArguments)
            Dim showActivity As Boolean
            If dv_activity.Count = 0 Then
                showActivity = False

            Else

                showActivity = True

            End If
            Dim ActivityParam As New ReportParameter
            ActivityParam.Name = "ActivityParameter"
            ActivityParam.Values.Add(showActivity)
            ReportViewer1.LocalReport.SetParameters(ActivityParam)


            Dim dv_work As Data.DataView = SqlDataSource23.Select(New DataSourceSelectArguments)
            Dim showWork As Boolean
            If dv_work.Count = 0 Then
                showWork = False

            Else

                showWork = True

            End If
            Dim WorkParam As New ReportParameter
            WorkParam.Name = "WorkParameter"
            WorkParam.Values.Add(showWork)
            ReportViewer1.LocalReport.SetParameters(WorkParam)




            Dim dv_seminar As Data.DataView = SqlDataSource24.Select(New DataSourceSelectArguments)
            Dim showSeminar As Boolean
            If dv_seminar.Count = 0 Then
                showSeminar = False

            Else

                showSeminar = True

            End If
            Dim SeminarParam As New ReportParameter
            SeminarParam.Name = "SeminarParameter"
            SeminarParam.Values.Add(showSeminar)
            ReportViewer1.LocalReport.SetParameters(SeminarParam)






            Dim dv_person As Data.DataView = SqlDataSource25.Select(New DataSourceSelectArguments)
            Dim showTechnicalSkill As Boolean
            Dim TechnicalSkillParam As New ReportParameter
            Dim showSocialSkill As Boolean
            Dim SocialSkillParam As New ReportParameter
            Dim showLanguage As Boolean
            Dim LanguageParam As New ReportParameter
            Dim showInterest As Boolean
            Dim InterestParam As New ReportParameter
            If dv_person.Count = 0 Then
                showTechnicalSkill = False
                showSocialSkill = False
                showLanguage = False
                showInterest = False
                TechnicalSkillParam.Name = "TechnicalSkillParameter"
                TechnicalSkillParam.Values.Add(showTechnicalSkill)
                ReportViewer1.LocalReport.SetParameters(TechnicalSkillParam)
                SocialSkillParam.Name = "SocialSkillParameter"
                SocialSkillParam.Values.Add(showSocialSkill)
                ReportViewer1.LocalReport.SetParameters(SocialSkillParam)
                LanguageParam.Name = "LanguageParameter"
                LanguageParam.Values.Add(showLanguage)
                ReportViewer1.LocalReport.SetParameters(LanguageParam)
                InterestParam.Name = "InterestParameter"
                InterestParam.Values.Add(showInterest)
                ReportViewer1.LocalReport.SetParameters(InterestParam)

            Else

         
                If String.IsNullOrEmpty(dv_person.Item(0).Item("TechnicalSkill")) Then
                    showTechnicalSkill = False

                Else

                    showTechnicalSkill = True

                End If

                TechnicalSkillParam.Name = "TechnicalSkillParameter"
                TechnicalSkillParam.Values.Add(showTechnicalSkill)
                ReportViewer1.LocalReport.SetParameters(TechnicalSkillParam)




                If String.IsNullOrEmpty(dv_person.Item(0).Item("SocialSkill")) Then
                    showSocialSkill = False

                Else

                    showSocialSkill = True

                End If

                SocialSkillParam.Name = "SocialSkillParameter"
                SocialSkillParam.Values.Add(showSocialSkill)
                ReportViewer1.LocalReport.SetParameters(SocialSkillParam)



                If String.IsNullOrEmpty(dv_person.Item(0).Item("Language")) Then
                    showLanguage = False

                Else

                    showLanguage = True

                End If

                LanguageParam.Name = "LanguageParameter"
                LanguageParam.Values.Add(showLanguage)
                ReportViewer1.LocalReport.SetParameters(LanguageParam)





                If String.IsNullOrEmpty(dv_person.Item(0).Item("Interest")) Then
                    showInterest = False

                Else

                    showInterest = True

                End If

                InterestParam.Name = "InterestParameter"
                InterestParam.Values.Add(showInterest)
                ReportViewer1.LocalReport.SetParameters(InterestParam)

            End If

            Dim dv_reference As Data.DataView = SqlDataSource26.Select(New DataSourceSelectArguments)
            Dim showReference As Boolean
            If dv_reference.Count = 0 Then
                showReference = False

            Else

                showReference = True

            End If
            Dim ReferenceParam As New ReportParameter
            ReferenceParam.Name = "ReferenceParameter"
            ReferenceParam.Values.Add(showReference)
            ReportViewer1.LocalReport.SetParameters(ReferenceParam)



            ReportViewer1.LocalReport.Refresh()



        End If


            ImageButton2.Visible = False
            verEn.Visible = False
            verCht.Visible = False


            Me.ReportViewer1.LocalReport.DisplayName = Session("netid") + "CV"



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
                        If tmp_ds.Tables("StudentPic").Rows.Count = 0 Then


                            Me.FileUpload1.PostedFile.SaveAs(Path & Session("pess_cod") & "/" & Me.FileUpload1.FileName)
                            ' SqlDataSource1.InsertCommand = "INSERT INTO StudentPic(pess_cod,path)VALUES('" & Session("pess_cod") & "','" & Path & "'+'" & Session("pess_cod") & "'+" \ "+ N'" & Me.FileUpload1.FileName & "' )"
                            SqlDataSource1.InsertCommand = "INSERT INTO StudentPic(pess_cod,path)VALUES('" & Session("pess_cod") & "',N'" + Me.FileUpload1.FileName + "')"
                            SqlDataSource1.Insert()
                            Me.Label1.Text = "Upload Success!!"
                            Me.Label1.Visible = True
                            Dim Param As New ReportParameter
                            Param.Name = "ReportParameter1"
                            Param.Values.Add(Path & Session("pess_cod") & "/" & Me.FileUpload1.FileName)
                            ReportViewer1.LocalReport.SetParameters(Param)
                            ReportViewer1.LocalReport.EnableExternalImages = True
                            ReportViewer1.LocalReport.Refresh()

                        End If
                         Dim dv_path_check As Data.DataView = SqlDataSource27.Select(New DataSourceSelectArguments)
                        For j As Integer = 0 To dv_path_check.Count - 1
                            If dv_path_check.Item(j).Item("path") = Me.FileUpload1.FileName Then
                                Response.Write("<script>alert('Image name is existed, change another name please!')</script>")

                                Dim tmp_da_pic As New SqlClient.SqlDataAdapter("Select pess_cod from StudentPic  where pess_cod='" & Session("pess_cod") & "'", conn)
                                Dim tmp_ds_pic As New DataSet
                                tmp_da_pic.Fill(tmp_ds_pic, "StudentPic")
                                tmp_da_pic.FillSchema(tmp_ds_pic, SchemaType.Source, "StudentPic")
                                If tmp_ds_pic.Tables("StudentPic").Rows.Count <> 0 Then
                                    SqlDataSource1.SelectCommand = "Select path from StudentPic where pess_cod='" & Session("pess_cod") & "'"
                                    Dim dv_path As Data.DataView = SqlDataSource1.Select(New DataSourceSelectArguments)
                                    If Not IsDBNull(dv_path.Item(0).Item("path")) Then
                                        Dim Param As New ReportParameter
                                        Param.Name = "ReportParameter1"
                                        Param.Values.Add(Path & Session("pess_cod") & "\" & dv_path.Item(0).Item("path"))
                                        ReportViewer1.LocalReport.SetParameters(Param)
                                        ReportViewer1.LocalReport.EnableExternalImages = True
                                        ReportViewer1.LocalReport.Refresh()


                                    End If
                                End If
                                Exit Sub
                            End If

                        Next

                        If tmp_ds.Tables("StudentPic").Rows.Count <> 0 Then

                            SqlDataSource1.SelectCommand = "Select path from StudentPic where pess_cod='" & Session("pess_cod") & "'"
                            Dim dv_path As Data.DataView = SqlDataSource1.Select(New DataSourceSelectArguments)
                            If Not IsDBNull(dv_path.Item(0).Item("path")) Then
                                
                             System.IO.File.Delete(Path & Session("pess_cod") & "/" & dv_path.Item(0).Item("path"))
                      
                          End If
                            Me.FileUpload1.PostedFile.SaveAs(Path & Session("pess_cod") & "/" & Me.FileUpload1.FileName)
                            SqlDataSource1.UpdateCommand = "update StudentPic set path=N'" + Me.FileUpload1.FileName + "' where  pess_cod='" & Session("pess_cod") & "'"
                            'SqlDataSource1.UpdateCommand = "update StudentPic set path='" & Path & "'+'" & Session("pess_cod") & "'+" \ "+ N'" & Me.FileUpload1.FileName & "' where  pess_cod='" & Session("pess_cod") & "'"
                            ' SqlDataSource1.UpdateCommand = "update StudentPic set path='" & Path & Session("pess_cod") & "'+" \ "+ N'" + Me.FileUpload1.FileName + "' where  pess_cod='" & Session("pess_cod") & "'"

                            SqlDataSource1.Update()


                            Me.Label1.Text = "Upload Success!!"
                            Me.Label1.Visible = True
                            Dim Param As New ReportParameter
                            Param.Name = "ReportParameter1"
                            Param.Values.Add(Path & Session("pess_cod") & "/" & Me.FileUpload1.FileName)
                            ReportViewer1.LocalReport.SetParameters(Param)
                            ReportViewer1.LocalReport.EnableExternalImages = True
                            ReportViewer1.LocalReport.Refresh()
                        End If
                       


                    Catch ex As Exception
                        Me.Label1.Text = "Upload False!! <br>" + ex.Message
                        Me.Label1.Visible = True

                    End Try
                Else
                    Me.Label1.Text = "picture upload failed, confirm the type please !!"
                    Me.Label1.Visible = True
                End If
            End If

        End If



    End Sub


    'Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton1.Click

    '    If Session("Role_Type") = "student" Then
    '        Response.Redirect("home.aspx")
    '    End If

    '    If Session("Role_Type") = "teacher" Or Session("Role_Type") = "tutor" Or Session("Role_Type") = "coordinator" Or Session("Role_Type") = "director" Then
    '        Response.Redirect("schoolStaff.aspx")
    '    End If

    '    Response.Write("<script>alert('Please Log In !'); window.location.href='http://172.26.122.66/siweb/logout.asp'; </script>")

    'End Sub

    Protected Sub ImageButton2_Click1(sender As Object, e As ImageClickEventArgs) Handles ImageButton2.Click
        If Session("Role_Type") = "student" Then
            Response.Redirect("home.aspx")
        End If

        If Session("Role_Type") = "teacher" Or Session("Role_Type") = "tutor" Or Session("Role_Type") = "coordinator" Or Session("Role_Type") = "director" Then
            Response.Redirect("schoolStaff.aspx")
        End If

        Response.Write("<script>alert('Please Log In !'); window.location.href='http://172.26.122.66/siweb/logout.asp'; </script>")
    End Sub



    Protected Sub ImageButtonapic1_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButtonapic1.Click

        Response.Redirect("CurriculumVitae.aspx")

        ImageButtonapic1.CssClass = "aimgactive"
        ImageButtonapic2.CssClass = "aimg"

    End Sub

    Protected Sub ImageButtonapic2_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButtonapic2.Click

        Response.Redirect("CurriculumVitaeCht.aspx")


        ImageButtonapic1.CssClass = "aimg"
        ImageButtonapic2.CssClass = "aimgactive"


    End Sub


    Protected Sub ImageButtonapic8_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButtonapic8.Click
        If Session("Role_Type") = "student" Then
            Response.Redirect("home.aspx")
        End If

        If Session("Role_Type") = "teacher" Or Session("Role_Type") = "tutor" Or Session("Role_Type") = "coordinator" Or Session("Role_Type") = "director" Then
            Response.Redirect("schoolStaff.aspx")
        End If

        Response.Write("<script>alert('Please Log In !'); window.location.href='http://172.26.122.66/siweb/logout.asp'; </script>")


    End Sub



    Protected Sub verEn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles verEn.Click
        Response.Redirect("CurriculumVitae.aspx")
    End Sub

   Protected Sub verCht_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles verCht.Click
        Response.Redirect("CurriculumVitaeCht.aspx")
    End Sub

  
  
End Class
