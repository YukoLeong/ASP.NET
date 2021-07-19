Imports System.Data.SqlClient
Imports System.Data
Imports System.Threading
Imports System.Globalization
Partial Class Student_SubjectCategory
    Inherits System.Web.UI.Page
    Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        

        If Session("Role_Type") Is Nothing Then

            Response.Write("<script>alert('Please Log In !'); window.location.href='http://172.26.122.66/siweb/logout.asp'; </script>")
            Response.End()
        End If
        Dim dv_verify As Data.DataView = SqlDataSource2.Select(New DataSourceSelectArguments)
        If Session("Role_Type") = "student" Then
            If dv_verify.Item(0).Item("sscs") = "False" Then

                Response.Write("<script>alert('You do not have Permission to view it !');window.history.back(-1); </script>")

            End If
        End If

        bindProgram()

    
        If Session("CurrentUI") = "zh-TW" Then
            ImageButton2.ImageUrl = "../images/homebluec.png"
            ImageButton2.Attributes.Add("onmouseover", "src='../images/homebluec_hover.png'")
            ImageButton2.Attributes.Add("onmouseout", "src='../images/homebluec.png'")
        End If
     
    End Sub
    Public Sub bindProgram()


        Using mycon As New SqlConnection(con)
            mycon.Open()
            ' Dim strSQL As String = "select programAbility.ability from programAbility,program_info where programAbility.program_simplify_code=program_info.SIMPLIFY_CODE and programAbility.program_simplify_code=@code "

            Dim strSQL As String = "select AREA_CH,SUM(FINAL_MARK) as score,count(SUBJECT_CODE) as num from academic_result_info where ALUN_NUMERO=@ALUN_NUMERO and ALUN_NUMERO_SEQ=@ALUN_NUMERO_SEQ and SUBJECT_STATUS_EN=@SUBJECT_STATUS_EN group by AREA_CH "


            Using cmd As New SqlCommand()
                cmd.Connection = mycon
                cmd.CommandText = strSQL
                cmd.Parameters.AddWithValue("@ALUN_NUMERO", Session("ALUN_NUMERO"))
                cmd.Parameters.AddWithValue("@ALUN_NUMERO_SEQ", Session("ALUN_NUMERO_SEQ"))
                cmd.Parameters.AddWithValue("@SUBJECT_STATUS_EN", "Pass")

                Dim mySqlAdapter As New SqlDataAdapter(cmd)
                Dim myDataSet As New DataSet()
                mySqlAdapter.Fill(myDataSet)

                GridViewScore.DataSource = myDataSet
                GridViewScore.AllowPaging = True
                GridViewScore.PageSize = 10
                GridViewScore.DataBind()
            End Using
            mycon.Close()
        End Using

    End Sub
    Protected Sub GridViewScore_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GridViewScore.RowCommand
        If e.CommandName = "Select" Then
            categoryInfo.Text = CType(e.CommandSource, LinkButton).Text
            subjectCategory.Visible = True
            info.Visible = True
        End If
    End Sub



    Protected Sub ImageButton2_Click1(sender As Object, e As ImageClickEventArgs) Handles ImageButton2.Click
        Response.Redirect("home.aspx")
    End Sub



    Protected Sub GridViewScore_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridViewScore.PageIndexChanging
        Me.GridViewScore.PageIndex = e.NewPageIndex
        bindProgram()
        GridViewScore.SelectedIndex = -1
        categoryInfo.Text =""
        subjectCategory.Visible = False
        info.Visible = False
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
End Class


