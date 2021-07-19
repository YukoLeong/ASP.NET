Imports System.Data
Imports System.Data.SqlClient
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.Control
Imports System.Web.UI.ClientScriptManager






Partial Class Student_Career3
    Inherits System.Web.UI.Page



    Private Sub Career_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init

        If DesignMode = True Then
            Return
        End If

        If Session("pess_cod") Is Nothing Then

            Dim cs As ClientScriptManager = Page.ClientScript

            'If Not cs.IsStartupScriptRegistered(Me.GetType(), "alert") Then
            'cs.RegisterClientScriptBlock(Me.GetType(),
            '"alert", "alert('Please login!')", True)

            'End If

            Response.Redirect("~/login.aspx")
        End If


        Dim conn As New SqlClient.SqlConnection("Data Source=172.25.2.64;Initial Catalog=EP;Persist Security Info=True;User ID=ep_client;Password=46709394")
        Dim tmp_da As New SqlClient.SqlDataAdapter("Select * from student_academic_info where pess_cod=" & Session("pess_cod"), conn)
        Dim tmp_da1 As New SqlClient.SqlDataAdapter("Select top 1 * from CareerPlanning where pess_cod=" & Session("pess_cod"), conn)
        Dim tmp_ds As New DataSet
        Dim tmp_dr As DataRow
        Dim str As String() = New String() {"."}


        conn.Open()
        tmp_da.Fill(tmp_ds, "student_academic_info")
        tmp_da.FillSchema(tmp_ds, SchemaType.Source, "personal_info")


        If tmp_ds.Tables("student_academic_info").Rows.Count <> 0 Then
            tmp_dr = tmp_ds.Tables("student_academic_info").Rows(0)
            Dim split As String() = tmp_dr("program_composite_code").Split(str, StringSplitOptions.RemoveEmptyEntries)
            Session.Add("programme", split(0))
            Session.Add("school", tmp_dr("school_code"))



        End If

        tmp_da1.Fill(tmp_ds, "CareerPlanning")
        tmp_da1.FillSchema(tmp_ds, SchemaType.Source, "CareerPlanning")
        If tmp_ds.Tables("CareerPlanning").Rows.Count = 0 Then
            tmp_dr = tmp_ds.Tables("CareerPlanning").NewRow
            tmp_dr("pess_cod") = Session("pess_cod")
            tmp_dr("careerPlanning") = "You can start to plan your career here!"
            tmp_ds.Tables("CareerPlanning").Rows.Add(tmp_dr)
            Dim myobj As New SqlClient.SqlCommandBuilder(tmp_da1)
            tmp_da1.Update(tmp_ds, "CareerPlanning")
        End If
        conn.Close()

        Call initCategoryList()


    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        Dim dv_learningExperience As Data.DataView = SqlDataSource11.Select(New DataSourceSelectArguments)

        Dim dv_learningAbility As Data.DataView = SqlDataSource13.Select(New DataSourceSelectArguments)

        Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString4").ConnectionString



        Using mycon As New SqlConnection(con)
            mycon.Open()
            For i As Integer = 0 To dv_learningAbility.Count - 1
                Dim strSQL As String = "update CurrentStatus set Professional_Competence=@professional,Leadership=@leadership,Communication=@communication,Creativity=@expression,Initiative=@initiative,Self_Development=@self_enhancement,Social_Responsibility=@civil_responsibility,Language=@language,IT_Application=@it_application where act='" & dv_learningAbility.Item(i).Item("Learning_Experience") & "' and pess_cod=" & Session("pess_cod")
                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL
                    cmd.Parameters.AddWithValue("@professional", dv_learningAbility.Item(i).Item("Professional_Competence") * (-dv_learningExperience.Item(0).Item(i + 2)))
                    cmd.Parameters.AddWithValue("@leadership", dv_learningAbility.Item(i).Item("Leadership") * (-dv_learningExperience.Item(0).Item(i + 2)))
                    cmd.Parameters.AddWithValue("@communication", dv_learningAbility.Item(i).Item("Communication") * (-dv_learningExperience.Item(0).Item(i + 2)))
                    cmd.Parameters.AddWithValue("@expression", dv_learningAbility.Item(i).Item("Creativity") * (-dv_learningExperience.Item(0).Item(i + 2)))
                    cmd.Parameters.AddWithValue("@initiative", dv_learningAbility.Item(i).Item("Initiative") * (-dv_learningExperience.Item(0).Item(i + 2)))
                    cmd.Parameters.AddWithValue("@self_enhancement", dv_learningAbility.Item(i).Item("Self_Development") * (-dv_learningExperience.Item(0).Item(i + 2)))
                    cmd.Parameters.AddWithValue("@civil_responsibility", dv_learningAbility.Item(i).Item("Social_Responsibility") * (-dv_learningExperience.Item(0).Item(i + 2)))
                    cmd.Parameters.AddWithValue("@language", dv_learningAbility.Item(i).Item("Language") * (-dv_learningExperience.Item(0).Item(i + 2)))
                    cmd.Parameters.AddWithValue("@it_application", dv_learningAbility.Item(i).Item("IT_Application") * (-dv_learningExperience.Item(0).Item(i + 2)))

                    cmd.ExecuteNonQuery()

                End Using
            Next
            mycon.Close()


        End Using



        Dim dv_AbilityColor As Data.DataView = SqlDataSource12.Select(New DataSourceSelectArguments)
        Dim mpi_Attribute(dv_AbilityColor.Count - 1) As String
        Dim mpi_Attribute_Color(dv_AbilityColor.Count - 1) As String
        Dim prog_Attribute(dv_AbilityColor.Count - 1) As Integer
        Dim student_att_total(dv_AbilityColor.Count - 1) As Integer


        SqlDataSource5.SelectCommand = "SELECT sum(Professional_Competence) as Professional_Competence,sum(Leadership) as Leadership,sum(Communication) as Communication ,sum(Creativity) as Creativity,sum(Initiative) as Initiative,sum(Self_Development) as Self_Development,sum(Social_Responsibility) as Social_Responsibility,sum(Language) as Language,sum(IT_Application) as IT_Application FROM CurrentStatus where pess_cod='" & Session("pess_cod") & "'"

        Dim dv_abilityValueTotal As Data.DataView = SqlDataSource5.Select(New DataSourceSelectArguments)

        SqlDataSource9.SelectCommand = "select * from categoryWeight where programme='" & Session("school") & "-" & Session("programme") & "'"
        Dim dv_attributeProg As Data.DataView = SqlDataSource9.Select(New DataSourceSelectArguments)
        If dv_attributeProg.Count <> 0 Then

            For i As Integer = 0 To dv_AbilityColor.Count - 1
                mpi_Attribute(i) = dv_AbilityColor.Item(i).Item("name").ToString 'retrieve attribute name
                mpi_Attribute_Color(i) = dv_AbilityColor.Item(i).Item("color").ToString 'retrieve attribute color
                student_att_total(i) = dv_abilityValueTotal.Item(0).Item(mpi_Attribute(i)).ToString 'retrieve student current attribute total
                prog_Attribute(i) = dv_attributeProg.Item(0).Item(mpi_Attribute(i))
            Next

        Else
            For i As Integer = 0 To dv_AbilityColor.Count - 1
                mpi_Attribute(i) = dv_AbilityColor.Item(i).Item("name").ToString   'retrieve attribute name
                mpi_Attribute_Color(i) = dv_AbilityColor.Item(i).Item("color").ToString 'retrieve attribute color
                student_att_total(i) = dv_abilityValueTotal.Item(0).Item(mpi_Attribute(i)).ToString 'retrieve student current attribute total
            Next
        End If
        SqlDataSource4.SelectCommand = "SELECT careerPlanning,Professional_Competence,Leadership,Communication,Creativity,Initiative,Self_Development,Social_Responsibility,Language,IT_Application FROM CareerPlanning where pess_cod='" & Session("pess_cod") & "'order by careerPlanning desc"
        Dim dv_planning As Data.DataView = SqlDataSource4.Select(New DataSourceSelectArguments)

        For i As Integer = 0 To dv_planning.Count - 1 'add student year plan to radar chart
            Chart_Total.Series.Add(dv_planning.Item(i).Item(0).ToString)
            Chart_Total.Series(dv_planning.Item(i).Item(0).ToString).ChartType = DataVisualization.Charting.SeriesChartType.Radar
            Chart_Total.Series(dv_planning.Item(i).Item(0).ToString).Color = Drawing.Color.FromName(mpi_Attribute_Color(i))

            For j As Integer = 1 To 9
                Chart_Total.Series(dv_planning.Item(i).Item(0).ToString).Points.AddXY(Regex.Replace(mpi_Attribute(j - 1), "_", " "), dv_planning.Item(i).Item(j).ToString)
            Next
        Next




        If chkStatus.Checked = True Then
            Chart_Total.Series.Add("current_status")
            Chart_Total.Series("current_status").BorderWidth = 6
            Chart_Total.Series("current_status").Color = Drawing.Color.Yellow
            Chart_Total.Series("current_status").ChartType = DataVisualization.Charting.SeriesChartType.Radar
            Chart_Total.Series("current_status")("RadarDrawingStyle") = "Line"
            Chart_Total.Series("current_status").Points.DataBindXY(mpi_Attribute, student_att_total)
        End If


        If chkMPIattribute.Checked = True And dv_attributeProg.Count <> 0 Then

            Chart_Total.Series.Add("current_program")
            Chart_Total.Series("current_program").BorderWidth = 6
            Chart_Total.Series("current_program").Color = Drawing.Color.YellowGreen
            Chart_Total.Series("current_program").ChartType = DataVisualization.Charting.SeriesChartType.Radar
            Chart_Total.Series("current_program")("RadarDrawingStyle") = "Line"
            Chart_Total.Series("current_program").Points.DataBindXY(mpi_Attribute, prog_Attribute)
        End If

        'If Session("drawCareer") = "true" Then
        If chkCareer.Checked = True Then
            Chart_Total.Series.Add("selected_career")
            Chart_Total.Series("selected_career").BorderWidth = 0
            Chart_Total.Series("selected_career").Color = Drawing.Color.Green
            Chart_Total.Series("selected_career").ChartType = DataVisualization.Charting.SeriesChartType.Radar
            Chart_Total.Series("selected_career")("RadarDrawingStyle") = "Line"

            Call changeCareer()
        End If




    End Sub



    Protected Sub GridViewCareer_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewCareer.SelectedIndexChanged

        Dim conn As New SqlClient.SqlConnection("Data Source=172.25.2.64;Initial Catalog=EP;Persist Security Info=True;User ID=ep_client;Password=46709394")
        Dim tmp_da As New SqlClient.SqlDataAdapter("Select top 1 * from CareerPlanning where id=" & Me.GridViewCareer.SelectedValue, conn)
        Dim tmp_ds As New DataSet
        Dim tmp_dr As DataRow

        conn.Open()
        tmp_da.Fill(tmp_ds, "CareerPlanning")
        tmp_da.FillSchema(tmp_ds, SchemaType.Source, "CareerPlanning")
        If tmp_ds.Tables("CareerPlanning").Rows.Count > 0 Then
            tmp_dr = tmp_ds.Tables("CareerPlanning").Rows(0)
            If IsDBNull(tmp_dr("description")) = False Then
                '                Me.Editor1.Content = tmp_dr("description")
            Else
                '               Me.Editor1.Content = ""
            End If

        End If
        conn.Close()

        Chart_Total.Series(GridViewCareer.SelectedRow.Cells(1).Text()).BorderWidth = 6
        Chart_Total.Series(GridViewCareer.SelectedRow.Cells(1).Text())("RadarDrawingStyle") = "Line"

        '        Me.LabelDetail.Visible = True

       

    End Sub

 

   



    Protected Sub DropDownCareer_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles DropDownCareer.SelectedIndexChanged
        Call changeCareer()

    End Sub

    Private Sub changeCareer()

        If MatchList.SelectedIndex >= 0 And chkCareer.Checked = True Then
            SqlDataSource3.SelectCommand = "SELECT * FROM AbilityColor "
            Dim dv_ability As Data.DataView = SqlDataSource3.Select(New DataSourceSelectArguments)

            SqlDataSource7.SelectCommand = "SELECT * FROM CareerAttribute2 where career='" & MatchList.SelectedItem.Text & "'"
            'SqlDataSource7.SelectCommand = "SELECT * FROM CareerAttribute2 where career='" & DropDownCareer.SelectedValue.ToString & "'"
            Dim dv_abilityCareerAtt As Data.DataView = SqlDataSource7.Select(New DataSourceSelectArguments)

            Dim mpi_Attribute(dv_ability.Count - 1) As String
            Dim career_att(dv_ability.Count - 1) As Integer

            Chart_Total.Series("selected_career").BorderWidth = 6

            For i As Integer = 0 To dv_ability.Count - 1
                mpi_Attribute(i) = dv_ability.Item(i).Item("name").ToString   'retrieve attribute name
                career_att(i) = dv_abilityCareerAtt.Item(0).Item(mpi_Attribute(i)).ToString 'retrieve student current attribute total
            Next


            Chart_Total.Series("selected_career").Points.DataBindXY(mpi_Attribute, career_att)


        End If



    End Sub


    Private Sub MatchList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles MatchList.SelectedIndexChanged
        'DropDownCareer.SelectedItem.Text = MatchList.SelectedItem.Text

        Call changeCareer()
        chkCareer.Checked = True

    End Sub



    Protected Sub RadioMatch_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles RadioMatch.SelectedIndexChanged
        loadMatchList()

    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton1.Click
        Response.Redirect("home.aspx")
    End Sub


    Protected Sub DropDownList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles DropDownList1.SelectedIndexChanged

        loadMatchList()

    End Sub


    Private Sub loadMatchList()

        Dim sql2 As String

        If Not DropDownList1.SelectedIndex = 0 Then
            sql2 = "and Industry = '" & Me.DropDownList1.SelectedValue & "' order by Industry "
        Else
            sql2 = " order by Industry "
        End If

        Select Case RadioMatch.SelectedValue
            Case "Current_Status"
                Try
                    SqlDataSource5.SelectCommand = "SELECT sum(Professional_Competence) as Professional_Competence,sum(Leadership) as Leadership,sum(Communication) as Communication ,sum(Creativity) as Creativity,sum(Initiative) as Initiative,sum(Self_Development) as Self_Development,sum(Social_Responsibility) as Social_Responsibility,sum(Language) as Language,sum(IT_Application) as IT_Application FROM CurrentStatus where pess_cod='" & Session("pess_cod") & "'"
                    Dim dv_abilityValueTotal As Data.DataView = SqlDataSource5.Select(New DataSourceSelectArguments)
                    SqlDataSource8.SelectCommand = "select * from careerAttribute2 where Professional_Competence <=" & dv_abilityValueTotal.Item(0).Item(0).ToString & " and Leadership <=" & dv_abilityValueTotal.Item(0).Item(1).ToString & " and Communication <=" & dv_abilityValueTotal.Item(0).Item(2).ToString & " and Creativity <=" & dv_abilityValueTotal.Item(0).Item(3).ToString & " and Initiative <=" & dv_abilityValueTotal.Item(0).Item(4).ToString & " and Self_Development <=" & dv_abilityValueTotal.Item(0).Item(5).ToString & " and Social_Responsibility <=" & dv_abilityValueTotal.Item(0).Item(6).ToString & " and Language <=" & dv_abilityValueTotal.Item(0).Item(7).ToString & " and IT_Application <=" & dv_abilityValueTotal.Item(0).Item(8).ToString & sql2
                    SqlDataSource8.DataBind()
                Catch ex As Exception
                    Return
                End Try

            Case "MPI_Attribute"
                Try
                    SqlDataSource9.SelectCommand = "select Professional_Competence,Leadership,Communication,Creativity,Initiative,Self_Development,Social_Responsibility,Language,IT_Application from categoryWeight where programme='" & Session("school") & "-" & Session("programme") & "'"
                    Dim dv_abilityValueTotal As Data.DataView = SqlDataSource9.Select(New DataSourceSelectArguments)
                    SqlDataSource8.SelectCommand = "select * from careerAttribute2 where Professional_Competence <=" & dv_abilityValueTotal.Item(0).Item(0).ToString & " and Leadership <=" & dv_abilityValueTotal.Item(0).Item(1).ToString & " and Communication <=" & dv_abilityValueTotal.Item(0).Item(2).ToString & " and Creativity <=" & dv_abilityValueTotal.Item(0).Item(3).ToString & " and Initiative <=" & dv_abilityValueTotal.Item(0).Item(4).ToString & " and Self_Development <=" & dv_abilityValueTotal.Item(0).Item(5).ToString & " and Social_Responsibility <=" & dv_abilityValueTotal.Item(0).Item(6).ToString & " and Language <=" & dv_abilityValueTotal.Item(0).Item(7).ToString & " and IT_Application <=" & dv_abilityValueTotal.Item(0).Item(8).ToString & sql2
                    SqlDataSource8.DataBind()
                Catch ex As Exception
                    Return
                End Try


            Case "Graduation_Status"
                Try
                    SqlDataSource9.SelectCommand = "select Professional_Competence,Leadership,Communication,Creativity,Initiative,Self_Development,Social_Responsibility,Language,IT_Application from careerPlanning where pess_cod='" & Session("pess_cod") & "' and careerPlanning <> 'You can start to plan your career here!' order by careerPlanning desc"
                    Dim dv_abilityValueTotal As Data.DataView = SqlDataSource9.Select(New DataSourceSelectArguments)
                    SqlDataSource8.SelectCommand = "select * from careerAttribute2 where Professional_Competence <=" & dv_abilityValueTotal.Item(0).Item(0).ToString & " and Leadership <=" & dv_abilityValueTotal.Item(0).Item(1).ToString & " and Communication <=" & dv_abilityValueTotal.Item(0).Item(2).ToString & " and Creativity <=" & dv_abilityValueTotal.Item(0).Item(3).ToString & " and Initiative <=" & dv_abilityValueTotal.Item(0).Item(4).ToString & " and Self_Development <=" & dv_abilityValueTotal.Item(0).Item(5).ToString & " and Social_Responsibility <=" & dv_abilityValueTotal.Item(0).Item(6).ToString & " and Language <=" & dv_abilityValueTotal.Item(0).Item(7).ToString & " and IT_Application <=" & dv_abilityValueTotal.Item(0).Item(8).ToString & sql2
                    SqlDataSource8.DataBind()
                Catch ex As Exception
                    Return

                End Try

            Case "all"
                Try
                    SqlDataSource9.SelectCommand = "select Professional_Competence,Leadership,Communication,Creativity,Initiative,Self_Development,Social_Responsibility,Language,IT_Application from careerPlanning where pess_cod='" & Session("pess_cod") & "' and careerPlanning <> 'You can start to plan your career here!' order by careerPlanning desc"
                    Dim dv_abilityValueTotal As Data.DataView = SqlDataSource9.Select(New DataSourceSelectArguments)

                    If DropDownList1.SelectedIndex = 0 Then
                        SqlDataSource8.SelectCommand = "select * from careerAttribute2  order by Industry"
                    Else
                        SqlDataSource8.SelectCommand = "select * from careerAttribute2  where Industry = '" & Me.DropDownList1.SelectedValue & "' order by Industry "
                    End If

                    SqlDataSource8.DataBind()
                Catch ex As Exception
                    Return

                End Try

        End Select

        Dim tmp_gv As New GridView
        tmp_gv.DataSource = SqlDataSource8
        tmp_gv.DataBind()
        If tmp_gv.Rows.Count = 0 Then
            MatchResultLable.Text = "No matched result"
        End If

    End Sub

    Private Sub initCategoryList()

        DropDownList1.Items.Add("------- All Categories -------")

        Try
            Dim conn As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("EPConnectionString4").ConnectionString)
            Dim tmp_da As New SqlClient.SqlDataAdapter("SELECT distinct Industry FROM [CareerAttribute2] order by Industry ", conn)
            'Dim tmp_da1 As New SqlClient.SqlDataAdapter("Select top 1 * from CareerPlanning where pess_cod=" & Session("pess_cod"), conn)
            Dim tmp_ds As New DataSet
            Dim tmp_dr As DataRow

            tmp_da.Fill(tmp_ds)


            If tmp_ds.Tables(0).Rows.Count <> 0 Then

                For Each tmp_dr In tmp_ds.Tables(0).Rows
                    DropDownList1.Items.Add(tmp_dr(0))
                Next
            End If

        Catch ex As Exception

        End Try


        DropDownList1.DataBind()


    End Sub

    Protected Sub GridViewCareer_RowUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdatedEventArgs) Handles GridViewCareer.RowUpdated

        loadMatchList()
      
    End Sub
End Class
