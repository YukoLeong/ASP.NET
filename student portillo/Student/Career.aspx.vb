Imports System.Data.SqlClient

Public Class Career
    Inherits System.Web.UI.Page

    Private Sub Career_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init

        If DesignMode = True Then
            Return
        End If

        If Session("pess_cod") Is Nothing Then

            MsgBox("please login in")

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

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
       

        Dim dv_seminarAttribute As Data.DataView = SqlDataSource10.Select(New DataSourceSelectArguments)
        Dim dv_seminar As Data.DataView = SqlDataSource11.Select(New DataSourceSelectArguments)
        Dim dv_seminarAbility As Data.DataView = SqlDataSource12.Select(New DataSourceSelectArguments)
        Dim dv_seminarName As Data.DataView = SqlDataSource13.Select(New DataSourceSelectArguments)
        Dim dv_otherAttribute As Data.DataView = SqlDataSource14.Select(New DataSourceSelectArguments)
        Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString1").ConnectionString
        Using mycon As New SqlConnection(con)
            mycon.Open()


            Dim strSQL As String = "update CurrentStatus set professional=@professional,leadership=@leadership,communication=@communication,comprehension=@comprehension,expression=@expression,initiative=@initiative,self_enhancement=@self_enhancement,civil_responsibility=@civil_responsibility,language=@language,it_application=@it_application where act='Seminar_Conference'and pess_cod=" & Session("pess_cod")

            Using cmd As New SqlCommand()
                cmd.Connection = mycon
                cmd.CommandText = strSQL
                cmd.Parameters.AddWithValue("@professional", dv_seminarAttribute.Item(0).Item("professional") * (-dv_seminar.Item(0).Item("Seminar_Conference")))
                cmd.Parameters.AddWithValue("@leadership", dv_seminarAttribute.Item(0).Item("leadership") * (-dv_seminar.Item(0).Item("Seminar_Conference")))
                cmd.Parameters.AddWithValue("@communication", dv_seminarAttribute.Item(0).Item("communication") * (-dv_seminar.Item(0).Item("Seminar_Conference")))
                cmd.Parameters.AddWithValue("@comprehension", dv_seminarAttribute.Item(0).Item("comprehension") * (-dv_seminar.Item(0).Item("Seminar_Conference")))
                cmd.Parameters.AddWithValue("@expression", dv_seminarAttribute.Item(0).Item("expression") * (-dv_seminar.Item(0).Item("Seminar_Conference")))
                cmd.Parameters.AddWithValue("@initiative", dv_seminarAttribute.Item(0).Item("initiative") * (-dv_seminar.Item(0).Item("Seminar_Conference")))
                cmd.Parameters.AddWithValue("@self_enhancement", dv_seminarAttribute.Item(0).Item("self_enhancement") * (-dv_seminar.Item(0).Item("Seminar_Conference")))
                cmd.Parameters.AddWithValue("@civil_responsibility", dv_seminarAttribute.Item(0).Item("civil_responsibility") * (-dv_seminar.Item(0).Item("Seminar_Conference")))
                cmd.Parameters.AddWithValue("@language", dv_seminarAttribute.Item(0).Item("language") * (-dv_seminar.Item(0).Item("Seminar_Conference")))
                cmd.Parameters.AddWithValue("@it_application", dv_seminarAttribute.Item(0).Item("it_application") * (-dv_seminar.Item(0).Item("Seminar_Conference")))

                cmd.ExecuteNonQuery()

            End Using


            mycon.Close()


        End Using


        Using mycon1 As New SqlConnection(con)
            mycon1.Open()
            For i As Integer = 1 To dv_seminarName.Count - 1
                Dim strSQL1 As String = "update CurrentStatus set professional=@professional,leadership=@leadership,communication=@communication,comprehension=@comprehension,expression=@expression,initiative=@initiative,self_enhancement=@self_enhancement,civil_responsibility=@civil_responsibility,language=@language,it_application=@it_application where act='" & dv_seminarName.Item(i).Item("experience_name") & "' and pess_cod=" & Session("pess_cod")
                Using cmd As New SqlCommand()
                    cmd.Connection = mycon1
                    cmd.CommandText = strSQL1
                    cmd.Parameters.AddWithValue("@professional", dv_otherAttribute.Item(i - 1).Item("professional") * (-dv_seminar.Item(0).Item(i)))
                    cmd.Parameters.AddWithValue("@leadership", dv_otherAttribute.Item(i - 1).Item("leadership") * (-dv_seminar.Item(0).Item(i)))
                    cmd.Parameters.AddWithValue("@communication", dv_otherAttribute.Item(i - 1).Item("communication") * (-dv_seminar.Item(0).Item(i)))
                    cmd.Parameters.AddWithValue("@comprehension", dv_otherAttribute.Item(i - 1).Item("comprehension") * (-dv_seminar.Item(0).Item(i)))
                    cmd.Parameters.AddWithValue("@expression", dv_otherAttribute.Item(i - 1).Item("expression") * (-dv_seminar.Item(0).Item(i)))
                    cmd.Parameters.AddWithValue("@initiative", dv_otherAttribute.Item(i - 1).Item("initiative") * (-dv_seminar.Item(0).Item(i)))
                    cmd.Parameters.AddWithValue("@self_enhancement", dv_otherAttribute.Item(i - 1).Item("self_enhancement") * (-dv_seminar.Item(0).Item(i)))
                    cmd.Parameters.AddWithValue("@civil_responsibility", dv_otherAttribute.Item(i - 1).Item("civil_responsibility") * (-dv_seminar.Item(0).Item(i)))
                    cmd.Parameters.AddWithValue("@language", dv_otherAttribute.Item(i - 1).Item("language") * (-dv_seminar.Item(0).Item(i)))
                    cmd.Parameters.AddWithValue("@it_application", dv_otherAttribute.Item(i - 1).Item("it_application") * (-dv_seminar.Item(0).Item(i)))

                    cmd.ExecuteNonQuery()

                End Using
            Next
            mycon1.Close()


        End Using






        SqlDataSource3.SelectCommand = "SELECT * FROM Ability "

        Dim dv_ability As Data.DataView = SqlDataSource3.Select(New DataSourceSelectArguments)

        Dim mpi_Attribute(dv_ability.Count - 1) As String
        Dim mpi_Attribute_Color(dv_ability.Count - 1) As String
        Dim prog_Attribute(dv_ability.Count - 1) As Integer
        Dim student_att_total(dv_ability.Count - 1) As Integer


        SqlDataSource5.SelectCommand = "SELECT sum(professional)as professional,sum(leadership)as leadership,sum(communication)as communication,sum(comprehension)as comprehension,sum(expression)as expression,sum(initiative)as initiative,sum(self_enhancement)as self_enhancement,sum(civil_responsibility)as civil_responsibility,sum(language)as language,sum(it_application)as it_application FROM CurrentStatus where pess_cod='" & Session("pess_cod") & "'"

        Dim dv_abilityValueTotal As Data.DataView = SqlDataSource5.Select(New DataSourceSelectArguments)

        SqlDataSource9.SelectCommand = "select * from categoryWeight where programme='" & Session("school") & "-" & Session("programme") & "'"
        Dim dv_attributeProg As Data.DataView = SqlDataSource9.Select(New DataSourceSelectArguments)
        If dv_attributeProg.Count <> 0 Then

            For i As Integer = 0 To dv_ability.Count - 1
                mpi_Attribute(i) = dv_ability.Item(i).Item("kind").ToString   'retrieve attribute name
                mpi_Attribute_Color(i) = dv_ability.Item(i).Item("color").ToString 'retrieve attribute color
                student_att_total(i) = dv_abilityValueTotal.Item(0).Item(mpi_Attribute(i)).ToString 'retrieve student current attribute total
                prog_Attribute(i) = dv_attributeProg.Item(0).Item(mpi_Attribute(i))
            Next

        else 
        For i As Integer = 0 To dv_ability.Count - 1
            mpi_Attribute(i) = dv_ability.Item(i).Item("kind").ToString   'retrieve attribute name
            mpi_Attribute_Color(i) = dv_ability.Item(i).Item("color").ToString 'retrieve attribute color
            student_att_total(i) = dv_abilityValueTotal.Item(0).Item(mpi_Attribute(i)).ToString 'retrieve student current attribute total
            Next
        End If
        SqlDataSource4.SelectCommand = "SELECT careerPlanning,professional,leadership,communication,comprehension,expression,initiative,self_enhancement,civil_responsibility,language,it_application FROM CareerPlanning where pess_cod='" & Session("pess_cod") & "'order by careerPlanning desc"
        Dim dv_planning As Data.DataView = SqlDataSource4.Select(New DataSourceSelectArguments)

        For i As Integer = 0 To dv_planning.Count - 1 'add student year plan to radar chart
            Chart_Total.Series.Add(dv_planning.Item(i).Item(0).ToString)
            Chart_Total.Series(dv_planning.Item(i).Item(0).ToString).ChartType = DataVisualization.Charting.SeriesChartType.Radar
            Chart_Total.Series(dv_planning.Item(i).Item(0).ToString).Color = Drawing.Color.FromName(mpi_Attribute_Color(i))

            For j As Integer = 1 To 10
                Chart_Total.Series(dv_planning.Item(i).Item(0).ToString).Points.AddXY(mpi_Attribute(j - 1), dv_planning.Item(i).Item(j).ToString)
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

        If DetailsView1.CurrentMode = DetailsViewMode.Edit Then
            '            Me.Editor1.Visible = True
        Else
            '           Me.Editor1.Visible = False
        End If

    End Sub

    Private Sub DetailsView1_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles DetailsView1.ItemInserted
        GridViewCareer.DataBind()

    End Sub

    Protected Sub DetailsView1_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles DetailsView1.ItemUpdated
        GridViewCareer.DataBind()

        Dim conn As New SqlClient.SqlConnection("Data Source=172.25.2.64;Initial Catalog=EP;Persist Security Info=True;User ID=ep_client;Password=46709394")
        Dim tmp_da As New SqlClient.SqlDataAdapter("Select top 1 * from CareerPlanning where id=" & Me.GridViewCareer.SelectedValue, conn)
        Dim tmp_ds As New DataSet
        Dim tmp_dr As DataRow

        conn.Open()
        tmp_da.Fill(tmp_ds, "CareerPlanning")
        tmp_da.FillSchema(tmp_ds, SchemaType.Source, "CareerPlanning")
        If tmp_ds.Tables("CareerPlanning").Rows.Count > 0 Then
            tmp_dr = tmp_ds.Tables("CareerPlanning").Rows(0)
            '    tmp_dr("description") = Me.Editor1.Content
            Dim myobj As New SqlClient.SqlCommandBuilder(tmp_da)
            tmp_da.Update(tmp_ds, "CareerPlanning")
        End If
        conn.Close()


    End Sub

    Private Sub DetailsView1_ModeChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DetailsView1.ModeChanged
        If DetailsView1.CurrentMode = DetailsViewMode.Edit Then
            '            Me.Editor1.Visible = True
        Else
            '           Me.Editor1.Visible = False
        End If
    End Sub


    Protected Sub DropDownCareer_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles DropDownCareer.SelectedIndexChanged
        Call changeCareer()

    End Sub

    Private Sub changeCareer()

        If DropDownCareer.SelectedIndex >= 0 And chkCareer.Checked = True Then
            SqlDataSource3.SelectCommand = "SELECT * FROM Ability "
            Dim dv_ability As Data.DataView = SqlDataSource3.Select(New DataSourceSelectArguments)

            SqlDataSource7.SelectCommand = "SELECT * FROM CareerAttribute where career='" & DropDownCareer.SelectedItem.Text & "'"
            Dim dv_abilityCareerAtt As Data.DataView = SqlDataSource7.Select(New DataSourceSelectArguments)

            Dim mpi_Attribute(dv_ability.Count - 1) As String
            Dim career_att(dv_ability.Count - 1) As Integer


            Chart_Total.Series("selected_career").BorderWidth = 6

            For i As Integer = 0 To dv_ability.Count - 1
                mpi_Attribute(i) = dv_ability.Item(i).Item("kind").ToString   'retrieve attribute name
                career_att(i) = dv_abilityCareerAtt.Item(0).Item(mpi_Attribute(i)).ToString 'retrieve student current attribute total
            Next


            Chart_Total.Series("selected_career").Points.DataBindXY(mpi_Attribute, career_att)

        End If



    End Sub


    Private Sub MatchList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles MatchList.SelectedIndexChanged
        DropDownCareer.SelectedItem.Text = MatchList.SelectedItem.Text

        Call changeCareer()

    End Sub



    Protected Sub RadioMatch_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles RadioMatch.SelectedIndexChanged
        Select Case RadioMatch.SelectedValue
            Case "Current_Status"
                SqlDataSource5.SelectCommand = "SELECT sum(professional)as professional,sum(leadership)as leadership,sum(communication)as communication,sum(comprehension)as comprehension,sum(expression)as expression,sum(initiative)as initiative,sum(self_enhancement)as self_enhancement,sum(civil_responsibility)as civil_responsibility,sum(language)as language,sum(it_application)as it_application FROM CurrentStatus where pess_cod='" & Session("pess_cod") & "'"
                Dim dv_abilityValueTotal As Data.DataView = SqlDataSource5.Select(New DataSourceSelectArguments)
                SqlDataSource8.SelectCommand = "select * from careerAttribute where professional <=" & dv_abilityValueTotal.Item(0).Item(0).ToString & " and leadership <=" & dv_abilityValueTotal.Item(0).Item(1).ToString & " and communication <=" & dv_abilityValueTotal.Item(0).Item(2).ToString & " and comprehension <=" & dv_abilityValueTotal.Item(0).Item(3).ToString & " and expression <=" & dv_abilityValueTotal.Item(0).Item(4).ToString & " and initiative <=" & dv_abilityValueTotal.Item(0).Item(5).ToString & " and self_enhancement <=" & dv_abilityValueTotal.Item(0).Item(6).ToString & " and civil_responsibility <=" & dv_abilityValueTotal.Item(0).Item(7).ToString & " and language <=" & dv_abilityValueTotal.Item(0).Item(8).ToString & " and it_application <=" & dv_abilityValueTotal.Item(0).Item(9).ToString
                SqlDataSource8.DataBind()
            Case "MPI_Attribute"
                Try
                    SqlDataSource9.SelectCommand = "select professional,leadership,communication,comprehension,expression,initiative,self_enhancement,civil_responsibility,language,it_application from categoryWeight where programme='" & Session("school") & "-" & Session("programme") & "'"
                    Dim dv_abilityValueTotal As Data.DataView = SqlDataSource9.Select(New DataSourceSelectArguments)
                    SqlDataSource8.SelectCommand = "select * from careerAttribute where professional <=" & dv_abilityValueTotal.Item(0).Item(0).ToString & " and leadership <=" & dv_abilityValueTotal.Item(0).Item(1).ToString & " and communication <=" & dv_abilityValueTotal.Item(0).Item(2).ToString & " and comprehension <=" & dv_abilityValueTotal.Item(0).Item(3).ToString & " and expression <=" & dv_abilityValueTotal.Item(0).Item(4).ToString & " and initiative <=" & dv_abilityValueTotal.Item(0).Item(5).ToString & " and self_enhancement <=" & dv_abilityValueTotal.Item(0).Item(6).ToString & " and civil_responsibility <=" & dv_abilityValueTotal.Item(0).Item(7).ToString & " and language <=" & dv_abilityValueTotal.Item(0).Item(8).ToString & " and it_application <=" & dv_abilityValueTotal.Item(0).Item(9).ToString
                    SqlDataSource8.DataBind()
                Catch ex As Exception
                    Return

                End Try


            Case "Graduation_Status"
                Try
                    SqlDataSource9.SelectCommand = "select professional,leadership,communication,comprehension,expression,initiative,self_enhancement,civil_responsibility,language,it_application from careerPlanning where pess_cod='" & Session("pess_cod") & "' and careerPlanning <> 'You can start to plan your career here!' order by careerPlanning desc"
                    Dim dv_abilityValueTotal As Data.DataView = SqlDataSource9.Select(New DataSourceSelectArguments)
                    SqlDataSource8.SelectCommand = "select * from careerAttribute where professional <=" & dv_abilityValueTotal.Item(0).Item(0).ToString & " and leadership <=" & dv_abilityValueTotal.Item(0).Item(1).ToString & " and communication <=" & dv_abilityValueTotal.Item(0).Item(2).ToString & " and comprehension <=" & dv_abilityValueTotal.Item(0).Item(3).ToString & " and expression <=" & dv_abilityValueTotal.Item(0).Item(4).ToString & " and initiative <=" & dv_abilityValueTotal.Item(0).Item(5).ToString & " and self_enhancement <=" & dv_abilityValueTotal.Item(0).Item(6).ToString & " and civil_responsibility <=" & dv_abilityValueTotal.Item(0).Item(7).ToString & " and language <=" & dv_abilityValueTotal.Item(0).Item(8).ToString & " and it_application <=" & dv_abilityValueTotal.Item(0).Item(9).ToString
                    SqlDataSource8.DataBind()
                Catch ex As Exception
                    Return

                End Try

        End Select




    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton1.Click
        Response.Redirect("home.aspx")
    End Sub
End Class