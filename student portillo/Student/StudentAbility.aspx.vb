Imports System.Data.SqlClient
Imports System.Data
Partial Class Student_StudentAbility
    Inherits System.Web.UI.Page
    Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If Session("Role_Type") Is Nothing Then

                Response.Write("<script>alert('Please Log In !'); window.location.href='../home.aspx'; </script>")

            End If
            bindProgram()
        End If

    End Sub
    Public Sub bindProgram()


        Using mycon As New SqlConnection(con)
            mycon.Open()
            ' Dim strSQL As String = "select programAbility.ability from programAbility,program_info where programAbility.program_simplify_code=program_info.SIMPLIFY_CODE and programAbility.program_simplify_code=@code "

            Dim strSQL As String = " select SubjectAbility.abilityID, ProgramAbility.ability,sum(academic_result_info.FINAL_MARK) as score from SubjectAbility,ProgramAbility,academic_result_info "
            strSQL += "where SubjectAbility.abilityID=ProgramAbility.id and SubjectAbility.program_code=@program_code and SubjectAbility.subject_code=academic_result_info.subject_code and academic_result_info.ALUN_NUMERO=@ALUN_NUMERO and academic_result_info.ALUN_NUMERO_SEQ=@ALUN_NUMERO_SEQ group by SubjectAbility.abilityID,ProgramAbility.ability"

            Using cmd As New SqlCommand()
                cmd.Connection = mycon
                cmd.CommandText = strSQL
                cmd.Parameters.AddWithValue("@ALUN_NUMERO", Session("ALUN_NUMERO"))
                cmd.Parameters.AddWithValue("@ALUN_NUMERO_SEQ", Session("ALUN_NUMERO_SEQ"))
                cmd.Parameters.AddWithValue("@program_code", Session("programForAbility"))
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
            abilityInfo.Text = CType(e.CommandSource, LinkButton).Text
            proAbility.Visible = True
            info.Visible = True
        End If
    End Sub
   


    Protected Sub ImageButton2_Click1(sender As Object, e As ImageClickEventArgs) Handles ImageButton2.Click
        Response.Redirect("home.aspx")
    End Sub



End Class


