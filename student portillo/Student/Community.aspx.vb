Imports System.Data
Imports System.Data.SqlClient
Imports System.Threading
Imports System.Globalization

Partial Class Student_Community
    Inherits System.Web.UI.Page

    Private Sub Community_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If DesignMode = True Then
            Return
        End If
        If Session("Role_Type") Is Nothing Then

            Response.Write("<script>alert('Please Log In !'); window.location.href='http://172.26.122.66/siweb/logout.asp'; </script>")
            Response.End()

        End If
        If Not IsPostBack Then
            verify()
        End If
        Dim dv_verify As Data.DataView = SqlDataSource4.Select(New DataSourceSelectArguments)
        Dim dv_verifyStaff As Data.DataView = SqlDataSource5.Select(New DataSourceSelectArguments)


        If Session("Role_Type") = "student" Then
            If dv_verify.Item(0).Item("ea") = "False" Then


                Response.Write("<script>alert('You do not have Permission to view it !');window.history.back(-1); </script>")

            End If
        End If

        If Session("position") = "studentview" Then

            'ImageButtonapic2.Visible = False

            If dv_verifyStaff.Item(0).Item("ea") = "False" Then

                Response.Write("<script>alert('You do not have Permission to view it !');window.history.back(-1); </script>")

            End If
        End If

        ImageButton2.Visible = False


    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        If Session("CurrentUI") = "en-US" Then
            ImageButtonapic9.ImageUrl = "~/Student/animatedmenu3/bpic9.png"
            ImageButtonapic1.ImageUrl = "~/Student/animatedmenu3/dpic1.png"
            ' ImageButtonapic2.ImageUrl = "~/Student/animatedmenu3/dpic2.png"

        End If

        If Session("CurrentUI") = "zh-TW" Then
            ImageButtonapic9.ImageUrl = "~/Student/animatedmenu3/homec.png"
            ImageButtonapic1.ImageUrl = "~/Student/animatedmenu3/cccc1.png"
            '  ImageButtonapic2.ImageUrl = "~/Student/animatedmenu3/cccc2.png"

        End If




    End Sub



    Private Sub DetailsViewActivity_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles DetailsViewComm.ItemInserted
        GridViewComm.DataBind()
        GridViewComm.Visible = True
        DetailsViewComm.Visible = False
        FileUpload1.Visible = False
        Button1.Visible = False
        Button2.Visible = False
        Image1.Visible = False

        Button10.Visible = False
        Editor1.Visible = False

        Label20.Visible = False
        Button9.Visible = False
        Button11.Visible = False
        AddCommBtn.Visible = True
    End Sub

    Private Sub DetailsViewActivity_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles DetailsViewComm.ItemUpdated
        GridViewComm.DataBind()
        GridViewComm.Visible = True
        DetailsViewComm.Visible = False
        FileUpload1.Visible = False
        Button1.Visible = False
        Button2.Visible = False
        Image1.Visible = False

        Button10.Visible = False
        Editor1.Visible = False

        Label20.Visible = False
        Button9.Visible = False
        Button11.Visible = False
        AddCommBtn.Visible = True
    End Sub

    Protected Sub DetailsViewComm_ItemDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewDeletedEventArgs) Handles DetailsViewComm.ItemDeleted
        GridViewComm.DataBind()
        GridViewComm.Visible = True
        DetailsViewComm.Visible = False
        FileUpload1.Visible = False
        Button1.Visible = False
        Image1.Visible = False
        Button2.Visible = False
        Image1.ImageUrl = ""
        Label1.Visible = False

        Button10.Visible = False
        Editor1.Visible = False

        Label20.Visible = False
        Button9.Visible = False
        Button11.Visible = False
        AddCommBtn.Visible = True
      
    End Sub

    'Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton1.Click

    '    If Session("Role_Type") = "student" Then
    '        Response.Redirect("home.aspx")
    '    End If

    '    If Session("Role_Type") = "teacher" Or Session("Role_Type") = "tutor" Or Session("Role_Type") = "coordinator" Or Session("Role_Type") = "director" Then
    '        Response.Redirect("schoolStaff.aspx")
    '    End If

    '    Response.Write("<script>alert('Please Log In !'); window.location.href='http://172.26.122.66/siweb/logout.asp'; </script>")

    'End Sub

    Protected Sub ImageButton2_Click1(sender As Object, e As ImageClickEventArgs) Handles ImageButton2.Click
        'If Session("Role_Type") = "student" Then
         '   Response.Redirect("home.aspx")
        'End If

       ' If Session("Role_Type") = "teacher" Or Session("Role_Type") = "tutor" Or Session("Role_Type") = "coordinator" Or Session("Role_Type") = "director" Then
       '     Response.Redirect("schoolStaff.aspx")
      '  End If

       ' Response.Write("<script>alert('Please Log In !'); window.location.href='http://172.26.122.66/siweb/logout.asp'; </script>")
    End Sub


    
    Protected Sub ImageButtonapic1_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButtonapic1.Click

        MultiView1.ActiveViewIndex = 0
      
        ImageButtonapic1.CssClass = "aimgactive"

        GridViewComm.Visible = True
        DetailsViewComm.Visible = False
        FileUpload1.Visible = False
        Button1.Visible = False
        Image1.Visible = False
        Button2.Visible = False
        Label1.Visible = False

        Button9.Visible = False
        Button10.Visible = False
        Button11.Visible = False
        Label20.Visible = False
        Me.Editor1.Visible = False
        AddCommBtn.Visible = True
    End Sub

    ' Protected Sub ImageButtonapic2_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButtonapic2.Click

    '   MultiView1.ActiveViewIndex = 1
    '   Label1.Visible = False
    '  TextBox2.Text = ""
    '    TextBox3.Text = ""
    '    TextBox4.Text = ""
    '     TextBox5.Text = ""
    '    Me.Editor2.Content = ""
    '    TextBox7.Text = ""
    '    TextBox8.Text = ""
    '    TextBox10.Text = ""
    '   TextBox11.Text = ""
    '    Label8.Text = ""


    '    ImageButtonapic1.CssClass = "aimg"
    ' ImageButtonapic2.CssClass = "aimgactive"


    '  End Sub

    Protected Sub ImageButtonapic9_Click(ByVal sender As Object, ByVal e As ImageClickEventArgs) Handles ImageButtonapic9.Click

        If Session("Role_Type") = "student" Then
            Response.Redirect("home.aspx")
        End If

        If Session("Role_Type") = "teacher" Or Session("Role_Type") = "tutor" Or Session("Role_Type") = "coordinator" Or Session("Role_Type") = "director" Then
            Response.Redirect("schoolStaff.aspx")
        End If

        Response.Write("<script>alert('Please Log In !'); window.location.href='http://172.26.122.66/siweb/logout.asp'; </script>")

    End Sub



    Public Function show() As Boolean

        If Session("Role_Type") = "student" Then
            Return True

        Else
            Return False
        End If
    End Function
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        If IsPostBack Then

            Dim Path As String = Server.MapPath("~/Student/UploadFile/")
            Dim pic As String = "~/Student/UploadFile/"
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


                        Dim dv_path_check As Data.DataView = SqlDataSource6.Select(New DataSourceSelectArguments)
                        For j As Integer = 0 To dv_path_check.Count - 1
                            If dv_path_check.Item(j).Item("path") = Me.FileUpload1.FileName Then
                                Response.Write("<script>alert('Image name is existed, change another name please!')</script>")
                                Exit Sub
                            End If

                        Next

                        Dim div1 As HtmlControl = CType(Me.Page.FindControl("imageStyle"), HtmlControl)

                        SqlDataSource3.SelectCommand = "Select path from CommAct where pess_cod='" & Session("pess_cod") & "' and id='" & GridViewComm.SelectedValue & "'"
                        Dim dv_path As Data.DataView = SqlDataSource3.Select(New DataSourceSelectArguments)
                        If Not IsDBNull(dv_path.Item(0).Item("path")) Then
                            System.IO.File.Delete(Path & Session("pess_cod") & "/" & dv_path.Item(0).Item("path"))
                        End If
                        Me.FileUpload1.PostedFile.SaveAs(Path & Session("pess_cod") & "\" & Me.FileUpload1.FileName)
                        'SqlDataSource3.UpdateCommand = "update CommAct set path='" & Path & Session("pess_cod") & "\" & Me.FileUpload1.FileName & "' where pess_cod='" & Session("pess_cod") & "' and id='" & GridViewComm.SelectedValue & "'"
                        SqlDataSource3.UpdateCommand = "update  CommAct set path=N'" + Me.FileUpload1.FileName + "' where pess_cod='" & Session("pess_cod") & "' and id='" & GridViewComm.SelectedValue & "'"
                        SqlDataSource3.Update()
                        If Session("CurrentUI") = "en-US" Then
                            Me.Label1.Text = "Upload Success!!"
                        End If
                        If Session("CurrentUI") = "zh-TW" Then
                            Me.Label1.Text = "上傳成功!!"

                        End If
                        Me.Label1.Visible = True

                        If fileExtension = ".jpg" Or fileExtension = ".jpeg" Or fileExtension = ".png" Or fileExtension = ".gif" Then

                            Image1.ImageUrl = pic & Session("pess_cod") & "\" & Me.FileUpload1.FileName
                            Image1.Visible = True
                            div1.Style("display") = ""

                        End If



                        If fileExtension = ".doc" Then

                            Image1.Visible = False

                        End If

                    Catch ex As Exception
                        If Session("CurrentUI") = "en-US" Then
                            Me.Label1.Text = "Upload False!! <br>" + ex.Message
                        End If
                        If Session("CurrentUI") = "zh-TW" Then
                            Me.Label1.Text = "上傳錯誤!! <br>" + ex.Message

                        End If

                        Me.Label1.Visible = True

                    End Try
                Else

                    If Session("CurrentUI") = "en-US" Then
                        Me.Label1.Text = "file upload failed, confirm the type please !!"
                    End If
                    If Session("CurrentUI") = "zh-TW" Then
                        Me.Label1.Text = "文件上傳失敗, 請確認格式!!"

                    End If
                    Me.Label1.Visible = True
                End If
            End If
        End If

    End Sub

    Protected Sub GridViewComm_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewComm.SelectedIndexChanged
        Dim div1 As HtmlControl = CType(Me.Page.FindControl("imageStyle"), HtmlControl)
        SqlDataSource3.SelectCommand = "Select path from CommAct where pess_cod='" & Session("pess_cod") & "' and id='" & GridViewComm.SelectedValue & "'"
        Dim dv_path As Data.DataView = SqlDataSource3.Select(New DataSourceSelectArguments)

        If Not IsDBNull(dv_path.Item(0).Item("path")) Then
            ' Dim strArr() As String
            ' strArr = dv_path.Item(0).Item("path").Split("\")
            'Image1.ImageUrl = "~/Student/UploadFile/" & Session("pess_cod") & "/" & strArr(strArr.Length - 1)
            'Image2.ImageUrl = "~/Student/UploadFile/" & Session("pess_cod") & "/" & strArr(strArr.Length - 1)
            Image1.ImageUrl = "~/Student/UploadFile/" & Session("pess_cod") & "/" & dv_path.Item(0).Item("path")
            Image2.ImageUrl = "~/Student/UploadFile/" & Session("pess_cod") & "/" & dv_path.Item(0).Item("path")
            Label1.Visible = False
            div1.Style("display") = ""
        Else

            Image1.ImageUrl = ""

            Label1.Visible = False

            div1.Style("display") = "none"
        End If
        GridViewComm.Visible = False
        DetailsViewComm.Visible = True
        DetailsViewComm.DataBind()
        FileUpload1.Visible = True
        Image1.Visible = True
        Button1.Visible = True
        Button2.Visible = True

        Dim conn As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString)
        Dim tmp_da As New SqlClient.SqlDataAdapter("Select top 1 * from CommAct where id=" & Me.GridViewComm.SelectedValue, conn)
        Dim tmp_ds As New DataSet
        Dim tmp_dr As DataRow

        conn.Open()
        tmp_da.Fill(tmp_ds, "CommAct")
        tmp_da.FillSchema(tmp_ds, SchemaType.Source, "CommAct")
        If tmp_ds.Tables("CommAct").Rows.Count > 0 Then
            tmp_dr = tmp_ds.Tables("CommAct").Rows(0)
            If IsDBNull(tmp_dr("description")) = False Then
                Me.Editor1.Content = tmp_dr("description")
            Else
                Me.Editor1.Content = ""
            End If
        End If
        conn.Close()


        If Session("Role_Type") = "student" Then
            Button10.Visible = True

        Else
            Button10.Visible = False
        End If
        Editor1.Visible = True
        Editor1.ActiveMode = AjaxControlToolkit.HTMLEditor.ActiveModeType.Preview

        Label20.Visible = True
        AddCommBtn.Visible = False
        verify()
    End Sub

    Private Sub verify()

        If Session("Role_Type") <> "student" Then

            Button1.Visible = False
            FileUpload1.Visible = False
        End If
    End Sub


    Protected Sub DetailsViewComm_ItemDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewDeleteEventArgs) Handles DetailsViewComm.ItemDeleting
        If (message.Value = "No") Then
            e.Cancel = True
            Return
        End If
        SqlDataSource3.SelectCommand = "Select path from CommAct where pess_cod='" & Session("pess_cod") & "' and id='" & GridViewComm.SelectedValue & "'"
        Dim dv_path As Data.DataView = SqlDataSource3.Select(New DataSourceSelectArguments)
        If Not IsDBNull(dv_path.Item(0).Item("path")) Then
            Dim Path As String = Server.MapPath("~/Student/UploadFile/")
            System.IO.File.Delete(Path & Session("pess_cod") & "/" & dv_path.Item(0).Item("path"))
        End If

    End Sub


    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click

        GridViewComm.Visible = True
        DetailsViewComm.Visible = False
        FileUpload1.Visible = False
        Button1.Visible = False
        Image1.Visible = False
        Button2.Visible = False
        Label1.Visible = False

        verify()
        Label20.Visible = False
        Button9.Visible = False
        Button11.Visible = False
        Button10.Visible = False
        Editor1.Visible = False
        AddCommBtn.Visible = True
        verify()
    End Sub




    Protected Sub CommIns_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CommIns.Click
        Dim startDate As String = TextBox2.Text
        Dim endDate As String = TextBox11.Text
        Dim startArr() As String
        Dim endArr() As String
        Dim flag As Boolean = False
        startArr = startDate.Split("/")
        endArr = endDate.Split("/")
        If startDate = "" Or endDate = "" Then
            flag = True
        End If
        If flag = False Then
            If ((Convert.ToInt32(startArr(0))) > (Convert.ToInt32(endArr(0)))) Then

                If Session("CurrentUI") = "zh-TW" Then
                    Response.Write("<script>alert('結束日期必須大於開始日期!')</script>")
                    Exit Sub
                Else
                    Response.Write("<script>alert('End Date must greater than Start Date!')</script>")
                    Exit Sub
                End If

            End If
            If ((Convert.ToInt32(startArr(0))) = (Convert.ToInt32(endArr(0))) And (Convert.ToInt32(startArr(1))) > (Convert.ToInt32(endArr(1)))) Then


                If Session("CurrentUI") = "zh-TW" Then
                    Response.Write("<script>alert('結束日期必須大於開始日期!')</script>")
                    Exit Sub
                Else
                    Response.Write("<script>alert('End Date must greater than Start Date!')</script>")
                    Exit Sub
                End If



            End If


            If ((Convert.ToInt32(startArr(0))) = (Convert.ToInt32(endArr(0))) And (Convert.ToInt32(startArr(1))) = (Convert.ToInt32(endArr(1))) And (Convert.ToInt32(startArr(2))) > (Convert.ToInt32(endArr(2)))) Then

                If Session("CurrentUI") = "zh-TW" Then
                    Response.Write("<script>alert('結束日期必須大於開始日期!')</script>")
                    Exit Sub
                Else
                    Response.Write("<script>alert('End Date must greater than Start Date!')</script>")
                    Exit Sub
                End If

            End If
        End If





        Dim Path As String = Server.MapPath("~/Student/UploadFile/")
        Dim pic As String = "~/Student/UploadFile/"
        Dim FileOk As Boolean = False
        Dim fileExtension As String
        Dim i As Integer
        If Me.FileUpload2.HasFile Then
            Dim dv_path_checkIns As Data.DataView = SqlDataSource6.Select(New DataSourceSelectArguments)
            For j As Integer = 0 To dv_path_checkIns.Count - 1
                If dv_path_checkIns.Item(j).Item("path") = Me.FileUpload2.FileName Then
                    Response.Write("<script>alert('Image name is existed, change another name please!')</script>")
                    Exit Sub
                End If

            Next
            fileExtension = IO.Path.GetExtension(Me.FileUpload2.FileName).ToLower
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

                    Me.FileUpload2.PostedFile.SaveAs(Path & Session("pess_cod") & "/" & Me.FileUpload2.FileName)


                Catch ex As Exception
                    If Session("CurrentUI") = "en-US" Then
                        Me.Label8.Text = "Upload false!! <br>" + ex.Message
                        Exit Sub
                    End If
                    If Session("CurrentUI") = "zh-TW" Then
                        Me.Label8.Text = "上傳錯誤!! <br>" + ex.Message
                        Exit Sub
                    End If
                End Try
            Else
                If Session("CurrentUI") = "en-US" Then
                    Me.Label8.Text = "file upload failed, confirm the type please !!"
                    Exit Sub
                End If
                If Session("CurrentUI") = "zh-TW" Then
                    Me.Label8.Text = "文件上傳失敗, 請確認格式!!"
                    Exit Sub
                End If
            End If



        End If


        Dim sb As StringBuilder = New StringBuilder(HttpUtility.HtmlEncode(Me.Editor2.Content))
        sb.Replace("&lt;br /&gt;", "<br />")
        sb.Replace("&amp;nbsp;", "&nbsp")
        sb.Replace("&lt;span style=&quot;", "<span style=" + Chr(34))
        sb.Replace("&quot;&gt;", Chr(34) + ">")
        sb.Replace("&lt;/span&gt;", "</span>")
        sb.Replace("&lt;div style=&quot;", "<div style=" + Chr(34))
        sb.Replace("&lt;/div&gt;", "</div>")
        sb.Replace("&lt;p style=&quot;", "<p style=" + Chr(34))
        sb.Replace("&lt;ul style=&quot;", "<ul style=" + Chr(34))
        sb.Replace("&lt;ol style=&quot;", "<ol style=" + Chr(34))
        sb.Replace("&lt;p&gt;", "<p>")
        sb.Replace("&lt;/p&gt;", "</p>")
        sb.Replace("&lt;ol&gt;", "<ol>")
        sb.Replace("&lt;li&gt;", "<li>")
        sb.Replace("&lt;/li&gt;", "</li>")
        sb.Replace("&lt;/ol&gt;", "</ol>")
        sb.Replace("&lt;ul&gt;", "<ul>")
        sb.Replace("&lt;/ul&gt;", "</ul>")
        sb.Replace("&lt;hr /&gt;", "<hr />")
        sb.Replace("&lt;a href=&quot;", "<a href=" + Chr(34))
        sb.Replace("&quot; target=&quot;", Chr(34) + " target=" + Chr(34))
        sb.Replace("&lt;/a&gt;", "</a>")






        If Me.FileUpload2.FileName = "" Then
            If TextBox2.Text = "" And TextBox11.Text = "" Then
                Try
                    Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
                    Using mycon As New SqlConnection(con)
                        mycon.Open()
                        Dim strSQL As String = "insert into CommAct (pess_cod,startDate,endDate,actName,orgName,position,description,path,actNameCht,orgNameCht,positionCht)values(@pess_cod,NULL,NULL,@actName,@orgName,@position,@description,NULL,@actNameCht,@orgNameCht,@positionCht);"
                        strSQL += "update Learning_Records_Correspond set [count] = [count] + 1 where (pess_cod = @pess_cod and experience_id='8')"
                        Using cmd As New SqlCommand()
                            cmd.Connection = mycon
                            cmd.CommandText = strSQL
                            cmd.Parameters.AddWithValue("@pess_cod", Session("pess_cod"))
                            cmd.Parameters.AddWithValue("@actName", TextBox3.Text)
                            cmd.Parameters.AddWithValue("@orgName", TextBox4.Text)
                            cmd.Parameters.AddWithValue("@position", TextBox5.Text)
                            cmd.Parameters.AddWithValue("@description", sb.ToString())
                            cmd.Parameters.AddWithValue("@actNameCht", TextBox7.Text)
                            cmd.Parameters.AddWithValue("@orgNameCht", TextBox10.Text)
                            cmd.Parameters.AddWithValue("@positionCht", TextBox8.Text)



                            cmd.ExecuteNonQuery()
                        End Using
                        mycon.Close()
                    End Using
                Catch ex As Exception

                    Response.Write("<script>alert('Insert Error!')</script>")

                    Return
                End Try
            ElseIf TextBox2.Text = "" Then
                Try
                    Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
                    Using mycon As New SqlConnection(con)
                        mycon.Open()
                        Dim strSQL As String = "insert into CommAct (pess_cod,startDate,endDate,actName,orgName,position,description,path,actNameCht,orgNameCht,positionCht)values(@pess_cod,NULL,@endDate,@actName,@orgName,@position,@description,NULL,@actNameCht,@orgNameCht,@positionCht);"
                        strSQL += "update Learning_Records_Correspond set [count] = [count] + 1 where (pess_cod = @pess_cod and experience_id='8')"
                        Using cmd As New SqlCommand()
                            cmd.Connection = mycon
                            cmd.CommandText = strSQL
                            cmd.Parameters.AddWithValue("@pess_cod", Session("pess_cod"))
                            cmd.Parameters.AddWithValue("@endDate", TextBox11.Text)
                            cmd.Parameters.AddWithValue("@actName", TextBox3.Text)
                            cmd.Parameters.AddWithValue("@orgName", TextBox4.Text)
                            cmd.Parameters.AddWithValue("@position", TextBox5.Text)
                            cmd.Parameters.AddWithValue("@description", sb.ToString())
                            cmd.Parameters.AddWithValue("@actNameCht", TextBox7.Text)
                            cmd.Parameters.AddWithValue("@orgNameCht", TextBox10.Text)
                            cmd.Parameters.AddWithValue("@positionCht", TextBox8.Text)



                            cmd.ExecuteNonQuery()
                        End Using
                        mycon.Close()
                    End Using
                Catch ex As Exception

                    Response.Write("<script>alert('Insert Error!')</script>")

                    Return
                End Try
            ElseIf TextBox11.Text = "" Then
                Try
                    Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
                    Using mycon As New SqlConnection(con)
                        mycon.Open()
                        Dim strSQL As String = "insert into CommAct (pess_cod,startDate,endDate,actName,orgName,position,description,path,actNameCht,orgNameCht,positionCht)values(@pess_cod,@startDate,NULL,@actName,@orgName,@position,@description,NULL,@actNameCht,@orgNameCht,@positionCht);"
                        strSQL += "update Learning_Records_Correspond set [count] = [count] + 1 where (pess_cod = @pess_cod and experience_id='8')"
                        Using cmd As New SqlCommand()
                            cmd.Connection = mycon
                            cmd.CommandText = strSQL
                            cmd.Parameters.AddWithValue("@pess_cod", Session("pess_cod"))
                            cmd.Parameters.AddWithValue("@startDate", TextBox2.Text)
                            cmd.Parameters.AddWithValue("@actName", TextBox3.Text)
                            cmd.Parameters.AddWithValue("@orgName", TextBox4.Text)
                            cmd.Parameters.AddWithValue("@position", TextBox5.Text)
                            cmd.Parameters.AddWithValue("@description", sb.ToString())
                            cmd.Parameters.AddWithValue("@actNameCht", TextBox7.Text)
                            cmd.Parameters.AddWithValue("@orgNameCht", TextBox10.Text)
                            cmd.Parameters.AddWithValue("@positionCht", TextBox8.Text)



                            cmd.ExecuteNonQuery()
                        End Using
                        mycon.Close()
                    End Using
                Catch ex As Exception

                    Response.Write("<script>alert('Insert Error!')</script>")

                    Return
                End Try
            Else
                Try
                    Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
                    Using mycon As New SqlConnection(con)
                        mycon.Open()
                        Dim strSQL As String = "insert into CommAct (pess_cod,startDate,endDate,actName,orgName,position,description,path,actNameCht,orgNameCht,positionCht)values(@pess_cod,@startDate,@endDate,@actName,@orgName,@position,@description,NULL,@actNameCht,@orgNameCht,@positionCht);"
                        strSQL += "update Learning_Records_Correspond set [count] = [count] + 1 where (pess_cod = @pess_cod and experience_id='8')"
                        Using cmd As New SqlCommand()
                            cmd.Connection = mycon
                            cmd.CommandText = strSQL
                            cmd.Parameters.AddWithValue("@pess_cod", Session("pess_cod"))
                            cmd.Parameters.AddWithValue("@startDate", TextBox2.Text)
                            cmd.Parameters.AddWithValue("@endDate", TextBox11.Text)
                            cmd.Parameters.AddWithValue("@actName", TextBox3.Text)
                            cmd.Parameters.AddWithValue("@orgName", TextBox4.Text)
                            cmd.Parameters.AddWithValue("@position", TextBox5.Text)
                            cmd.Parameters.AddWithValue("@description", sb.ToString())
                            cmd.Parameters.AddWithValue("@actNameCht", TextBox7.Text)
                            cmd.Parameters.AddWithValue("@orgNameCht", TextBox10.Text)
                            cmd.Parameters.AddWithValue("@positionCht", TextBox8.Text)



                            cmd.ExecuteNonQuery()
                        End Using
                        mycon.Close()
                    End Using
                Catch ex As Exception

                    Response.Write("<script>alert('Insert Error!')</script>")

                    Return
                End Try
            End If

        Else
            If TextBox2.Text = "" And TextBox11.Text = "" Then
                Try
                    Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
                    Using mycon As New SqlConnection(con)
                        mycon.Open()
                        Dim strSQL As String = "insert into CommAct (pess_cod,startDate,endDate,actName,orgName,position,description,path,actNameCht,orgNameCht,positionCht)values(@pess_cod,NULL,NULL,@actName,@orgName,@position,@description, N'" + Me.FileUpload2.FileName + "',@actNameCht,@orgNameCht,@positionCht);"
                        strSQL += "update Learning_Records_Correspond set [count] = [count] + 1 where (pess_cod = @pess_cod and experience_id='8')"
                        Using cmd As New SqlCommand()
                            cmd.Connection = mycon
                            cmd.CommandText = strSQL
                            cmd.Parameters.AddWithValue("@pess_cod", Session("pess_cod"))
                            cmd.Parameters.AddWithValue("@actName", TextBox3.Text)
                            cmd.Parameters.AddWithValue("@orgName", TextBox4.Text)
                            cmd.Parameters.AddWithValue("@position", TextBox5.Text)
                            cmd.Parameters.AddWithValue("@description", sb.ToString())
                            'cmd.Parameters.AddWithValue("@path", Path & Session("pess_cod") & "\" & Me.FileUpload2.FileName)
                            cmd.Parameters.AddWithValue("@actNameCht", TextBox7.Text)
                            cmd.Parameters.AddWithValue("@orgNameCht", TextBox10.Text)
                            cmd.Parameters.AddWithValue("@positionCht", TextBox8.Text)


                            cmd.ExecuteNonQuery()
                        End Using
                        mycon.Close()
                    End Using
                Catch ex As Exception

                    Response.Write("<script>alert('Insert Error!')</script>")

                    Return
                End Try

            ElseIf TextBox2.Text = "" Then
                Try
                    Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
                    Using mycon As New SqlConnection(con)
                        mycon.Open()
                        Dim strSQL As String = "insert into CommAct (pess_cod,startDate,endDate,actName,orgName,position,description,path,actNameCht,orgNameCht,positionCht)values(@pess_cod,NULL,@endDate,@actName,@orgName,@position,@description, N'" + Me.FileUpload2.FileName + "',@actNameCht,@orgNameCht,@positionCht);"
                        strSQL += "update Learning_Records_Correspond set [count] = [count] + 1 where (pess_cod = @pess_cod and experience_id='8')"
                        Using cmd As New SqlCommand()
                            cmd.Connection = mycon
                            cmd.CommandText = strSQL
                            cmd.Parameters.AddWithValue("@pess_cod", Session("pess_cod"))
                            cmd.Parameters.AddWithValue("@endDate", TextBox11.Text)
                            cmd.Parameters.AddWithValue("@actName", TextBox3.Text)
                            cmd.Parameters.AddWithValue("@orgName", TextBox4.Text)
                            cmd.Parameters.AddWithValue("@position", TextBox5.Text)
                            cmd.Parameters.AddWithValue("@description", sb.ToString())
                            'cmd.Parameters.AddWithValue("@path", Path & Session("pess_cod") & "\" & Me.FileUpload2.FileName)
                            cmd.Parameters.AddWithValue("@actNameCht", TextBox7.Text)
                            cmd.Parameters.AddWithValue("@orgNameCht", TextBox10.Text)
                            cmd.Parameters.AddWithValue("@positionCht", TextBox8.Text)

                            cmd.ExecuteNonQuery()
                        End Using
                        mycon.Close()
                    End Using
                Catch ex As Exception

                    Response.Write("<script>alert('Insert Error!')</script>")

                    Return
                End Try
            ElseIf TextBox11.Text = "" Then
                Try
                    Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
                    Using mycon As New SqlConnection(con)
                        mycon.Open()
                        Dim strSQL As String = "insert into CommAct (pess_cod,startDate,endDate,actName,orgName,position,description,path,actNameCht,orgNameCht,positionCht)values(@pess_cod,@startDate,NULL,@actName,@orgName,@position,@description, N'" + Me.FileUpload2.FileName + "',@actNameCht,@orgNameCht,@positionCht);"
                        strSQL += "update Learning_Records_Correspond set [count] = [count] + 1 where (pess_cod = @pess_cod and experience_id='8')"
                        Using cmd As New SqlCommand()
                            cmd.Connection = mycon
                            cmd.CommandText = strSQL
                            cmd.Parameters.AddWithValue("@pess_cod", Session("pess_cod"))
                            cmd.Parameters.AddWithValue("@startDate", TextBox2.Text)
                            cmd.Parameters.AddWithValue("@actName", TextBox3.Text)
                            cmd.Parameters.AddWithValue("@orgName", TextBox4.Text)
                            cmd.Parameters.AddWithValue("@position", TextBox5.Text)
                            cmd.Parameters.AddWithValue("@description", sb.ToString())
                            'cmd.Parameters.AddWithValue("@path", Path & Session("pess_cod") & "\" & Me.FileUpload2.FileName)
                            cmd.Parameters.AddWithValue("@actNameCht", TextBox7.Text)
                            cmd.Parameters.AddWithValue("@orgNameCht", TextBox10.Text)
                            cmd.Parameters.AddWithValue("@positionCht", TextBox8.Text)


                            cmd.ExecuteNonQuery()
                        End Using
                        mycon.Close()
                    End Using
                Catch ex As Exception

                    Response.Write("<script>alert('Insert Error!')</script>")

                    Return
                End Try
            Else
                Try
                    Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
                    Using mycon As New SqlConnection(con)
                        mycon.Open()
                        Dim strSQL As String = "insert into CommAct (pess_cod,startDate,endDate,actName,orgName,position,description,path,actNameCht,orgNameCht,positionCht)values(@pess_cod,@startDate,@endDate,@actName,@orgName,@position,@description, N'" + Me.FileUpload2.FileName + "',@actNameCht,@orgNameCht,@positionCht);"
                        strSQL += "update Learning_Records_Correspond set [count] = [count] + 1 where (pess_cod = @pess_cod and experience_id='8')"
                        Using cmd As New SqlCommand()
                            cmd.Connection = mycon
                            cmd.CommandText = strSQL
                            cmd.Parameters.AddWithValue("@pess_cod", Session("pess_cod"))
                            cmd.Parameters.AddWithValue("@startDate", TextBox2.Text)
                            cmd.Parameters.AddWithValue("@endDate", TextBox11.Text)
                            cmd.Parameters.AddWithValue("@actName", TextBox3.Text)
                            cmd.Parameters.AddWithValue("@orgName", TextBox4.Text)
                            cmd.Parameters.AddWithValue("@position", TextBox5.Text)
                            cmd.Parameters.AddWithValue("@description", sb.ToString())
                            'cmd.Parameters.AddWithValue("@path", Path & Session("pess_cod") & "\" & Me.FileUpload2.FileName)
                            cmd.Parameters.AddWithValue("@actNameCht", TextBox7.Text)
                            cmd.Parameters.AddWithValue("@orgNameCht", TextBox10.Text)
                            cmd.Parameters.AddWithValue("@positionCht", TextBox8.Text)

                            cmd.ExecuteNonQuery()
                        End Using
                        mycon.Close()
                    End Using
                Catch ex As Exception

                    Response.Write("<script>alert('Insert Error!')</script>")

                    Return
                End Try
            End If

        End If


        GridViewComm.DataBind()


        MultiView1.ActiveViewIndex = 0
        ImageButtonapic1.CssClass = "aimgactive"
        'ImageButtonapic2.CssClass = "aimg"


        GridViewComm.Visible = True
        DetailsViewComm.Visible = False
        FileUpload1.Visible = False
        Button1.Visible = False
        Image1.Visible = False
        Button2.Visible = False
        Label1.Visible = False

        Button9.Visible = False
        Button10.Visible = False
        Button11.Visible = False
        Label20.Visible = False
        Me.Editor1.Visible = False

    End Sub

    Protected Sub CommCel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CommCel.Click
        MultiView1.ActiveViewIndex = 0
        ImageButtonapic1.CssClass = "aimgactive"
        'ImageButtonapic2.CssClass = "aimg"



        GridViewComm.Visible = True
        DetailsViewComm.Visible = False
        FileUpload1.Visible = False
        Button1.Visible = False
        Image1.Visible = False
        Button2.Visible = False
        Label1.Visible = False

        Button9.Visible = False
        Button10.Visible = False
        Button11.Visible = False
        Label20.Visible = False
        Me.Editor1.Visible = False
    End Sub


    Protected Sub GridViewComm_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GridViewComm.RowDeleting
        If (message.Value = "No") Then
            e.Cancel = True
            Return
        End If
        SqlDataSource3.SelectCommand = "Select path from CommAct where pess_cod='" & Session("pess_cod") & "' and id='" & GridViewComm.DataKeys(e.RowIndex).Value.ToString() & "'"
        Dim dv_path As Data.DataView = SqlDataSource3.Select(New DataSourceSelectArguments)
        If Not IsDBNull(dv_path.Item(0).Item("path")) Then
            System.IO.File.Delete(dv_path.Item(0).Item("path"))
        End If
    End Sub



    Protected Sub delCom_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        If (message.Value = "No") Then
            Exit Sub
        End If

    End Sub

    Protected Sub DetailsViewComm_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdateEventArgs) Handles DetailsViewComm.ItemUpdating
        Dim startDate As String = CType(Me.DetailsViewComm.FindControl("TextBox1"), TextBox).Text
        Dim endDate As String = CType(Me.DetailsViewComm.FindControl("TextBox2"), TextBox).Text
        Dim startArr() As String
        Dim endArr() As String
        startArr = startDate.Split("/")
        endArr = endDate.Split("/")
        If startDate = "" Or endDate = "" Then
            Exit Sub
        End If

        If ((Convert.ToInt32(startArr(0))) > (Convert.ToInt32(endArr(0)))) Then
            e.Cancel = True

            If Session("CurrentUI") = "zh-TW" Then
                Response.Write("<script>alert('結束日期必須大於開始日期!')</script>")
            Else
                Response.Write("<script>alert('End Date must greater than Start Date!')</script>")

            End If

            Return
        End If
        If ((Convert.ToInt32(startArr(0))) = (Convert.ToInt32(endArr(0))) And (Convert.ToInt32(startArr(1))) > (Convert.ToInt32(endArr(1)))) Then
            e.Cancel = True

            If Session("CurrentUI") = "zh-TW" Then
                Response.Write("<script>alert('結束日期必須大於開始日期!')</script>")

            Else
                Response.Write("<script>alert('End Date must greater than Start Date!')</script>")

            End If
            Return

        End If

        If ((Convert.ToInt32(startArr(0))) = (Convert.ToInt32(endArr(0))) And (Convert.ToInt32(startArr(1))) = (Convert.ToInt32(endArr(1))) And (Convert.ToInt32(startArr(2))) > (Convert.ToInt32(endArr(2)))) Then
            e.Cancel = True

            If Session("CurrentUI") = "zh-TW" Then
                Response.Write("<script>alert('結束日期必須大於開始日期!')</script>")
            Else
                Response.Write("<script>alert('End Date must greater than Start Date!')</script>")

            End If
            Return

        End If
    End Sub

    Protected Sub DetailsViewComm_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertEventArgs) Handles DetailsViewComm.ItemInserting
        Dim startDate As String = CType(Me.DetailsViewComm.FindControl("TextBox1"), TextBox).Text
        Dim endDate As String = CType(Me.DetailsViewComm.FindControl("TextBox2"), TextBox).Text
        Dim startArr() As String
        Dim endArr() As String
        startArr = startDate.Split("/")
        endArr = endDate.Split("/")
        If startDate = "" Or endDate = "" Then
            Exit Sub
        End If

        If ((Convert.ToInt32(startArr(0))) > (Convert.ToInt32(endArr(0)))) Then
            e.Cancel = True

            If Session("CurrentUI") = "zh-TW" Then
                Response.Write("<script>alert('結束日期必須大於開始日期!')</script>")
            Else
                Response.Write("<script>alert('End Date must greater than Start Date!')</script>")

            End If
            Return
        End If
        If ((Convert.ToInt32(startArr(0))) = (Convert.ToInt32(endArr(0))) And (Convert.ToInt32(startArr(1))) > (Convert.ToInt32(endArr(1)))) Then
            e.Cancel = True

            If Session("CurrentUI") = "zh-TW" Then
                Response.Write("<script>alert('結束日期必須大於開始日期!')</script>")
            Else
                Response.Write("<script>alert('End Date must greater than Start Date!')</script>")

            End If
            Return

        End If

        If ((Convert.ToInt32(startArr(0))) = (Convert.ToInt32(endArr(0))) And (Convert.ToInt32(startArr(1))) = (Convert.ToInt32(endArr(1))) And (Convert.ToInt32(startArr(2))) > (Convert.ToInt32(endArr(2)))) Then
            e.Cancel = True

            If Session("CurrentUI") = "zh-TW" Then
                Response.Write("<script>alert('結束日期必須大於開始日期!')</script>")
            Else
                Response.Write("<script>alert('End Date must greater than Start Date!')</script>")

            End If
            Return

        End If
    End Sub
    Protected Overrides Sub InitializeCulture()

        If Session("CurrentUI") IsNot Nothing Then

            Dim selectedLanguage As String = Session("CurrentUI").ToString()
            UICulture = selectedLanguage
            Culture = selectedLanguage


            Thread.CurrentThread.CurrentCulture =
                CultureInfo.CreateSpecificCulture(selectedLanguage)
            Thread.CurrentThread.CurrentUICulture = New CultureInfo(selectedLanguage)
        End If

        MyBase.InitializeCulture()
    End Sub

    Protected Sub Button10_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button10.Click
        Editor1.ActiveMode = AjaxControlToolkit.HTMLEditor.ActiveModeType.Design
        Editor1.Visible = True
        Button9.Visible = True
        Button11.Visible = True
        Button10.Visible = False
    End Sub

    Protected Sub Button9_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button9.Click
        Dim conn As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString)
        Dim tmp_da As New SqlClient.SqlDataAdapter("Select top 1 * from CommAct where pess_cod='" & Session("pess_cod") & "' and id=" & GridViewComm.SelectedValue, conn)
        Dim tmp_ds As New DataSet
        Dim tmp_dr As DataRow

        conn.Open()
        tmp_da.Fill(tmp_ds, "CommAct")
        tmp_da.FillSchema(tmp_ds, SchemaType.Source, "CommAct")
        If tmp_ds.Tables("CommAct").Rows.Count > 0 Then
            tmp_dr = tmp_ds.Tables("CommAct").Rows(0)
            Dim sb As StringBuilder = New StringBuilder(HttpUtility.HtmlEncode(Me.Editor1.Content))
            sb.Replace("&lt;br /&gt;", "<br />")
            sb.Replace("&amp;nbsp;", "&nbsp")
            sb.Replace("&lt;span style=&quot;", "<span style=" + Chr(34))
            sb.Replace("&quot;&gt;", Chr(34) + ">")
            sb.Replace("&lt;/span&gt;", "</span>")
            sb.Replace("&lt;div style=&quot;", "<div style=" + Chr(34))
            sb.Replace("&lt;/div&gt;", "</div>")
            sb.Replace("&lt;p style=&quot;", "<p style=" + Chr(34))
            sb.Replace("&lt;ul style=&quot;", "<ul style=" + Chr(34))
            sb.Replace("&lt;ol style=&quot;", "<ol style=" + Chr(34))
            sb.Replace("&lt;p&gt;", "<p>")
            sb.Replace("&lt;/p&gt;", "</p>")
            sb.Replace("&lt;ol&gt;", "<ol>")
            sb.Replace("&lt;li&gt;", "<li>")
            sb.Replace("&lt;/li&gt;", "</li>")
            sb.Replace("&lt;/ol&gt;", "</ol>")
            sb.Replace("&lt;ul&gt;", "<ul>")
            sb.Replace("&lt;/ul&gt;", "</ul>")
            sb.Replace("&lt;hr /&gt;", "<hr />")
            sb.Replace("&lt;a href=&quot;", "<a href=" + Chr(34))
            sb.Replace("&quot; target=&quot;", Chr(34) + " target=" + Chr(34))
            sb.Replace("&lt;/a&gt;", "</a>")

            tmp_dr("description") = sb

            Dim myobj As New SqlClient.SqlCommandBuilder(tmp_da)
            tmp_da.Update(tmp_ds, "CommAct")
            Button9.Visible = False
            Button11.Visible = False
            Button10.Visible = True
            Me.Editor1.Content = tmp_dr("description")
            Editor1.ActiveMode = AjaxControlToolkit.HTMLEditor.ActiveModeType.Preview


        End If

        conn.Close()
    End Sub

    Protected Sub Button11_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button11.Click
        Dim conn As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString)
        Dim tmp_da As New SqlClient.SqlDataAdapter("Select top 1 * from CommAct where pess_cod='" & Session("pess_cod") & "' and id=" & GridViewComm.SelectedValue, conn)
        Dim tmp_ds As New DataSet
        Dim tmp_dr As DataRow

        conn.Open()
        tmp_da.Fill(tmp_ds, "CommAct")
        tmp_da.FillSchema(tmp_ds, SchemaType.Source, "CommAct")
        If tmp_ds.Tables("CommAct").Rows.Count > 0 Then
            tmp_dr = tmp_ds.Tables("CommAct").Rows(0)
            Me.Editor1.Content = tmp_dr("description")
            Button9.Visible = False
            Button11.Visible = False
            Button10.Visible = True

            Editor1.ActiveMode = AjaxControlToolkit.HTMLEditor.ActiveModeType.Preview
        End If
    End Sub


    Protected Sub AddCommBtn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AddCommBtn.Click
        MultiView1.ActiveViewIndex = 1
        Label1.Visible = False
        TextBox2.Text = ""
        TextBox3.Text = ""
        TextBox4.Text = ""
        TextBox5.Text = ""
        Me.Editor2.Content = ""
        TextBox7.Text = ""
        TextBox8.Text = ""
        TextBox10.Text = ""
        TextBox11.Text = ""
        Label8.Text = ""

    End Sub
End Class
