Imports System.Data.SqlClient
Imports System.Data

Partial Class SystemAdmin_SeminarAdding
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
        Dim dv_verify As Data.DataView = SqlDataSource6.Select(New DataSourceSelectArguments)

        If Session("Role_Type") Is Nothing Then

            Response.Write("<script>alert('Please Log In !'); window.location.href='../staff.aspx'; </script>")
            Exit Sub
        End If


        If dv_verify.Item(0).Item("sr") = "False" Then

            Response.Write("<script>alert('You do not have Permission to view it !');window.history.back(-1); </script>")

            End If
         

        End If


    End Sub
    Public Sub SelectedCheckBoxes()
        Dim hiddenIDs() As String = {}
        If Not String.IsNullOrEmpty(hiddenCatIDs.Value) Then
            hiddenIDs = hiddenCatIDs.Value.Split(New Char() {"|"})
        End If

        Dim arrIDs As New ArrayList()
        Dim CatID As String = "0"
        Dim CatID1 As String = "0"
        If hiddenIDs.Length <> 0 Then
            arrIDs.AddRange(hiddenIDs)
        End If

        For Each rowItem As GridViewRow In GridView1.Rows
            Dim chk As CheckBox

            chk = CType(rowItem.Cells(0).FindControl("chk1"), CheckBox)
            CatID = GridView1.DataKeys(rowItem.RowIndex)("ALUN_NUMERO").ToString()
            CatID1 = GridView1.DataKeys(rowItem.RowIndex)("ALUN_NUMERO_SEQ").ToString()
            If chk.Checked Then
                If Not (arrIDs.Contains(CatID) And arrIDs.Contains(CatID1)) Then
                    arrIDs.Add(CatID)
                    arrIDs.Add(CatID1)
                End If
            Else
                If (arrIDs.Contains(CatID) And arrIDs.Contains(CatID1)) Then
                    arrIDs.Remove(CatID)
                    arrIDs.Remove(CatID1)
                End If
            End If
        Next

        hiddenIDs = CType(arrIDs.ToArray(Type.GetType("System.String")), String())

        hiddenCatIDs.Value = String.Join("|", hiddenIDs)
    End Sub
    Public Sub bindGridView()

        Dim connStr As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString


        Dim mySQLconnection As New SqlConnection(connStr)


        If mySQLconnection.State = ConnectionState.Closed Then mySQLconnection.Open()

        Dim mySqlCommand As New SqlCommand("SELECT STUDENT_ID, NAME_CH,ALUN_NUMERO,ALUN_NUMERO_SEQ FROM student_academic_info WHERE ((SCHOOL_CODE = @SCHOOL_CODE) AND (PROGRAM_COMPOSITE_CODE = @PROGRAM_COMPOSITE_CODE))", mySQLconnection)
        mySqlCommand.Parameters.AddWithValue("@SCHOOL_CODE", DropDownList1.SelectedValue)
        mySqlCommand.Parameters.AddWithValue("@PROGRAM_COMPOSITE_CODE", DropDownList2.SelectedValue)
        Dim mySqlAdapter As New SqlDataAdapter(mySqlCommand)
        Dim myDataSet As New DataSet()
        mySqlAdapter.Fill(myDataSet)

        GridView1.DataSource = myDataSet
        GridView1.DataBind()

        Dim hiddenIDs() As String = {}

        If Not String.IsNullOrEmpty(hiddenCatIDs.Value) Then
            hiddenIDs = hiddenCatIDs.Value.Split(New Char() {"|"})
        End If

        Dim arrIDs As New ArrayList()

        If hiddenIDs.Length <> 0 Then
            arrIDs.AddRange(hiddenIDs)
        End If

        Dim chk As CheckBox
        Dim CatID As String
        Dim CatID1 As String

        For Each rowItem As GridViewRow In GridView1.Rows
            chk = CType(rowItem.Cells(0).FindControl("chk1"), CheckBox)

            CatID = GridView1.DataKeys(rowItem.RowIndex)("ALUN_NUMERO").ToString()
            CatID1 = GridView1.DataKeys(rowItem.RowIndex)("ALUN_NUMERO_SEQ").ToString()

            If arrIDs.Contains(CatID) And arrIDs.Contains(CatID1) Then
                chk.Checked = True
            Else
                chk.Checked = False
            End If
        Next



        If mySQLconnection.State = ConnectionState.Open Then mySQLconnection.Close()
    End Sub


    Public Sub bindGridViewByStud()

        Dim connStr As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString


        Dim mySQLconnection As New SqlConnection(connStr)


        If mySQLconnection.State = ConnectionState.Closed Then mySQLconnection.Open()

        Dim mySqlCommand As New SqlCommand("SELECT STUDENT_ID, NAME_CH,ALUN_NUMERO,ALUN_NUMERO_SEQ FROM student_academic_info WHERE STUDENT_ID = @STUDENT_ID", mySQLconnection)
        mySqlCommand.Parameters.AddWithValue("@STUDENT_ID", HiddenText.Value)
        Dim mySqlAdapter As New SqlDataAdapter(mySqlCommand)
        Dim myDataSet As New DataSet()
        mySqlAdapter.Fill(myDataSet)

        GridView1.DataSource = myDataSet
        GridView1.DataBind()

        Dim hiddenIDs() As String = {}

        If Not String.IsNullOrEmpty(hiddenCatIDs.Value) Then
            hiddenIDs = hiddenCatIDs.Value.Split(New Char() {"|"})
        End If

        Dim arrIDs As New ArrayList()

        If hiddenIDs.Length <> 0 Then
            arrIDs.AddRange(hiddenIDs)
        End If

        Dim chk As CheckBox
        Dim CatID As String
        Dim CatID1 As String

        For Each rowItem As GridViewRow In GridView1.Rows
            chk = CType(rowItem.Cells(0).FindControl("chk1"), CheckBox)

            CatID = GridView1.DataKeys(rowItem.RowIndex)("ALUN_NUMERO").ToString()
            CatID1 = GridView1.DataKeys(rowItem.RowIndex)("ALUN_NUMERO_SEQ").ToString()

            If arrIDs.Contains(CatID) And arrIDs.Contains(CatID1) Then
                chk.Checked = True
            Else
                chk.Checked = False
            End If
        Next



        If mySQLconnection.State = ConnectionState.Open Then mySQLconnection.Close()
    End Sub



    Protected Sub GridView1_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridView1.PageIndexChanging
        GridView1.PageIndex = e.NewPageIndex
        SelectedCheckBoxes()
        bindGridView()

    End Sub




    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        MultiView1.ActiveViewIndex = 1
        Button2.Visible = True
        Button3.Visible = True
        Button4.Visible = True
        bindGridView()
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button2.Click
        CheckState(True)
      
    End Sub

    Private Sub CheckState(ByVal p As Boolean)

        For Each row As GridViewRow In GridView1.Rows
            Dim chkcheck As CheckBox = DirectCast(row.FindControl("chk1"), CheckBox)
            chkcheck.Checked = p
        Next

    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button3.Click
        CheckState(False)
    End Sub

    Protected Sub Button4_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button4.Click
        Dim conn As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString)
        conn.Open()
        For i As Integer = 0 To (GridView1.Rows.Count - 1)
            Dim myCheckbox As CheckBox = GridView1.Rows(i).FindControl("chk1")


            If myCheckbox.Checked = True Then
                Dim tmp_da7 As New SqlClient.SqlDataAdapter("Select top 1 * from Learning_Records_Correspond where ALUN_NUMERO='" & GridView1.DataKeys(i)("ALUN_NUMERO").ToString() & "' and ALUN_NUMERO_SEQ='" & GridView1.DataKeys(i)("ALUN_NUMERO_SEQ").ToString() & "'", conn)

                Dim tmp_ds As New DataSet





                Dim dv_Learning_Experience As Data.DataView = SqlDataSource9.Select(New DataSourceSelectArguments)
                tmp_da7.Fill(tmp_ds, "Learning_Records_Correspond")
                tmp_da7.FillSchema(tmp_ds, SchemaType.Source, "Learning_Records_Correspond")
                If tmp_ds.Tables("Learning_Records_Correspond").Rows.Count = 0 Then
                    ALUN_NUMERO.Value = GridView1.DataKeys(i)("ALUN_NUMERO").ToString()
                    ALUN_NUMERO_SEQ.Value = GridView1.DataKeys(i)("ALUN_NUMERO_SEQ").ToString()
                    For b As Integer = 0 To dv_Learning_Experience.Count - 1

                        Try
                            Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
                            Using mycon As New SqlConnection(con)
                                mycon.Open()
                                Dim strSQL As String = "insert into Learning_Records_Correspond(ALUN_NUMERO,ALUN_NUMERO_SEQ,experience_id,count)values(@ALUN_NUMERO,@ALUN_NUMERO_SEQ,@experience_id,@count);"

                                Using cmd As New SqlCommand()
                                    cmd.Connection = mycon
                                    cmd.CommandText = strSQL
                                    cmd.Parameters.AddWithValue("@ALUN_NUMERO", ALUN_NUMERO.Value)
                                    cmd.Parameters.AddWithValue("@ALUN_NUMERO_SEQ", ALUN_NUMERO_SEQ.Value)
                                    cmd.Parameters.AddWithValue("@experience_id", dv_Learning_Experience.Item(b).Item("id"))
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
            End If
        Next
        conn.Close()
        Application.Lock()
        ' Dim dv_seminar As Data.DataView = SqlDataSource4.Select(New DataSourceSelectArguments)
        For c As Integer = 0 To (GridView1.Rows.Count - 1)
            Dim myCheckbox As CheckBox = GridView1.Rows(c).FindControl("chk1")


            If myCheckbox.Checked = True Then

                Try
                    Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
                    Using mycon As New SqlConnection(con)
                        mycon.Open()
                        Dim strSQL As String = "insert into Seminar (ALUN_NUMERO,ALUN_NUMERO_SEQ,Seminar_info_id,Operator,taken)values(@ALUN_NUMERO,@ALUN_NUMERO_SEQ,@Seminar_info_id,@Operator,@taken);"
                        strSQL = strSQL + "update Learning_Records_Correspond set count = count + 1 where ALUN_NUMERO=@ALUN_NUMERO1 and ALUN_NUMERO_SEQ=@ALUN_NUMERO_SEQ1 and experience_id='1'"
                        Using cmd As New SqlCommand()
                            cmd.Connection = mycon
                            cmd.CommandText = strSQL
                            cmd.Parameters.AddWithValue("@ALUN_NUMERO", GridView1.DataKeys(c)("ALUN_NUMERO").ToString())
                            cmd.Parameters.AddWithValue("@ALUN_NUMERO_SEQ", GridView1.DataKeys(c)("ALUN_NUMERO_SEQ").ToString())
                            cmd.Parameters.AddWithValue("@Seminar_info_id", ListBox2.SelectedValue)
                            cmd.Parameters.AddWithValue("@Operator", Session("ID"))
                            cmd.Parameters.AddWithValue("@taken", "True")
                            cmd.Parameters.AddWithValue("@ALUN_NUMERO1", GridView1.DataKeys(c)("ALUN_NUMERO").ToString())
                            cmd.Parameters.AddWithValue("@ALUN_NUMERO_SEQ1", GridView1.DataKeys(c)("ALUN_NUMERO_SEQ").ToString())
                            cmd.ExecuteNonQuery()
                        End Using
                        mycon.Close()
                    End Using
                Catch ex As Exception
                    Application.UnLock()
                    Response.Write("<script>alert('some student have been taken, check it please')</script>")

                    Return

                End Try
            End If
        Next

        topicNameForAdd.Value = ListBox2.SelectedValue
        bindGridView1()

        Application.UnLock()
        MultiView1.ActiveViewIndex = 2
    End Sub



    Public Sub SelectedCheckBoxes1()
        Dim hiddenIDs1() As String = {}
        If Not String.IsNullOrEmpty(HiddenField1.Value) Then
            hiddenIDs1 = HiddenField1.Value.Split(New Char() {"|"})
        End If

        Dim arrIDs1 As New ArrayList()
        Dim CatID1 As String = "0"
        Dim CatID2 As String = "0"
        If hiddenIDs1.Length <> 0 Then
            arrIDs1.AddRange(hiddenIDs1)
        End If

        For Each rowItem As GridViewRow In GridView2.Rows
            Dim chk As CheckBox

            chk = CType(rowItem.Cells(0).FindControl("chk2"), CheckBox)
            CatID1 = GridView2.DataKeys(rowItem.RowIndex)("ALUN_NUMERO").ToString()
            CatID2 = GridView2.DataKeys(rowItem.RowIndex)("ALUN_NUMERO_SEQ").ToString()
            If chk.Checked Then
                If Not (arrIDs1.Contains(CatID1) And arrIDs1.Contains(CatID2)) Then
                    arrIDs1.Add(CatID1)
                    arrIDs1.Add(CatID2)
                End If
            Else
                If arrIDs1.Contains(CatID1) And arrIDs1.Contains(CatID2) Then
                    arrIDs1.Remove(CatID1)
                    arrIDs1.Remove(CatID2)
                End If
            End If
        Next

        hiddenIDs1 = CType(arrIDs1.ToArray(Type.GetType("System.String")), String())

        HiddenField1.Value = String.Join("|", hiddenIDs1)
    End Sub
    Public Sub bindGridView1()

        Dim connStr As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString


        Dim mySQLconnection As New SqlConnection(connStr)


        If mySQLconnection.State = ConnectionState.Closed Then mySQLconnection.Open()

        Dim mySqlCommand As New SqlCommand("SELECT Seminar.ALUN_NUMERO,Seminar.ALUN_NUMERO_SEQ,Seminar_Info.topicName,student_academic_info.STUDENT_ID,student_academic_info.NAME_CH FROM Seminar,student_academic_info,Seminar_Info WHERE Seminar.ALUN_NUMERO=student_academic_info.ALUN_NUMERO and Seminar.ALUN_NUMERO_SEQ=student_academic_info.ALUN_NUMERO_SEQ and Seminar.Seminar_info_id=Seminar_Info.id and Seminar.taken='True'and Seminar.Operator='" & Session("ID") & "'", mySQLconnection)

        Dim mySqlAdapter As New SqlDataAdapter(mySqlCommand)
        Dim myDataSet As New DataSet()
        mySqlAdapter.Fill(myDataSet)

        GridView2.DataSource = myDataSet
        GridView2.DataBind()

        Dim hiddenIDs1() As String = {}

        If Not String.IsNullOrEmpty(HiddenField1.Value) Then
            hiddenIDs1 = HiddenField1.Value.Split(New Char() {"|"})
        End If

        Dim arrIDs1 As New ArrayList()

        If hiddenIDs1.Length <> 0 Then
            arrIDs1.AddRange(hiddenIDs1)
        End If

        Dim chk As CheckBox
        Dim CatID1 As String
        Dim CatID2 As String

        For Each rowItem As GridViewRow In GridView2.Rows
            chk = CType(rowItem.Cells(0).FindControl("chk2"), CheckBox)

            CatID1 = GridView2.DataKeys(rowItem.RowIndex)("ALUN_NUMERO").ToString()
            CatID2 = GridView2.DataKeys(rowItem.RowIndex)("ALUN_NUMERO_SEQ").ToString()


            If arrIDs1.Contains(CatID1) And arrIDs1.Contains(CatID2) Then
                chk.Checked = True
            Else
                chk.Checked = False
            End If
        Next



        If mySQLconnection.State = ConnectionState.Open Then mySQLconnection.Close()
    End Sub





    Protected Sub GridView2_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridView2.PageIndexChanging
        GridView2.PageIndex = e.NewPageIndex
        SelectedCheckBoxes1()
        bindGridView1()


    End Sub

    Protected Sub Button6_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button6.Click
        'Dim dv_seminar As Data.DataView = SqlDataSource4.Select(New DataSourceSelectArguments)
        For i As Integer = 0 To (GridView2.Rows.Count - 1)
            Dim myCheckbox As CheckBox = GridView2.Rows(i).FindControl("chk2")
   
            If myCheckbox.Checked = True Then

             
                Try
                    Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
                    Using mycon As New SqlConnection(con)
                        mycon.Open()
                        Dim strSQL As String = "delete from Seminar where ALUN_NUMERO=@ALUN_NUMERO and ALUN_NUMERO_SEQ=@ALUN_NUMERO_SEQ and Seminar_info_id=@Seminar_info_id;"
                        '  strSQL = strSQL + "update Learning_Records_Correspond set count = count - 1 where PESS_COD=@pess_cod1 and experience_id='1'"
                        Using cmd As New SqlCommand()
                            cmd.Connection = mycon
                            cmd.CommandText = strSQL
                            cmd.Parameters.AddWithValue("@ALUN_NUMERO", GridView2.DataKeys(i)("ALUN_NUMERO").ToString())
                            cmd.Parameters.AddWithValue("@ALUN_NUMERO_SEQ", GridView2.DataKeys(i)("ALUN_NUMERO_SEQ").ToString())
                            cmd.Parameters.AddWithValue("@Seminar_info_id", topicNameForAdd.Value)
                            ' cmd.Parameters.AddWithValue("@pess_cod1", GridView2.DataKeys(i)("pess_cod").ToString())
                            cmd.ExecuteNonQuery()
                        End Using
                        mycon.Close()
                    End Using
                Catch ex As Exception
                    Response.Write("<script>alert('some student had already taken')</script>")

                End Try
            End If
        Next
        bindGridView1()
    End Sub



   
    Protected Sub Button7_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button7.Click
        Button2.Visible = True
        Button3.Visible = True
        Button4.Visible = True
        bindGridViewByStud()
        MultiView1.ActiveViewIndex = 1
    End Sub
    Public Sub bindGridAttendInfo()
        SqlDataSource7.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
        SqlDataSource7.SelectCommand = "SELECT student_academic_info.ALUN_NUMERO,student_academic_info.ALUN_NUMERO_SEQ,student_academic_info.student_id,student_academic_info.name_ch,Seminar_Info.topicName,Seminar_Info.startDate FROM [Seminar],[student_academic_info],[Seminar_Info] where Seminar.Seminar_info_id=Seminar_Info.id and Seminar.Seminar_info_id='" & ListBox2.SelectedValue & "' and student_academic_info.school_code='" & DropDownList1.SelectedValue & "' and student_academic_info.program_composite_code='" & DropDownList2.SelectedValue & "' and student_academic_info.ALUN_NUMERO = Seminar.ALUN_NUMERO and student_academic_info.ALUN_NUMERO_SEQ = Seminar.ALUN_NUMERO_SEQ"
        GridView3.DataSource = SqlDataSource7

        GridView3.DataBind()
    End Sub
    Public Sub PageCount()
        Try
            Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
            Using mycon As New SqlConnection(con)
                mycon.Open()
                Dim strSQL As String = "select count(Seminar_Info.topicName)as studentCount FROM [Seminar],[student_academic_info],[Seminar_Info] where Seminar.Seminar_info_id=Seminar_Info.id and Seminar.Seminar_info_id=@Seminar_info_id and student_academic_info.school_code=@school_code and student_academic_info.program_composite_code=@programme_code and student_academic_info.ALUN_NUMERO=Seminar.ALUN_NUMERO and student_academic_info.ALUN_NUMERO_SEQ=Seminar.ALUN_NUMERO_SEQ"
                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL
                    cmd.Parameters.AddWithValue("@Seminar_info_id", ListBox2.SelectedValue)
                    cmd.Parameters.AddWithValue("@school_code", DropDownList1.SelectedValue)
                    cmd.Parameters.AddWithValue("@programme_code", DropDownList2.SelectedValue)
                    Dim reader As SqlDataReader = cmd.ExecuteReader()
                    If reader.HasRows Then
                        While reader.Read()
                            Label6.Text = reader("studentCount").ToString()
                        End While
                    Else
                        Label6.Text = "0"
                    End If
                End Using
                mycon.Close()
            End Using

        Catch ex As Exception
            Response.Write("<script>alert('Web Error!')</script>")
        End Try
    End Sub
    Protected Sub Button8_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button8.Click
        MultiView1.ActiveViewIndex = 0
        Label5.Visible = True
        Label6.Visible = True
        GridView3.Visible = True

        bindGridAttendInfo()
        PageCount()
   
        toipcNameForDel.Value = ListBox2.SelectedValue
    End Sub




    Protected Sub ListBox1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ListBox1.SelectedIndexChanged
        GridView3.Visible = False
        Label5.Visible = False
        Label6.Visible = False
    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList1.SelectedIndexChanged
        GridView3.Visible = False
        Label5.Visible = False
        Label6.Visible = False
    End Sub



    Public Sub bindGridViewAttend()

        Dim connStr As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString


        Dim mySQLconnection As New SqlConnection(connStr)


        If mySQLconnection.State = ConnectionState.Closed Then mySQLconnection.Open()

        Dim mySqlCommand As New SqlCommand("SELECT STUDENT_ID, NAME_CH,ALUN_NUMERO,ALUN_NUMERO_SEQ FROM student_academic_info WHERE ((SCHOOL_CODE = @SCHOOL_CODE) AND (PROGRAM_COMPOSITE_CODE = @PROGRAM_COMPOSITE_CODE))", mySQLconnection)
        mySqlCommand.Parameters.AddWithValue("@SCHOOL_CODE", DropDownList1.SelectedValue)
        mySqlCommand.Parameters.AddWithValue("@PROGRAM_COMPOSITE_CODE", DropDownList2.SelectedValue)
        Dim mySqlAdapter As New SqlDataAdapter(mySqlCommand)
        Dim myDataSet As New DataSet()
        mySqlAdapter.Fill(myDataSet)

        GridView1.DataSource = myDataSet
        GridView1.DataBind()

        Dim hiddenIDs() As String = {}

        If Not String.IsNullOrEmpty(hiddenCatIDs.Value) Then
            hiddenIDs = hiddenCatIDs.Value.Split(New Char() {"|"})
        End If

        Dim arrIDs As New ArrayList()

        If hiddenIDs.Length <> 0 Then
            arrIDs.AddRange(hiddenIDs)
        End If

        Dim chk As CheckBox
        Dim CatID As String
        Dim CatID1 As String

        For Each rowItem As GridViewRow In GridView1.Rows
            chk = CType(rowItem.Cells(0).FindControl("chk1"), CheckBox)

            CatID = GridView1.DataKeys(rowItem.RowIndex)("ALUN_NUMERO").ToString()
            CatID1 = GridView1.DataKeys(rowItem.RowIndex)("ALUN_NUMERO_SEQ").ToString()

            If arrIDs.Contains(CatID) And arrIDs.Contains(CatID1) Then
                chk.Checked = True
            Else
                chk.Checked = False
            End If
        Next



        If mySQLconnection.State = ConnectionState.Open Then mySQLconnection.Close()
    End Sub





    Protected Sub GridView3_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridView3.PageIndexChanging
        Me.GridView3.PageIndex = e.NewPageIndex
        bindGridAttendInfo()
    End Sub






    Protected Sub GridView3_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GridView3.RowDeleting

        Try
            Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
            Using mycon As New SqlConnection(con)
                mycon.Open()
                Dim strSQL As String = "delete from Seminar where Seminar_info_id=@Seminar_info_id and ALUN_NUMERO=@ALUN_NUMERO and ALUN_NUMERO_SEQ=@ALUN_NUMERO_SEQ;"
                strSQL = strSQL + "update Learning_Records_Correspond set count = count - 1 where ALUN_NUMERO=@ALUN_NUMERO1 and ALUN_NUMERO_SEQ=@ALUN_NUMERO_SEQ1 and experience_id='1'"
                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL
                    cmd.Parameters.AddWithValue("@ALUN_NUMERO", GridView3.DataKeys(e.RowIndex)("ALUN_NUMERO").ToString())
                    cmd.Parameters.AddWithValue("@ALUN_NUMERO_SEQ", GridView3.DataKeys(e.RowIndex)("ALUN_NUMERO_SEQ").ToString())

                    cmd.Parameters.AddWithValue("@Seminar_info_id", toipcNameForDel.Value)
                    cmd.Parameters.AddWithValue("@ALUN_NUMERO1", GridView3.DataKeys(e.RowIndex)("ALUN_NUMERO").ToString())
                    cmd.Parameters.AddWithValue("@ALUN_NUMERO_SEQ1", GridView3.DataKeys(e.RowIndex)("ALUN_NUMERO_SEQ").ToString())

                    cmd.ExecuteNonQuery()
                End Using
                mycon.Close()
            End Using
        Catch ex As Exception
            Response.Write("<script>alert('some student had already taken')</script>")

        End Try
        bindGridAttendInfo()
        PageCount()
    End Sub

   
    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton1.Click
        Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
        Using mycon As New SqlConnection(con)
            mycon.Open()

            Dim strSQL As String = "update Seminar set taken = 'False' where Operator=@Operator"
            Using cmd As New SqlCommand()
                cmd.Connection = mycon
                cmd.CommandText = strSQL

                cmd.Parameters.AddWithValue("@Operator", Session("ID"))
                cmd.ExecuteNonQuery()

            End Using
            mycon.Close()
        End Using
        Response.Redirect("home.aspx")
    End Sub
End Class
