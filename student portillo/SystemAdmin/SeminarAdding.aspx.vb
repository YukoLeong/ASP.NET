Imports System.Data.SqlClient
Imports System.Data

Partial Class SystemAdmin_SeminarAdding
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ' If Session("ID") Is Nothing Then

        'MsgBox("please login in")

        '  Response.Redirect("~/login.aspx")
        '  End If
        Session("Operator") = "gary"


    End Sub
    Public Sub SelectedCheckBoxes()
        Dim hiddenIDs() As String = {}
        If Not String.IsNullOrEmpty(hiddenCatIDs.Value) Then
            hiddenIDs = hiddenCatIDs.Value.Split(New Char() {"|"})
        End If

        Dim arrIDs As New ArrayList()
        Dim CatID As String = "0"

        If hiddenIDs.Length <> 0 Then
            arrIDs.AddRange(hiddenIDs)
        End If

        For Each rowItem As GridViewRow In GridView1.Rows
            Dim chk As CheckBox

            chk = CType(rowItem.Cells(0).FindControl("chk1"), CheckBox)
            CatID = GridView1.DataKeys(rowItem.RowIndex)("pess_cod").ToString()
            If chk.Checked Then
                If Not arrIDs.Contains(CatID) Then
                    arrIDs.Add(CatID)
                End If
            Else
                If (arrIDs.Contains(CatID)) Then
                    arrIDs.Remove(CatID)
                End If
            End If
        Next

        hiddenIDs = CType(arrIDs.ToArray(Type.GetType("System.String")), String())

        hiddenCatIDs.Value = String.Join("|", hiddenIDs)
    End Sub
    Public Sub bindGridView()

        Dim connStr As String = ConfigurationManager.ConnectionStrings("EPConnectionString1").ConnectionString


        Dim mySQLconnection As New SqlConnection(connStr)


        If mySQLconnection.State = ConnectionState.Closed Then mySQLconnection.Open()

        Dim mySqlCommand As New SqlCommand("SELECT STUDENT_ID, NAME_CH,pess_cod FROM student_academic_info WHERE ((SCHOOL_EN = @SCHOOL_EN) AND (PROGRAM_COMPOSITE_EN = @PROGRAM_COMPOSITE_EN))", mySQLconnection)
        mySqlCommand.Parameters.AddWithValue("@SCHOOL_EN", DropDownList1.SelectedValue)
        mySqlCommand.Parameters.AddWithValue("@PROGRAM_COMPOSITE_EN", DropDownList2.SelectedValue)
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

        For Each rowItem As GridViewRow In GridView1.Rows
            chk = CType(rowItem.Cells(0).FindControl("chk1"), CheckBox)

            CatID = GridView1.DataKeys(rowItem.RowIndex)("pess_cod").ToString()

            If arrIDs.Contains(CatID) Then
                chk.Checked = True
            Else
                chk.Checked = False
            End If
        Next



        If mySQLconnection.State = ConnectionState.Open Then mySQLconnection.Close()
    End Sub


    Protected Sub GridView1_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs)
        GridView1.PageIndex = e.NewPageIndex
        SelectedCheckBoxes()
        bindGridView()

    End Sub




    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
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
        Application.Lock()
        Dim dv_seminar As Data.DataView = SqlDataSource4.Select(New DataSourceSelectArguments)
        For i As Integer = 0 To (GridView1.Rows.Count - 1)
            Dim myCheckbox As CheckBox = GridView1.Rows(i).FindControl("chk1")


            If myCheckbox.Checked = True Then

                Try
                    Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString1").ConnectionString
                    Using mycon As New SqlConnection(con)
                        mycon.Open()
                        Dim strSQL As String = "insert into Seminar (pess_cod,topicName,category,startDate,duration,organizer,mpi_gen,Operator,take)values(@pess_cod,@topic,@category,@startDate,@duration,@organizer,@mpi_gen,@Operator,@take)"
                        Dim strSQL1 As String = "update Learning_Records_Correspond set Seminar_Conference = Seminar_Conference + 1 where PESS_COD=@pess_cod1"
                        Using cmd As New SqlCommand()
                            cmd.Connection = mycon
                            cmd.CommandText = strSQL
                            cmd.Parameters.AddWithValue("@pess_cod", GridView1.DataKeys(i)("pess_cod").ToString())
                            cmd.Parameters.AddWithValue("@topic", DropDownList3.SelectedValue)
                            cmd.Parameters.AddWithValue("@category", dv_seminar.Item(0).Item("category").ToString)
                            cmd.Parameters.AddWithValue("@startDate", dv_seminar.Item(0).Item("startDate").ToString)
                            cmd.Parameters.AddWithValue("@duration", dv_seminar.Item(0).Item("duration").ToString)
                            cmd.Parameters.AddWithValue("@organizer", dv_seminar.Item(0).Item("organizer").ToString)
                            cmd.Parameters.AddWithValue("@mpi_gen", dv_seminar.Item(0).Item("mpi_gen").ToString)
                            cmd.Parameters.AddWithValue("@Operator", Session("Operator"))
                            cmd.Parameters.AddWithValue("@take", "True")
                            cmd.ExecuteNonQuery()
                            cmd.CommandText = strSQL1
                            cmd.Parameters.AddWithValue("@pess_cod1", GridView1.DataKeys(i)("pess_cod").ToString())
                            cmd.ExecuteNonQuery()
                        End Using
                        mycon.Close()
                    End Using
                Catch ex As Exception
                    Application.UnLock()
                    MsgBox("some student have been taken, check it please")
                    Return

                End Try
            End If
        Next

        bindGridView1()
        Button6.Visible = True
        Application.UnLock()
    End Sub



    Public Sub SelectedCheckBoxes1()
        Dim hiddenIDs1() As String = {}
        If Not String.IsNullOrEmpty(HiddenField1.Value) Then
            hiddenIDs1 = HiddenField1.Value.Split(New Char() {"|"})
        End If

        Dim arrIDs1 As New ArrayList()
        Dim CatID1 As String = "0"

        If hiddenIDs1.Length <> 0 Then
            arrIDs1.AddRange(hiddenIDs1)
        End If

        For Each rowItem As GridViewRow In GridView2.Rows
            Dim chk As CheckBox

            chk = CType(rowItem.Cells(0).FindControl("chk2"), CheckBox)
            CatID1 = GridView2.DataKeys(rowItem.RowIndex)("pess_cod").ToString()
            If chk.Checked Then
                If Not arrIDs1.Contains(CatID1) Then
                    arrIDs1.Add(CatID1)
                End If
            Else
                If (arrIDs1.Contains(CatID1)) Then
                    arrIDs1.Remove(CatID1)
                End If
            End If
        Next

        hiddenIDs1 = CType(arrIDs1.ToArray(Type.GetType("System.String")), String())

        HiddenField1.Value = String.Join("|", hiddenIDs1)
    End Sub
    Public Sub bindGridView1()

        Dim connStr As String = ConfigurationManager.ConnectionStrings("EPConnectionString1").ConnectionString


        Dim mySQLconnection As New SqlConnection(connStr)


        If mySQLconnection.State = ConnectionState.Closed Then mySQLconnection.Open()

        Dim mySqlCommand As New SqlCommand("SELECT Seminar.pess_cod,Seminar.topicName,student_academic_info.STUDENT_ID,student_academic_info.NAME_CH FROM Seminar,student_academic_info WHERE Seminar.pess_cod=student_academic_info.pess_cod and Seminar.take='True'and Seminar.Operator='" & Session("Operator") & "'", mySQLconnection)

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

        For Each rowItem As GridViewRow In GridView2.Rows
            chk = CType(rowItem.Cells(0).FindControl("chk2"), CheckBox)

            CatID1 = GridView2.DataKeys(rowItem.RowIndex)("pess_cod").ToString()

            If arrIDs1.Contains(CatID1) Then
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
        Dim dv_seminar As Data.DataView = SqlDataSource4.Select(New DataSourceSelectArguments)
        For i As Integer = 0 To (GridView2.Rows.Count - 1)
            Dim myCheckbox As CheckBox = GridView2.Rows(i).FindControl("chk2")


            If myCheckbox.Checked = True Then
                Try
                    Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString1").ConnectionString
                    Using mycon As New SqlConnection(con)
                        mycon.Open()
                        Dim strSQL As String = "delete from Seminar where pess_cod=@pess_cod"
                        Dim strSQL1 As String = "update Learning_Records_Correspond set Seminar_Conference = Seminar_Conference - 1 where PESS_COD=@pess_cod1"
                        Using cmd As New SqlCommand()
                            cmd.Connection = mycon
                            cmd.CommandText = strSQL
                            cmd.Parameters.AddWithValue("@pess_cod", GridView2.DataKeys(i)("pess_cod").ToString())
                            cmd.ExecuteNonQuery()
                            cmd.CommandText = strSQL1
                            cmd.Parameters.AddWithValue("@pess_cod1", GridView2.DataKeys(i)("pess_cod").ToString())
                            cmd.ExecuteNonQuery()
                        End Using
                        mycon.Close()
                    End Using
                Catch ex As Exception
                    MsgBox("some student had already taken ")
                End Try
            End If
        Next
        bindGridView1()
    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton1.Click
        Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString1").ConnectionString
        Using mycon As New SqlConnection(con)
            mycon.Open()

            Dim strSQL As String = "update Seminar set take = 'False' where Operator=@Operator"
            Using cmd As New SqlCommand()
                cmd.Connection = mycon
                cmd.CommandText = strSQL

                cmd.Parameters.AddWithValue("@Operator", Session("Operator"))
                cmd.ExecuteNonQuery()

            End Using
            mycon.Close()
        End Using
        Response.Redirect("home.aspx")
    End Sub

   
End Class
