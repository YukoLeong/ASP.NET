Imports System.Data
Imports System.Data.SqlClient
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.Control
Imports System.Web.UI.ClientScriptManager

Partial Class Student_JobMatchingSimulation
    Inherits System.Web.UI.Page


    Private Sub Career_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init

        If DesignMode = True Then
            Return
        End If

        'If Not IsPostBack Then
            Dim dv_verify As Data.DataView = SqlDataSource17.Select(New DataSourceSelectArguments)
            Dim dv_verifyStaff As Data.DataView = SqlDataSource18.Select(New DataSourceSelectArguments)
           
        If Session("Role_Type") Is Nothing Then

            Response.Write("<script>alert('Please Log In !'); window.location.href='../home.aspx'; </script>")
            Response.End()
        
        End If


            If Session("Role_Type") = "student" Then
                If dv_verify.Item(0).Item("jms") = "False" Then

                    Response.Write("<script>alert('You do not have Permission to view it !');window.history.back(-1); </script>")

                End If
            End If

            If Session("position") = "studentview" Then
                If dv_verifyStaff.Item(0).Item("jms") = "False" Then

                    Response.Write("<script>alert('You do not have Permission to view it !');window.history.back(-1); </script>")

                End If
            End If

       





        'End If



        Dim conn As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString)
        Dim tmp_da As New SqlClient.SqlDataAdapter("Select * from student_academic_info where ALUN_NUMERO='" & Session("ALUN_NUMERO") & "' and ALUN_NUMERO_SEQ='" & Session("ALUN_NUMERO_SEQ") & "'", conn)
        Dim tmp_da2 As New SqlClient.SqlDataAdapter("Select top 1 * from Learning_Records_Correspond where pess_cod='" & Session("pess_cod") & "'", conn)
        Dim tmp_da3 As New SqlClient.SqlDataAdapter("Select top 1 * from CurrentStatus where pess_cod='" & Session("pess_cod") & "'", conn)
        Dim tmp_ds As New DataSet
        Dim tmp_dr As DataRow
        Dim str As String() = New String() {"."}


        conn.Open()
        tmp_da.Fill(tmp_ds, "student_academic_info")
        tmp_da.FillSchema(tmp_ds, SchemaType.Source, "personal_info")


        If tmp_ds.Tables("student_academic_info").Rows.Count <> 0 Then
            tmp_dr = tmp_ds.Tables("student_academic_info").Rows(0)
            Dim split As String() = tmp_dr("program_composite_code").Split(str, StringSplitOptions.RemoveEmptyEntries)
            Session.Add("programmeCode", split(0))
            Session.Add("school", tmp_dr("school_code"))



        End If

     

        Dim dv_Learning_Experience As Data.DataView = SqlDataSource19.Select(New DataSourceSelectArguments)
        tmp_da2.Fill(tmp_ds, "Learning_Records_Correspond")
        tmp_da2.FillSchema(tmp_ds, SchemaType.Source, "Learning_Records_Correspond")
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




        Dim dv_Learning_Experience_Current As Data.DataView = SqlDataSource19.Select(New DataSourceSelectArguments)
        tmp_da3.Fill(tmp_ds, "CurrentStatus")
        tmp_da3.FillSchema(tmp_ds, SchemaType.Source, "CurrentStatus")
        If tmp_ds.Tables("CurrentStatus").Rows.Count = 0 Then
            pess_cod.Value = Session("pess_cod")

            For i As Integer = 0 To dv_Learning_Experience_Current.Count - 1

                Try
                    Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
                    Using mycon As New SqlConnection(con)
                        mycon.Open()
                        Dim strSQL As String = "insert into CurrentStatus(pess_cod,experience_id,Professional_Competence,Leadership,Communication,Creativity,Initiative,Self_Development,Social_Responsibility,Language,IT_Application)values(@pess_cod,@experience_id,@professional,@leadership,@communication,@expression,@initiative,@self_enhancement,@civil_responsibility,@language,@it_application);"

                        Using cmd As New SqlCommand()
                            cmd.Connection = mycon
                            cmd.CommandText = strSQL
                            cmd.Parameters.AddWithValue("@pess_cod", pess_cod.Value)
                            cmd.Parameters.AddWithValue("@experience_id", dv_Learning_Experience_Current.Item(i).Item("id"))
                            cmd.Parameters.AddWithValue("@professional", "0")
                            cmd.Parameters.AddWithValue("@leadership", "0")
                            cmd.Parameters.AddWithValue("@communication", "0")
                            cmd.Parameters.AddWithValue("@expression", "0")
                            cmd.Parameters.AddWithValue("@initiative", "0")
                            cmd.Parameters.AddWithValue("@self_enhancement", "0")
                            cmd.Parameters.AddWithValue("@civil_responsibility", "0")
                            cmd.Parameters.AddWithValue("@language", "0")
                            cmd.Parameters.AddWithValue("@it_application", "0")
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

        Call initCategoryList()


    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    
        If IsPostBack = False Then
        If Session("Role_Type") Is Nothing Then

            Response.Write("<script>alert('Please Log In !'); window.location.href='../home.aspx'; </script>")
            Exit Sub
        End If
        If Session("Role_Type") = "student" Then
            Button1.Visible = True

        Else
            Button1.Visible = False
        End If
            showChart()

        End If
    End Sub

    Private Sub showChart()

        Dim dv_learningExperience As Data.DataView = SqlDataSource11.Select(New DataSourceSelectArguments)

        Dim dv_learningAttribute As Data.DataView = SqlDataSource13.Select(New DataSourceSelectArguments)

        Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString



        Using mycon As New SqlConnection(con)
            mycon.Open()
            For i As Integer = 0 To dv_learningAttribute.Count - 1
                Dim strSQL As String = "update CurrentStatus set Professional_Competence=@professional,Leadership=@leadership,Communication=@communication,Creativity=@expression,Initiative=@initiative,Self_Development=@self_enhancement,Social_Responsibility=@civil_responsibility,Language=@language,IT_Application=@it_application where experience_id='" & dv_learningAttribute.Item(i).Item("experience_id") & "' and pess_cod='" & Session("pess_cod") & "'"
                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL
                    cmd.Parameters.AddWithValue("@professional", dv_learningAttribute.Item(i).Item("Professional_Competence") * (-dv_learningExperience.Item(i).Item("count")))
                    cmd.Parameters.AddWithValue("@leadership", dv_learningAttribute.Item(i).Item("Leadership") * (-dv_learningExperience.Item(i).Item("count")))
                    cmd.Parameters.AddWithValue("@communication", dv_learningAttribute.Item(i).Item("Communication") * (-dv_learningExperience.Item(i).Item("count")))
                    cmd.Parameters.AddWithValue("@expression", dv_learningAttribute.Item(i).Item("Creativity") * (-dv_learningExperience.Item(i).Item("count")))
                    cmd.Parameters.AddWithValue("@initiative", dv_learningAttribute.Item(i).Item("Initiative") * (-dv_learningExperience.Item(i).Item("count")))
                    cmd.Parameters.AddWithValue("@self_enhancement", dv_learningAttribute.Item(i).Item("Self_Development") * (-dv_learningExperience.Item(i).Item("count")))
                    cmd.Parameters.AddWithValue("@civil_responsibility", dv_learningAttribute.Item(i).Item("Social_Responsibility") * (-dv_learningExperience.Item(i).Item("count")))
                    cmd.Parameters.AddWithValue("@language", dv_learningAttribute.Item(i).Item("Language") * (-dv_learningExperience.Item(i).Item("count")))
                    cmd.Parameters.AddWithValue("@it_application", dv_learningAttribute.Item(i).Item("IT_Application") * (-dv_learningExperience.Item(i).Item("count")))
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

        SqlDataSource9.SelectCommand = "select * from categoryWeight where programme='" & Session("school") & "_" & Session("programmeCode") & "'"
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
        SqlDataSource4.SelectCommand = "SELECT careerPlanning,Professional_Competence,Leadership,Communication,Creativity,Initiative,Self_Development,Social_Responsibility,Language,IT_Application FROM CareerPlanning where pess_cod='" & Session("pess_cod") & "' order by careerPlanning desc"
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
            Chart_Total.Series.Add("Current Status")
            Chart_Total.Series("Current Status").BorderWidth = 6
            Chart_Total.Series("Current Status").Color = Drawing.Color.Yellow
            Chart_Total.Series("Current Status").ChartType = DataVisualization.Charting.SeriesChartType.Radar
            Chart_Total.Series("Current Status")("RadarDrawingStyle") = "Line"
            Chart_Total.Series("Current Status").Points.DataBindXY(mpi_Attribute, student_att_total)
        End If

        If chkMPIattribute.Checked = True And dv_attributeProg.Count <> 0 Then

            Chart_Total.Series.Add("Current Program")
            Chart_Total.Series("Current Program").BorderWidth = 6
            Chart_Total.Series("Current Program").Color = Drawing.Color.YellowGreen
            Chart_Total.Series("Current Program").ChartType = DataVisualization.Charting.SeriesChartType.Radar
            Chart_Total.Series("Current Program")("RadarDrawingStyle") = "Line"
            Chart_Total.Series("Current Program").Points.DataBindXY(mpi_Attribute, prog_Attribute)
        End If

        If chkCareer.Checked = True Then
            Chart_Total.Series.Add("Selected Career")
            Chart_Total.Series("Selected Career").BorderWidth = 0
            Chart_Total.Series("Selected Career").Color = Drawing.Color.Green
            Chart_Total.Series("Selected Career").ChartType = DataVisualization.Charting.SeriesChartType.Radar
            Chart_Total.Series("Selected Career")("RadarDrawingStyle") = "Line"

            Call changeCareer()
        End If

    End Sub

    Protected Sub GridViewCareer_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewCareer.SelectedIndexChanged

        Dim conn As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString)
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




    Private Sub changeCareer()

        If MatchList.SelectedIndex >= 0 And chkCareer.Checked = True Then
            SqlDataSource3.SelectCommand = "SELECT * FROM AttributeColor "
            Dim dv_ability As Data.DataView = SqlDataSource3.Select(New DataSourceSelectArguments)

            ' SqlDataSource7.SelectCommand = "SELECT * FROM CareerForm where CareerFormID='" & MatchList.SelectedItem.Text & "'"
            SqlDataSource7.SelectCommand = "SELECT * FROM CareerForm where CareerFormID='" & MatchList.SelectedValue & "'"
            'SqlDataSource7.SelectCommand = "SELECT * FROM CareerAttribute where career='" & DropDownCareer.SelectedValue.ToString & "'"
            Dim dv_abilityCareerAtt As Data.DataView = SqlDataSource7.Select(New DataSourceSelectArguments)

            Dim mpi_Attribute(dv_ability.Count - 1) As String
            Dim career_att(dv_ability.Count - 1) As Integer

            Chart_Total.Series("Selected Career").BorderWidth = 6

            For i As Integer = 0 To dv_ability.Count - 1
                mpi_Attribute(i) = dv_ability.Item(i).Item("name").ToString   'retrieve attribute name
                career_att(i) = dv_abilityCareerAtt.Item(0).Item(mpi_Attribute(i)).ToString 'retrieve student current attribute total
            Next


            Chart_Total.Series("Selected Career").Points.DataBindXY(mpi_Attribute, career_att)


        End If



    End Sub


    Private Sub MatchList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles MatchList.SelectedIndexChanged
        'DropDownCareer.SelectedItem.Text = MatchList.SelectedItem.Text
        showChart()
        Call changeCareer()



    End Sub



    Protected Sub RadioMatch_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles RadioMatch.SelectedIndexChanged
        showChart()
        loadMatchList()

    End Sub

    'Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton1.Click
    '   If Session("Role_Type") = "student" Then
    '        Response.Redirect("home.aspx")
    '    End If

    '    If Session("Role_Type") = "teacher" Or Session("Role_Type") = "tutor" Or Session("Role_Type") = "coordinator" Or Session("Role_Type") = "director" Then
    '        Response.Redirect("schoolStaff.aspx")
    '    End If

    '        Response.Write("<script>alert('Please Log In !'); window.location.href='../login.aspx'; </script>")

    'End Sub

    Protected Sub ImageButton2_Click1(sender As Object, e As ImageClickEventArgs) Handles ImageButton2.Click
        If Session("Role_Type") = "student" Then
            Response.Redirect("home.aspx")
        End If

        If Session("Role_Type") = "teacher" Or Session("Role_Type") = "tutor" Or Session("Role_Type") = "coordinator" Or Session("Role_Type") = "director" Then
            Response.Redirect("schoolStaff.aspx")
        End If

        Response.Write("<script>alert('Please Log In !'); window.location.href='../home.aspx'; </script>")
    End Sub

    Private Sub loadMatchList()

        Dim sql2 As String

        If Not DropDownList1.SelectedIndex = 0 Then
            sql2 = "and Industry = '" & Me.DropDownList1.SelectedValue & "' and IsApproval='1' order by Industry "
        Else
            sql2 = " and IsApproval='1' order by Industry "
        End If

        Select Case RadioMatch.SelectedValue
            Case "Current_Status"
                Try
                    SqlDataSource5.SelectCommand = "SELECT sum(Professional_Competence) as Professional_Competence,sum(Leadership) as Leadership,sum(Communication) as Communication ,sum(Creativity) as Creativity,sum(Initiative) as Initiative,sum(Self_Development) as Self_Development,sum(Social_Responsibility) as Social_Responsibility,sum(Language) as Language,sum(IT_Application) as IT_Application FROM CurrentStatus where pess_cod='" & Session("pess_cod") & "'"
                    Dim dv_abilityValueTotal As Data.DataView = SqlDataSource5.Select(New DataSourceSelectArguments)
                    SqlDataSource8.SelectCommand = "select * from CareerForm where Professional_Competence <=" & dv_abilityValueTotal.Item(0).Item(0).ToString & " and Leadership <=" & dv_abilityValueTotal.Item(0).Item(1).ToString & " and Communication <=" & dv_abilityValueTotal.Item(0).Item(2).ToString & " and Creativity <=" & dv_abilityValueTotal.Item(0).Item(3).ToString & " and Initiative <=" & dv_abilityValueTotal.Item(0).Item(4).ToString & " and Self_Development <=" & dv_abilityValueTotal.Item(0).Item(5).ToString & " and Social_Responsibility <=" & dv_abilityValueTotal.Item(0).Item(6).ToString & " and Language <=" & dv_abilityValueTotal.Item(0).Item(7).ToString & " and IT_Application <=" & dv_abilityValueTotal.Item(0).Item(8).ToString & sql2
                    SqlDataSource8.DataBind()
                Catch ex As Exception
                    Return
                End Try

            Case "MPI_Attribute"
                Try
                    SqlDataSource9.SelectCommand = "select Professional_Competence,Leadership,Communication,Creativity,Initiative,Self_Development,Social_Responsibility,Language,IT_Application from categoryWeight where programme='" & Session("school") & "_" & Session("programmeCode") & "'"
                    Dim dv_abilityValueTotal As Data.DataView = SqlDataSource9.Select(New DataSourceSelectArguments)
                    SqlDataSource8.SelectCommand = "select * from CareerForm where Professional_Competence <=" & dv_abilityValueTotal.Item(0).Item(0).ToString & " and Leadership <=" & dv_abilityValueTotal.Item(0).Item(1).ToString & " and Communication <=" & dv_abilityValueTotal.Item(0).Item(2).ToString & " and Creativity <=" & dv_abilityValueTotal.Item(0).Item(3).ToString & " and Initiative <=" & dv_abilityValueTotal.Item(0).Item(4).ToString & " and Self_Development <=" & dv_abilityValueTotal.Item(0).Item(5).ToString & " and Social_Responsibility <=" & dv_abilityValueTotal.Item(0).Item(6).ToString & " and Language <=" & dv_abilityValueTotal.Item(0).Item(7).ToString & " and IT_Application <=" & dv_abilityValueTotal.Item(0).Item(8).ToString & sql2
                    SqlDataSource8.DataBind()
                Catch ex As Exception
                    Return
                End Try


            Case "Graduation_Status"
                Try
                    SqlDataSource9.SelectCommand = "select Professional_Competence,Leadership,Communication,Creativity,Initiative,Self_Development,Social_Responsibility,Language,IT_Application from careerPlanning where pess_cod='" & Session("pess_cod") & "' and careerPlanning <> 'You can start to plan your career here!' order by careerPlanning desc"
                    Dim dv_abilityValueTotal As Data.DataView = SqlDataSource9.Select(New DataSourceSelectArguments)
                    SqlDataSource8.SelectCommand = "select * from CareerForm where Professional_Competence <=" & dv_abilityValueTotal.Item(0).Item(0).ToString & " and Leadership <=" & dv_abilityValueTotal.Item(0).Item(1).ToString & " and Communication <=" & dv_abilityValueTotal.Item(0).Item(2).ToString & " and Creativity <=" & dv_abilityValueTotal.Item(0).Item(3).ToString & " and Initiative <=" & dv_abilityValueTotal.Item(0).Item(4).ToString & " and Self_Development <=" & dv_abilityValueTotal.Item(0).Item(5).ToString & " and Social_Responsibility <=" & dv_abilityValueTotal.Item(0).Item(6).ToString & " and Language <=" & dv_abilityValueTotal.Item(0).Item(7).ToString & " and IT_Application <=" & dv_abilityValueTotal.Item(0).Item(8).ToString & sql2
                    SqlDataSource8.DataBind()
                Catch ex As Exception
                    Return

                End Try

            Case "all"
                Try
                    SqlDataSource9.SelectCommand = "select Professional_Competence,Leadership,Communication,Creativity,Initiative,Self_Development,Social_Responsibility,Language,IT_Application from careerPlanning where pess_cod='" & Session("pess_cod") & "' and careerPlanning <> 'You can start to plan your career here!' order by careerPlanning desc"
                    Dim dv_abilityValueTotal As Data.DataView = SqlDataSource9.Select(New DataSourceSelectArguments)

                    If DropDownList1.SelectedIndex = 0 Then
                        SqlDataSource8.SelectCommand = "select * from CareerForm where IsApproval='1' order by Industry"
                    Else
                        SqlDataSource8.SelectCommand = "select * from CareerForm where Industry = '" & Me.DropDownList1.SelectedValue & "' and IsApproval='1' order by Industry  "
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
            Dim conn As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString)
            Dim tmp_da As New SqlClient.SqlDataAdapter("SELECT distinct Industry FROM [CareerForm]  where IsApproval='1' order by Industry ", conn)

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
        showChart()
        loadMatchList()
     
    End Sub

  
    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click
        MultiView1.ActiveViewIndex = 0
        showChart()
        loadMatchList()

    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        Try
            Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
            Using mycon As New SqlConnection(con)
                mycon.Open()
                Dim strSQL As String = "insert into CareerPlanning (pess_cod,careerPlanning,Professional_Competence,Leadership,Communication,Creativity,Initiative,Self_Development,Social_Responsibility,Language,IT_Application)values(@pess_cod,@careerPlanning,@Professional_Competence,@Leadership,@Communication,@Creativity,@Initiative,@Self_Development,@Social_Responsibility,@Language,@IT_Application);"

                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL
                    cmd.Parameters.AddWithValue("@pess_cod", Session("pess_cod"))
                    cmd.Parameters.AddWithValue("@careerPlanning", TextBox1.Text)
                    cmd.Parameters.AddWithValue("@Professional_Competence", TextBox2.Text)
                    cmd.Parameters.AddWithValue("@Leadership", TextBox3.Text)
                    cmd.Parameters.AddWithValue("@Communication", TextBox4.Text)
                    cmd.Parameters.AddWithValue("@Creativity", TextBox5.Text)
                    cmd.Parameters.AddWithValue("@Initiative", TextBox6.Text)
                    cmd.Parameters.AddWithValue("@Self_Development", TextBox7.Text)
                    cmd.Parameters.AddWithValue("@Social_Responsibility", TextBox8.Text)
                    cmd.Parameters.AddWithValue("@Language", TextBox9.Text)
                    cmd.Parameters.AddWithValue("@IT_Application", TextBox10.Text)
                    cmd.ExecuteNonQuery()
                End Using
                mycon.Close()
            End Using
        Catch ex As Exception

            Response.Write("<script>alert('Insert Error!')</script>")

            Return
        End Try
        MultiView1.ActiveViewIndex = 0
        GridViewCareer.DataBind()
        showChart()
        loadMatchList()

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        MultiView1.ActiveViewIndex = 1
        TextBox1.Text = ""
        TextBox2.Text = ""
        TextBox3.Text = ""
        TextBox4.Text = ""
        TextBox5.Text = ""
        TextBox6.Text = ""
        TextBox7.Text = ""
        TextBox8.Text = ""
        TextBox9.Text = ""
        TextBox10.Text = ""
        TextBox1.Focus()
        showChart()
        loadMatchList()

    End Sub

    Protected Sub GridViewCareer_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GridViewCareer.RowCommand
        If e.CommandName = "Cancel" Then
            showChart()
            loadMatchList()
        End If
    End Sub

    Protected Sub GridViewCareer_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GridViewCareer.RowDeleting
        If (message.Value = "No") Then
            e.Cancel = True
            showChart()
            loadMatchList()

            Return
        End If
       

    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList1.SelectedIndexChanged
        showChart()
        loadMatchList()

    End Sub

    Protected Sub GridViewCareer_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles GridViewCareer.RowEditing
        showChart()
        loadMatchList()

    End Sub

   

    Protected Sub chkStatus_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkStatus.CheckedChanged
        Dim dv_learningExperience As Data.DataView = SqlDataSource11.Select(New DataSourceSelectArguments)

        Dim dv_learningAttribute As Data.DataView = SqlDataSource13.Select(New DataSourceSelectArguments)

        Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString



        Using mycon As New SqlConnection(con)
            mycon.Open()
            For i As Integer = 0 To dv_learningAttribute.Count - 1
                Dim strSQL As String = "update CurrentStatus set Professional_Competence=@professional,Leadership=@leadership,Communication=@communication,Creativity=@expression,Initiative=@initiative,Self_Development=@self_enhancement,Social_Responsibility=@civil_responsibility,Language=@language,IT_Application=@it_application where experience_id='" & dv_learningAttribute.Item(i).Item("experience_id") & "' and pess_cod='" & Session("pess_cod") & "'"
                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL
                    cmd.Parameters.AddWithValue("@professional", dv_learningAttribute.Item(i).Item("Professional_Competence") * (-dv_learningExperience.Item(i).Item("count")))
                    cmd.Parameters.AddWithValue("@leadership", dv_learningAttribute.Item(i).Item("Leadership") * (-dv_learningExperience.Item(i).Item("count")))
                    cmd.Parameters.AddWithValue("@communication", dv_learningAttribute.Item(i).Item("Communication") * (-dv_learningExperience.Item(i).Item("count")))
                    cmd.Parameters.AddWithValue("@expression", dv_learningAttribute.Item(i).Item("Creativity") * (-dv_learningExperience.Item(i).Item("count")))
                    cmd.Parameters.AddWithValue("@initiative", dv_learningAttribute.Item(i).Item("Initiative") * (-dv_learningExperience.Item(i).Item("count")))
                    cmd.Parameters.AddWithValue("@self_enhancement", dv_learningAttribute.Item(i).Item("Self_Development") * (-dv_learningExperience.Item(i).Item("count")))
                    cmd.Parameters.AddWithValue("@civil_responsibility", dv_learningAttribute.Item(i).Item("Social_Responsibility") * (-dv_learningExperience.Item(i).Item("count")))
                    cmd.Parameters.AddWithValue("@language", dv_learningAttribute.Item(i).Item("Language") * (-dv_learningExperience.Item(i).Item("count")))
                    cmd.Parameters.AddWithValue("@it_application", dv_learningAttribute.Item(i).Item("IT_Application") * (-dv_learningExperience.Item(i).Item("count")))
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

        SqlDataSource9.SelectCommand = "select * from categoryWeight where programme='" & Session("school") & "_" & Session("programmeCode") & "'"
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
        SqlDataSource4.SelectCommand = "SELECT careerPlanning,Professional_Competence,Leadership,Communication,Creativity,Initiative,Self_Development,Social_Responsibility,Language,IT_Application FROM CareerPlanning where pess_cod='" & Session("pess_cod") & "' order by careerPlanning desc"
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
            Chart_Total.Series.Add("Current Status")
            Chart_Total.Series("Current Status").BorderWidth = 6
            Chart_Total.Series("Current Status").Color = Drawing.Color.Yellow
            Chart_Total.Series("Current Status").ChartType = DataVisualization.Charting.SeriesChartType.Radar
            Chart_Total.Series("Current Status")("RadarDrawingStyle") = "Line"
            Chart_Total.Series("Current Status").Points.DataBindXY(mpi_Attribute, student_att_total)
        End If

        If chkMPIattribute.Checked = True And dv_attributeProg.Count <> 0 Then

            Chart_Total.Series.Add("Current Program")
            Chart_Total.Series("Current Program").BorderWidth = 6
            Chart_Total.Series("Current Program").Color = Drawing.Color.YellowGreen
            Chart_Total.Series("Current Program").ChartType = DataVisualization.Charting.SeriesChartType.Radar
            Chart_Total.Series("Current Program")("RadarDrawingStyle") = "Line"
            Chart_Total.Series("Current Program").Points.DataBindXY(mpi_Attribute, prog_Attribute)
        End If

        If chkCareer.Checked = True Then
            Chart_Total.Series.Add("Selected Career")
            Chart_Total.Series("Selected Career").BorderWidth = 0
            Chart_Total.Series("Selected Career").Color = Drawing.Color.Green
            Chart_Total.Series("Selected Career").ChartType = DataVisualization.Charting.SeriesChartType.Radar
            Chart_Total.Series("Selected Career")("RadarDrawingStyle") = "Line"

            Call changeCareer()
        End If

    End Sub

    Protected Sub chkMPIattribute_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkMPIattribute.CheckedChanged

        Dim dv_learningExperience As Data.DataView = SqlDataSource11.Select(New DataSourceSelectArguments)

        Dim dv_learningAttribute As Data.DataView = SqlDataSource13.Select(New DataSourceSelectArguments)

        Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString



        Using mycon As New SqlConnection(con)
            mycon.Open()
            For i As Integer = 0 To dv_learningAttribute.Count - 1
                Dim strSQL As String = "update CurrentStatus set Professional_Competence=@professional,Leadership=@leadership,Communication=@communication,Creativity=@expression,Initiative=@initiative,Self_Development=@self_enhancement,Social_Responsibility=@civil_responsibility,Language=@language,IT_Application=@it_application where experience_id='" & dv_learningAttribute.Item(i).Item("experience_id") & "' and pess_cod='" & Session("pess_cod") & "'"
                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL
                    cmd.Parameters.AddWithValue("@professional", dv_learningAttribute.Item(i).Item("Professional_Competence") * (-dv_learningExperience.Item(i).Item("count")))
                    cmd.Parameters.AddWithValue("@leadership", dv_learningAttribute.Item(i).Item("Leadership") * (-dv_learningExperience.Item(i).Item("count")))
                    cmd.Parameters.AddWithValue("@communication", dv_learningAttribute.Item(i).Item("Communication") * (-dv_learningExperience.Item(i).Item("count")))
                    cmd.Parameters.AddWithValue("@expression", dv_learningAttribute.Item(i).Item("Creativity") * (-dv_learningExperience.Item(i).Item("count")))
                    cmd.Parameters.AddWithValue("@initiative", dv_learningAttribute.Item(i).Item("Initiative") * (-dv_learningExperience.Item(i).Item("count")))
                    cmd.Parameters.AddWithValue("@self_enhancement", dv_learningAttribute.Item(i).Item("Self_Development") * (-dv_learningExperience.Item(i).Item("count")))
                    cmd.Parameters.AddWithValue("@civil_responsibility", dv_learningAttribute.Item(i).Item("Social_Responsibility") * (-dv_learningExperience.Item(i).Item("count")))
                    cmd.Parameters.AddWithValue("@language", dv_learningAttribute.Item(i).Item("Language") * (-dv_learningExperience.Item(i).Item("count")))
                    cmd.Parameters.AddWithValue("@it_application", dv_learningAttribute.Item(i).Item("IT_Application") * (-dv_learningExperience.Item(i).Item("count")))
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

        SqlDataSource9.SelectCommand = "select * from categoryWeight where programme='" & Session("school") & "_" & Session("programmeCode") & "'"
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
        SqlDataSource4.SelectCommand = "SELECT careerPlanning,Professional_Competence,Leadership,Communication,Creativity,Initiative,Self_Development,Social_Responsibility,Language,IT_Application FROM CareerPlanning where pess_cod='" & Session("pess_cod") & "' order by careerPlanning desc"
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
            Chart_Total.Series.Add("Current Status")
            Chart_Total.Series("Current Status").BorderWidth = 6
            Chart_Total.Series("Current Status").Color = Drawing.Color.Yellow
            Chart_Total.Series("Current Status").ChartType = DataVisualization.Charting.SeriesChartType.Radar
            Chart_Total.Series("Current Status")("RadarDrawingStyle") = "Line"
            Chart_Total.Series("Current Status").Points.DataBindXY(mpi_Attribute, student_att_total)
        End If

        If chkMPIattribute.Checked = True And dv_attributeProg.Count <> 0 Then

            Chart_Total.Series.Add("Current Program")
            Chart_Total.Series("Current Program").BorderWidth = 6
            Chart_Total.Series("Current Program").Color = Drawing.Color.YellowGreen
            Chart_Total.Series("Current Program").ChartType = DataVisualization.Charting.SeriesChartType.Radar
            Chart_Total.Series("Current Program")("RadarDrawingStyle") = "Line"
            Chart_Total.Series("Current Program").Points.DataBindXY(mpi_Attribute, prog_Attribute)
        End If

        If chkCareer.Checked = True Then
            Chart_Total.Series.Add("Selected Career")
            Chart_Total.Series("Selected Career").BorderWidth = 0
            Chart_Total.Series("Selected Career").Color = Drawing.Color.Green
            Chart_Total.Series("Selected Career").ChartType = DataVisualization.Charting.SeriesChartType.Radar
            Chart_Total.Series("Selected Career")("RadarDrawingStyle") = "Line"

            Call changeCareer()
        End If

    End Sub

    Protected Sub chkCareer_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkCareer.CheckedChanged
        Dim dv_learningExperience As Data.DataView = SqlDataSource11.Select(New DataSourceSelectArguments)

        Dim dv_learningAttribute As Data.DataView = SqlDataSource13.Select(New DataSourceSelectArguments)

        Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString



        Using mycon As New SqlConnection(con)
            mycon.Open()
            For i As Integer = 0 To dv_learningAttribute.Count - 1
                Dim strSQL As String = "update CurrentStatus set Professional_Competence=@professional,Leadership=@leadership,Communication=@communication,Creativity=@expression,Initiative=@initiative,Self_Development=@self_enhancement,Social_Responsibility=@civil_responsibility,Language=@language,IT_Application=@it_application where experience_id='" & dv_learningAttribute.Item(i).Item("experience_id") & "' and pess_cod='" & Session("pess_cod") & "'"
                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL
                    cmd.Parameters.AddWithValue("@professional", dv_learningAttribute.Item(i).Item("Professional_Competence") * (-dv_learningExperience.Item(i).Item("count")))
                    cmd.Parameters.AddWithValue("@leadership", dv_learningAttribute.Item(i).Item("Leadership") * (-dv_learningExperience.Item(i).Item("count")))
                    cmd.Parameters.AddWithValue("@communication", dv_learningAttribute.Item(i).Item("Communication") * (-dv_learningExperience.Item(i).Item("count")))
                    cmd.Parameters.AddWithValue("@expression", dv_learningAttribute.Item(i).Item("Creativity") * (-dv_learningExperience.Item(i).Item("count")))
                    cmd.Parameters.AddWithValue("@initiative", dv_learningAttribute.Item(i).Item("Initiative") * (-dv_learningExperience.Item(i).Item("count")))
                    cmd.Parameters.AddWithValue("@self_enhancement", dv_learningAttribute.Item(i).Item("Self_Development") * (-dv_learningExperience.Item(i).Item("count")))
                    cmd.Parameters.AddWithValue("@civil_responsibility", dv_learningAttribute.Item(i).Item("Social_Responsibility") * (-dv_learningExperience.Item(i).Item("count")))
                    cmd.Parameters.AddWithValue("@language", dv_learningAttribute.Item(i).Item("Language") * (-dv_learningExperience.Item(i).Item("count")))
                    cmd.Parameters.AddWithValue("@it_application", dv_learningAttribute.Item(i).Item("IT_Application") * (-dv_learningExperience.Item(i).Item("count")))
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

        SqlDataSource9.SelectCommand = "select * from categoryWeight where programme='" & Session("school") & "_" & Session("programmeCode") & "'"
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
        SqlDataSource4.SelectCommand = "SELECT careerPlanning,Professional_Competence,Leadership,Communication,Creativity,Initiative,Self_Development,Social_Responsibility,Language,IT_Application FROM CareerPlanning where pess_cod='" & Session("pess_cod") & "' order by careerPlanning desc"
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
            Chart_Total.Series.Add("Current Status")
            Chart_Total.Series("Current Status").BorderWidth = 6
            Chart_Total.Series("Current Status").Color = Drawing.Color.Yellow
            Chart_Total.Series("Current Status").ChartType = DataVisualization.Charting.SeriesChartType.Radar
            Chart_Total.Series("Current Status")("RadarDrawingStyle") = "Line"
            Chart_Total.Series("Current Status").Points.DataBindXY(mpi_Attribute, student_att_total)
        End If

        If chkMPIattribute.Checked = True And dv_attributeProg.Count <> 0 Then

            Chart_Total.Series.Add("Current Program")
            Chart_Total.Series("Current Program").BorderWidth = 6
            Chart_Total.Series("Current Program").Color = Drawing.Color.YellowGreen
            Chart_Total.Series("Current Program").ChartType = DataVisualization.Charting.SeriesChartType.Radar
            Chart_Total.Series("Current Program")("RadarDrawingStyle") = "Line"
            Chart_Total.Series("Current Program").Points.DataBindXY(mpi_Attribute, prog_Attribute)
        End If

        If chkCareer.Checked = True Then
            Chart_Total.Series.Add("Selected Career")
            Chart_Total.Series("Selected Career").BorderWidth = 0
            Chart_Total.Series("Selected Career").Color = Drawing.Color.Green
            Chart_Total.Series("Selected Career").ChartType = DataVisualization.Charting.SeriesChartType.Radar
            Chart_Total.Series("Selected Career")("RadarDrawingStyle") = "Line"

            Call changeCareer()
        End If
    End Sub

    Protected Sub GridViewCareer_RowDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeletedEventArgs) Handles GridViewCareer.RowDeleted
        showChart()
        loadMatchList()

    End Sub
End Class

