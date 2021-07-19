Imports System.Data
Imports System.Data.SqlClient
Imports System.Threading
Imports System.Globalization
Imports System.Net

Partial Class Student_studentProfile
    Inherits System.Web.UI.Page

    Private Sub studentProfile_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init

        If DesignMode = True Then
            Return
        End If

        '  If Not IsPostBack Then
        Dim dv_verify As Data.DataView = SqlDataSource9.Select(New DataSourceSelectArguments)
        Dim dv_verifyStaff As Data.DataView = SqlDataSource14.Select(New DataSourceSelectArguments)
        If Session("Role_Type") Is Nothing Then

            Response.Write("<script>alert('Please Log In !'); window.location.href='http://172.26.122.66/siweb/logout.asp'; </script>")
            Response.End()

        End If


        If Session("Role_Type") = "student" Then
            If dv_verify.Item(0).Item("sp") = "False" Then

                Response.Write("<script>alert('You do not have Permission to view it !');window.history.back(-1); </script>")

            End If
        End If

        If Session("position") = "studentview" Then
            If dv_verifyStaff.Item(0).Item("sp") = "False" Then

                Response.Write("<script>alert('You do not have Permission to view it !');window.history.back(-1); </script>")

            End If
        End If
        '  End If
        If Not IsPostBack Then
            verify()
        End If


        Dim conn As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString)
        Dim tmp_da As New SqlClient.SqlDataAdapter("Select top 1 * from StudentProfile where pess_cod='" & Session("pess_cod") & "'", conn)
        Dim tmp_da1 As New SqlClient.SqlDataAdapter("Select top 1 * from PersonalDetail where pess_cod='" & Session("pess_cod") & "'", conn)

        Dim tmp_ds As New DataSet
        Dim tmp_dr As DataRow

        conn.Open()
        tmp_da.Fill(tmp_ds, "StudentProfile")
        tmp_da.FillSchema(tmp_ds, SchemaType.Source, "StudentProfile")
        If tmp_ds.Tables("StudentProfile").Rows.Count = 0 Then
            tmp_dr = tmp_ds.Tables("StudentProfile").NewRow
            tmp_dr("pess_cod") = Session("pess_cod")
            tmp_dr("perBio") = ""
            tmp_ds.Tables("StudentProfile").Rows.Add(tmp_dr)
            Dim myobj As New SqlClient.SqlCommandBuilder(tmp_da)
            tmp_da.Update(tmp_ds, "StudentProfile")
        Else
            tmp_dr = tmp_ds.Tables("StudentProfile").Rows(0)
            Me.Editor1.Content = tmp_dr("perBio")
        End If

        Dim tmp_ds1 As New DataSet
        Dim tmp_dr1 As DataRow
        tmp_da1.Fill(tmp_ds1, "PersonalDetail")
        tmp_da1.FillSchema(tmp_ds1, SchemaType.Source, "PersonalDetail")
        If tmp_ds1.Tables("PersonalDetail").Rows.Count = 0 Then
            tmp_dr1 = tmp_ds1.Tables("PersonalDetail").NewRow
            tmp_dr1("pess_cod") = Session("pess_cod")

            tmp_dr1("TechnicalSkill") = ""
            tmp_dr1("SocialSkill") = ""
            tmp_dr1("Language") = ""
            tmp_dr1("Interest") = ""
            tmp_dr1("TechnicalSkillCht") = ""
            tmp_dr1("SocialSkillCht") = ""
            tmp_dr1("LanguageCht") = ""
            tmp_dr1("InterestCht") = ""
            tmp_ds1.Tables("PersonalDetail").Rows.Add(tmp_dr1)
            Dim myobj As New SqlClient.SqlCommandBuilder(tmp_da1)
            tmp_da1.Update(tmp_ds1, "PersonalDetail")
        Else
            tmp_dr1 = tmp_ds1.Tables("PersonalDetail").Rows(0)
            Me.Editor2.Content = tmp_dr1("TechnicalSkill")
            Me.Editor3.Content = tmp_dr1("SocialSkill")
            Me.Editor4.Content = tmp_dr1("Language")
            Me.Editor5.Content = tmp_dr1("Interest")
            Me.Editor2Cht.Content = tmp_dr1("TechnicalSkillCht")
            Me.Editor3Cht.Content = tmp_dr1("SocialSkillCht")
            Me.Editor4Cht.Content = tmp_dr1("LanguageCht")
            Me.Editor5Cht.Content = tmp_dr1("InterestCht")
        End If




        conn.Close()

        MultiView1.ActiveViewIndex = 0
        MultiView2.ActiveViewIndex = 11
        'Button1.CssClass = "blueli"
        'Button2.CssClass = "blue"
        'Button3.CssClass = "blue"

        Button15.Visible = False
        Button10.Visible = False
        Button11.Visible = False
        Button28.Visible = False
        Button34.Visible = False
        Button12.Visible = False
        Button13.Visible = False
        Button4.Visible = False
        ColorButton1.Visible = False
        ColorButton2.Visible = False
        ColorButton3.Visible = False
        Label1.Visible = False
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        
          If IsDBNull(Session("ChineseName")) = False Then
            Label1.Text = Session("ChineseName")
            '    ImageButtonapic9.ImageUrl = "~/Student/animatedmenu3/homec.png"
            'Else
            '    ImageButtonapic9.ImageUrl = "~/Student/animatedmenu3/bpic9.png"
        End If

        If Session("Role_Type") = "student" Then
            '   DetailsViewTeacher.Visible = False
            ' DataList4.Visible = False

        Else
            '   DetailsViewPersonal.Visible = False
            ColorButton2.Visible = False

        End If




        If Session("CurrentUI") = "en-US" Then
            ImageButtonapic9.ImageUrl = "~/Student/animatedmenu3/bpic9.png"
            ImageButtonapic99.ImageUrl = "~/Student/animatedmenu3/spic1.png"
            ImageButtonapic100.ImageUrl = "~/Student/animatedmenu3/spic2.png"
            ImageButtonapic1.ImageUrl = "~/Student/animatedmenu3/spic3.png"
            ImageButtonapic2.ImageUrl = "~/Student/animatedmenu3/spic4.png"
            ImageButtonapic3.ImageUrl = "~/Student/animatedmenu3/spic5.png"
            ImageButtonapic4.ImageUrl = "~/Student/animatedmenu3/spic6.png"
            ImageButtonapic5.ImageUrl = "~/Student/animatedmenu3/spic7.png"
            ImageButtonapic6.ImageUrl = "~/Student/animatedmenu3/spic8.png"
            ImageButtonapic7.ImageUrl = "~/Student/animatedmenu3/spic9.png"
            ImageButtonapic8.ImageUrl = "~/Student/animatedmenu3/spic10.png"

        End If

        If Session("CurrentUI") = "zh-TW" Then
            ImageButtonapic9.ImageUrl = "~/Student/animatedmenu3/homec.png"
            ImageButtonapic99.ImageUrl = "~/Student/animatedmenu3/ccca1.png"
            ImageButtonapic100.ImageUrl = "~/Student/animatedmenu3/ccca2.png"
            ImageButtonapic1.ImageUrl = "~/Student/animatedmenu3/ccca3.png"
            ImageButtonapic2.ImageUrl = "~/Student/animatedmenu3/ccca4.png"
            ImageButtonapic3.ImageUrl = "~/Student/animatedmenu3/ccca5.png"
            ImageButtonapic4.ImageUrl = "~/Student/animatedmenu3/ccca6.png"
            ImageButtonapic5.ImageUrl = "~/Student/animatedmenu3/ccca7.png"
            ImageButtonapic6.ImageUrl = "~/Student/animatedmenu3/ccca8.png"
            ImageButtonapic7.ImageUrl = "~/Student/animatedmenu3/ccca9.png"
            ImageButtonapic8.ImageUrl = "~/Student/animatedmenu3/ccca10.png"

        End If



        'If Session("CurrentUI").CompareTo("en") Then
        '    ImageButtonapic9.ImageUrl = "~/Student/animatedmenu3/bpic9.png"

        'End If



        'Else

        '    ImageButtonapic9.ImageUrl = "~/Student/animatedmenu3/homec.png"




        'If Session("CurrentUI") = False Then
        '    ImageButtonapic9.ImageUrl = "~/Student/animatedmenu3/bpic9.png"
        'Else
        '    ImageButtonapic9.ImageUrl = "~/Student/animatedmenu3/homec.png"
        'End If



    End Sub


    Protected Sub ColorButton1_Click1(sender As Object, e As EventArgs) Handles ColorButton1.Click
        MultiView1.ActiveViewIndex = 0
        MultiView2.ActiveViewIndex = 11
        ColorButton1.CssClass = "home selected"
        ColorButton2.CssClass = "about"
        ColorButton3.CssClass = "services"
    End Sub

    Protected Sub ColorButton2_Click1(sender As Object, e As EventArgs) Handles ColorButton2.Click
        MultiView1.ActiveViewIndex = 1
        ColorButton1.CssClass = "home"
        ColorButton2.CssClass = "about selected"
        ColorButton3.CssClass = "services"
    End Sub

    Protected Sub ColorButton3_Click1(sender As Object, e As EventArgs) Handles ColorButton3.Click
        MultiView1.ActiveViewIndex = 2
        ColorButton1.CssClass = "home"
        ColorButton2.CssClass = "about"
        ColorButton3.CssClass = "services selected"
    End Sub


   ' Protected Sub ImageButton2_Click1(sender As Object, e As ImageClickEventArgs) Handles ImageButton2.Click
    '   If Session("Role_Type") = "student" Then
         '   Response.Redirect("home.aspx")
     '   End If

       ' If Session("Role_Type") = "teacher" Or Session("Role_Type") = "tutor" Or Session("Role_Type") = "coordinator" Or Session("Role_Type") = "director" Then
        '    Response.Redirect("schoolStaff.aspx")
      '  End If

      '  Response.Write("<script>alert('Please Log In !'); window.location.href='http://172.26.122.66/siweb/logout.asp'; </script>")
   ' End Sub


    'Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton1.Click
    '   If Session("Role_Type") = "student" Then
    '        Response.Redirect("home.aspx")
    '    End If

    '    If Session("Role_Type") = "teacher" Or Session("Role_Type") = "tutor" Or Session("Role_Type") = "coordinator" Or Session("Role_Type") = "director" Then
    '        Response.Redirect("schoolStaff.aspx")
    '    End If

    '        Response.Write("<script>alert('Please Log In !'); window.location.href='http://172.26.122.66/siweb/logout.asp'; </script>")



    'End Sub

    'Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click

    '    MultiView1.ActiveViewIndex = 0
    '    MultiView2.ActiveViewIndex = 11
    '    Button1.CssClass = "blueli"
    '    Button2.CssClass = "blue"
    '    Button3.CssClass = "blue"

    '    Button15.CssClass = "blue"
    '    Button10.CssClass = "blue"
    '    Button11.CssClass = "blue"
    '    Button12.CssClass = "blue"
    '    Button13.CssClass = "blue"
    '    Button4.CssClass = "blue"
    '    Button28.CssClass = "blue"
    '    Button34.CssClass = "blue"

    'End Sub

    'Protected Sub Button2_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button2.Click
    '    MultiView1.ActiveViewIndex = 1
    '    Button2.CssClass = "blueli"
    '    Button1.CssClass = "blue"
    '    Button3.CssClass = "blue"



    'End Sub

    'Protected Sub Button3_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button3.Click
    '    MultiView1.ActiveViewIndex = 2
    '    Button3.CssClass = "blueli"
    '    Button1.CssClass = "blue"
    '    Button2.CssClass = "blue"




    'End Sub



    Protected Sub ImageButtonapic99_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButtonapic99.Click

        MultiView1.ActiveViewIndex = 0
        MultiView2.ActiveViewIndex = 11

        If Session("Role_Type") = "student" Then
            Button8.Visible = True

            ImageButtonapic1.CssClass = "aimg"
            ImageButtonapic2.CssClass = "aimg"
            ImageButtonapic3.CssClass = "aimg"
            ImageButtonapic4.CssClass = "aimg"
            ImageButtonapic5.CssClass = "aimg"
            ImageButtonapic6.CssClass = "aimg"
            ImageButtonapic7.CssClass = "aimg"
            ImageButtonapic8.CssClass = "aimg"
            ImageButtonapic99.CssClass = "aimgactive"
            ImageButtonapic100.CssClass = "aimg"

        Else
            Button8.Visible = False
            ImageButtonapic1.CssClass = "aimg"
            ImageButtonapic2.CssClass = "aimg"
            ImageButtonapic3.CssClass = "aimg"
            ImageButtonapic4.CssClass = "aimg"
            ImageButtonapic5.CssClass = "aimg"
            ImageButtonapic6.CssClass = "aimg"
            ImageButtonapic7.CssClass = "aimg"
            ImageButtonapic8.CssClass = "aimg"
            ImageButtonapic99.CssClass = "aimgactive"
            ImageButtonapic100.CssClass = "aimg"
        End If


    End Sub




    Protected Sub ImageButtonapic1_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButtonapic1.Click

        MultiView2.ActiveViewIndex = 0
        Button7.Visible = False
        Button9.Visible = False

        If Session("Role_Type") = "student" Then
            Button8.Visible = True

            ImageButtonapic1.CssClass = "aimgactive"
            ImageButtonapic2.CssClass = "aimg"
            ImageButtonapic3.CssClass = "aimg"
            ImageButtonapic4.CssClass = "aimg"
            ImageButtonapic5.CssClass = "aimg"
            ImageButtonapic6.CssClass = "aimg"
            ImageButtonapic7.CssClass = "aimg"
            ImageButtonapic8.CssClass = "aimg"
            ImageButtonapic99.CssClass = "aimg"
            ImageButtonapic100.CssClass = "aimg"
        Else
            Button8.Visible = False
            ImageButtonapic1.CssClass = "aimgactive"
            ImageButtonapic2.CssClass = "aimg"
            ImageButtonapic3.CssClass = "aimg"
            ImageButtonapic4.CssClass = "aimg"
            ImageButtonapic5.CssClass = "aimg"
            ImageButtonapic6.CssClass = "aimg"
            ImageButtonapic7.CssClass = "aimg"
            ImageButtonapic8.CssClass = "aimg"
            ImageButtonapic99.CssClass = "aimg"
            ImageButtonapic100.CssClass = "aimg"
        End If


    End Sub

    Protected Sub ImageButtonapic2_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButtonapic2.Click

        MultiView2.ActiveViewIndex = 1
        Button17.Visible = False
        Button18.Visible = False
        If Session("Role_Type") = "student" Then
            Button16.Visible = True
            ImageButtonapic1.CssClass = "aimg"
            ImageButtonapic2.CssClass = "aimgactive"
            ImageButtonapic3.CssClass = "aimg"
            ImageButtonapic4.CssClass = "aimg"
            ImageButtonapic5.CssClass = "aimg"
            ImageButtonapic6.CssClass = "aimg"
            ImageButtonapic7.CssClass = "aimg"
            ImageButtonapic8.CssClass = "aimg"
            ImageButtonapic99.CssClass = "aimg"
            ImageButtonapic100.CssClass = "aimg"
        Else
            Button16.Visible = False
            ImageButtonapic1.CssClass = "aimg"
            ImageButtonapic2.CssClass = "aimgactive"
            ImageButtonapic3.CssClass = "aimg"
            ImageButtonapic4.CssClass = "aimg"
            ImageButtonapic5.CssClass = "aimg"
            ImageButtonapic6.CssClass = "aimg"
            ImageButtonapic7.CssClass = "aimg"
            ImageButtonapic8.CssClass = "aimg"
            ImageButtonapic99.CssClass = "aimg"
            ImageButtonapic100.CssClass = "aimg"

        End If



    End Sub

    Protected Sub ImageButtonapic3_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButtonapic3.Click

        MultiView2.ActiveViewIndex = 2
        Button14.Visible = False
        Button19.Visible = False
        If Session("Role_Type") = "student" Then
            Button6.Visible = True
            ImageButtonapic1.CssClass = "aimg"
            ImageButtonapic2.CssClass = "aimg"
            ImageButtonapic3.CssClass = "aimgactive"
            ImageButtonapic4.CssClass = "aimg"
            ImageButtonapic5.CssClass = "aimg"
            ImageButtonapic6.CssClass = "aimg"
            ImageButtonapic7.CssClass = "aimg"
            ImageButtonapic8.CssClass = "aimg"
            ImageButtonapic99.CssClass = "aimg"
            ImageButtonapic100.CssClass = "aimg"
        Else
            Button6.Visible = False
            ImageButtonapic1.CssClass = "aimg"
            ImageButtonapic2.CssClass = "aimg"
            ImageButtonapic3.CssClass = "aimgactive"
            ImageButtonapic4.CssClass = "aimg"
            ImageButtonapic5.CssClass = "aimg"
            ImageButtonapic6.CssClass = "aimg"
            ImageButtonapic7.CssClass = "aimg"
            ImageButtonapic8.CssClass = "aimg"
            ImageButtonapic99.CssClass = "aimg"
            ImageButtonapic100.CssClass = "aimg"
        End If




    End Sub

    Protected Sub ImageButtonapic4_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButtonapic4.Click

        MultiView2.ActiveViewIndex = 8
        ImageButtonapic1.CssClass = "aimg"
        ImageButtonapic2.CssClass = "aimg"
        ImageButtonapic3.CssClass = "aimg"
        ImageButtonapic4.CssClass = "aimgactive"
        ImageButtonapic5.CssClass = "aimg"
        ImageButtonapic6.CssClass = "aimg"
        ImageButtonapic7.CssClass = "aimg"
        ImageButtonapic8.CssClass = "aimg"
        ImageButtonapic99.CssClass = "aimg"
        ImageButtonapic100.CssClass = "aimg"
        GridView4.DataBind()
        GridView4.Visible = True
        DetailsView1.Visible = False
        Button35.Visible = False
        addWork.Visible = True
        verify()
        MultiView3.ActiveViewIndex = 0


    End Sub
    Protected Sub ImageButtonapic5_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButtonapic5.Click

        MultiView2.ActiveViewIndex = 9
        ImageButtonapic1.CssClass = "aimg"
        ImageButtonapic2.CssClass = "aimg"
        ImageButtonapic3.CssClass = "aimg"
        ImageButtonapic4.CssClass = "aimg"
        ImageButtonapic5.CssClass = "aimgactive"
        ImageButtonapic6.CssClass = "aimg"
        ImageButtonapic7.CssClass = "aimg"
        ImageButtonapic8.CssClass = "aimg"
        ImageButtonapic99.CssClass = "aimg"
        ImageButtonapic100.CssClass = "aimg"
        GridView5.DataBind()
        GridView5.Visible = True
        DetailsView3.Visible = False
        Button36.Visible = False
        reLevantBtn.Visible = True
        verify()
        MultiView4.ActiveViewIndex = 0






    End Sub
    Protected Sub ImageButtonapic6_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButtonapic6.Click


        MultiView2.ActiveViewIndex = 3
        Button21.Visible = False
        Button22.Visible = False
        If Session("Role_Type") = "student" Then
            Button20.Visible = True
            ImageButtonapic1.CssClass = "aimg"
            ImageButtonapic2.CssClass = "aimg"
            ImageButtonapic3.CssClass = "aimg"
            ImageButtonapic4.CssClass = "aimg"
            ImageButtonapic5.CssClass = "aimg"
            ImageButtonapic6.CssClass = "aimgactive"
            ImageButtonapic7.CssClass = "aimg"
            ImageButtonapic8.CssClass = "aimg"
            ImageButtonapic99.CssClass = "aimg"
            ImageButtonapic100.CssClass = "aimg"
        Else
            Button20.Visible = False
            ImageButtonapic1.CssClass = "aimg"
            ImageButtonapic2.CssClass = "aimg"
            ImageButtonapic3.CssClass = "aimg"
            ImageButtonapic4.CssClass = "aimg"
            ImageButtonapic5.CssClass = "aimg"
            ImageButtonapic6.CssClass = "aimgactive"
            ImageButtonapic7.CssClass = "aimg"
            ImageButtonapic8.CssClass = "aimg"
            ImageButtonapic99.CssClass = "aimg"
            ImageButtonapic100.CssClass = "aimg"
        End If


    End Sub
    Protected Sub ImageButtonapic7_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButtonapic7.Click


        MultiView2.ActiveViewIndex = 4
        Button24.Visible = False
        Button25.Visible = False
        If Session("Role_Type") = "student" Then
            Button23.Visible = True
            ImageButtonapic1.CssClass = "aimg"
            ImageButtonapic2.CssClass = "aimg"
            ImageButtonapic3.CssClass = "aimg"
            ImageButtonapic4.CssClass = "aimg"
            ImageButtonapic5.CssClass = "aimg"
            ImageButtonapic6.CssClass = "aimg"
            ImageButtonapic7.CssClass = "aimgactive"
            ImageButtonapic8.CssClass = "aimg"
            ImageButtonapic99.CssClass = "aimg"
            ImageButtonapic100.CssClass = "aimg"
        Else
            Button23.Visible = False
            ImageButtonapic1.CssClass = "aimg"
            ImageButtonapic2.CssClass = "aimg"
            ImageButtonapic3.CssClass = "aimg"
            ImageButtonapic4.CssClass = "aimg"
            ImageButtonapic5.CssClass = "aimg"
            ImageButtonapic6.CssClass = "aimg"
            ImageButtonapic7.CssClass = "aimgactive"
            ImageButtonapic8.CssClass = "aimg"
            ImageButtonapic99.CssClass = "aimg"
            ImageButtonapic100.CssClass = "aimg"
        End If





    End Sub

    Protected Sub ImageButtonapic8_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButtonapic8.Click

        If Session("Role_Type") = "student" Then
            MultiView2.ActiveViewIndex = 5
            ImageButtonapic1.CssClass = "aimg"
            ImageButtonapic2.CssClass = "aimg"
            ImageButtonapic3.CssClass = "aimg"
            ImageButtonapic4.CssClass = "aimg"
            ImageButtonapic5.CssClass = "aimg"
            ImageButtonapic6.CssClass = "aimg"
            ImageButtonapic7.CssClass = "aimg"
            ImageButtonapic8.CssClass = "aimgactive"
            ImageButtonapic99.CssClass = "aimg"

        Else
            MultiView2.ActiveViewIndex = 10
            ImageButtonapic1.CssClass = "aimg"
            ImageButtonapic2.CssClass = "aimg"
            ImageButtonapic3.CssClass = "aimg"
            ImageButtonapic4.CssClass = "aimg"
            ImageButtonapic5.CssClass = "aimg"
            ImageButtonapic6.CssClass = "aimg"
            ImageButtonapic7.CssClass = "aimg"
            ImageButtonapic8.CssClass = "aimgactive"
            ImageButtonapic99.CssClass = "aimg"
        End If



    End Sub

    Protected Sub ImageButtonapic9_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButtonapic9.Click

        If Session("Role_Type") = "student" Then
            Response.Redirect("home.aspx")
        End If

        If Session("Role_Type") = "teacher" Or Session("Role_Type") = "tutor" Or Session("Role_Type") = "coordinator" Or Session("Role_Type") = "director" Then
            Response.Redirect("schoolStaff.aspx")
        End If

        Response.Write("<script>alert('Please Log In !'); window.location.href='http://172.26.122.66/siweb/logout.asp'; </script>")

    End Sub



    

    Protected Sub Button7_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button7.Click

        Dim conn As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString)
        Dim tmp_da As New SqlClient.SqlDataAdapter("Select top 1 * from StudentProfile where pess_cod='" & Session("pess_cod") & "'", conn)
        Dim tmp_ds As New DataSet
        Dim tmp_dr As DataRow

        conn.Open()
        tmp_da.Fill(tmp_ds, "StudentProfile")
        tmp_da.FillSchema(tmp_ds, SchemaType.Source, "StudentProfile")
        If tmp_ds.Tables("StudentProfile").Rows.Count > 0 Then
            tmp_dr = tmp_ds.Tables("StudentProfile").Rows(0)
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
            tmp_dr("perBio") = sb

            Dim myobj As New SqlClient.SqlCommandBuilder(tmp_da)
            tmp_da.Update(tmp_ds, "StudentProfile")

            Button7.Visible = False
            Button9.Visible = False
            Button8.Visible = True
            Me.Editor1.Content = tmp_dr("perBio")
            Editor1.ActiveMode = AjaxControlToolkit.HTMLEditor.ActiveModeType.Preview
        End If

        conn.Close()
    End Sub

    Protected Sub Button8_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button8.Click
        Editor1.ActiveMode = AjaxControlToolkit.HTMLEditor.ActiveModeType.Design

        Button7.Visible = True
        Button9.Visible = True
        Button8.Visible = False

    End Sub




    Private Sub verify()

        If Session("Role_Type") <> "student" Then
            addWork.Visible = False
            reLevantBtn.Visible = False

        End If
    End Sub







    Protected Sub Button9_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button9.Click
        Dim conn As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString)
        Dim tmp_da As New SqlClient.SqlDataAdapter("Select top 1 * from StudentProfile where pess_cod='" & Session("pess_cod") & "'", conn)
        Dim tmp_ds As New DataSet
        Dim tmp_dr As DataRow

        conn.Open()
        tmp_da.Fill(tmp_ds, "StudentProfile")
        tmp_da.FillSchema(tmp_ds, SchemaType.Source, "StudentProfile")
        If tmp_ds.Tables("StudentProfile").Rows.Count > 0 Then
            tmp_dr = tmp_ds.Tables("StudentProfile").Rows(0)
            Me.Editor1.Content = tmp_dr("perBio")
            Button7.Visible = False
            Button9.Visible = False
            Button8.Visible = True
            Editor1.ActiveMode = AjaxControlToolkit.HTMLEditor.ActiveModeType.Preview
        End If

    End Sub

    Protected Sub Button15_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button15.Click
        MultiView2.ActiveViewIndex = 0
        Button7.Visible = False
        Button9.Visible = False

        If Session("Role_Type") = "student" Then
            Button8.Visible = True
            Button15.CssClass = "blueli"
            Button10.CssClass = "blue"
            Button11.CssClass = "blue"
            Button12.CssClass = "blue"
            Button13.CssClass = "blue"
            Button4.CssClass = "blue"
            Button28.CssClass = "blue"
            Button34.CssClass = "blue"
        Else
            Button8.Visible = False
            Button15.CssClass = "blueli"
            Button10.CssClass = "blue"
            Button11.CssClass = "blue"
            Button12.CssClass = "blue"
            Button13.CssClass = "blue"
            Button4.CssClass = "blue"
            Button28.CssClass = "blue"
            Button34.CssClass = "blue"
        End If
    End Sub

    Protected Sub Button16_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button16.Click
        Editor2.ActiveMode = AjaxControlToolkit.HTMLEditor.ActiveModeType.Design

        Button17.Visible = True
        Button18.Visible = True
        Button16.Visible = False
    End Sub

    Protected Sub Button17_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button17.Click

        Dim conn As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString)
        Dim tmp_da As New SqlClient.SqlDataAdapter("Select top 1 * from PersonalDetail where pess_cod='" & Session("pess_cod") & "'", conn)
        Dim tmp_ds As New DataSet
        Dim tmp_dr As DataRow

        conn.Open()
        tmp_da.Fill(tmp_ds, "PersonalDetail")
        tmp_da.FillSchema(tmp_ds, SchemaType.Source, "PersonalDetail")
        If tmp_ds.Tables("PersonalDetail").Rows.Count > 0 Then
            tmp_dr = tmp_ds.Tables("PersonalDetail").Rows(0)
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
			sb.Replace("&quot; target=&quot;", Chr(34)+" target=" + Chr(34))
			sb.Replace("&lt;/a&gt;", "</a>")
            tmp_dr("TechnicalSkill") = sb
            Dim myobj As New SqlClient.SqlCommandBuilder(tmp_da)
            tmp_da.Update(tmp_ds, "PersonalDetail")

            Button17.Visible = False
            Button18.Visible = False
            Button16.Visible = True
            Me.Editor2.Content = tmp_dr("TechnicalSkill")
            Editor2.ActiveMode = AjaxControlToolkit.HTMLEditor.ActiveModeType.Preview
        End If

        conn.Close()
    End Sub

    Protected Sub Button18_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button18.Click
        Dim conn As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString)
        Dim tmp_da As New SqlClient.SqlDataAdapter("Select top 1 * from PersonalDetail where pess_cod='" & Session("pess_cod") & "'", conn)
        Dim tmp_ds As New DataSet
        Dim tmp_dr As DataRow

        conn.Open()
        tmp_da.Fill(tmp_ds, "PersonalDetail")
        tmp_da.FillSchema(tmp_ds, SchemaType.Source, "PersonalDetail")
        If tmp_ds.Tables("PersonalDetail").Rows.Count > 0 Then
            tmp_dr = tmp_ds.Tables("PersonalDetail").Rows(0)
            Me.Editor2.Content = tmp_dr("TechnicalSkill")
            Button17.Visible = False
            Button18.Visible = False
            Button16.Visible = True
            Editor2.ActiveMode = AjaxControlToolkit.HTMLEditor.ActiveModeType.Preview
        End If
    End Sub

    Protected Sub Button10_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button10.Click
        MultiView2.ActiveViewIndex = 1
        Button17.Visible = False
        Button18.Visible = False
        If Session("Role_Type") = "student" Then
            Button16.Visible = True
            Button10.CssClass = "blueli"
            Button15.CssClass = "blue"
            Button11.CssClass = "blue"
            Button12.CssClass = "blue"
            Button13.CssClass = "blue"
            Button4.CssClass = "blue"
            Button28.CssClass = "blue"
            Button34.CssClass = "blue"
        Else
            Button16.Visible = False
            Button10.CssClass = "blueli"
            Button15.CssClass = "blue"
            Button11.CssClass = "blue"
            Button12.CssClass = "blue"
            Button13.CssClass = "blue"
            Button4.CssClass = "blue"
            Button28.CssClass = "blue"
            Button34.CssClass = "blue"
        End If
    End Sub

    Protected Sub Button6_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button6.Click
        Editor3.ActiveMode = AjaxControlToolkit.HTMLEditor.ActiveModeType.Design

        Button14.Visible = True
        Button19.Visible = True
        Button6.Visible = False
    End Sub

    Protected Sub Button14_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button14.Click
        Dim conn As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString)
        Dim tmp_da As New SqlClient.SqlDataAdapter("Select top 1 * from PersonalDetail where pess_cod='" & Session("pess_cod") & "'", conn)
        Dim tmp_ds As New DataSet
        Dim tmp_dr As DataRow

        conn.Open()
        tmp_da.Fill(tmp_ds, "PersonalDetail")
        tmp_da.FillSchema(tmp_ds, SchemaType.Source, "PersonalDetail")
        If tmp_ds.Tables("PersonalDetail").Rows.Count > 0 Then
            tmp_dr = tmp_ds.Tables("PersonalDetail").Rows(0)

            Dim sb As StringBuilder = New StringBuilder(HttpUtility.HtmlEncode(Me.Editor3.Content))
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
            tmp_dr("SocialSkill") = sb
           
			
            Dim myobj As New SqlClient.SqlCommandBuilder(tmp_da)
            tmp_da.Update(tmp_ds, "PersonalDetail")

            Button14.Visible = False
            Button19.Visible = False
            Button6.Visible = True
            Me.Editor3.Content = tmp_dr("SocialSkill")
            Editor3.ActiveMode = AjaxControlToolkit.HTMLEditor.ActiveModeType.Preview
        End If

        conn.Close()
    End Sub

    Protected Sub Button19_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button19.Click
        Dim conn As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString)
        Dim tmp_da As New SqlClient.SqlDataAdapter("Select top 1 * from PersonalDetail where pess_cod='" & Session("pess_cod") & "'", conn)
        Dim tmp_ds As New DataSet
        Dim tmp_dr As DataRow

        conn.Open()
        tmp_da.Fill(tmp_ds, "PersonalDetail")
        tmp_da.FillSchema(tmp_ds, SchemaType.Source, "PersonalDetail")
        If tmp_ds.Tables("PersonalDetail").Rows.Count > 0 Then
            tmp_dr = tmp_ds.Tables("PersonalDetail").Rows(0)
            Me.Editor3.Content = tmp_dr("SocialSkill")
            Button14.Visible = False
            Button19.Visible = False
            Button6.Visible = True
            Editor3.ActiveMode = AjaxControlToolkit.HTMLEditor.ActiveModeType.Preview
        End If
    End Sub

    Protected Sub Button11_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button11.Click
        MultiView2.ActiveViewIndex = 2
        Button14.Visible = False
        Button19.Visible = False
        If Session("Role_Type") = "student" Then
            Button6.Visible = True
            Button11.CssClass = "blueli"
            Button10.CssClass = "blue"
            Button15.CssClass = "blue"
            Button12.CssClass = "blue"
            Button13.CssClass = "blue"
            Button4.CssClass = "blue"
            Button28.CssClass = "blue"
            Button34.CssClass = "blue"
        Else
            Button6.Visible = False
            Button11.CssClass = "blueli"
            Button10.CssClass = "blue"
            Button15.CssClass = "blue"
            Button12.CssClass = "blue"
            Button13.CssClass = "blue"
            Button4.CssClass = "blue"
            Button28.CssClass = "blue"
            Button34.CssClass = "blue"
        End If
    End Sub

    Protected Sub Button20_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button20.Click
        Editor4.ActiveMode = AjaxControlToolkit.HTMLEditor.ActiveModeType.Design

        Button21.Visible = True
        Button22.Visible = True
        Button20.Visible = False
    End Sub

    Protected Sub Button21_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button21.Click
        Dim conn As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString)
        Dim tmp_da As New SqlClient.SqlDataAdapter("Select top 1 * from PersonalDetail where pess_cod='" & Session("pess_cod") & "'", conn)
        Dim tmp_ds As New DataSet
        Dim tmp_dr As DataRow

        conn.Open()
        tmp_da.Fill(tmp_ds, "PersonalDetail")
        tmp_da.FillSchema(tmp_ds, SchemaType.Source, "PersonalDetail")
        If tmp_ds.Tables("PersonalDetail").Rows.Count > 0 Then
            tmp_dr = tmp_ds.Tables("PersonalDetail").Rows(0)

            Dim sb As StringBuilder = New StringBuilder(HttpUtility.HtmlEncode(Me.Editor4.Content))
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
			
	
            tmp_dr("Language") = sb
          
			
            Dim myobj As New SqlClient.SqlCommandBuilder(tmp_da)
            tmp_da.Update(tmp_ds, "PersonalDetail")

            Button21.Visible = False
            Button22.Visible = False
            Button20.Visible = True
            Me.Editor4.Content = tmp_dr("Language")
            Editor4.ActiveMode = AjaxControlToolkit.HTMLEditor.ActiveModeType.Preview
        End If

        conn.Close()
    End Sub

    Protected Sub Button22_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button22.Click
        Dim conn As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString)
        Dim tmp_da As New SqlClient.SqlDataAdapter("Select top 1 * from PersonalDetail where pess_cod='" & Session("pess_cod") & "'", conn)
        Dim tmp_ds As New DataSet
        Dim tmp_dr As DataRow

        conn.Open()
        tmp_da.Fill(tmp_ds, "PersonalDetail")
        tmp_da.FillSchema(tmp_ds, SchemaType.Source, "PersonalDetail")
        If tmp_ds.Tables("PersonalDetail").Rows.Count > 0 Then
            tmp_dr = tmp_ds.Tables("PersonalDetail").Rows(0)
            Me.Editor4.Content = tmp_dr("Language")
            Button21.Visible = False
            Button22.Visible = False
            Button20.Visible = True
            Editor4.ActiveMode = AjaxControlToolkit.HTMLEditor.ActiveModeType.Preview
        End If
    End Sub

    Protected Sub Button12_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button12.Click
        MultiView2.ActiveViewIndex = 3
        Button21.Visible = False
        Button22.Visible = False
        If Session("Role_Type") = "student" Then
            Button20.Visible = True
            Button12.CssClass = "blueli"
            Button10.CssClass = "blue"
            Button11.CssClass = "blue"
            Button15.CssClass = "blue"
            Button13.CssClass = "blue"
            Button4.CssClass = "blue"
            Button28.CssClass = "blue"
            Button34.CssClass = "blue"
        Else
            Button20.Visible = False
            Button12.CssClass = "blueli"
            Button10.CssClass = "blue"
            Button11.CssClass = "blue"
            Button15.CssClass = "blue"
            Button13.CssClass = "blue"
            Button4.CssClass = "blue"
            Button28.CssClass = "blue"
            Button34.CssClass = "blue"
        End If
    End Sub

    Protected Sub Button23_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button23.Click
        Editor5.ActiveMode = AjaxControlToolkit.HTMLEditor.ActiveModeType.Design

        Button24.Visible = True
        Button25.Visible = True
        Button23.Visible = False
    End Sub

    Protected Sub Button24_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button24.Click
        Dim conn As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString)
        Dim tmp_da As New SqlClient.SqlDataAdapter("Select top 1 * from PersonalDetail where pess_cod='" & Session("pess_cod") & "'", conn)
        Dim tmp_ds As New DataSet
        Dim tmp_dr As DataRow

        conn.Open()
        tmp_da.Fill(tmp_ds, "PersonalDetail")
        tmp_da.FillSchema(tmp_ds, SchemaType.Source, "PersonalDetail")
        If tmp_ds.Tables("PersonalDetail").Rows.Count > 0 Then
            tmp_dr = tmp_ds.Tables("PersonalDetail").Rows(0)

          Dim sb As StringBuilder = New StringBuilder(HttpUtility.HtmlEncode(Me.Editor5.Content))
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
            tmp_dr("Interest") = sb
            
            Dim myobj As New SqlClient.SqlCommandBuilder(tmp_da)
            tmp_da.Update(tmp_ds, "PersonalDetail")

            Button24.Visible = False
            Button25.Visible = False
            Button23.Visible = True
            Me.Editor5.Content =tmp_dr("Interest")
            Editor5.ActiveMode = AjaxControlToolkit.HTMLEditor.ActiveModeType.Preview
        End If

        conn.Close()
    End Sub

    Protected Sub Button25_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button25.Click
        Dim conn As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString)
        Dim tmp_da As New SqlClient.SqlDataAdapter("Select top 1 * from PersonalDetail where pess_cod='" & Session("pess_cod") & "'", conn)
        Dim tmp_ds As New DataSet
        Dim tmp_dr As DataRow

        conn.Open()
        tmp_da.Fill(tmp_ds, "PersonalDetail")
        tmp_da.FillSchema(tmp_ds, SchemaType.Source, "PersonalDetail")
        If tmp_ds.Tables("PersonalDetail").Rows.Count > 0 Then
            tmp_dr = tmp_ds.Tables("PersonalDetail").Rows(0)
            Me.Editor5.Content = tmp_dr("Interest")
			
		
            Button24.Visible = False
            Button25.Visible = False
            Button23.Visible = True
            Editor5.ActiveMode = AjaxControlToolkit.HTMLEditor.ActiveModeType.Preview
        End If
    End Sub

    Protected Sub Button13_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button13.Click
        MultiView2.ActiveViewIndex = 4
        Button24.Visible = False
        Button25.Visible = False
        If Session("Role_Type") = "student" Then
            Button23.Visible = True
            Button13.CssClass = "blueli"
            Button10.CssClass = "blue"
            Button11.CssClass = "blue"
            Button12.CssClass = "blue"
            Button15.CssClass = "blue"
            Button4.CssClass = "blue"
            Button28.CssClass = "blue"
            Button34.CssClass = "blue"
        Else
            Button23.Visible = False
            Button13.CssClass = "blueli"
            Button10.CssClass = "blue"
            Button11.CssClass = "blue"
            Button12.CssClass = "blue"
            Button15.CssClass = "blue"
            Button4.CssClass = "blue"
            Button28.CssClass = "blue"
            Button34.CssClass = "blue"
        End If
    End Sub

    Protected Sub Button4_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button4.Click
        If Session("Role_Type") = "student" Then
            MultiView2.ActiveViewIndex = 5
            Button4.CssClass = "blueli"
            Button10.CssClass = "blue"
            Button11.CssClass = "blue"
            Button12.CssClass = "blue"
            Button13.CssClass = "blue"
            Button15.CssClass = "blue"
            Button28.CssClass = "blue"
            Button34.CssClass = "blue"
           
        Else
            MultiView2.ActiveViewIndex = 10
            Button4.CssClass = "blueli"
            Button10.CssClass = "blue"
            Button11.CssClass = "blue"
            Button12.CssClass = "blue"
            Button13.CssClass = "blue"
            Button15.CssClass = "blue"
            Button28.CssClass = "blue"
            Button34.CssClass = "blue"
        End If


    End Sub

  

    Protected Sub Button26_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button26.Click
        MultiView2.ActiveViewIndex = 6
        DropDownList4.SelectedValue = "Prof."
        TextBox2.Text = ""
        TextBox3.Text = ""
        TextBox4.Text = ""
        TextBox5.Text = ""
        TextBox6.Text = ""
        TextBox7.Text = ""
        TextBox8.Text = ""
        TextBox9.Text = ""
        TextBox10.Text = ""
        TextBox11.Text = ""
        DropDownList1.SelectedValue = "教授"
        TextBox36.Text = ""
        TextBox37.Text = ""
        TextBox38.Text = ""
        TextBox39.Text = ""
        TextBox40.Text = ""
        TextBox41.Text = ""
        TextBox42.Text = ""
        TextBox43.Text = ""
        TextBox2.Focus()

    End Sub

    Protected Sub Button29_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button29.Click
        Dim conn As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString)
        conn.Open()
        Dim sql As String
      
        sql = "insert into Reference(pess_cod,teacher,teacher_type,position,program,school,institute,address,city,country,phone,email,teacherCht,teacher_typeCht,positionCht,programCht,schoolCht,instituteCht,addressCht,cityCht,countryCht)Values(@pess_cod,@teacher,@teacher_type,@position,@program,@school,@institute,@address,@city,@country,@phone,@email,@teacherCht,@teacher_typeCht,@positionCht,@programCht,@schoolCht,@instituteCht,@addressCht,@cityCht,@countryCht)"
        Dim cmd As New SqlCommand(sql, conn)
        cmd.Parameters.AddWithValue("@pess_cod", Session("pess_cod"))
        cmd.Parameters.AddWithValue("@teacher", TextBox2.Text)
        cmd.Parameters.AddWithValue("@teacher_type", DropDownList4.SelectedValue)
        cmd.Parameters.AddWithValue("@position", TextBox3.Text)
        cmd.Parameters.AddWithValue("@program", TextBox4.Text)
        cmd.Parameters.AddWithValue("@school", TextBox5.Text)
        cmd.Parameters.AddWithValue("@institute", TextBox6.Text)
        cmd.Parameters.AddWithValue("@address", TextBox7.Text)
        cmd.Parameters.AddWithValue("@city", TextBox8.Text)
        cmd.Parameters.AddWithValue("@country", TextBox9.Text)
        cmd.Parameters.AddWithValue("@phone", TextBox10.Text)
        cmd.Parameters.AddWithValue("@email", TextBox11.Text)
        cmd.Parameters.AddWithValue("@teacherCht", TextBox36.Text)
        cmd.Parameters.AddWithValue("@teacher_typeCht", DropDownList1.SelectedValue)
        cmd.Parameters.AddWithValue("@positionCht", TextBox37.Text)
        cmd.Parameters.AddWithValue("@programCht", TextBox38.Text)
        cmd.Parameters.AddWithValue("@schoolCht", TextBox39.Text)
        cmd.Parameters.AddWithValue("@instituteCht", TextBox40.Text)
        cmd.Parameters.AddWithValue("@addressCht", TextBox41.Text)
        cmd.Parameters.AddWithValue("@cityCht", TextBox42.Text)
        cmd.Parameters.AddWithValue("@countryCht", TextBox43.Text)
       
        cmd.ExecuteNonQuery()
        DataList3.DataBind()
        conn.Close()
        MultiView2.ActiveViewIndex = 5
    End Sub

    Public Function show() As Boolean

        If Session("Role_Type") = "student" Then
            Return True

        Else
            Return False
        End If
    End Function


   
   
    Protected Sub DataList3_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles DataList3.ItemCommand
        If e.CommandName = "Edit" Then
            Dim teacher As Label = CType(e.Item.FindControl("teacherLabel"), Label)
            Dim teacherType As Label = CType(e.Item.FindControl("Teacher_Type"), Label)
            Dim position As Label = CType(e.Item.FindControl("positionLabel"), Label)
            Dim program As Label = CType(e.Item.FindControl("programLabel"), Label)
            Dim school As Label = CType(e.Item.FindControl("schoolLabel"), Label)
            Dim institute As Label = CType(e.Item.FindControl("instituteLabel"), Label)
            Dim address As Label = CType(e.Item.FindControl("addressLabel"), Label)
            Dim city As Label = CType(e.Item.FindControl("cityLabel"), Label)
            Dim country As Label = CType(e.Item.FindControl("countryLabel"), Label)
            Dim phone As Label = CType(e.Item.FindControl("phoneLabel"), Label)
            Dim email As Label = CType(e.Item.FindControl("emailLabel"), Label)
            Dim id As Label = CType(e.Item.FindControl("idLabel"), Label)
            Dim teacherCht As Label = CType(e.Item.FindControl("teacherChtLabel"), Label)
            Dim teacherTypeCht As Label = CType(e.Item.FindControl("teacher_typeChtLabel"), Label)
            Dim positionCht As Label = CType(e.Item.FindControl("positionChtLabel"), Label)
            Dim programCht As Label = CType(e.Item.FindControl("programChtLabel"), Label)
            Dim schoolCht As Label = CType(e.Item.FindControl("schoolChtLabel"), Label)
            Dim instituteCht As Label = CType(e.Item.FindControl("instituteChtLabel"), Label)
            Dim addressCht As Label = CType(e.Item.FindControl("addressChtLabel"), Label)
            Dim cityCht As Label = CType(e.Item.FindControl("cityChtLabel"), Label)
            Dim countryCht As Label = CType(e.Item.FindControl("countryChtLabel"), Label)
            TextBox12.Text = teacher.Text
            TextBox13.Text = position.Text
            TextBox14.Text = program.Text
            TextBox15.Text = school.Text
            TextBox16.Text = institute.Text
            TextBox17.Text = address.Text
            TextBox18.Text = city.Text
            TextBox19.Text = country.Text
            TextBox20.Text = phone.Text
            TextBox21.Text = email.Text
            index.Value = id.Text
            TextBox44.Text = teacherCht.Text
            TextBox45.Text = positionCht.Text
            TextBox46.Text = programCht.Text
            TextBox47.Text = schoolCht.Text
            TextBox48.Text = instituteCht.Text
            TextBox49.Text = addressCht.Text
            TextBox50.Text = cityCht.Text
            TextBox51.Text = countryCht.Text
            DropDownList3.SelectedValue = teacherType.Text
            DropDownList2.SelectedValue = teacherTypeCht.Text
            MultiView2.ActiveViewIndex = 7
        End If
        If e.CommandName = "Delete" Then
            If (message.Value = "No") Then
                Exit Sub
            End If
            Dim id As Label = CType(e.Item.FindControl("idLabel"), Label)

            Dim conn As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString)
            conn.Open()
            Dim sql As String
            sql = "delete from Reference where id='" & id.Text & "'"
            Dim cmd As New SqlCommand(sql, conn)
            cmd.ExecuteNonQuery()
            DataList3.DataBind()
            conn.Close()
            MultiView2.ActiveViewIndex = 5
        End If
    End Sub

    Protected Sub Button27_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button27.Click
        Dim conn As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString)
        conn.Open()
        Dim sql As String
        sql = "update Reference set pess_cod=@pess_cod,teacher=@teacher,teacher_type=@teacher_type,position=@position,program=@program,school=@school,institute=@institute,address=@address,city=@city,country=@country,phone=@phone,email=@email,teacherCht=@teacherCht,teacher_typeCht=@teacher_typeCht,positionCht=@positionCht,programCht=@programCht,schoolCht=@schoolCht,instituteCht=@instituteCht,addressCht=@addressCht,cityCht=@cityCht,countryCht=@countryCht where id=@id"
        Dim cmd As New SqlCommand(sql, conn)
        cmd.Parameters.AddWithValue("@pess_cod", Session("pess_cod"))
        cmd.Parameters.AddWithValue("@teacher", TextBox12.Text)
        cmd.Parameters.AddWithValue("@teacher_type", DropDownList3.SelectedValue)
        cmd.Parameters.AddWithValue("@position", TextBox13.Text)
        cmd.Parameters.AddWithValue("@program", TextBox14.Text)
        cmd.Parameters.AddWithValue("@school", TextBox15.Text)
        cmd.Parameters.AddWithValue("@institute", TextBox16.Text)
        cmd.Parameters.AddWithValue("@address", TextBox17.Text)
        cmd.Parameters.AddWithValue("@city", TextBox18.Text)
        cmd.Parameters.AddWithValue("@country", TextBox19.Text)
        cmd.Parameters.AddWithValue("@phone", TextBox20.Text)
        cmd.Parameters.AddWithValue("@email", TextBox21.Text)
        cmd.Parameters.AddWithValue("@teacherCht", TextBox44.Text)
        cmd.Parameters.AddWithValue("@teacher_typeCht", DropDownList2.SelectedValue)
        cmd.Parameters.AddWithValue("@positionCht", TextBox45.Text)
        cmd.Parameters.AddWithValue("@programCht", TextBox46.Text)
        cmd.Parameters.AddWithValue("@schoolCht", TextBox47.Text)
        cmd.Parameters.AddWithValue("@instituteCht", TextBox48.Text)
        cmd.Parameters.AddWithValue("@addressCht", TextBox49.Text)
        cmd.Parameters.AddWithValue("@cityCht", TextBox50.Text)
        cmd.Parameters.AddWithValue("@countryCht", TextBox51.Text)
        cmd.Parameters.AddWithValue("@id", index.Value)
        cmd.ExecuteNonQuery()
        DataList3.DataBind()
        conn.Close()


        MultiView2.ActiveViewIndex = 5
    End Sub

  
    Protected Sub Button32_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button32.Click
        MultiView2.ActiveViewIndex = 5
    End Sub

    Protected Sub Button33_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button33.Click

        MultiView2.ActiveViewIndex = 5
    End Sub

   
    
    Protected Sub Button28_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button28.Click
        MultiView2.ActiveViewIndex = 8
        Button28.CssClass = "blueli"
        Button10.CssClass = "blue"
        Button11.CssClass = "blue"
        Button12.CssClass = "blue"
        Button13.CssClass = "blue"
        Button4.CssClass = "blue"
        Button15.CssClass = "blue"
        Button34.CssClass = "blue"
        GridView4.DataBind()
        GridView4.Visible = True
        DetailsView1.Visible = False
        Button35.Visible = False
        addWork.Visible = True
        verify()
        MultiView3.ActiveViewIndex = 0
    End Sub

    Protected Sub DetailsView1_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles DetailsView1.ItemUpdated
        GridView4.DataBind()
        GridView4.Visible = True
        DetailsView1.Visible = False
        Button35.Visible = False
    End Sub

    Protected Sub DetailsView1_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles DetailsView1.ItemInserted
        GridView4.DataBind()
        GridView4.Visible = True
        DetailsView1.Visible = False
        Button35.Visible = False
    End Sub

    Protected Sub DetailsView1_ItemDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewDeletedEventArgs) Handles DetailsView1.ItemDeleted
        GridView4.DataBind()
        GridView4.Visible = True
        DetailsView1.Visible = False
        Button35.Visible = False
    End Sub

    Protected Sub Button34_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button34.Click
        MultiView2.ActiveViewIndex = 9
        Button34.CssClass = "blueli"
        Button10.CssClass = "blue"
        Button11.CssClass = "blue"
        Button12.CssClass = "blue"
        Button13.CssClass = "blue"
        Button4.CssClass = "blue"
        Button28.CssClass = "blue"
        Button15.CssClass = "blue"
        GridView5.DataBind()
        GridView5.Visible = True
        DetailsView3.Visible = False
        Button36.Visible = False
        reLevantBtn.Visible = True
        verify()
        MultiView4.ActiveViewIndex = 0
    End Sub

    Protected Sub DetailsView3_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles DetailsView3.ItemUpdated
        GridView5.DataBind()
        GridView5.Visible = True
        DetailsView3.Visible = False
        Button36.Visible = False
    End Sub

    Protected Sub DetailsView3_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles DetailsView3.ItemInserted
        GridView5.DataBind()
        GridView5.Visible = True
        DetailsView3.Visible = False
        Button36.Visible = False
    End Sub

    Protected Sub DetailsView3_ItemDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewDeletedEventArgs) Handles DetailsView3.ItemDeleted
        GridView5.DataBind()
        GridView5.Visible = True
        DetailsView3.Visible = False
        Button36.Visible = False
    End Sub

    Protected Sub DetailsView1_ItemDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewDeleteEventArgs) Handles DetailsView1.ItemDeleting
        If (message.Value = "No") Then
            e.Cancel = True
            Return
        End If
     
    End Sub

    Protected Sub DetailsView3_ItemDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewDeleteEventArgs) Handles DetailsView3.ItemDeleting
        If (message.Value = "No") Then
            e.Cancel = True
            Return
        End If

    End Sub

    Protected Sub GridView4_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView4.SelectedIndexChanged

        GridView4.Visible = False
        DetailsView1.Visible = True
        DetailsView1.DataBind()
        Button35.Visible = True
        addWork.Visible = False
        verify()
    End Sub

    Protected Sub GridView5_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView5.SelectedIndexChanged

        GridView5.Visible = False
        DetailsView3.Visible = True
        DetailsView3.DataBind()
        Button36.Visible = True
        reLevantBtn.Visible = False
        verify()
    End Sub

  

    Protected Sub DetailsView1_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertEventArgs) Handles DetailsView1.ItemInserting
        Dim startDate As String = CType(Me.DetailsView1.FindControl("TextBox1"), TextBox).Text
        Dim endDate As String = CType(Me.DetailsView1.FindControl("TextBox2"), TextBox).Text
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

    Protected Sub DetailsView1_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdateEventArgs) Handles DetailsView1.ItemUpdating
        Dim startDate As String = CType(Me.DetailsView1.FindControl("TextBox1"), TextBox).Text
        Dim endDate As String = CType(Me.DetailsView1.FindControl("TextBox2"), TextBox).Text
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

  
    Protected Sub Button35_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button35.Click
        GridView4.Visible = True
        DetailsView1.Visible = False
        Button35.Visible = False
        addWork.Visible = True
        verify()
    End Sub

    Protected Sub Button36_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button36.Click
        GridView5.Visible = True
        DetailsView3.Visible = False
        Button36.Visible = False
        reLevantBtn.Visible = True
        verify()
    End Sub

    Protected Sub addWork_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles addWork.Click
        MultiView3.ActiveViewIndex = 1
        TextBox22.Text = ""
        TextBox23.Text = ""
        TextBox24.Text = ""
        TextBox25.Text = ""
        TextBox26.Text = ""
        TextBox33.Text = ""
        TextBox34.Text = ""
        TextBox35.Text = ""
    End Sub

   
    Protected Sub workIns_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles workIns.Click

        Dim startDate As String = TextBox22.Text
        Dim endDate As String = TextBox23.Text
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

        If TextBox22.Text = "" And TextBox23.Text = "" Then
            Try
                Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
                Using mycon As New SqlConnection(con)
                    mycon.Open()
                    Dim strSQL As String = "INSERT INTO StudentWorks ([pess_cod],[start_year], [end_year], [job], [city], [company], [jobCht], [companyCht], [cityCht]) VALUES (@pess_cod, NULL, NULL, @job, @city, @company, @jobCht, @companyCht, @cityCht)"

                    Using cmd As New SqlCommand()
                        cmd.Connection = mycon
                        cmd.CommandText = strSQL
                        cmd.Parameters.AddWithValue("@pess_cod", Session("pess_cod"))
                      
                        cmd.Parameters.AddWithValue("@job", TextBox24.Text)
                        cmd.Parameters.AddWithValue("@company", TextBox25.Text)
                        cmd.Parameters.AddWithValue("@city", TextBox26.Text)
                        cmd.Parameters.AddWithValue("@jobCht", TextBox33.Text)
                        cmd.Parameters.AddWithValue("@companyCht", TextBox34.Text)
                        cmd.Parameters.AddWithValue("@cityCht", TextBox35.Text)


                        cmd.ExecuteNonQuery()
                    End Using
                    mycon.Close()
                End Using
            Catch ex As Exception

                Response.Write("<script>alert('Insert Error!')</script>")

                Return
            End Try
        ElseIf TextBox22.Text = "" Then
            Try
                Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
                Using mycon As New SqlConnection(con)
                    mycon.Open()
                    Dim strSQL As String = "INSERT INTO StudentWorks ([pess_cod],[start_year], [end_year], [job], [city], [company], [jobCht], [companyCht], [cityCht]) VALUES (@pess_cod, NULL, @end_year, @job, @city, @company, @jobCht, @companyCht, @cityCht)"

                    Using cmd As New SqlCommand()
                        cmd.Connection = mycon
                        cmd.CommandText = strSQL
                        cmd.Parameters.AddWithValue("@pess_cod", Session("pess_cod"))
                        cmd.Parameters.AddWithValue("@end_year", TextBox23.Text)
                        cmd.Parameters.AddWithValue("@job", TextBox24.Text)
                        cmd.Parameters.AddWithValue("@company", TextBox25.Text)
                        cmd.Parameters.AddWithValue("@city", TextBox26.Text)
                        cmd.Parameters.AddWithValue("@jobCht", TextBox33.Text)
                        cmd.Parameters.AddWithValue("@companyCht", TextBox34.Text)
                        cmd.Parameters.AddWithValue("@cityCht", TextBox35.Text)

                        cmd.ExecuteNonQuery()
                    End Using
                    mycon.Close()
                End Using
            Catch ex As Exception

                Response.Write("<script>alert('Insert Error!')</script>")

                Return
            End Try
        ElseIf TextBox23.Text = "" Then
            Try
                Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
                Using mycon As New SqlConnection(con)
                    mycon.Open()
                    Dim strSQL As String = "INSERT INTO StudentWorks ([pess_cod],[start_year], [end_year], [job], [city], [company], [jobCht], [companyCht], [cityCht]) VALUES (@pess_cod, @start_year, NULL, @job, @city, @company, @jobCht, @companyCht, @cityCht)"

                    Using cmd As New SqlCommand()
                        cmd.Connection = mycon
                        cmd.CommandText = strSQL
                        cmd.Parameters.AddWithValue("@pess_cod", Session("pess_cod"))
                        cmd.Parameters.AddWithValue("@start_year", TextBox22.Text)
                        cmd.Parameters.AddWithValue("@job", TextBox24.Text)
                        cmd.Parameters.AddWithValue("@company", TextBox25.Text)
                        cmd.Parameters.AddWithValue("@city", TextBox26.Text)
                        cmd.Parameters.AddWithValue("@jobCht", TextBox33.Text)
                        cmd.Parameters.AddWithValue("@companyCht", TextBox34.Text)
                        cmd.Parameters.AddWithValue("@cityCht", TextBox35.Text)

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
                    Dim strSQL As String = "INSERT INTO StudentWorks ([pess_cod],[start_year], [end_year], [job], [city], [company], [jobCht], [companyCht], [cityCht]) VALUES (@pess_cod, @start_year, @end_year, @job, @city, @company, @jobCht, @companyCht, @cityCht)"

                    Using cmd As New SqlCommand()
                        cmd.Connection = mycon
                        cmd.CommandText = strSQL
                        cmd.Parameters.AddWithValue("@pess_cod", Session("pess_cod"))
                        cmd.Parameters.AddWithValue("@start_year", TextBox22.Text)
                        cmd.Parameters.AddWithValue("@end_year", TextBox23.Text)
                        cmd.Parameters.AddWithValue("@job", TextBox24.Text)
                        cmd.Parameters.AddWithValue("@company", TextBox25.Text)
                        cmd.Parameters.AddWithValue("@city", TextBox26.Text)
                        cmd.Parameters.AddWithValue("@jobCht", TextBox33.Text)
                        cmd.Parameters.AddWithValue("@companyCht", TextBox34.Text)
                        cmd.Parameters.AddWithValue("@cityCht", TextBox35.Text)

                        cmd.ExecuteNonQuery()
                    End Using
                    mycon.Close()
                End Using
            Catch ex As Exception

                Response.Write("<script>alert('Insert Error!')</script>")

                Return
            End Try
        End If
        GridView4.DataBind()
        MultiView3.ActiveViewIndex = 0

    End Sub

    Protected Sub workCel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles workCel.Click
        MultiView3.ActiveViewIndex = 0
    End Sub

   
    Protected Sub GridView4_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GridView4.RowDeleting
        If (message.Value = "No") Then
            e.Cancel = True
            Return
        End If
    End Sub

   

   

    Protected Sub reLevantBtn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles reLevantBtn.Click
        MultiView4.ActiveViewIndex = 1
        TextBox27.Text = ""
        TextBox28.Text = ""
        TextBox29.Text = ""
        TextBox30.Text = ""
        TextBox31.Text = ""
        TextBox32.Text = ""

   
    End Sub

   
    Protected Sub relevantIns_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles relevantIns.Click

        Dim startDate As String = TextBox27.Text
        Dim endDate As String = TextBox52.Text
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
        If TextBox27.Text = "" And TextBox52.Text = "" Then
            Try
                Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
                Using mycon As New SqlConnection(con)
                    mycon.Open()
                    Dim strSQL As String = "INSERT INTO RelevantExperience ([pess_cod], [startDate], [endDate], [course], [detail], [organization], [city], [country]) VALUES (@pess_cod, NULL, NULL, @course, @detail, @organization, @city, @country)"

                    Using cmd As New SqlCommand()
                        cmd.Connection = mycon
                        cmd.CommandText = strSQL
                        cmd.Parameters.AddWithValue("@pess_cod", Session("pess_cod"))
                        cmd.Parameters.AddWithValue("@course", TextBox28.Text)
                        cmd.Parameters.AddWithValue("@detail", TextBox29.Text)
                        cmd.Parameters.AddWithValue("@organization", TextBox30.Text)
                        cmd.Parameters.AddWithValue("@city", TextBox31.Text)
                        cmd.Parameters.AddWithValue("@country", TextBox32.Text)

                        cmd.ExecuteNonQuery()
                    End Using
                    mycon.Close()
                End Using
            Catch ex As Exception

                Response.Write("<script>alert('Insert Error!')</script>")

                Return
            End Try
        ElseIf TextBox27.Text = "" Then
            Try
                Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
                Using mycon As New SqlConnection(con)
                    mycon.Open()
                    Dim strSQL As String = "INSERT INTO RelevantExperience ([pess_cod], [startDate], [endDate], [course], [detail], [organization], [city], [country]) VALUES (@pess_cod, NULL, @endDate, @course, @detail, @organization, @city, @country)"

                    Using cmd As New SqlCommand()
                        cmd.Connection = mycon
                        cmd.CommandText = strSQL
                        cmd.Parameters.AddWithValue("@pess_cod", Session("pess_cod"))
                        cmd.Parameters.AddWithValue("@endDate", TextBox52.Text)
                        cmd.Parameters.AddWithValue("@course", TextBox28.Text)
                        cmd.Parameters.AddWithValue("@detail", TextBox29.Text)
                        cmd.Parameters.AddWithValue("@organization", TextBox30.Text)
                        cmd.Parameters.AddWithValue("@city", TextBox31.Text)
                        cmd.Parameters.AddWithValue("@country", TextBox32.Text)

                        cmd.ExecuteNonQuery()
                    End Using
                    mycon.Close()
                End Using
            Catch ex As Exception

                Response.Write("<script>alert('Insert Error!')</script>")

                Return
            End Try
        ElseIf TextBox52.Text = "" Then
             Try
                Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
                Using mycon As New SqlConnection(con)
                    mycon.Open()
                    Dim strSQL As String = "INSERT INTO RelevantExperience ([pess_cod], [startDate], [endDate], [course], [detail], [organization], [city], [country]) VALUES (@pess_cod, @startDate, NULL, @course, @detail, @organization, @city, @country)"

                    Using cmd As New SqlCommand()
                        cmd.Connection = mycon
                        cmd.CommandText = strSQL
                        cmd.Parameters.AddWithValue("@pess_cod", Session("pess_cod"))
                        cmd.Parameters.AddWithValue("@startDate", TextBox27.Text)
                        cmd.Parameters.AddWithValue("@course", TextBox28.Text)
                        cmd.Parameters.AddWithValue("@detail", TextBox29.Text)
                        cmd.Parameters.AddWithValue("@organization", TextBox30.Text)
                        cmd.Parameters.AddWithValue("@city", TextBox31.Text)
                        cmd.Parameters.AddWithValue("@country", TextBox32.Text)

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
                    Dim strSQL As String = "INSERT INTO RelevantExperience ([pess_cod], [startDate], [endDate], [course], [detail], [organization], [city], [country]) VALUES (@pess_cod, @startDate, @endDate, @course, @detail, @organization, @city, @country)"

                    Using cmd As New SqlCommand()
                        cmd.Connection = mycon
                        cmd.CommandText = strSQL
                        cmd.Parameters.AddWithValue("@pess_cod", Session("pess_cod"))
                        cmd.Parameters.AddWithValue("@startDate", TextBox27.Text)
                        cmd.Parameters.AddWithValue("@endDate", TextBox52.Text)
                        cmd.Parameters.AddWithValue("@course", TextBox28.Text)
                        cmd.Parameters.AddWithValue("@detail", TextBox29.Text)
                        cmd.Parameters.AddWithValue("@organization", TextBox30.Text)
                        cmd.Parameters.AddWithValue("@city", TextBox31.Text)
                        cmd.Parameters.AddWithValue("@country", TextBox32.Text)

                        cmd.ExecuteNonQuery()
                    End Using
                    mycon.Close()
                End Using
            Catch ex As Exception

                Response.Write("<script>alert('Insert Error!')</script>")

                Return
            End Try
        End If


        GridView5.DataBind()
        MultiView4.ActiveViewIndex = 0

    End Sub

    Protected Sub relevantCel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles relevantCel.Click
        MultiView4.ActiveViewIndex = 0
    End Sub

    Protected Sub GridView5_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GridView5.RowDeleting
        If (message.Value = "No") Then
            e.Cancel = True
            Return
        End If
    End Sub

   
    Protected Sub ImageButtonapic100_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonapic100.Click

        MultiView2.ActiveViewIndex = 12
        ImageButtonapic100.CssClass = "aimgactive"
        ImageButtonapic1.CssClass = "aimg"
        ImageButtonapic2.CssClass = "aimg"
        ImageButtonapic3.CssClass = "aimg"
        ImageButtonapic4.CssClass = "aimg"
        ImageButtonapic5.CssClass = "aimg"
        ImageButtonapic6.CssClass = "aimg"
        ImageButtonapic7.CssClass = "aimg"
        ImageButtonapic8.CssClass = "aimg"
        ImageButtonapic99.CssClass = "aimg"
    End Sub

    Protected Sub GridView4_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles GridView4.RowUpdating
        Dim startDate As String = CType(Me.GridView4.Rows(e.RowIndex).FindControl("TextBox2"), TextBox).Text
        Dim endDate As String = CType(Me.GridView4.Rows(e.RowIndex).FindControl("TextBox3"), TextBox).Text
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







        'If (Not String.IsNullOrEmpty(Request("lang"))) Then
        '{
        '    Session("lang") = Request("lang")
        '}
        'End If
        'Dim lang As String = Convert.ToString(Session("lang"))
        'Dim culture As String = String.Empty
        'If (Session("CurrentUI").ToLower().CompareTo("en") = 0 Or String.IsNullOrEmpty(Culture)) Then

        '    ImageButtonapic9.ImageUrl = "~/Student/animatedmenu3/bpic9.png"
        '    ImageButtonapic99.ImageUrl = "~/Student/animatedmenu3/spic1.png"
        '    ImageButtonapic100.ImageUrl = "~/Student/animatedmenu3/spic2.png"
        '    ImageButtonapic1.ImageUrl = "~/Student/animatedmenu3/spic3.png"
        '    ImageButtonapic2.ImageUrl = "~/Student/animatedmenu3/spic4.png"
        '    ImageButtonapic3.ImageUrl = "~/Student/animatedmenu3/spic5.png"
        '    ImageButtonapic4.ImageUrl = "~/Student/animatedmenu3/spic6.png"
        '    ImageButtonapic5.ImageUrl = "~/Student/animatedmenu3/spic7.png"
        '    ImageButtonapic6.ImageUrl = "~/Student/animatedmenu3/spic8.png"
        '    ImageButtonapic7.ImageUrl = "~/Student/animatedmenu3/spic9.png"
        '    ImageButtonapic8.ImageUrl = "~/Student/animatedmenu3/spic10.png"

        'End If
        'If (Session("CurrentUI").ToLower().CompareTo("zh") = 0) Then

        '    ImageButtonapic9.ImageUrl = "~/Student/animatedmenu3/homec.png"
        '    ImageButtonapic99.ImageUrl = "~/Student/animatedmenu3/ccca1.png"
        '    ImageButtonapic100.ImageUrl = "~/Student/animatedmenu3/ccca2.png"
        '    ImageButtonapic1.ImageUrl = "~/Student/animatedmenu3/ccca3.png"
        '    ImageButtonapic2.ImageUrl = "~/Student/animatedmenu3/ccca4.png"
        '    ImageButtonapic3.ImageUrl = "~/Student/animatedmenu3/ccca5.png"
        '    ImageButtonapic4.ImageUrl = "~/Student/animatedmenu3/ccca6.png"
        '    ImageButtonapic5.ImageUrl = "~/Student/animatedmenu3/ccca7.png"
        '    ImageButtonapic6.ImageUrl = "~/Student/animatedmenu3/ccca8.png"
        '    ImageButtonapic7.ImageUrl = "~/Student/animatedmenu3/ccca9.png"
        '    ImageButtonapic8.ImageUrl = "~/Student/animatedmenu3/ccca10.png"

        'End If



        'if (!string.IsNullOrEmpty(Request["lang"]))
        '{
        '    Session["lang"] = Request["lang"];
        '}
        'string lang = Convert.ToString(Session["lang"]);
        'string culture = string.Empty;
        'if (lang.ToLower().CompareTo("en") == 0 || string.IsNullOrEmpty(culture))
        '{
        '    ImageButtonapic9.ImageUrl = "~/Student/animatedmenu3/bpic9.png";
        '    ImageButtonapic99.ImageUrl = "~/Student/animatedmenu3/spic1.png";
        '    ImageButtonapic100.ImageUrl = "~/Student/animatedmenu3/spic2.png";
        '    ImageButtonapic1.ImageUrl = "~/Student/animatedmenu3/spic3.png";
        '    ImageButtonapic2.ImageUrl = "~/Student/animatedmenu3/spic4.png";
        '    ImageButtonapic3.ImageUrl = "~/Student/animatedmenu3/spic5.png";
        '    ImageButtonapic4.ImageUrl = "~/Student/animatedmenu3/spic6.png";
        '    ImageButtonapic5.ImageUrl = "~/Student/animatedmenu3/spic7.png";
        '    ImageButtonapic6.ImageUrl = "~/Student/animatedmenu3/spic8.png";
        '    ImageButtonapic7.ImageUrl = "~/Student/animatedmenu3/spic9.png";
        '    ImageButtonapic8.ImageUrl = "~/Student/animatedmenu3/spic10.png";
        '}
        'if (lang.ToLower().CompareTo("zh") == 0)
        '{
        '    ImageButtonapic9.ImageUrl = "~/Student/animatedmenu3/homec.png";
        '    ImageButtonapic99.ImageUrl = "~/Student/animatedmenu3/ccca1.png";
        '    ImageButtonapic100.ImageUrl = "~/Student/animatedmenu3/ccca2.png";
        '    ImageButtonapic1.ImageUrl = "~/Student/animatedmenu3/ccca3.png";
        '    ImageButtonapic2.ImageUrl = "~/Student/animatedmenu3/ccca4.png";
        '    ImageButtonapic3.ImageUrl = "~/Student/animatedmenu3/ccca5.png";
        '    ImageButtonapic4.ImageUrl = "~/Student/animatedmenu3/ccca6.png";
        '    ImageButtonapic5.ImageUrl = "~/Student/animatedmenu3/ccca7.png";
        '    ImageButtonapic6.ImageUrl = "~/Student/animatedmenu3/ccca8.png";
        '    ImageButtonapic7.ImageUrl = "~/Student/animatedmenu3/ccca9.png";
        '    ImageButtonapic8.ImageUrl = "~/Student/animatedmenu3/ccca10.png";
        '}


    End Sub

   

    Protected Sub DetailsView3_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdateEventArgs) Handles DetailsView3.ItemUpdating
        Dim startDate As String = CType(Me.DetailsView3.FindControl("TextBox1"), TextBox).Text
        Dim endDate As String = CType(Me.DetailsView3.FindControl("TextBox3"), TextBox).Text
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

    Protected Sub DetailsView3_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertEventArgs) Handles DetailsView3.ItemInserting
        Dim startDate As String = CType(Me.DetailsView3.FindControl("TextBox1"), TextBox).Text
        Dim endDate As String = CType(Me.DetailsView3.FindControl("TextBox3"), TextBox).Text
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

    Protected Sub GridView5_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles GridView5.RowUpdating
        Dim startDate As String = CType(Me.GridView5.Rows(e.RowIndex).FindControl("TextBox1"), TextBox).Text
        Dim endDate As String = CType(Me.GridView5.Rows(e.RowIndex).FindControl("TextBox2"), TextBox).Text
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

    Protected Sub technicalEdit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles technicalEdit.Click
        Editor2Cht.ActiveMode = AjaxControlToolkit.HTMLEditor.ActiveModeType.Design

        technicalUpdate.Visible = True
        technicalCancel.Visible = True
        technicalEdit.Visible = False
    End Sub

    Protected Sub technicalUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles technicalUpdate.Click

        Dim conn As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString)
        Dim tmp_da As New SqlClient.SqlDataAdapter("Select top 1 * from PersonalDetail where pess_cod='" & Session("pess_cod") & "'", conn)
        Dim tmp_ds As New DataSet
        Dim tmp_dr As DataRow

        conn.Open()
        tmp_da.Fill(tmp_ds, "PersonalDetail")
        tmp_da.FillSchema(tmp_ds, SchemaType.Source, "PersonalDetail")
        If tmp_ds.Tables("PersonalDetail").Rows.Count > 0 Then
            tmp_dr = tmp_ds.Tables("PersonalDetail").Rows(0)
              Dim sb As StringBuilder = New StringBuilder(HttpUtility.HtmlEncode(Me.Editor2Cht.Content))
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
            tmp_dr("TechnicalSkillCht") = sb
            Dim myobj As New SqlClient.SqlCommandBuilder(tmp_da)
            tmp_da.Update(tmp_ds, "PersonalDetail")

            technicalUpdate.Visible = False
            technicalCancel.Visible = False
            technicalEdit.Visible = True
            Me.Editor2Cht.Content =tmp_dr("TechnicalSkillCht")
            Editor2Cht.ActiveMode = AjaxControlToolkit.HTMLEditor.ActiveModeType.Preview
        End If

        conn.Close()
    End Sub

    Protected Sub technicalCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles technicalCancel.Click
        Dim conn As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString)
        Dim tmp_da As New SqlClient.SqlDataAdapter("Select top 1 * from PersonalDetail where pess_cod='" & Session("pess_cod") & "'", conn)
        Dim tmp_ds As New DataSet
        Dim tmp_dr As DataRow

        conn.Open()
        tmp_da.Fill(tmp_ds, "PersonalDetail")
        tmp_da.FillSchema(tmp_ds, SchemaType.Source, "PersonalDetail")
        If tmp_ds.Tables("PersonalDetail").Rows.Count > 0 Then
            tmp_dr = tmp_ds.Tables("PersonalDetail").Rows(0)
            Me.Editor2Cht.Content = tmp_dr("TechnicalSkillCht")
            technicalUpdate.Visible = False
            technicalCancel.Visible = False
            technicalEdit.Visible = True
            Editor2Cht.ActiveMode = AjaxControlToolkit.HTMLEditor.ActiveModeType.Preview
        End If
    End Sub

    Protected Sub socialEdit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles socialEdit.Click
        Editor3Cht.ActiveMode = AjaxControlToolkit.HTMLEditor.ActiveModeType.Design

        socialUpdate.Visible = True
        socialCancel.Visible = True
        socialEdit.Visible = False
    End Sub

    Protected Sub socialUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles socialUpdate.Click
        Dim conn As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString)
        Dim tmp_da As New SqlClient.SqlDataAdapter("Select top 1 * from PersonalDetail where pess_cod='" & Session("pess_cod") & "'", conn)
        Dim tmp_ds As New DataSet
        Dim tmp_dr As DataRow

        conn.Open()
        tmp_da.Fill(tmp_ds, "PersonalDetail")
        tmp_da.FillSchema(tmp_ds, SchemaType.Source, "PersonalDetail")
        If tmp_ds.Tables("PersonalDetail").Rows.Count > 0 Then
            tmp_dr = tmp_ds.Tables("PersonalDetail").Rows(0)
            Dim sb As StringBuilder = New StringBuilder(HttpUtility.HtmlEncode(Me.Editor3Cht.Content))
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
            tmp_dr("SocialSkillCht") = sb
           
            Dim myobj As New SqlClient.SqlCommandBuilder(tmp_da)
            tmp_da.Update(tmp_ds, "PersonalDetail")

            socialUpdate.Visible = False
            socialCancel.Visible = False
            socialEdit.Visible = True
            Me.Editor3Cht.Content = tmp_dr("SocialSkillCht")
            Editor3Cht.ActiveMode = AjaxControlToolkit.HTMLEditor.ActiveModeType.Preview
        End If

        conn.Close()
    End Sub

    Protected Sub socialCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles socialCancel.Click
        Dim conn As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString)
        Dim tmp_da As New SqlClient.SqlDataAdapter("Select top 1 * from PersonalDetail where pess_cod='" & Session("pess_cod") & "'", conn)
        Dim tmp_ds As New DataSet
        Dim tmp_dr As DataRow

        conn.Open()
        tmp_da.Fill(tmp_ds, "PersonalDetail")
        tmp_da.FillSchema(tmp_ds, SchemaType.Source, "PersonalDetail")
        If tmp_ds.Tables("PersonalDetail").Rows.Count > 0 Then
            tmp_dr = tmp_ds.Tables("PersonalDetail").Rows(0)
            Me.Editor3Cht.Content = tmp_dr("SocialSkillCht")
            socialUpdate.Visible = False
            socialCancel.Visible = False
            socialEdit.Visible = True
            Editor3Cht.ActiveMode = AjaxControlToolkit.HTMLEditor.ActiveModeType.Preview
        End If
    End Sub

    Protected Sub lanEdit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lanEdit.Click
        Editor4Cht.ActiveMode = AjaxControlToolkit.HTMLEditor.ActiveModeType.Design

        lanUpdate.Visible = True
        lanCancel.Visible = True
        lanEdit.Visible = False
    End Sub

    Protected Sub lanUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lanUpdate.Click
        Dim conn As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString)
        Dim tmp_da As New SqlClient.SqlDataAdapter("Select top 1 * from PersonalDetail where pess_cod='" & Session("pess_cod") & "'", conn)
        Dim tmp_ds As New DataSet
        Dim tmp_dr As DataRow

        conn.Open()
        tmp_da.Fill(tmp_ds, "PersonalDetail")
        tmp_da.FillSchema(tmp_ds, SchemaType.Source, "PersonalDetail")
        If tmp_ds.Tables("PersonalDetail").Rows.Count > 0 Then
            tmp_dr = tmp_ds.Tables("PersonalDetail").Rows(0)

            Dim sb As StringBuilder = New StringBuilder(HttpUtility.HtmlEncode(Me.Editor4Cht.Content))
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
            tmp_dr("LanguageCht") = sb
         
            Dim myobj As New SqlClient.SqlCommandBuilder(tmp_da)
            tmp_da.Update(tmp_ds, "PersonalDetail")

            lanUpdate.Visible = False
            lanCancel.Visible = False
            lanEdit.Visible = True
            Me.Editor4Cht.Content =tmp_dr("LanguageCht")
            Editor4Cht.ActiveMode = AjaxControlToolkit.HTMLEditor.ActiveModeType.Preview
        End If

        conn.Close()
    End Sub

    Protected Sub lanCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lanCancel.Click
        Dim conn As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString)
        Dim tmp_da As New SqlClient.SqlDataAdapter("Select top 1 * from PersonalDetail where pess_cod='" & Session("pess_cod") & "'", conn)
        Dim tmp_ds As New DataSet
        Dim tmp_dr As DataRow

        conn.Open()
        tmp_da.Fill(tmp_ds, "PersonalDetail")
        tmp_da.FillSchema(tmp_ds, SchemaType.Source, "PersonalDetail")
        If tmp_ds.Tables("PersonalDetail").Rows.Count > 0 Then
            tmp_dr = tmp_ds.Tables("PersonalDetail").Rows(0)
            Me.Editor4Cht.Content = tmp_dr("LanguageCht")
            lanUpdate.Visible = False
            lanCancel.Visible = False
            lanEdit.Visible = True
            Editor4Cht.ActiveMode = AjaxControlToolkit.HTMLEditor.ActiveModeType.Preview
        End If
    End Sub

    Protected Sub interestsEdit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles interestsEdit.Click
        Editor5Cht.ActiveMode = AjaxControlToolkit.HTMLEditor.ActiveModeType.Design

        interestsUpdate.Visible = True
        interestsCancel.Visible = True
        interestsEdit.Visible = False
    End Sub

    Protected Sub interestsUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles interestsUpdate.Click
        Dim conn As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString)
        Dim tmp_da As New SqlClient.SqlDataAdapter("Select top 1 * from PersonalDetail where pess_cod='" & Session("pess_cod") & "'", conn)
        Dim tmp_ds As New DataSet
        Dim tmp_dr As DataRow

        conn.Open()
        tmp_da.Fill(tmp_ds, "PersonalDetail")
        tmp_da.FillSchema(tmp_ds, SchemaType.Source, "PersonalDetail")
        If tmp_ds.Tables("PersonalDetail").Rows.Count > 0 Then
            tmp_dr = tmp_ds.Tables("PersonalDetail").Rows(0)

            Dim sb As StringBuilder = New StringBuilder(HttpUtility.HtmlEncode(Me.Editor5Cht.Content))
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
            tmp_dr("InterestCht") = sb
          
            Dim myobj As New SqlClient.SqlCommandBuilder(tmp_da)
            tmp_da.Update(tmp_ds, "PersonalDetail")

            interestsUpdate.Visible = False
            interestsCancel.Visible = False
            interestsEdit.Visible = True
            Me.Editor5Cht.Content = tmp_dr("InterestCht")
            Editor5Cht.ActiveMode = AjaxControlToolkit.HTMLEditor.ActiveModeType.Preview
        End If

        conn.Close()
    End Sub

    Protected Sub interestsCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles interestsCancel.Click
        Dim conn As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString)
        Dim tmp_da As New SqlClient.SqlDataAdapter("Select top 1 * from PersonalDetail where pess_cod='" & Session("pess_cod") & "'", conn)
        Dim tmp_ds As New DataSet
        Dim tmp_dr As DataRow

        conn.Open()
        tmp_da.Fill(tmp_ds, "PersonalDetail")
        tmp_da.FillSchema(tmp_ds, SchemaType.Source, "PersonalDetail")
        If tmp_ds.Tables("PersonalDetail").Rows.Count > 0 Then
            tmp_dr = tmp_ds.Tables("PersonalDetail").Rows(0)
            Me.Editor5Cht.Content = tmp_dr("InterestCht")
            interestsUpdate.Visible = False
            interestsCancel.Visible = False
            interestsEdit.Visible = True
            Editor5Cht.ActiveMode = AjaxControlToolkit.HTMLEditor.ActiveModeType.Preview
        End If
    End Sub

End Class
