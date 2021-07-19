Imports System.Data
Imports System.Data.SqlClient

Partial Class CategoryWeight
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
       ' If Not IsPostBack Then
            Dim dv_verify As Data.DataView = SqlDataSource2.Select(New DataSourceSelectArguments)

            If Session("Role_Type") Is Nothing Then

                Response.Write("<script>alert('Please Log In !'); window.location.href='../staff.aspx'; </script>")
                Response.End()
            End If


            If dv_verify.Item(0).Item("paa") = "False" Then

                Response.Write("<script>alert('You do not have Permission to view it !');window.history.back(-1); </script>")

            End If

            If Session("Role_Type") = "director" Then

                Button1.Visible = False

            End If

            If Session("Role_Type") = "coordinator" Then

                Button1.Visible = True

            End If

      '  End If


        GetDataGrid()



    End Sub


    Protected Sub GridViewCategory_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewCategory.SelectedIndexChanged

        GetData()

        ShowData()


    End Sub



    'Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton1.Click

    '        Response.Redirect("../Instructor/home.aspx")

    'End Sub

    Protected Sub ImageButton2_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton2.Click
        Response.Redirect("../Instructor/home.aspx")
    End Sub


    Protected Sub GridViewCategory_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridViewCategory.PageIndexChanging
        Me.GridViewCategory.PageIndex = e.NewPageIndex
        Me.GetDataGrid()
    End Sub

    Private Sub GetData()

        Dim conn As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString)

        conn.Open()
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim dt As New DataTable

        If Session("Role_Type") = "director" Then

            Dim cmd As SqlCommand = New SqlCommand("SELECT * FROM CategoryWeight WHERE programme ='" & GridViewCategory.SelectedValue & "'", conn)
            da.SelectCommand = cmd
            da.Fill(dt)
            DetailsViewCategoryView.DataSource = dt
            DetailsViewCategoryView.DataBind()
            DetailsViewCategoryView.Visible = True
            MultiView2.ActiveViewIndex = 1

        End If

        If Session("Role_Type") = "coordinator" Then

            Dim cmd As SqlCommand = New SqlCommand("SELECT * FROM CategoryWeight WHERE programme ='" & GridViewCategory.SelectedValue & "'", conn)
            da.SelectCommand = cmd
            da.Fill(dt)
            DetailsViewCategory.DataSource = dt
            DetailsViewCategory.DataBind()
            DetailsViewCategory.Visible = True
            MultiView2.ActiveViewIndex = 0
        End If




    End Sub
    Private Sub GetDataGrid()

        Dim conn As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString)

        conn.Open()
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim dt As New DataTable
        If Session("Role_Type") = "coordinator" Then
            Dim sql2, sql3 As String
            Dim strArr() As String
            Dim count As Integer
            sql3 = ""
            Dim char1 As Char() = New [Char]() {",", "_"}
            strArr = Session("Programme").Split(char1)
            For count = 0 To strArr.Length - 1 Step 2
                If (count = strArr.Length - 2) Then
                    sql2 = " SELECT * FROM [CategoryWeight] where school =  '" & strArr(count) & "' and program_code='" & strArr(count + 1) & "' order by programme desc"
                Else
                    sql2 = " SELECT * FROM [CategoryWeight] where school =  '" & strArr(count) & "' and program_code='" & strArr(count + 1) & "' UNION ALL"
                End If
                sql3 = sql3 + sql2

            Next
            Dim cmd As SqlCommand = New SqlCommand(sql3, conn)
            da.SelectCommand = cmd



        ElseIf Session("Role_Type") = "director" Then
            Dim cmd As SqlCommand = New SqlCommand("SELECT * FROM [CategoryWeight] where school = '" & Session("School_code") & "' order by programme desc", conn)
            da.SelectCommand = cmd
        End If

        da.Fill(dt)
        GridViewCategory.DataSource = dt
        GridViewCategory.DataBind()


    End Sub
    Private Sub ShowData()

        Dim XValue(Me.GridViewCategory.Columns.Count - 4) As String
        Dim XValue1(Me.GridViewCategory.Columns.Count - 4) As String
        Dim YValue1_1(Me.GridViewCategory.Columns.Count - 4) As Integer
        Dim YValue1_s(Me.GridViewCategory.Columns.Count - 4) As Integer

        Dim XValue1_prof(Me.GridViewCategory.Columns.Count - 4) As Integer

        '  Dim ProgramName As String
        '  Dim SchoolName As String
        Dim curPageIndex As Integer


        curPageIndex = GridViewCategory.PageIndex

        '  ProgramName = Me.GridViewCategory.SelectedRow.Cells(1).Text
        '  SchoolName = Me.GridViewCategory.SelectedRow.Cells(2).Text
        HiddenField1.Value = Me.GridViewCategory.SelectedRow.Cells(1).Text
        HiddenField2.Value = Me.GridViewCategory.SelectedRow.Cells(2).Text

        For i As Integer = 3 To Me.GridViewCategory.Columns.Count - 1
            XValue(i - 3) = Me.GridViewCategory.Columns(i).ToString
            XValue1(i - 3) = Regex.Replace(XValue(i - 3), "_", " ")
            YValue1_1(i - 3) = Me.GridViewCategory.SelectedRow.Cells(i).Text
        Next


        Do While GridViewCategory.PageIndex > 0 And HiddenField2.Value = Me.GridViewCategory.Rows(0).Cells(2).Text
            GridViewCategory.PageIndex = GridViewCategory.PageIndex - 1
            GridViewCategory.DataBind()
        Loop


        Do While GridViewCategory.PageIndex < GridViewCategory.PageCount

            For j As Integer = 0 To GridViewCategory.Rows.Count - 1
                If HiddenField2.Value = Me.GridViewCategory.Rows(j).Cells(2).Text Then

                    For k As Integer = 3 To Me.GridViewCategory.Columns.Count - 1
                        YValue1_s(k - 3) = Me.GridViewCategory.Rows(j).Cells(k).Text + YValue1_s(k - 3)
                    Next

                End If
            Next

            If GridViewCategory.PageIndex + 1 < GridViewCategory.PageCount And HiddenField2.Value = Me.GridViewCategory.Rows(GridViewCategory.Rows.Count - 1).Cells(2).Text Then
                GridViewCategory.PageIndex = GridViewCategory.PageIndex + 1
                GridViewCategory.DataBind()
            Else
                Exit Do
            End If

        Loop




        SchoolAttribute.Series.Item(0).Name = HiddenField2.Value
        SchoolAttribute.Series(HiddenField2.Value).Points.DataBindXY(XValue1, YValue1_s)

        ProgrammeAttribute.Series.Item(0).Name = HiddenField1.Value
        ProgrammeAttribute.Series(HiddenField1.Value).Points.DataBindXY(XValue1, YValue1_1)

        ProgrammeAttrPie.Series.Item(0).Name = HiddenField1.Value
        ProgrammeAttrPie.Series(HiddenField1.Value).Points.DataBindXY(XValue1, YValue1_1)


        SchoolAttribute.Series.Item(1).Name = HiddenField1.Value
        SchoolAttribute.Series(HiddenField1.Value).Points.DataBindXY(XValue1, YValue1_1)
        If Session("Role_Type") = "director" Then
            SqlDataSource4.SelectCommand = "SELECT * FROM [CategoryWeight] where school = '" & HiddenField2.Value & "' order by programme desc"
            SqlDataSource4.DataBind()

        ElseIf Session("Role_Type") = "coordinator" Then
            ' SqlDataSource4.SelectCommand = "SELECT * FROM [CategoryWeight] where school = '" & HiddenField2.Value & "' and program_name='" & Session("Programme") & "'  order by programme desc"
            ' SqlDataSource4.SelectCommand = "SELECT * FROM [CategoryWeight] where school = '" & HiddenField2.Value & "' and programme='" & HiddenField1.Value & "'  order by programme desc"
            '  SqlDataSource4.DataBind()
            Dim sql2, sql3 As String
            Dim strArr() As String
            Dim count As Integer
            sql3 = ""
            Dim char1 As Char() = New [Char]() {",", "_"}
            strArr = Session("Programme").Split(char1)
            For count = 0 To strArr.Length - 1 Step 2
                If (count = strArr.Length - 2) Then
                    sql2 = " SELECT * FROM [CategoryWeight] where school =  '" & strArr(count) & "' and program_code='" & strArr(count + 1) & "' order by programme desc"
                Else
                    sql2 = " SELECT * FROM [CategoryWeight] where school =  '" & strArr(count) & "' and program_code='" & strArr(count + 1) & "' UNION ALL"
                End If
                sql3 = sql3 + sql2

            Next
            SqlDataSource4.SelectCommand = sql3
            SqlDataSource4.DataBind()
        End If
        Dim dv_ability As Data.DataView = SqlDataSource4.Select(New DataSourceSelectArguments)

        For i As Integer = 0 To dv_ability.Count - 1
            Chart1.Series(0).Points.AddXY(dv_ability.Item(i).Item(0).ToString, dv_ability.Item(i).Item(3).ToString)
            Chart2.Series(0).Points.AddXY(dv_ability.Item(i).Item(0).ToString, dv_ability.Item(i).Item(4).ToString)
            Chart3.Series(0).Points.AddXY(dv_ability.Item(i).Item(0).ToString, dv_ability.Item(i).Item(5).ToString)
            Chart4.Series(0).Points.AddXY(dv_ability.Item(i).Item(0).ToString, dv_ability.Item(i).Item(6).ToString)
            Chart5.Series(0).Points.AddXY(dv_ability.Item(i).Item(0).ToString, dv_ability.Item(i).Item(7).ToString)
            Chart6.Series(0).Points.AddXY(dv_ability.Item(i).Item(0).ToString, dv_ability.Item(i).Item(8).ToString)
            Chart7.Series(0).Points.AddXY(dv_ability.Item(i).Item(0).ToString, dv_ability.Item(i).Item(9).ToString)
            Chart8.Series(0).Points.AddXY(dv_ability.Item(i).Item(0).ToString, dv_ability.Item(i).Item(10).ToString)
            Chart9.Series(0).Points.AddXY(dv_ability.Item(i).Item(0).ToString, dv_ability.Item(i).Item(11).ToString)
            ' Chart10.Series(0).Points.AddXY(dv_ability.Item(i).Item(0).ToString, dv_ability.Item(i).Item(11).ToString)

            If dv_ability.Item(i).Item(0).ToString = HiddenField1.Value Then
                Chart1.Series(0).Points(i).Color = Drawing.Color.Violet
                Chart2.Series(0).Points(i).Color = Drawing.Color.Purple
                Chart3.Series(0).Points(i).Color = Drawing.Color.Pink
                Chart4.Series(0).Points(i).Color = Drawing.Color.Plum
                Chart5.Series(0).Points(i).Color = Drawing.Color.RosyBrown
                Chart6.Series(0).Points(i).Color = Drawing.Color.Yellow
                Chart7.Series(0).Points(i).Color = Drawing.Color.Cyan
                Chart8.Series(0).Points(i).Color = Drawing.Color.Sienna
                Chart9.Series(0).Points(i).Color = Drawing.Color.Teal
                ' Chart10.Series(0).Points(i).Color = Drawing.Color.YellowGreen

            End If
        Next



        GridViewCategory.PageIndex = curPageIndex
        GridViewCategory.DataBind()


    End Sub


    Private Sub UpdateData()

        Dim XValue(Me.GridViewCategory.Columns.Count - 4) As String
        Dim XValue1(Me.GridViewCategory.Columns.Count - 4) As String
        Dim YValue1_1(Me.GridViewCategory.Columns.Count - 4) As Integer
        Dim YValue1_s(Me.GridViewCategory.Columns.Count - 4) As Integer

        Dim XValue1_prof(Me.GridViewCategory.Columns.Count - 4) As Integer

        '  Dim ProgramName As String
        '  Dim SchoolName As String
        Dim curPageIndex As Integer


        curPageIndex = GridViewCategory.PageIndex

        '  ProgramName = Me.GridViewCategory.SelectedRow.Cells(1).Text
        '  SchoolName = Me.GridViewCategory.SelectedRow.Cells(2).Text


        For i As Integer = 3 To Me.GridViewCategory.Columns.Count - 1
            XValue(i - 3) = Me.GridViewCategory.Columns(i).ToString
            XValue1(i - 3) = Regex.Replace(XValue(i - 3), "_", " ")
            YValue1_1(i - 3) = Me.GridViewCategory.SelectedRow.Cells(i).Text
        Next


        Do While GridViewCategory.PageIndex > 0 And HiddenField2.Value = Me.GridViewCategory.Rows(0).Cells(2).Text
            GridViewCategory.PageIndex = GridViewCategory.PageIndex - 1
            GridViewCategory.DataBind()
        Loop


        Do While GridViewCategory.PageIndex < GridViewCategory.PageCount

            For j As Integer = 0 To GridViewCategory.Rows.Count - 1
                If HiddenField2.Value = Me.GridViewCategory.Rows(j).Cells(2).Text Then

                    For k As Integer = 3 To Me.GridViewCategory.Columns.Count - 1
                        YValue1_s(k - 3) = Me.GridViewCategory.Rows(j).Cells(k).Text + YValue1_s(k - 3)
                    Next

                End If
            Next

            If GridViewCategory.PageIndex + 1 < GridViewCategory.PageCount And HiddenField2.Value = Me.GridViewCategory.Rows(GridViewCategory.Rows.Count - 1).Cells(2).Text Then
                GridViewCategory.PageIndex = GridViewCategory.PageIndex + 1
                GridViewCategory.DataBind()
            Else
                Exit Do
            End If

        Loop




        SchoolAttribute.Series.Item(0).Name = HiddenField2.Value
        SchoolAttribute.Series(HiddenField2.Value).Points.DataBindXY(XValue1, YValue1_s)

        ProgrammeAttribute.Series.Item(0).Name = HiddenField1.Value
        ProgrammeAttribute.Series(HiddenField1.Value).Points.DataBindXY(XValue1, YValue1_1)

        ProgrammeAttrPie.Series.Item(0).Name = HiddenField1.Value
        ProgrammeAttrPie.Series(HiddenField1.Value).Points.DataBindXY(XValue1, YValue1_1)


        SchoolAttribute.Series.Item(1).Name = HiddenField1.Value
        SchoolAttribute.Series(HiddenField1.Value).Points.DataBindXY(XValue1, YValue1_1)
        If Session("Role_Type") = "director" Then
            SqlDataSource4.SelectCommand = "SELECT * FROM [CategoryWeight] where school = '" & HiddenField2.Value & "' order by programme desc"
            SqlDataSource4.DataBind()

        ElseIf Session("Role_Type") = "coordinator" Then
            ' SqlDataSource4.SelectCommand = "SELECT * FROM [CategoryWeight] where school = '" & HiddenField2.Value & "' and program_name='" & Session("Programme") & "'  order by programme desc"
            ' SqlDataSource4.SelectCommand = "SELECT * FROM [CategoryWeight] where school = '" & HiddenField2.Value & "' and programme='" & HiddenField1.Value & "'  order by programme desc"
            Dim sql2, sql3 As String
            Dim strArr() As String
            Dim count As Integer
            sql3 = ""
            Dim char1 As Char() = New [Char]() {",", "_"}
            strArr = Session("Programme").Split(char1)
            For count = 0 To strArr.Length - 1 Step 2
                If (count = strArr.Length - 2) Then
                    sql2 = " SELECT * FROM [CategoryWeight] where school =  '" & strArr(count) & "' and program_code='" & strArr(count + 1) & "' order by programme desc"
                Else
                    sql2 = " SELECT * FROM [CategoryWeight] where school =  '" & strArr(count) & "' and program_code='" & strArr(count + 1) & "' UNION ALL"
                End If
                sql3 = sql3 + sql2

            Next
            SqlDataSource4.SelectCommand = sql3
            SqlDataSource4.DataBind()

        End If
        Dim dv_ability As Data.DataView = SqlDataSource4.Select(New DataSourceSelectArguments)

        For i As Integer = 0 To dv_ability.Count - 1
            Chart1.Series(0).Points.AddXY(dv_ability.Item(i).Item(0).ToString, dv_ability.Item(i).Item(3).ToString)
            Chart2.Series(0).Points.AddXY(dv_ability.Item(i).Item(0).ToString, dv_ability.Item(i).Item(4).ToString)
            Chart3.Series(0).Points.AddXY(dv_ability.Item(i).Item(0).ToString, dv_ability.Item(i).Item(5).ToString)
            Chart4.Series(0).Points.AddXY(dv_ability.Item(i).Item(0).ToString, dv_ability.Item(i).Item(6).ToString)
            Chart5.Series(0).Points.AddXY(dv_ability.Item(i).Item(0).ToString, dv_ability.Item(i).Item(7).ToString)
            Chart6.Series(0).Points.AddXY(dv_ability.Item(i).Item(0).ToString, dv_ability.Item(i).Item(8).ToString)
            Chart7.Series(0).Points.AddXY(dv_ability.Item(i).Item(0).ToString, dv_ability.Item(i).Item(9).ToString)
            Chart8.Series(0).Points.AddXY(dv_ability.Item(i).Item(0).ToString, dv_ability.Item(i).Item(10).ToString)
            Chart9.Series(0).Points.AddXY(dv_ability.Item(i).Item(0).ToString, dv_ability.Item(i).Item(11).ToString)
            ' Chart10.Series(0).Points.AddXY(dv_ability.Item(i).Item(0).ToString, dv_ability.Item(i).Item(11).ToString)

            If dv_ability.Item(i).Item(0).ToString = HiddenField1.Value Then
                Chart1.Series(0).Points(i).Color = Drawing.Color.Violet
                Chart2.Series(0).Points(i).Color = Drawing.Color.Purple
                Chart3.Series(0).Points(i).Color = Drawing.Color.Pink
                Chart4.Series(0).Points(i).Color = Drawing.Color.Plum
                Chart5.Series(0).Points(i).Color = Drawing.Color.RosyBrown
                Chart6.Series(0).Points(i).Color = Drawing.Color.Yellow
                Chart7.Series(0).Points(i).Color = Drawing.Color.Cyan
                Chart8.Series(0).Points(i).Color = Drawing.Color.Sienna
                Chart9.Series(0).Points(i).Color = Drawing.Color.Teal
                ' Chart10.Series(0).Points(i).Color = Drawing.Color.YellowGreen

            End If
        Next



        GridViewCategory.PageIndex = curPageIndex
        GridViewCategory.DataBind()


    End Sub



    Protected Sub DetailsViewCategory_ModeChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewModeEventArgs) Handles DetailsViewCategory.ModeChanging
        If e.CancelingEdit Then
            UpdateData()
        End If
        DetailsViewCategory.ChangeMode(e.NewMode)
        Me.GetData()
    End Sub

    Protected Sub DetailsViewCategory_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdateEventArgs) Handles DetailsViewCategory.ItemUpdating

      
                Try

                    Using conn As New SqlConnection(ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString)
                        conn.Open()
                Dim strSQL As String = "UPDATE [CategoryWeight] SET [Professional_Competence] = @Professional_Competence, [Leadership] = @Leadership, [Communication] = @Communication, [Creativity] = @Creativity, [Initiative] = @Initiative, [Self_Development] = @Self_Development, [Social_Responsibility] = @Social_Responsibility, [Language] = @Language, [IT_Application] = @IT_Application WHERE [programme] =@programme"
                        Using cmd As New SqlCommand(strSQL)
                            cmd.Connection = conn
                            cmd.CommandText = strSQL
                           
                            cmd.Parameters.AddWithValue("@Professional_Competence", CType(DetailsViewCategory.FindControl("TextBox1"), TextBox).Text.Trim())
                            cmd.Parameters.AddWithValue("@Leadership", CType(DetailsViewCategory.FindControl("TextBox4"), TextBox).Text.Trim())
                            cmd.Parameters.AddWithValue("@Communication", CType(DetailsViewCategory.FindControl("TextBox5"), TextBox).Text.Trim())
                            cmd.Parameters.AddWithValue("@Creativity", CType(DetailsViewCategory.FindControl("TextBox6"), TextBox).Text.Trim())
                            cmd.Parameters.AddWithValue("@Initiative", CType(DetailsViewCategory.FindControl("TextBox7"), TextBox).Text.Trim())
                            cmd.Parameters.AddWithValue("@Self_Development", CType(DetailsViewCategory.FindControl("TextBox8"), TextBox).Text.Trim())
                            cmd.Parameters.AddWithValue("@Social_Responsibility", CType(DetailsViewCategory.FindControl("TextBox9"), TextBox).Text.Trim())
                            cmd.Parameters.AddWithValue("@Language", CType(DetailsViewCategory.FindControl("TextBox10"), TextBox).Text.Trim())
                            cmd.Parameters.AddWithValue("@IT_Application", CType(DetailsViewCategory.FindControl("TextBox11"), TextBox).Text.Trim())
                    cmd.Parameters.AddWithValue("@programme", GridViewCategory.SelectedValue)

                            cmd.ExecuteNonQuery()
                            DetailsViewCategory.ChangeMode(DetailsViewMode.ReadOnly)

                            Me.GetData()
                            Me.GetDataGrid()
                        End Using
                        conn.Close()
                    End Using
                Catch ex As Exception

                    Response.Write("<script>alert('Program have already inserted!')</script>")
                    Exit Sub
                End Try

        DetailsViewCategory.Visible = True
        UpdateData()

    End Sub

    Protected Sub DetailsViewCategory_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles DetailsViewCategory.ItemUpdated

        UpdateData()
        GridViewCategory.DataBind()
        DetailsViewCategory.Visible = True

    End Sub



    Protected Sub DetailsViewCategory_ItemDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewDeleteEventArgs) Handles DetailsViewCategory.ItemDeleting

        If (message.Value = "No") Then
            e.Cancel = True
            UpdateData()
            Exit Sub
        End If

        Try
            Using conn As New SqlConnection(ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString)
                conn.Open()
                Dim strSQL As String = "DELETE FROM [CategoryWeight] WHERE [programme] = @programme"
                Using cmd As New SqlCommand(strSQL)
                    cmd.Connection = conn
                    cmd.CommandText = strSQL
                    cmd.Parameters.AddWithValue("@programme", GridViewCategory.SelectedValue)
                    cmd.ExecuteNonQuery()
                    DetailsViewCategory.ChangeMode(DetailsViewMode.ReadOnly)
                    Me.GetData()
                    Me.GetDataGrid()
                End Using
                conn.Close()
            End Using
        Catch ex As Exception

            Response.Write("<script>alert('error')</script>")
        End Try

    End Sub

    Protected Sub DetailsViewCategory_ItemDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewDeletedEventArgs) Handles DetailsViewCategory.ItemDeleted
        GridViewCategory.DataBind()


    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click

        Dim strArr() As String
        Dim char1 As Char() = New [Char]() {"_"}
        strArr = DropDownList1.SelectedValue.Split(char1)
        ' Dim str As String() = New String() {"-"}
        Dim dv_check As Data.DataView = SqlDataSource4.Select(New DataSourceSelectArguments)
        For i = 0 To dv_check.Count - 1
            If DropDownList1.SelectedValue = dv_check.Item(i).Item("programme") Then

                Response.Write("<script>alert('Program have already existed!')</script>")
                TextBox14.Text = ""
                TextBox15.Text = ""
                TextBox16.Text = ""
                TextBox17.Text = ""
                TextBox18.Text = ""
                TextBox19.Text = ""
                TextBox20.Text = ""
                TextBox21.Text = ""
                TextBox22.Text = ""

                Exit Sub
            End If
        Next

        Try

            Using conn As New SqlConnection(ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString)
                conn.Open()
                Dim strSQL As String = "INSERT INTO [CategoryWeight] ([programme], [school], [Professional_Competence], [Leadership], [Communication], [Creativity], [Initiative], [Self_Development], [Social_Responsibility], [Language], [IT_Application],[program_code]) VALUES (@programme, @school, @Professional_Competence, @Leadership, @Communication, @Creativity, @Initiative, @Self_Development, @Social_Responsibility, @Language, @IT_Application,@program_code)"
                Using cmd As New SqlCommand(strSQL)
                    cmd.Connection = conn
                    cmd.CommandText = strSQL
                    cmd.Parameters.AddWithValue("@programme", DropDownList1.SelectedValue)
                    cmd.Parameters.AddWithValue("@school", strArr(0))
                    cmd.Parameters.AddWithValue("@Professional_Competence", TextBox14.Text.Trim())
                    cmd.Parameters.AddWithValue("@Leadership", TextBox15.Text.Trim())
                    cmd.Parameters.AddWithValue("@Communication", TextBox16.Text.Trim())
                    cmd.Parameters.AddWithValue("@Creativity", TextBox17.Text.Trim())
                    cmd.Parameters.AddWithValue("@Initiative", TextBox18.Text.Trim())
                    cmd.Parameters.AddWithValue("@Self_Development", TextBox19.Text.Trim())
                    cmd.Parameters.AddWithValue("@Social_Responsibility", TextBox20.Text.Trim())
                    cmd.Parameters.AddWithValue("@Language", TextBox21.Text.Trim())
                    cmd.Parameters.AddWithValue("@IT_Application", TextBox22.Text.Trim())
                    cmd.Parameters.AddWithValue("@program_code", strArr(1))
                    cmd.ExecuteNonQuery()
                    Me.GetDataGrid()
                End Using
                conn.Close()
            End Using
        Catch ex As Exception
            Response.Write("<script>alert('Program have already existed!')</script>")
            Exit Sub
        End Try



        DetailsViewCategory.Visible = False
        MultiView1.ActiveViewIndex = 0
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        MultiView1.ActiveViewIndex = 1
        DetailsViewCategory.Visible = False
        Dim strArr() As String
        Dim count As Integer
        Dim char1 As Char() = New [Char]() {","}
        strArr = Session("Programme").Split(char1)
        DropDownList1.Items.Clear()
        For count = 0 To strArr.Length - 1

            DropDownList1.Items.Add(New ListItem(strArr(count), strArr(count)))

        Next
        TextBox14.Text = ""
        TextBox15.Text = ""
        TextBox16.Text = ""
        TextBox17.Text = ""
        TextBox18.Text = ""
        TextBox19.Text = ""
        TextBox20.Text = ""
        TextBox21.Text = ""
        TextBox22.Text = ""

    End Sub

    Protected Sub DetailsViewCategory_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewCommandEventArgs) Handles DetailsViewCategory.ItemCommand
        If e.CommandName = "Edit" Then
            UpdateData()
        End If

    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click
        MultiView1.ActiveViewIndex = 0

    End Sub


End Class
