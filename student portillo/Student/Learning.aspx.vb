Imports System.Data
Imports System.Data.SqlClient
Imports System.Threading
Imports System.Globalization
Partial Class Student_Learning
    Inherits System.Web.UI.Page

    Private Sub LearningRecords_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init

        If DesignMode = True Then
            Return
        End If
        If Session("Role_Type") Is Nothing Then

            Response.Write("<script>alert('Please Log In !'); window.location.href='http://172.26.122.66/siweb/logout.asp'; </script>")

            Response.End()

        End If

        If Not IsPostBack Then
            Dim dv_verify As Data.DataView = SqlDataSource8.Select(New DataSourceSelectArguments)
            Dim dv_verifyStaff As Data.DataView = SqlDataSource18.Select(New DataSourceSelectArguments)


            If Session("Role_Type") = "student" Then
                If dv_verify.Item(0).Item("lr") = "False" Then

                    Response.Write("<script>alert('You do not have Permission to view it !');window.history.back(-1); </script>")

                End If
            End If
            If Session("position") = "studentview" Then
                If dv_verifyStaff.Item(0).Item("lr") = "False" Then

                    Response.Write("<script>alert('You do not have Permission to view it !');window.history.back(-1); </script>")

                End If
            End If
        End If

        If Not IsPostBack Then
            verify()
        End If

        Dim conn As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString)
        Dim tmp_da7 As New SqlClient.SqlDataAdapter("Select top 1 * from Learning_Records_Correspond where pess_cod='" & Session("pess_cod") & "'", conn)

        Dim tmp_ds As New DataSet


        conn.Open()
        Dim dv_Learning_Experience As Data.DataView = SqlDataSource19.Select(New DataSourceSelectArguments)
        tmp_da7.Fill(tmp_ds, "Learning_Records_Correspond")
        tmp_da7.FillSchema(tmp_ds, SchemaType.Source, "Learning_Records_Correspond")
        If tmp_ds.Tables("Learning_Records_Correspond").Rows.Count = 0 Then
            pess_cod.Value = Session("pess_cod")

            For i As Integer = 0 To dv_Learning_Experience.Count - 1

                Try
                    Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
                    Using mycon As New SqlConnection(con)
                        mycon.Open()
                        Dim strSQL As String = "insert into Learning_Records_Correspond(pess_cod,experience_id,count)values(@pess_cod,@experience_id,@count);"

                        Using cmd As New SqlCommand()
                            cmd.Connection = mycon
                            cmd.CommandText = strSQL
                            cmd.Parameters.AddWithValue("@pess_cod", pess_cod.Value)
                            cmd.Parameters.AddWithValue("@experience_id", dv_Learning_Experience.Item(i).Item("id"))
                            cmd.Parameters.AddWithValue("@count", "0")
                            cmd.ExecuteNonQuery()
                        End Using
                        mycon.Close()
                    End Using
                Catch ex As Exception

                    Response.Write("<script>alert('Web Error!')</script>")

                    Return

                End Try

            Next
        End If


        conn.Close()
        TotalCount()

        Button1.Visible = False
        Button2.Visible = False
        Button3.Visible = False
        Button4.Visible = False
        Button5.Visible = False
        Button6.Visible = False
        Button7.Visible = False



    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        If Session("CurrentUI") = "en-US" Then
            ImageButtonapic8.ImageUrl = "~/Student/animatedmenu3/apic8.png"
            ImageButtonapic1.ImageUrl = "~/Student/animatedmenu3/apic1.png"
            ImageButtonapic2.ImageUrl = "~/Student/animatedmenu3/apic2.png"
            ImageButtonapic3.ImageUrl = "~/Student/animatedmenu3/apic3.png"
            ImageButtonapic4.ImageUrl = "~/Student/animatedmenu3/apic4.png"
            ImageButtonapic5.ImageUrl = "~/Student/animatedmenu3/apic5.png"
            ImageButtonapic6.ImageUrl = "~/Student/animatedmenu3/apic6.png"
            ImageButtonapic7.ImageUrl = "~/Student/animatedmenu3/apic7.png"

        End If

        If Session("CurrentUI") = "zh-TW" Then
            ImageButtonapic8.ImageUrl = "~/Student/animatedmenu3/homec.png"
            ImageButtonapic1.ImageUrl = "~/Student/animatedmenu3/cccb1.png"
            ImageButtonapic2.ImageUrl = "~/Student/animatedmenu3/cccb2.png"
            ImageButtonapic3.ImageUrl = "~/Student/animatedmenu3/cccb3.png"
            ImageButtonapic4.ImageUrl = "~/Student/animatedmenu3/cccb4.png"
            ImageButtonapic5.ImageUrl = "~/Student/animatedmenu3/cccb5.png"
            ImageButtonapic6.ImageUrl = "~/Student/animatedmenu3/cccb6.png"
            ImageButtonapic7.ImageUrl = "~/Student/animatedmenu3/cccb7.png"

        End If




    End Sub



    Protected Sub ImageButtonapic1_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButtonapic1.Click

        MultiView1.ActiveViewIndex = 0
        GridViewSeminar.Visible = True
        DetailsViewSeminar.Visible = False
        semBack.Visible = False
        Label1.Visible = False
        ImageButtonapic1.CssClass = "aimgactive"
        ImageButtonapic2.CssClass = "aimg"
        ImageButtonapic3.CssClass = "aimg"
        ImageButtonapic4.CssClass = "aimg"
        ImageButtonapic5.CssClass = "aimg"
        ImageButtonapic6.CssClass = "aimg"
        ImageButtonapic7.CssClass = "aimg"
        AddSemBtn.Visible = True
        verify()
        MultiView8.ActiveViewIndex = 0

    End Sub

    Protected Sub ImageButtonapic2_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButtonapic2.Click

        MultiView1.ActiveViewIndex = 1
        GridViewProfessional.Visible = True
        DetailsViewProfessional.Visible = False
        FileUpload1.Visible = False
        Button8.Visible = False
        Image1.Visible = False
        Button12.Visible = False
        Label1.Visible = False

        ImageButtonapic1.CssClass = "aimg"
        ImageButtonapic2.CssClass = "aimgactive"
        ImageButtonapic3.CssClass = "aimg"
        ImageButtonapic4.CssClass = "aimg"
        ImageButtonapic5.CssClass = "aimg"
        ImageButtonapic6.CssClass = "aimg"
        ImageButtonapic7.CssClass = "aimg"


        addCert.Visible = True
        verify()
        MultiView2.ActiveViewIndex = 0
    End Sub

    Protected Sub ImageButtonapic3_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButtonapic3.Click

        MultiView1.ActiveViewIndex = 4
        GridViewAward.Visible = True
        DetailsViewAward.Visible = False
        Button14.Visible = False

        Label1.Visible = False

        ImageButtonapic1.CssClass = "aimg"
        ImageButtonapic2.CssClass = "aimg"
        ImageButtonapic3.CssClass = "aimgactive"
        ImageButtonapic4.CssClass = "aimg"
        ImageButtonapic5.CssClass = "aimg"
        ImageButtonapic6.CssClass = "aimg"
        ImageButtonapic7.CssClass = "aimg"


        addAward.Visible = True
        verify()
        MultiView3.ActiveViewIndex = 0

    End Sub

    Protected Sub ImageButtonapic4_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButtonapic4.Click

        MultiView1.ActiveViewIndex = 2
        ' If Session("Role_Type") = "student" Then
        'Button10.Visible = True
        ' Else
        '  Button10.Visible = False
        '  End If
        GridViewMatch.Visible = True
        DetailsViewMatch.Visible = False
        Button13.Visible = False
        Button10.Visible = False


         Label1.Visible = False
        ImageButtonapic1.CssClass = "aimg"
        ImageButtonapic2.CssClass = "aimg"
        ImageButtonapic3.CssClass = "aimg"
        ImageButtonapic4.CssClass = "aimgactive"
        ImageButtonapic5.CssClass = "aimg"
        ImageButtonapic6.CssClass = "aimg"
        ImageButtonapic7.CssClass = "aimg"


        Editor1.Visible = False
        addMatch.Visible = True
        verify()
        Label20.Visible = False
        Button9.Visible = False
        Button11.Visible = False
        MultiView4.ActiveViewIndex = 0

    End Sub
    Protected Sub ImageButtonapic5_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButtonapic5.Click

        MultiView1.ActiveViewIndex = 6
        GridViewIntership.Visible = True
        DetailsViewIntership.Visible = False
        Button16.Visible = False

        Label1.Visible = False
        ImageButtonapic1.CssClass = "aimg"
        ImageButtonapic2.CssClass = "aimg"
        ImageButtonapic3.CssClass = "aimg"
        ImageButtonapic4.CssClass = "aimg"
        ImageButtonapic5.CssClass = "aimgactive"
        ImageButtonapic6.CssClass = "aimg"
        ImageButtonapic7.CssClass = "aimg"


        addShip.Visible = True
        verify()
        MultiView5.ActiveViewIndex = 0
    End Sub
    Protected Sub ImageButtonapic6_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButtonapic6.Click

        MultiView1.ActiveViewIndex = 5
        GridViewAbroad.Visible = True
        DetailsViewAbroad.Visible = False
        Button15.Visible = False


        Label1.Visible = False
        ImageButtonapic1.CssClass = "aimg"
        ImageButtonapic2.CssClass = "aimg"
        ImageButtonapic3.CssClass = "aimg"
        ImageButtonapic4.CssClass = "aimg"
        ImageButtonapic5.CssClass = "aimg"
        ImageButtonapic6.CssClass = "aimgactive"
        ImageButtonapic7.CssClass = "aimg"


        addAbroad.Visible = True
        verify()
        MultiView6.ActiveViewIndex = 0
    End Sub
    Protected Sub ImageButtonapic7_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButtonapic7.Click

        MultiView1.ActiveViewIndex = 3
        GridViewReading.Visible = True
        DetailsViewReading.Visible = False

        Label1.Visible = False

        ImageButtonapic1.CssClass = "aimg"
        ImageButtonapic2.CssClass = "aimg"
        ImageButtonapic3.CssClass = "aimg"
        ImageButtonapic4.CssClass = "aimg"
        ImageButtonapic5.CssClass = "aimg"
        ImageButtonapic6.CssClass = "aimg"
        ImageButtonapic7.CssClass = "aimgactive"


        Button18.Visible = False
        addRead.Visible = True
        verify()
        MultiView7.ActiveViewIndex = 0

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


    Private Sub DetailsViewProfessional_ItemDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewDeletedEventArgs) Handles DetailsViewProfessional.ItemDeleted
        GridViewProfessional.DataBind()
        GridViewProfessional.Visible = True
        DetailsViewProfessional.Visible = False
        FileUpload1.Visible = False
        Button8.Visible = False
        Image1.Visible = False
        Button12.Visible = False
        addCert.Visible = True
    End Sub


    Private Sub DetailsViewProfessional_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles DetailsViewProfessional.ItemInserted
        GridViewProfessional.DataBind()
        GridViewProfessional.Visible = True
        DetailsViewProfessional.Visible = False
        FileUpload1.Visible = False
        Button8.Visible = False
        Button12.Visible = False
        Image1.Visible = False
        addCert.Visible = True
    End Sub

    Private Sub DetailsViewProfessional_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles DetailsViewProfessional.ItemUpdated
        GridViewProfessional.DataBind()
        GridViewProfessional.Visible = True
        DetailsViewProfessional.Visible = False
        FileUpload1.Visible = False
        Button8.Visible = False
        Button12.Visible = False
        Image1.Visible = False
        addCert.Visible = True
    End Sub





    Protected Sub GridViewMatch_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewMatch.SelectedIndexChanged
        Dim conn As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString)
        Dim tmp_da As New SqlClient.SqlDataAdapter("Select top 1 * from MatchRecord where id=" & Me.GridViewMatch.SelectedValue, conn)
        Dim tmp_ds As New DataSet
        Dim tmp_dr As DataRow

        conn.Open()
        tmp_da.Fill(tmp_ds, "MatchRecord")
        tmp_da.FillSchema(tmp_ds, SchemaType.Source, "MatchRecord")
        If tmp_ds.Tables("MatchRecord").Rows.Count > 0 Then
            tmp_dr = tmp_ds.Tables("MatchRecord").Rows(0)
            If IsDBNull(tmp_dr("description")) = False Then
                Me.Editor1.Content = tmp_dr("description")
            Else
                Me.Editor1.Content = ""
            End If
        End If
        conn.Close()
        GridViewMatch.Visible = False
        DetailsViewMatch.Visible = True
        DetailsViewMatch.DataBind()
        Button13.Visible = True
           If Session("Role_Type") = "student" Then
            Button10.Visible = True

        Else
            Button10.Visible = False
        End If
        Editor1.Visible = True
        Editor1.ActiveMode = AjaxControlToolkit.HTMLEditor.ActiveModeType.Preview
        addMatch.Visible = False
        Label20.Visible = True
        verify()
    End Sub

    Private Sub DetailsViewMatch_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles DetailsViewMatch.ItemUpdated
        GridViewMatch.DataBind()

        Dim conn As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString)
        Dim tmp_da As New SqlClient.SqlDataAdapter("Select top 1 * from MatchRecord where id=" & Me.GridViewMatch.SelectedValue, conn)
        Dim tmp_ds As New DataSet
        Dim tmp_dr As DataRow

        conn.Open()
        tmp_da.Fill(tmp_ds, "MatchRecord")
        tmp_da.FillSchema(tmp_ds, SchemaType.Source, "MatchRecord")
        If tmp_ds.Tables("MatchRecord").Rows.Count > 0 Then
            tmp_dr = tmp_ds.Tables("MatchRecord").Rows(0)
            tmp_dr("description") = Me.Editor1.Content
            Dim myobj As New SqlClient.SqlCommandBuilder(tmp_da)
            Dim dummy As Integer = tmp_da.Update(tmp_ds, "MatchRecord")
        End If
        conn.Close()
        GridViewMatch.Visible = True
        DetailsViewMatch.Visible = False
        Button13.Visible = False
        Button10.Visible = False
        Editor1.Visible = False
        addMatch.Visible = True
        Label20.Visible = False
        Button9.Visible = False
        Button11.Visible = False
    End Sub

    Private Sub DetailsViewReading_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles DetailsViewReading.ItemInserted
        GridViewReading.DataBind()
        GridViewReading.Visible = True
        DetailsViewReading.Visible = False
        Button18.Visible = False
        addRead.Visible = True
    End Sub

    Private Sub DetailsViewReading_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles DetailsViewReading.ItemUpdated
        GridViewReading.DataBind()
        GridViewReading.Visible = True
        DetailsViewReading.Visible = False
        Button18.Visible = False
        addRead.Visible = True
    End Sub

    Private Sub DetailsViewAward_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles DetailsViewAward.ItemInserted
        GridViewAward.DataBind()
        GridViewAward.Visible = True
        DetailsViewAward.Visible = False
        Button14.Visible = False
        addAward.Visible = True
    End Sub

    Private Sub DetailsViewAward_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles DetailsViewAward.ItemUpdated
        GridViewAward.DataBind()
        GridViewAward.Visible = True
        DetailsViewAward.Visible = False
        Button14.Visible = False
        addAward.Visible = True
    End Sub

    Private Sub DetailsViewAbroad_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles DetailsViewAbroad.ItemInserted
        GridViewAbroad.DataBind()
        GridViewAbroad.Visible = True
        DetailsViewAbroad.Visible = False
        Button15.Visible = False
        addAbroad.Visible = True
    End Sub

    Private Sub DetailsViewAbroad_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles DetailsViewAbroad.ItemUpdated
        GridViewAbroad.DataBind()
        GridViewAbroad.Visible = True
        DetailsViewAbroad.Visible = False
        Button15.Visible = False
        addAbroad.Visible = True
    End Sub







    Private Sub DetailsViewIntership_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles DetailsViewIntership.ItemInserted
        GridViewIntership.DataBind()
        GridViewIntership.Visible = True
        DetailsViewIntership.Visible = False
        Button16.Visible = False
        addShip.Visible = True

    End Sub

    Private Sub DetailsViewIntership_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles DetailsViewIntership.ItemUpdated
        GridViewIntership.DataBind()
        GridViewIntership.Visible = True
        DetailsViewIntership.Visible = False
        Button16.Visible = False
        addShip.Visible = True
    End Sub

    Protected Sub DetailsViewMatch_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles DetailsViewMatch.ItemInserted
        GridViewMatch.DataBind()
        GridViewMatch.Visible = True
        DetailsViewMatch.Visible = False
        Button13.Visible = False
        Button10.Visible = False
        Editor1.Visible = False
        addMatch.Visible = True
        Label20.Visible = False
        Button9.Visible = False
        Button11.Visible = False
    End Sub

    Protected Sub DetailsViewMatch_ItemDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewDeletedEventArgs) Handles DetailsViewMatch.ItemDeleted

        GridViewMatch.DataBind()
        GridViewMatch.Visible = True
        DetailsViewMatch.Visible = False
        Button13.Visible = False
        Button10.Visible = False
        Editor1.Visible = False
        addMatch.Visible = True
        Label20.Visible = False
        Button9.Visible = False
        Button11.Visible = False
    End Sub

    Protected Sub DetailsViewReading_ItemDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewDeletedEventArgs) Handles DetailsViewReading.ItemDeleted

        GridViewReading.DataBind()
    End Sub

    Protected Sub DetailsViewAward_ItemDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewDeletedEventArgs) Handles DetailsViewAward.ItemDeleted
        GridViewAward.DataBind()
        GridViewAward.Visible = True
        DetailsViewAward.Visible = False
        Button14.Visible = False
        addAward.Visible = True
    End Sub

    Protected Sub DetailsViewAbroad_ItemDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewDeletedEventArgs) Handles DetailsViewAbroad.ItemDeleted

        GridViewAbroad.DataBind()
        GridViewAbroad.Visible = True
        DetailsViewAbroad.Visible = False
        Button15.Visible = False
        addAbroad.Visible = True
    End Sub

    Protected Sub DetailsViewIntership_ItemDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewDeletedEventArgs) Handles DetailsViewIntership.ItemDeleted
        GridViewIntership.DataBind()
        GridViewIntership.Visible = True
        DetailsViewIntership.Visible = False
        Button16.Visible = False
        addShip.Visible = True
    End Sub

    'Protected Sub Button17_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button17.ServerClick
        '  If Session("Role_Type") = "student" Then
        'Response.Redirect("home.aspx")
        ' End If

        ' If Session("Role_Type") = "teacher" Or Session("Role_Type") = "tutor" Or Session("Role_Type") = "coordinator" Or Session("Role_Type") = "director" Then
        'Response.Redirect("schoolStaff.aspx")
        ' End If

        ' Response.Write("<script>alert('Please Log In !'); window.location.href='http://172.26.122.66/siweb/logout.asp'; </script>")


   ' End Sub
    
    Public Function show() As Boolean

        If Session("Role_Type") = "student" Then
            Return True

        Else
            Return False
        End If
    End Function

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        MultiView1.ActiveViewIndex = 0
        GridViewSeminar.DataBind()
        Button1.CssClass = "blueli"
        Button2.CssClass = "blue"
        Button3.CssClass = "blue"
        Button4.CssClass = "blue"
        Button5.CssClass = "blue"
        Button6.CssClass = "blue"
        Button7.CssClass = "blue"
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button2.Click
        MultiView1.ActiveViewIndex = 1
        GridViewProfessional.Visible = True
        DetailsViewProfessional.Visible = False
        FileUpload1.Visible = False
        Button8.Visible = False
        Image1.Visible = False
        Button12.Visible = False
        Button2.CssClass = "blueli"
        Button1.CssClass = "blue"
        Button3.CssClass = "blue"
        Button4.CssClass = "blue"
        Button5.CssClass = "blue"
        Button6.CssClass = "blue"
        Button7.CssClass = "blue"
        addCert.Visible = True
        verify()
        MultiView2.ActiveViewIndex = 0
    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button3.Click
        MultiView1.ActiveViewIndex = 2
        ' If Session("Role_Type") = "student" Then
        'Button10.Visible = True
        ' Else
        '  Button10.Visible = False
        '  End If
        GridViewMatch.Visible = True
        DetailsViewMatch.Visible = False
        Button13.Visible = False
        Button10.Visible = False
        Button3.CssClass = "blueli"
        Button1.CssClass = "blue"
        Button2.CssClass = "blue"
        Button4.CssClass = "blue"
        Button5.CssClass = "blue"
        Button6.CssClass = "blue"
        Button7.CssClass = "blue"
        Editor1.Visible = False
        addMatch.Visible = True
        verify()
        Label20.Visible = False
        Button9.Visible = False
        Button11.Visible = False
        MultiView4.ActiveViewIndex = 0
    End Sub

    Protected Sub Button4_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button4.Click
        MultiView1.ActiveViewIndex = 3
        GridViewReading.Visible = True
        DetailsViewReading.Visible = False
        Button4.CssClass = "blueli"
        Button1.CssClass = "blue"
        Button2.CssClass = "blue"
        Button3.CssClass = "blue"
        Button5.CssClass = "blue"
        Button6.CssClass = "blue"
        Button7.CssClass = "blue"
        Button18.Visible = False
        addRead.Visible = True
        verify()
        MultiView7.ActiveViewIndex = 0
    End Sub

    Protected Sub Button5_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button5.Click
        MultiView1.ActiveViewIndex = 4
        GridViewAward.Visible = True
        DetailsViewAward.Visible = False
        Button14.Visible = False
        Button5.CssClass = "blueli"
        Button1.CssClass = "blue"
        Button2.CssClass = "blue"
        Button3.CssClass = "blue"
        Button4.CssClass = "blue"
        Button6.CssClass = "blue"
        Button7.CssClass = "blue"
        addAward.Visible = True
        verify()
        MultiView5.ActiveViewIndex = 0
    End Sub

    Protected Sub Button6_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button6.Click
        MultiView1.ActiveViewIndex = 5
        GridViewAbroad.Visible = True
        DetailsViewAbroad.Visible = False
        Button15.Visible = False
        Button6.CssClass = "blueli"
        Button1.CssClass = "blue"
        Button2.CssClass = "blue"
        Button3.CssClass = "blue"
        Button4.CssClass = "blue"
        Button5.CssClass = "blue"
        Button7.CssClass = "blue"
        addAbroad.Visible = True
        verify()
		MultiView6.ActiveViewIndex = 0
    End Sub

    Protected Sub Button7_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button7.Click
        MultiView1.ActiveViewIndex = 6
        GridViewIntership.Visible = True
        DetailsViewIntership.Visible = False
        Button16.Visible = False
        Button7.CssClass = "blueli"
        Button1.CssClass = "blue"
        Button2.CssClass = "blue"
        Button3.CssClass = "blue"
        Button4.CssClass = "blue"
        Button5.CssClass = "blue"
        Button6.CssClass = "blue"
        addShip.Visible = True
        verify()
	    MultiView5.ActiveViewIndex = 0
    End Sub

    Protected Sub Button8_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button8.Click
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
                        Dim dv_path_check As Data.DataView = SqlDataSource22.Select(New DataSourceSelectArguments)
                        For j As Integer = 0 To dv_path_check.Count - 1
                            If dv_path_check.Item(j).Item("path") = Me.FileUpload1.FileName Then
                                Response.Write("<script>alert('Image name is existed, change another name please!')</script>")
                                Exit Sub
                            End If

                        Next

                        Dim div1 As HtmlControl = CType(Me.Page.FindControl("imageStyle"), HtmlControl)
                        SqlDataSource20.SelectCommand = "Select path from ProfessionalCert where pess_cod='" & Session("pess_cod") & "' and id='" & GridViewProfessional.SelectedValue & "'"
                        Dim dv_path As Data.DataView = SqlDataSource20.Select(New DataSourceSelectArguments)
                        If Not IsDBNull(dv_path.Item(0).Item("path")) Then
                            System.IO.File.Delete(Path & Session("pess_cod") & "/" & dv_path.Item(0).Item("path"))
                        End If
                        Me.FileUpload1.PostedFile.SaveAs(Path & Session("pess_cod") & "\" & Me.FileUpload1.FileName)
                       ' SqlDataSource20.UpdateCommand = "update ProfessionalCert set path='" & Path & Session("pess_cod") & "\" & Me.FileUpload1.FileName & "' where pess_cod='" & Session("pess_cod") & "' and id='" & GridViewProfessional.SelectedValue & "'"
                        SqlDataSource20.UpdateCommand = "update  ProfessionalCert set path=N'" + Me.FileUpload1.FileName + "' where pess_cod='" & Session("pess_cod") & "' and id='" & GridViewProfessional.SelectedValue & "'"
                        SqlDataSource20.Update()
                        If Session("CurrentUI") = "en-US" Then
                            Me.Label1.Text = "Upload Success!!"
                        End If
                        If Session("CurrentUI") = "zh-TW" Then
                            Me.Label1.Text = "上傳成功!!"

                        End If
                        Image1.ImageUrl = pic & Session("pess_cod") & "\" & Me.FileUpload1.FileName
                        Me.Label1.Visible = True
                        div1.Style("display") = ""
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

    Protected Sub Button9_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button9.Click
        Dim conn As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString)
        Dim tmp_da As New SqlClient.SqlDataAdapter("Select top 1 * from MatchRecord where pess_cod='" & Session("pess_cod") & "' and id=" & GridViewMatch.SelectedValue, conn)
        Dim tmp_ds As New DataSet
        Dim tmp_dr As DataRow

        conn.Open()
        tmp_da.Fill(tmp_ds, "MatchRecord")
        tmp_da.FillSchema(tmp_ds, SchemaType.Source, "MatchRecord")
        If tmp_ds.Tables("MatchRecord").Rows.Count > 0 Then
            tmp_dr = tmp_ds.Tables("MatchRecord").Rows(0)
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
			sb.Replace("&quot; target=&quot;", Chr(34)+" target=" + Chr(34))
			sb.Replace("&lt;/a&gt;", "</a>")

            tmp_dr("description") = sb

            Dim myobj As New SqlClient.SqlCommandBuilder(tmp_da)
            tmp_da.Update(tmp_ds, "MatchRecord")
            Button9.Visible = False
            Button11.Visible = False
            Button10.Visible = True
            Me.Editor1.Content = tmp_dr("description")
            Editor1.ActiveMode = AjaxControlToolkit.HTMLEditor.ActiveModeType.Preview


        End If

        conn.Close()
    End Sub

    Protected Sub Button10_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button10.Click
        Editor1.ActiveMode = AjaxControlToolkit.HTMLEditor.ActiveModeType.Design
        Editor1.Visible = True
        Button9.Visible = True
        Button11.Visible = True
        Button10.Visible = False

    End Sub

    Private Sub verify()

        If Session("Role_Type") <> "student" Then
            addCert.Visible = False
            addMatch.Visible = False
            addRead.Visible = False
            addAward.Visible = False
            addAbroad.Visible = False
            addShip.Visible = False
            Button8.Visible = False
            FileUpload1.Visible = False
        
        End If

      
    End Sub





    Protected Sub GridViewProfessional_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewProfessional.SelectedIndexChanged
        Dim div1 As HtmlControl = CType(Me.Page.FindControl("imageStyle"), HtmlControl)
        SqlDataSource20.SelectCommand = "Select path from ProfessionalCert where pess_cod='" & Session("pess_cod") & "' and id='" & GridViewProfessional.SelectedValue & "'"
        Dim dv_path As Data.DataView = SqlDataSource20.Select(New DataSourceSelectArguments)
        If Not IsDBNull(dv_path.Item(0).Item("path")) Then
            'Dim strArr() As String
           'strArr = dv_path.Item(0).Item("path").Split("\")
             Image1.ImageUrl = "~/Student/UploadFile/" & Session("pess_cod") & "/" & dv_path.Item(0).Item("path")
            Image2.ImageUrl = "~/Student/UploadFile/" & Session("pess_cod") & "/" & dv_path.Item(0).Item("path")
            Label1.Visible = False
            div1.Style("display") = ""
        Else
            Image1.ImageUrl = ""
            Label1.Visible = False
            div1.Style("display") = "none"
        End If
        GridViewProfessional.Visible = False
        DetailsViewProfessional.Visible = True
        DetailsViewProfessional.DataBind()
        FileUpload1.Visible = True
        Image1.Visible = True
        Button8.Visible = True
        Button12.Visible = True
        addCert.Visible = False
        verify()
    End Sub


   
    Protected Sub Button11_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button11.Click
       Dim conn As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString)
        Dim tmp_da As New SqlClient.SqlDataAdapter("Select top 1 * from MatchRecord where pess_cod='" & Session("pess_cod") & "' and id=" & GridViewMatch.SelectedValue, conn)
        Dim tmp_ds As New DataSet
        Dim tmp_dr As DataRow

        conn.Open()
        tmp_da.Fill(tmp_ds, "MatchRecord")
        tmp_da.FillSchema(tmp_ds, SchemaType.Source, "MatchRecord")
        If tmp_ds.Tables("MatchRecord").Rows.Count > 0 Then
            tmp_dr = tmp_ds.Tables("MatchRecord").Rows(0)
            Me.Editor1.Content = tmp_dr("description")
            Button9.Visible = False
            Button11.Visible = False
            Button10.Visible = True
 
            Editor1.ActiveMode = AjaxControlToolkit.HTMLEditor.ActiveModeType.Preview
        End If
    End Sub


    Protected Sub Button12_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button12.Click
        GridViewProfessional.Visible = True
        DetailsViewProfessional.Visible = False
        FileUpload1.Visible = False
        Button8.Visible = False
        Image1.Visible = False
        Button12.Visible = False
        Label1.Visible = False
        addCert.Visible = True
        verify()
    End Sub

 

    Protected Sub Button13_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button13.Click
        GridViewMatch.Visible = True
        DetailsViewMatch.Visible = False
        Button13.Visible = False
        Button10.Visible = False
        Editor1.Visible = False
        addMatch.Visible = True
        verify()
        Label20.Visible = False
        Button9.Visible = False
        Button11.Visible = False
    End Sub

   

    Protected Sub Button14_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button14.Click
        GridViewAward.Visible = True
        DetailsViewAward.Visible = False
        Button14.Visible = False
        addAward.Visible = True
        verify()
    End Sub

    Protected Sub GridViewAward_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewAward.SelectedIndexChanged
        GridViewAward.Visible = False
        DetailsViewAward.Visible = True
        DetailsViewAward.DataBind()
        Button14.Visible = True
        addAward.Visible = False
        verify()
    End Sub


   Protected Sub Button15_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button15.Click
        GridViewAbroad.Visible = True
        DetailsViewAbroad.Visible = False
        Button15.Visible = False
        addAbroad.Visible = True
        verify()
    End Sub

    Protected Sub GridViewAbroad_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewAbroad.SelectedIndexChanged
        GridViewAbroad.Visible = False
        DetailsViewAbroad.Visible = True
        DetailsViewAbroad.DataBind()
        Button15.Visible = True
        addAbroad.Visible = False
        verify()
    End Sub

   
    Protected Sub Button16_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button16.Click
        GridViewIntership.Visible = True
        DetailsViewIntership.Visible = False
        Button16.Visible = False
        addShip.Visible = True
        verify()
    End Sub

    Protected Sub GridViewIntership_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewIntership.SelectedIndexChanged
        GridViewIntership.Visible = False
        DetailsViewIntership.Visible = True
        DetailsViewIntership.DataBind()
        Button16.Visible = True
        addShip.Visible = False
        verify()
    End Sub

    Protected Sub DetailsViewAbroad_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertEventArgs) Handles DetailsViewAbroad.ItemInserting
        Dim startDate As String = CType(Me.DetailsViewAbroad.FindControl("TextBox1"), TextBox).Text
        Dim endDate As String = CType(Me.DetailsViewAbroad.FindControl("TextBox2"), TextBox).Text
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

    
    Protected Sub DetailsViewAbroad_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdateEventArgs) Handles DetailsViewAbroad.ItemUpdating
        Dim startDate As String = CType(Me.DetailsViewAbroad.FindControl("TextBox1"), TextBox).Text
        Dim endDate As String = CType(Me.DetailsViewAbroad.FindControl("TextBox2"), TextBox).Text
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

    Protected Sub DetailsViewIntership_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertEventArgs) Handles DetailsViewIntership.ItemInserting
        Dim startDate As String = CType(Me.DetailsViewIntership.FindControl("TextBox1"), TextBox).Text
        Dim endDate As String = CType(Me.DetailsViewIntership.FindControl("TextBox2"), TextBox).Text
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

    Protected Sub DetailsViewIntership_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdateEventArgs) Handles DetailsViewIntership.ItemUpdating
        Dim startDate As String = CType(Me.DetailsViewIntership.FindControl("TextBox1"), TextBox).Text
        Dim endDate As String = CType(Me.DetailsViewIntership.FindControl("TextBox2"), TextBox).Text
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

    Protected Sub DetailsViewProfessional_ItemDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewDeleteEventArgs) Handles DetailsViewProfessional.ItemDeleting
        If (message.Value = "No") Then
            e.Cancel = True
            Return
        End If
        SqlDataSource20.SelectCommand = "Select path from ProfessionalCert where pess_cod='" & Session("pess_cod") & "' and id='" & GridViewProfessional.SelectedValue & "'"
        Dim dv_path As Data.DataView = SqlDataSource20.Select(New DataSourceSelectArguments)
        If Not IsDBNull(dv_path.Item(0).Item("path")) Then
            Dim Path As String = Server.MapPath("~/Student/UploadFile/")
            System.IO.File.Delete(Path & Session("pess_cod") & "/" & dv_path.Item(0).Item("path"))
        End If

    End Sub

    Protected Sub DetailsViewMatch_ItemDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewDeleteEventArgs) Handles DetailsViewMatch.ItemDeleting
        If (message.Value = "No") Then
            e.Cancel = True
            Return
        End If
    End Sub

    Protected Sub DetailsViewReading_ItemDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewDeleteEventArgs) Handles DetailsViewReading.ItemDeleting
        If (message.Value = "No") Then
            e.Cancel = True
            Return
        End If
    End Sub

    Protected Sub DetailsViewAward_ItemDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewDeleteEventArgs) Handles DetailsViewAward.ItemDeleting
        If (message.Value = "No") Then
            e.Cancel = True
            Return
        End If
    End Sub

    Protected Sub DetailsViewAbroad_ItemDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewDeleteEventArgs) Handles DetailsViewAbroad.ItemDeleting
        If (message.Value = "No") Then
            e.Cancel = True
            Return
        End If
    End Sub

    Protected Sub DetailsViewIntership_ItemDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewDeleteEventArgs) Handles DetailsViewIntership.ItemDeleting
        If (message.Value = "No") Then
            e.Cancel = True
            Return
        End If
    End Sub
    Public Sub TotalCount()
        Try
            Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
            Using mycon As New SqlConnection(con)
                mycon.Open()
                Dim strSQL As String = "select Seminar.pess_cod,SUM(Seminar_Info.bonus_point) as Total_Point from Seminar,Seminar_Info "
                strSQL += "where Seminar.Seminar_info_id=Seminar_Info.id and Seminar.pess_cod=@pess_cod group by Seminar.pess_cod"
                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL
                    cmd.Parameters.AddWithValue("@pess_cod", Session("pess_cod"))

                    Dim reader As SqlDataReader = cmd.ExecuteReader()
                    If reader.HasRows Then
                        While reader.Read()
                            Label3.Text = reader("Total_Point").ToString()
                        End While
                    Else
                        Label3.Text = "0"
                    End If
                End Using
                mycon.Close()
            End Using

        Catch ex As Exception
            ' Response.Write("<script>alert('Web Error!')</script>")
        End Try
    End Sub

    Protected Sub GridViewProfessional_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GridViewProfessional.RowDeleting
        If (message.Value = "No") Then
            e.Cancel = True
            Return
        End If
    End Sub

    Protected Sub addCert_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles addCert.Click
        MultiView2.ActiveViewIndex = 1
        certDateTxt.Text = ""
        certNameTxt.Text = ""
        courseNameTxt.Text = ""
        certTypeTxt.Text = ""
        CertOrgTxt.Text = ""
        certNameChtTxt.Text = ""
        courseNameChtTxt.Text = ""
        certTypeChtTxt.Text = ""
        CertOrgChtTxt.Text = ""
        Label10.Text = ""
        Label1.Visible = False

    End Sub

   

 

    Protected Sub CertIns_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CertIns.Click
      
        Dim Path As String = Server.MapPath("~/Student/UploadFile/")
        Dim pic As String = "~/Student/UploadFile/"
        Dim FileOk As Boolean = False
        Dim fileExtension As String
        Dim i As Integer
        If Me.FileUpload2.HasFile Then
            Dim dv_path_checkIns As Data.DataView = SqlDataSource22.Select(New DataSourceSelectArguments)
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

                    If Session("CurrentUI") = "zh-TW" Then
                        Me.Label10.Text = "上傳錯誤!! <br>" + ex.Message
                        Exit Sub
                    Else
                        Me.Label10.Text = "Upload false!! <br>" + ex.Message
                        Exit Sub
                    End If


                End Try
            Else

                If Session("CurrentUI") = "zh-TW" Then
                    Me.Label10.Text = "文件上傳失敗, 請確認格式!!"
                    Exit Sub
                Else
                    Me.Label10.Text = "file upload failed, confirm the type please !!"
                    Exit Sub
                End If
            End If
        End If

        If Me.FileUpload2.FileName = "" Then
            If certDateTxt.Text = "" Then
                Try
                    Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
                    Using mycon As New SqlConnection(con)
                        mycon.Open()
                        Dim strSQL As String = "INSERT INTO ProfessionalCert (pess_cod, certDate, certName, courseName, courseType, organizer, certNameCht, courseNameCht, courseTypeCht, organizerCht) VALUES (@pess_cod, NULL, @certName, @courseName, @courseType, @organizer, @certNameCht, @courseNameCht, @courseTypeCht, @organizerCht);"
                        strSQL += "update Learning_Records_Correspond set [count] = [count] + 1 where (pess_cod = @pess_cod and experience_id='2')"
                        Using cmd As New SqlCommand()

                            cmd.Connection = mycon
                            cmd.CommandText = strSQL
                            cmd.Parameters.AddWithValue("@pess_cod", Session("pess_cod"))
                            cmd.Parameters.AddWithValue("@certName", certNameTxt.Text)
                            cmd.Parameters.AddWithValue("@courseName", courseNameTxt.Text)
                            cmd.Parameters.AddWithValue("@courseType", certTypeTxt.Text)
                            cmd.Parameters.AddWithValue("@organizer", CertOrgTxt.Text)
                            cmd.Parameters.AddWithValue("@certNameCht", certNameChtTxt.Text)
                            cmd.Parameters.AddWithValue("@courseNameCht", courseNameChtTxt.Text)
                            cmd.Parameters.AddWithValue("@courseTypeCht", certTypeChtTxt.Text)
                            cmd.Parameters.AddWithValue("@organizerCht", CertOrgChtTxt.Text)

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
                        Dim strSQL As String = "INSERT INTO ProfessionalCert (pess_cod, certDate, certName, courseName, courseType, organizer, certNameCht, courseNameCht, courseTypeCht, organizerCht) VALUES (@pess_cod, @certDate, @certName, @courseName, @courseType, @organizer, @certNameCht, @courseNameCht, @courseTypeCht, @organizerCht);"
                        strSQL += "update Learning_Records_Correspond set [count] = [count] + 1 where (pess_cod = @pess_cod and experience_id='2')"
                        Using cmd As New SqlCommand()

                            cmd.Connection = mycon
                            cmd.CommandText = strSQL
                            cmd.Parameters.AddWithValue("@pess_cod", Session("pess_cod"))
                            cmd.Parameters.AddWithValue("@certDate", certDateTxt.Text)
                            cmd.Parameters.AddWithValue("@certName", certNameTxt.Text)
                            cmd.Parameters.AddWithValue("@courseName", courseNameTxt.Text)
                            cmd.Parameters.AddWithValue("@courseType", certTypeTxt.Text)
                            cmd.Parameters.AddWithValue("@organizer", CertOrgTxt.Text)
                            cmd.Parameters.AddWithValue("@certNameCht", certNameChtTxt.Text)
                            cmd.Parameters.AddWithValue("@courseNameCht", courseNameChtTxt.Text)
                            cmd.Parameters.AddWithValue("@courseTypeCht", certTypeChtTxt.Text)
                            cmd.Parameters.AddWithValue("@organizerCht", CertOrgChtTxt.Text)
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
            If certDateTxt.Text = "" Then
                Try
                    Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
                    Using mycon As New SqlConnection(con)
                        mycon.Open()
                        Dim strSQL As String = "INSERT INTO ProfessionalCert (pess_cod, certDate, certName, courseName, courseType, organizer, path, certNameCht, courseNameCht, courseTypeCht, organizerCht) VALUES (@pess_cod, NULL, @certName, @courseName, @courseType, @organizer, N'" + Me.FileUpload2.FileName + "', @certNameCht, @courseNameCht, @courseTypeCht, @organizerCht);"
                        strSQL += "update Learning_Records_Correspond set [count] = [count] + 1 where (pess_cod = @pess_cod and experience_id='2')"
                        Using cmd As New SqlCommand()
                            cmd.Connection = mycon
                            cmd.CommandText = strSQL
                            cmd.Parameters.AddWithValue("@pess_cod", Session("pess_cod"))
                            cmd.Parameters.AddWithValue("@certName", certNameTxt.Text)
                            cmd.Parameters.AddWithValue("@courseName", courseNameTxt.Text)
                            cmd.Parameters.AddWithValue("@courseType", certTypeTxt.Text)
                            cmd.Parameters.AddWithValue("@organizer", CertOrgTxt.Text)
                            'cmd.Parameters.AddWithValue("@path", Path & Session("pess_cod") & "\" & Me.FileUpload2.FileName)
                            cmd.Parameters.AddWithValue("@certNameCht", certNameChtTxt.Text)
                            cmd.Parameters.AddWithValue("@courseNameCht", courseNameChtTxt.Text)
                            cmd.Parameters.AddWithValue("@courseTypeCht", certTypeChtTxt.Text)
                            cmd.Parameters.AddWithValue("@organizerCht", CertOrgChtTxt.Text)
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
                        Dim strSQL As String = "INSERT INTO ProfessionalCert (pess_cod, certDate, certName, courseName, courseType, organizer, path, certNameCht, courseNameCht, courseTypeCht, organizerCht) VALUES (@pess_cod, @certDate, @certName, @courseName, @courseType, @organizer, N'" + Me.FileUpload2.FileName + "', @certNameCht, @courseNameCht, @courseTypeCht, @organizerCht);"
                        strSQL += "update Learning_Records_Correspond set [count] = [count] + 1 where (pess_cod = @pess_cod and experience_id='2')"
                        Using cmd As New SqlCommand()
                            cmd.Connection = mycon
                            cmd.CommandText = strSQL
                            cmd.Parameters.AddWithValue("@pess_cod", Session("pess_cod"))
                            cmd.Parameters.AddWithValue("@certDate", certDateTxt.Text)
                            cmd.Parameters.AddWithValue("@certName", certNameTxt.Text)
                            cmd.Parameters.AddWithValue("@courseName", courseNameTxt.Text)
                            cmd.Parameters.AddWithValue("@courseType", certTypeTxt.Text)
                            cmd.Parameters.AddWithValue("@organizer", CertOrgTxt.Text)
                            'cmd.Parameters.AddWithValue("@path", Path & Session("pess_cod") & "\" & Me.FileUpload2.FileName)
                            cmd.Parameters.AddWithValue("@certNameCht", certNameChtTxt.Text)
                            cmd.Parameters.AddWithValue("@courseNameCht", courseNameChtTxt.Text)
                            cmd.Parameters.AddWithValue("@courseTypeCht", certTypeChtTxt.Text)
                            cmd.Parameters.AddWithValue("@organizerCht", CertOrgChtTxt.Text)
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


        GridViewProfessional.DataBind()


        MultiView2.ActiveViewIndex = 0




    End Sub

    Protected Sub CertCel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CertCel.Click
        MultiView2.ActiveViewIndex = 0
    End Sub

    Protected Sub GridViewAward_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GridViewAward.RowDeleting
        If (message.Value = "No") Then
            e.Cancel = True
            Return
        End If
    End Sub

    Protected Sub addAward_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles addAward.Click
        MultiView3.ActiveViewIndex = 1
        awardDateTxt.Text = ""
        awardNameTxt.Text = ""
        describtionTxt.Text = ""
        organizationTxt.Text = ""
        awardNameChtTxt.Text = ""
        organizationChtTxt.Text = ""

    End Sub

   
    Protected Sub awardIns_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles awardIns.Click
        If awardDateTxt.Text = "" Then
            Try
                Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
                Using mycon As New SqlConnection(con)
                    mycon.Open()


                    Dim strSQL As String = "INSERT INTO AwardRecord (pess_cod, awardName, dateAward, organizer, description, awardNameCht, organizerCht) VALUES (@pess_cod, @awardName, NULL, @organizer, @description, @awardNameCht, @organizerCht);"
                    strSQL += "update Learning_Records_Correspond set [count] = [count] + 1 where (pess_cod = @pess_cod and experience_id='5')"
                    Using cmd As New SqlCommand()

                        cmd.Connection = mycon
                        cmd.CommandText = strSQL
                        cmd.Parameters.AddWithValue("@pess_cod", Session("pess_cod"))
                        cmd.Parameters.AddWithValue("@awardName", awardNameTxt.Text)
                        cmd.Parameters.AddWithValue("@organizer", organizationTxt.Text)
                        cmd.Parameters.AddWithValue("@description", describtionTxt.Text)
                        cmd.Parameters.AddWithValue("@awardNameCht", awardNameChtTxt.Text)
                        cmd.Parameters.AddWithValue("@organizerCht", organizationChtTxt.Text)


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


                    Dim strSQL As String = "INSERT INTO AwardRecord (pess_cod, awardName, dateAward, organizer, description, awardNameCht, organizerCht) VALUES (@pess_cod, @awardName, @dateAward, @organizer, @description, @awardNameCht, @organizerCht);"
                    strSQL += "update Learning_Records_Correspond set [count] = [count] + 1 where (pess_cod = @pess_cod and experience_id='5')"
                    Using cmd As New SqlCommand()

                        cmd.Connection = mycon
                        cmd.CommandText = strSQL
                        cmd.Parameters.AddWithValue("@pess_cod", Session("pess_cod"))
                        cmd.Parameters.AddWithValue("@awardName", awardNameTxt.Text)
                        cmd.Parameters.AddWithValue("@dateAward", awardDateTxt.Text)
                        cmd.Parameters.AddWithValue("@organizer", organizationTxt.Text)
                        cmd.Parameters.AddWithValue("@description", describtionTxt.Text)
                        cmd.Parameters.AddWithValue("@awardNameCht", awardNameChtTxt.Text)
                        cmd.Parameters.AddWithValue("@organizerCht", organizationChtTxt.Text)

                        cmd.ExecuteNonQuery()
                    End Using
                    mycon.Close()
                End Using
            Catch ex As Exception

                Response.Write("<script>alert('Insert Error!')</script>")

                Return
            End Try

        End If
      
        GridViewAward.DataBind()

        MultiView3.ActiveViewIndex = 0
    End Sub

    Protected Sub awardCel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles awardCel.Click
        MultiView3.ActiveViewIndex = 0
    End Sub

    Protected Sub GridViewMatch_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GridViewMatch.RowDeleting
        If (message.Value = "No") Then
            e.Cancel = True
            Return
        End If
    End Sub

    Protected Sub addMatch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles addMatch.Click
        MultiView4.ActiveViewIndex = 1
        matchDate.Text = ""
        matchName.Text = ""
        matchCategory.Text = ""
        matchEndDate.Text = ""
        matchNameCht.Text = ""
        matchCategoryCht.Text = ""
        Editor2.Content = ""

    End Sub

  
    Protected Sub matchIns_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles matchIns.Click

        Dim startDate As String = matchDate.Text
        Dim endDate As String = matchEndDate.Text
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
        If matchDate.Text = "" And matchEndDate.Text = "" Then
          Try
                Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
                Using mycon As New SqlConnection(con)
                    mycon.Open()
                    Dim strSQL As String = "INSERT INTO MatchRecord (pess_cod, matchName, dateMatch, dateEnd, category, description, matchNameCht, categoryCht) VALUES (@pess_cod, @matchName, NULL, NULL, @category, @description, @matchNameCht, @categoryCht);"
                    strSQL += "update Learning_Records_Correspond set [count] = [count] + 1 where (pess_cod = @pess_cod and experience_id='3')"
                    Using cmd As New SqlCommand()

                        cmd.Connection = mycon
                        cmd.CommandText = strSQL
                        cmd.Parameters.AddWithValue("@pess_cod", Session("pess_cod"))
                        cmd.Parameters.AddWithValue("@matchName", matchName.Text)
                        cmd.Parameters.AddWithValue("@category", matchCategory.Text)
                        cmd.Parameters.AddWithValue("@description", Me.Editor2.Content)
                        cmd.Parameters.AddWithValue("@matchNameCht", matchNameCht.Text)
                        cmd.Parameters.AddWithValue("@categoryCht", matchCategoryCht.Text)

                        cmd.ExecuteNonQuery()
                    End Using
                    mycon.Close()
                End Using
            Catch ex As Exception

                Response.Write("<script>alert('Insert Error!')</script>")

                Return
            End Try
        ElseIf matchDate.Text = "" Then
            Try
                Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
                Using mycon As New SqlConnection(con)
                    mycon.Open()
                    Dim strSQL As String = "INSERT INTO MatchRecord (pess_cod, matchName, dateMatch, dateEnd, category, description, matchNameCht, categoryCht) VALUES (@pess_cod, @matchName, NULL, @dateEnd, @category, @description, @matchNameCht, @categoryCht);"
                    strSQL += "update Learning_Records_Correspond set [count] = [count] + 1 where (pess_cod = @pess_cod and experience_id='3')"
                    Using cmd As New SqlCommand()

                        cmd.Connection = mycon
                        cmd.CommandText = strSQL
                        cmd.Parameters.AddWithValue("@pess_cod", Session("pess_cod"))
                        cmd.Parameters.AddWithValue("@matchName", matchName.Text)
                        cmd.Parameters.AddWithValue("@dateEnd", matchEndDate.Text)
                        cmd.Parameters.AddWithValue("@category", matchCategory.Text)
                        cmd.Parameters.AddWithValue("@description", Me.Editor2.Content)
                        cmd.Parameters.AddWithValue("@matchNameCht", matchNameCht.Text)
                        cmd.Parameters.AddWithValue("@categoryCht", matchCategoryCht.Text)

                        cmd.ExecuteNonQuery()
                    End Using
                    mycon.Close()
                End Using
            Catch ex As Exception

                Response.Write("<script>alert('Insert Error!')</script>")

                Return
            End Try
        ElseIf matchEndDate.Text = "" Then
             Try
                Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
                Using mycon As New SqlConnection(con)
                    mycon.Open()
                    Dim strSQL As String = "INSERT INTO MatchRecord (pess_cod, matchName, dateMatch, dateEnd, category, description, matchNameCht, categoryCht) VALUES (@pess_cod, @matchName, @dateMatch, NULL, @category, @description, @matchNameCht, @categoryCht);"
                    strSQL += "update Learning_Records_Correspond set [count] = [count] + 1 where (pess_cod = @pess_cod and experience_id='3')"
                    Using cmd As New SqlCommand()

                        cmd.Connection = mycon
                        cmd.CommandText = strSQL
                        cmd.Parameters.AddWithValue("@pess_cod", Session("pess_cod"))
                        cmd.Parameters.AddWithValue("@matchName", matchName.Text)
                        cmd.Parameters.AddWithValue("@dateMatch", matchDate.Text)
                        cmd.Parameters.AddWithValue("@category", matchCategory.Text)
                        cmd.Parameters.AddWithValue("@description", Me.Editor2.Content)
                        cmd.Parameters.AddWithValue("@matchNameCht", matchNameCht.Text)
                        cmd.Parameters.AddWithValue("@categoryCht", matchCategoryCht.Text)

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
                    Dim strSQL As String = "INSERT INTO MatchRecord (pess_cod, matchName, dateMatch, dateEnd, category, description, matchNameCht, categoryCht) VALUES (@pess_cod, @matchName, @dateMatch, @dateEnd, @category, @description, @matchNameCht, @categoryCht);"
                    strSQL += "update Learning_Records_Correspond set [count] = [count] + 1 where (pess_cod = @pess_cod and experience_id='3')"
                    Using cmd As New SqlCommand()

                        cmd.Connection = mycon
                        cmd.CommandText = strSQL
                        cmd.Parameters.AddWithValue("@pess_cod", Session("pess_cod"))
                        cmd.Parameters.AddWithValue("@matchName", matchName.Text)
                        cmd.Parameters.AddWithValue("@dateMatch", matchDate.Text)
                        cmd.Parameters.AddWithValue("@dateEnd", matchEndDate.Text)
                        cmd.Parameters.AddWithValue("@category", matchCategory.Text)
                        cmd.Parameters.AddWithValue("@description", Me.Editor2.Content)
                        cmd.Parameters.AddWithValue("@matchNameCht", matchNameCht.Text)
                        cmd.Parameters.AddWithValue("@categoryCht", matchCategoryCht.Text)

                        cmd.ExecuteNonQuery()
                    End Using
                    mycon.Close()
                End Using
            Catch ex As Exception

                Response.Write("<script>alert('Insert Error!')</script>")

                Return
            End Try
        End If



        GridViewMatch.DataBind()

        MultiView4.ActiveViewIndex = 0
    End Sub

   
    Protected Sub matchCel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles matchCel.Click
        MultiView4.ActiveViewIndex = 0
    End Sub

    Protected Sub GridViewIntership_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GridViewIntership.RowDeleting
        If (message.Value = "No") Then
            e.Cancel = True
            Return
        End If
    End Sub

  
    Protected Sub addShip_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles addShip.Click
        MultiView5.ActiveViewIndex = 1
        shipStart.Text = ""
        shipEnd.Text = ""
        shipCompany.Text = ""
        shipJob.Text = ""
        shipDuration.Text = ""
        shipCompanyCht.Text = ""
        shipJobCht.Text = ""
        shipDurationCht.Text = ""
    End Sub

    Protected Sub shipIns_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles shipIns.Click
        Dim startDate As String = shipStart.Text
        Dim endDate As String = shipEnd.Text
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
        If shipStart.Text = "" And shipEnd.Text = "" Then
            Try
                Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
                Using mycon As New SqlConnection(con)
                    mycon.Open()

                    Dim strSQL As String = "INSERT INTO Intership (pess_cod, company, jobTitle, startDate, endDate, duration, companyCht, jobTitleCht, durationCht) VALUES (@pess_cod, @company, @jobTitle, NULL, NULL, @duration, @companyCht, @jobTitleCht, @durationCht);"
                    strSQL += "update Learning_Records_Correspond set [count] = [count] + 1 where (pess_cod = @pess_cod and experience_id='7')"
                    Using cmd As New SqlCommand()

                        cmd.Connection = mycon
                        cmd.CommandText = strSQL
                        cmd.Parameters.AddWithValue("@pess_cod", Session("pess_cod"))
                        cmd.Parameters.AddWithValue("@company", shipCompany.Text)
                        cmd.Parameters.AddWithValue("@jobTitle", shipJob.Text)
                        cmd.Parameters.AddWithValue("@duration", shipDuration.Text)
                        cmd.Parameters.AddWithValue("@companyCht", shipCompanyCht.Text)
                        cmd.Parameters.AddWithValue("@jobTitleCht", shipJobCht.Text)
                        cmd.Parameters.AddWithValue("@durationCht", shipDurationCht.Text)

                        cmd.ExecuteNonQuery()
                    End Using
                    mycon.Close()
                End Using
            Catch ex As Exception

                Response.Write("<script>alert('Insert Error!')</script>")

                Return
            End Try
        ElseIf shipStart.Text = "" Then
            Try
                Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
                Using mycon As New SqlConnection(con)
                    mycon.Open()

                    Dim strSQL As String = "INSERT INTO Intership (pess_cod, company, jobTitle, startDate, endDate, duration, companyCht, jobTitleCht, durationCht) VALUES (@pess_cod, @company, @jobTitle, NULL, @endDate, @duration, @companyCht, @jobTitleCht, @durationCht);"
                    strSQL += "update Learning_Records_Correspond set [count] = [count] + 1 where (pess_cod = @pess_cod and experience_id='7')"
                    Using cmd As New SqlCommand()

                        cmd.Connection = mycon
                        cmd.CommandText = strSQL
                        cmd.Parameters.AddWithValue("@pess_cod", Session("pess_cod"))
                        cmd.Parameters.AddWithValue("@company", shipCompany.Text)
                        cmd.Parameters.AddWithValue("@jobTitle", shipJob.Text)
                        cmd.Parameters.AddWithValue("@endDate", shipEnd.Text)
                        cmd.Parameters.AddWithValue("@duration", shipDuration.Text)
                        cmd.Parameters.AddWithValue("@companyCht", shipCompanyCht.Text)
                        cmd.Parameters.AddWithValue("@jobTitleCht", shipJobCht.Text)
                        cmd.Parameters.AddWithValue("@durationCht", shipDurationCht.Text)

                        cmd.ExecuteNonQuery()
                    End Using
                    mycon.Close()
                End Using
            Catch ex As Exception

                Response.Write("<script>alert('Insert Error!')</script>")

                Return
            End Try
        ElseIf shipEnd.Text = "" Then
            Try
                Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
                Using mycon As New SqlConnection(con)
                    mycon.Open()

                    Dim strSQL As String = "INSERT INTO Intership (pess_cod, company, jobTitle, startDate, endDate, duration, companyCht, jobTitleCht, durationCht) VALUES (@pess_cod, @company, @jobTitle, @startDate, NULL, @duration, @companyCht, @jobTitleCht, @durationCht);"
                    strSQL += "update Learning_Records_Correspond set [count] = [count] + 1 where (pess_cod = @pess_cod and experience_id='7')"
                    Using cmd As New SqlCommand()

                        cmd.Connection = mycon
                        cmd.CommandText = strSQL
                        cmd.Parameters.AddWithValue("@pess_cod", Session("pess_cod"))
                        cmd.Parameters.AddWithValue("@company", shipCompany.Text)
                        cmd.Parameters.AddWithValue("@jobTitle", shipJob.Text)
                        cmd.Parameters.AddWithValue("@startDate", shipStart.Text)
                        cmd.Parameters.AddWithValue("@duration", shipDuration.Text)
                        cmd.Parameters.AddWithValue("@companyCht", shipCompanyCht.Text)
                        cmd.Parameters.AddWithValue("@jobTitleCht", shipJobCht.Text)
                        cmd.Parameters.AddWithValue("@durationCht", shipDurationCht.Text)

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

                    Dim strSQL As String = "INSERT INTO Intership (pess_cod, company, jobTitle, startDate, endDate, duration, companyCht, jobTitleCht, durationCht) VALUES (@pess_cod, @company, @jobTitle, @startDate, @endDate, @duration, @companyCht, @jobTitleCht, @durationCht);"
                    strSQL += "update Learning_Records_Correspond set [count] = [count] + 1 where (pess_cod = @pess_cod and experience_id='7')"
                    Using cmd As New SqlCommand()

                        cmd.Connection = mycon
                        cmd.CommandText = strSQL
                        cmd.Parameters.AddWithValue("@pess_cod", Session("pess_cod"))
                        cmd.Parameters.AddWithValue("@company", shipCompany.Text)
                        cmd.Parameters.AddWithValue("@jobTitle", shipJob.Text)
                        cmd.Parameters.AddWithValue("@startDate", shipStart.Text)
                        cmd.Parameters.AddWithValue("@endDate", shipEnd.Text)
                        cmd.Parameters.AddWithValue("@duration", shipDuration.Text)
                        cmd.Parameters.AddWithValue("@companyCht", shipCompanyCht.Text)
                        cmd.Parameters.AddWithValue("@jobTitleCht", shipJobCht.Text)
                        cmd.Parameters.AddWithValue("@durationCht", shipDurationCht.Text)

                        cmd.ExecuteNonQuery()
                    End Using
                    mycon.Close()
                End Using
            Catch ex As Exception

                Response.Write("<script>alert('Insert Error!')</script>")

                Return
            End Try

        End If
    
        GridViewIntership.DataBind()

        MultiView5.ActiveViewIndex = 0
    End Sub

    Protected Sub shipCel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles shipCel.Click
        MultiView5.ActiveViewIndex = 0
    End Sub

    Protected Sub GridViewAbroad_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GridViewAbroad.RowDeleting
        If (message.Value = "No") Then
            e.Cancel = True
            Return
        End If
    End Sub

  
    Protected Sub addAbroad_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles addAbroad.Click
        MultiView6.ActiveViewIndex = 1
        abroadStart.Text = ""
        abroadEnd.Text = ""
        abroadCountry.Text = ""
        abroadSchool.Text = ""
        abroadTopic.Text = ""
        abroadCountryCht.Text = ""
        abroadSchoolCht.Text = ""
        abroadTopicCht.Text = ""
    End Sub

   
    Protected Sub abroadIns_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles abroadIns.Click
        Dim startDate As String = abroadStart.Text
        Dim endDate As String = abroadEnd.Text
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
        If abroadStart.Text = "" And abroadEnd.Text = "" Then
            Try
                Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
                Using mycon As New SqlConnection(con)
                    mycon.Open()


                    Dim strSQL As String = "INSERT INTO StudyTA (pess_cod, country, school, majorSubj, startDate, endDate, countryCht, schoolCht, majorSubjCht) VALUES (@pess_cod, @country, @school, @majorSubj, NULL, NULL, @countryCht, @schoolCht, @majorSubjCht);"
                    strSQL += "update Learning_Records_Correspond set [count] = [count] + 1  where (pess_cod = @pess_cod and experience_id='6')"
                    Using cmd As New SqlCommand()

                        cmd.Connection = mycon
                        cmd.CommandText = strSQL
                        cmd.Parameters.AddWithValue("@pess_cod", Session("pess_cod"))
                        cmd.Parameters.AddWithValue("@country", abroadCountry.Text)
                        cmd.Parameters.AddWithValue("@school", abroadSchool.Text)
                        cmd.Parameters.AddWithValue("@majorSubj", abroadTopic.Text)
                        cmd.Parameters.AddWithValue("@countryCht", abroadCountryCht.Text)
                        cmd.Parameters.AddWithValue("@schoolCht", abroadSchoolCht.Text)
                        cmd.Parameters.AddWithValue("@majorSubjCht", abroadTopicCht.Text)

                        cmd.ExecuteNonQuery()
                    End Using
                    mycon.Close()
                End Using
            Catch ex As Exception

                Response.Write("<script>alert('Insert Error!')</script>")

                Return
            End Try
        ElseIf abroadStart.Text = "" Then
            Try
                Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
                Using mycon As New SqlConnection(con)
                    mycon.Open()


                    Dim strSQL As String = "INSERT INTO StudyTA (pess_cod, country, school, majorSubj, startDate, endDate, countryCht, schoolCht, majorSubjCht) VALUES (@pess_cod, @country, @school, @majorSubj, NULL, @endDate, @countryCht, @schoolCht, @majorSubjCht);"
                    strSQL += "update Learning_Records_Correspond set [count] = [count] + 1  where (pess_cod = @pess_cod and experience_id='6')"
                    Using cmd As New SqlCommand()

                        cmd.Connection = mycon
                        cmd.CommandText = strSQL
                        cmd.Parameters.AddWithValue("@pess_cod", Session("pess_cod"))
                        cmd.Parameters.AddWithValue("@country", abroadCountry.Text)
                        cmd.Parameters.AddWithValue("@school", abroadSchool.Text)
                        cmd.Parameters.AddWithValue("@majorSubj", abroadTopic.Text)
                        cmd.Parameters.AddWithValue("@endDate", abroadEnd.Text)
                        cmd.Parameters.AddWithValue("@countryCht", abroadCountryCht.Text)
                        cmd.Parameters.AddWithValue("@schoolCht", abroadSchoolCht.Text)
                        cmd.Parameters.AddWithValue("@majorSubjCht", abroadTopicCht.Text)
                        cmd.ExecuteNonQuery()
                    End Using
                    mycon.Close()
                End Using
            Catch ex As Exception

                Response.Write("<script>alert('Insert Error!')</script>")

                Return
            End Try
        ElseIf abroadEnd.Text = "" Then
            Try
                Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
                Using mycon As New SqlConnection(con)
                    mycon.Open()


                    Dim strSQL As String = "INSERT INTO StudyTA (pess_cod, country, school, majorSubj, startDate, endDate, countryCht, schoolCht, majorSubjCht) VALUES (@pess_cod, @country, @school, @majorSubj, @startDate, NULL, @countryCht, @schoolCht, @majorSubjCht);"
                    strSQL += "update Learning_Records_Correspond set [count] = [count] + 1  where (pess_cod = @pess_cod and experience_id='6')"
                    Using cmd As New SqlCommand()

                        cmd.Connection = mycon
                        cmd.CommandText = strSQL
                        cmd.Parameters.AddWithValue("@pess_cod", Session("pess_cod"))
                        cmd.Parameters.AddWithValue("@country", abroadCountry.Text)
                        cmd.Parameters.AddWithValue("@school", abroadSchool.Text)
                        cmd.Parameters.AddWithValue("@majorSubj", abroadTopic.Text)
                        cmd.Parameters.AddWithValue("@startDate", abroadStart.Text)
                        cmd.Parameters.AddWithValue("@countryCht", abroadCountryCht.Text)
                        cmd.Parameters.AddWithValue("@schoolCht", abroadSchoolCht.Text)
                        cmd.Parameters.AddWithValue("@majorSubjCht", abroadTopicCht.Text)

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


                    Dim strSQL As String = "INSERT INTO StudyTA (pess_cod, country, school, majorSubj, startDate, endDate, countryCht, schoolCht, majorSubjCht) VALUES (@pess_cod, @country, @school, @majorSubj, @startDate, @endDate, @countryCht, @schoolCht, @majorSubjCht);"
                    strSQL += "update Learning_Records_Correspond set [count] = [count] + 1  where (pess_cod = @pess_cod and experience_id='6')"
                    Using cmd As New SqlCommand()

                        cmd.Connection = mycon
                        cmd.CommandText = strSQL
                        cmd.Parameters.AddWithValue("@pess_cod", Session("pess_cod"))
                        cmd.Parameters.AddWithValue("@country", abroadCountry.Text)
                        cmd.Parameters.AddWithValue("@school", abroadSchool.Text)
                        cmd.Parameters.AddWithValue("@majorSubj", abroadTopic.Text)
                        cmd.Parameters.AddWithValue("@startDate", abroadStart.Text)
                        cmd.Parameters.AddWithValue("@endDate", abroadEnd.Text)
                        cmd.Parameters.AddWithValue("@countryCht", abroadCountryCht.Text)
                        cmd.Parameters.AddWithValue("@schoolCht", abroadSchoolCht.Text)
                        cmd.Parameters.AddWithValue("@majorSubjCht", abroadTopicCht.Text)
                        cmd.ExecuteNonQuery()
                    End Using
                    mycon.Close()
                End Using
            Catch ex As Exception

                Response.Write("<script>alert('Insert Error!')</script>")

                Return
            End Try
        End If

      

        GridViewAbroad.DataBind()

        MultiView6.ActiveViewIndex = 0
    End Sub

    Protected Sub abroadCel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles abroadCel.Click
        MultiView6.ActiveViewIndex = 0
    End Sub

  
    Protected Sub GridViewReading_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GridViewReading.RowDeleting
        If (message.Value = "No") Then
            e.Cancel = True
            Return
        End If
    End Sub

    Protected Sub addRead_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles addRead.Click
        MultiView7.ActiveViewIndex = 1
        readName.Text = ""
        readAuthor.Text = ""
        readVer.Text = ""
        readPub.Text = ""
        readISBN.Text = ""
        readCategory.Text = ""
        readName.Focus()
    End Sub

    Protected Sub GridViewReading_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewReading.SelectedIndexChanged

        GridViewReading.Visible = False
        DetailsViewReading.Visible = True
        DetailsViewReading.DataBind()
        Button18.Visible = True
        addRead.Visible = False
        verify()
    End Sub

    Protected Sub readIns_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles readIns.Click
      
    Try
            Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
            Using mycon As New SqlConnection(con)
                mycon.Open()
                If readVer.Text = "" Then
                    Dim strSQL As String = "INSERT INTO ReadingRecord(pess_cod, bookName, author, version, publisher, isbn, category) VALUES (@pess_cod, @bookName, @author, NULL, @publisher, @isbn, @category);"
                    strSQL += "update Learning_Records_Correspond set [count] = [count] + 1 where (pess_cod = @pess_cod and experience_id='4')"
                    Using cmd As New SqlCommand()

                        cmd.Connection = mycon
                        cmd.CommandText = strSQL
                        cmd.Parameters.AddWithValue("@pess_cod", Session("pess_cod"))
                        cmd.Parameters.AddWithValue("@bookName", readName.Text)
                        cmd.Parameters.AddWithValue("@author", readAuthor.Text)


                        cmd.Parameters.AddWithValue("@publisher", readPub.Text)
                        cmd.Parameters.AddWithValue("@isbn", readISBN.Text)
                        cmd.Parameters.AddWithValue("@category", readCategory.Text)
                        cmd.ExecuteNonQuery()
                    End Using
                Else
                    Dim strSQL As String = "INSERT INTO ReadingRecord(pess_cod, bookName, author, version, publisher, isbn, category) VALUES (@pess_cod, @bookName, @author, @version, @publisher, @isbn, @category);"
                    strSQL += "update Learning_Records_Correspond set [count] = [count] + 1 where (pess_cod = @pess_cod and experience_id='4')"
                    Using cmd As New SqlCommand()

                        cmd.Connection = mycon
                        cmd.CommandText = strSQL
                        cmd.Parameters.AddWithValue("@pess_cod", Session("pess_cod"))
                        cmd.Parameters.AddWithValue("@bookName", readName.Text)
                        cmd.Parameters.AddWithValue("@author", readAuthor.Text)

                        cmd.Parameters.AddWithValue("@version", readVer.Text)
                        cmd.Parameters.AddWithValue("@publisher", readPub.Text)
                        cmd.Parameters.AddWithValue("@isbn", readISBN.Text)
                        cmd.Parameters.AddWithValue("@category", readCategory.Text)
                        cmd.ExecuteNonQuery()
                    End Using
                End If

             
                mycon.Close()
            End Using
        Catch ex As Exception

            Response.Write("<script>alert('Insert Error!')</script>")
            Return
        End Try
        GridViewReading.DataBind()

        MultiView7.ActiveViewIndex = 0
    End Sub

    Protected Sub readCel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles readCel.Click
        MultiView7.ActiveViewIndex = 0
    End Sub

    Protected Sub Button18_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button18.Click
        GridViewReading.Visible = True
        DetailsViewReading.Visible = False
        Button18.Visible = False
        addRead.Visible = True
        verify()
    End Sub

    'Protected Sub ImageButton2_Click1(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton2.Click
    '    If Session("Role_Type") = "student" Then
    '        Response.Redirect("home.aspx")
    '    End If

    '    If Session("Role_Type") = "teacher" Or Session("Role_Type") = "tutor" Or Session("Role_Type") = "coordinator" Or Session("Role_Type") = "director" Then
    '        Response.Redirect("schoolStaff.aspx")
    '    End If

    '    Response.Write("<script>alert('Please Log In !'); window.location.href='http://172.26.122.66/siweb/logout.asp'; </script>")

    'End Sub

  
  
    Protected Sub GridViewAbroad_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles GridViewAbroad.RowUpdating
        Dim startDate As String = CType(Me.GridViewAbroad.Rows(e.RowIndex).FindControl("TextBox2"), TextBox).Text
        Dim endDate As String = CType(Me.GridViewAbroad.Rows(e.RowIndex).FindControl("TextBox3"), TextBox).Text
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

    Protected Sub GridViewIntership_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles GridViewIntership.RowUpdating
        Dim startDate As String = CType(Me.GridViewIntership.Rows(e.RowIndex).FindControl("TextBox2"), TextBox).Text
        Dim endDate As String = CType(Me.GridViewIntership.Rows(e.RowIndex).FindControl("TextBox3"), TextBox).Text
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

    Protected Sub DetailsViewMatch_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdateEventArgs) Handles DetailsViewMatch.ItemUpdating
        Dim startDate As String = CType(Me.DetailsViewMatch.FindControl("TextBox1"), TextBox).Text
        Dim endDate As String = CType(Me.DetailsViewMatch.FindControl("TextBox2"), TextBox).Text
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

    Protected Sub DetailsViewMatch_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertEventArgs) Handles DetailsViewMatch.ItemInserting
        Dim startDate As String = CType(Me.DetailsViewMatch.FindControl("TextBox1"), TextBox).Text
        Dim endDate As String = CType(Me.DetailsViewMatch.FindControl("TextBox2"), TextBox).Text
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
 
   

    Protected Sub GridViewSeminar_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewSeminar.SelectedIndexChanged
        GridViewSeminar.Visible = False
        DetailsViewSeminar.Visible = True
        DetailsViewSeminar.DataBind()
        semBack.Visible = True
        Label3.Visible = False
        Label5.Visible = False
        AddSemBtn.Visible = False

        'bindDetailViewStudentSeminar()
    End Sub

   

    Protected Sub DetailsViewSeminar_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DetailsViewSeminar.DataBound
        If GridViewSeminar.DataKeys(GridViewSeminar.SelectedIndex).Values(1).Trim() = "Internal" Then
            DetailsViewSeminar.Rows(9).Cells(0).CssClass = "hidden"
        End If
    End Sub

    Protected Sub DetailsViewSeminar_ItemDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewDeletedEventArgs) Handles DetailsViewSeminar.ItemDeleted
        GridViewSeminar.DataBind()
        GridViewSeminar.Visible = True
        DetailsViewSeminar.Visible = False
        semBack.Visible = False
        AddSemBtn.Visible = True
    End Sub

    Protected Sub DetailsViewSeminar_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles DetailsViewSeminar.ItemInserted
        GridViewSeminar.DataBind()
        GridViewSeminar.Visible = True
        DetailsViewSeminar.Visible = False
        semBack.Visible = False
        AddSemBtn.Visible = True
    End Sub

    Protected Sub DetailsViewSeminar_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles DetailsViewSeminar.ItemUpdated
        GridViewSeminar.DataBind()
        GridViewSeminar.Visible = True
        DetailsViewSeminar.Visible = False
        semBack.Visible = False
        AddSemBtn.Visible = True
    End Sub

    
    Protected Sub semBack_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles semBack.Click
        GridViewSeminar.Visible = True
        AddSemBtn.Visible = True
        DetailsViewSeminar.Visible = False
        semBack.Visible = False
        Label3.Visible = True
        Label5.Visible = True
        verify()
    End Sub

    Protected Sub AddSemBtn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AddSemBtn.Click
        MultiView8.ActiveViewIndex = 1
        semDateTxt.Text = ""
        semTopicTxt.Text = ""
        semTopicChtTxt.Text = ""
        semTypeTxt.Text = ""
        semTypeChtTxt.Text = ""
        semDurationTxt.Text = ""
        semOrgTxt.Text = ""
        semOrgChtTxt.Text = ""
      End Sub

    Protected Sub SemCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SemCancel.Click
        MultiView8.ActiveViewIndex = 0
    End Sub

    Protected Sub SemIns_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SemIns.Click
        If semDateTxt.Text = "" Then
            Try
                Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
                Using mycon As New SqlConnection(con)
                    mycon.Open()
                    Dim strSQL As String = "INSERT INTO [Seminar_Info] ([topicName], [category], [startDate], [duration], [organizer], [status], [pess_cod], [topicNameCht], [categoryCht], [organizerCht]) VALUES (@topicName, @category, NULL, @duration, @organizer, @status, @pess_cod, @topicNameCht, @categoryCht, @organizerCht);"
                    strSQL += "update Learning_Records_Correspond set [count] = [count] + 1 where (pess_cod = @pess_cod and experience_id='1')"
                    Using cmd As New SqlCommand()

                        cmd.Connection = mycon
                        cmd.CommandText = strSQL
                        cmd.Parameters.AddWithValue("@topicName", semTopicTxt.Text)
                        cmd.Parameters.AddWithValue("@category", semTypeTxt.Text)
                        cmd.Parameters.AddWithValue("@duration", semDurationTxt.Text)
                        cmd.Parameters.AddWithValue("@organizer", semOrgTxt.Text)
                        cmd.Parameters.AddWithValue("@status", "Enternal")
                        cmd.Parameters.AddWithValue("@pess_cod", Session("pess_cod"))
                        cmd.Parameters.AddWithValue("@topicNameCht", semTopicChtTxt.Text)
                        cmd.Parameters.AddWithValue("@categoryCht", semTypeChtTxt.Text)
                        cmd.Parameters.AddWithValue("@organizerCht", semOrgChtTxt.Text)
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
                    Dim strSQL As String = "INSERT INTO [Seminar_Info] ([topicName], [category], [startDate], [duration], [organizer], [status], [pess_cod], [topicNameCht], [categoryCht], [organizerCht]) VALUES (@topicName, @category, @startDate, @duration, @organizer, @status, @pess_cod, @topicNameCht, @categoryCht, @organizerCht);"
                    strSQL += "update Learning_Records_Correspond set [count] = [count] + 1 where (pess_cod = @pess_cod and experience_id='1')"
                    Using cmd As New SqlCommand()

                        cmd.Connection = mycon
                        cmd.CommandText = strSQL

                        cmd.Parameters.AddWithValue("@topicName", semTopicTxt.Text)
                        cmd.Parameters.AddWithValue("@category", semTypeTxt.Text)
                        cmd.Parameters.AddWithValue("@startDate", semDateTxt.Text)
                        cmd.Parameters.AddWithValue("@duration", semDurationTxt.Text)
                        cmd.Parameters.AddWithValue("@organizer", semOrgTxt.Text)
                        cmd.Parameters.AddWithValue("@status", "Enternal")
                        cmd.Parameters.AddWithValue("@pess_cod", Session("pess_cod"))
                        cmd.Parameters.AddWithValue("@topicNameCht", semTopicChtTxt.Text)
                        cmd.Parameters.AddWithValue("@categoryCht", semTypeChtTxt.Text)
                        cmd.Parameters.AddWithValue("@organizerCht", semOrgChtTxt.Text)
                        cmd.ExecuteNonQuery()
                    End Using
                    mycon.Close()
                End Using
            Catch ex As Exception

                Response.Write("<script>alert('Insert Error!')</script>")

                Return
            End Try
        End If



        GridViewSeminar.DataBind()

        MultiView8.ActiveViewIndex = 0
    End Sub
End Class
