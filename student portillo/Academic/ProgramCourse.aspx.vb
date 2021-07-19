Imports System.Data.SqlClient
Imports System.Data
Partial Class Student_ProgramCourse
    Inherits System.Web.UI.Page
    Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            If Session("Role_Type") Is Nothing Then

                Response.Write("<script>alert('Please Log In !'); window.location.href='../staff.aspx'; </script>")

            End If
            bindProgramList()
            bindProgramAddList()
        End If

    End Sub
    Public Sub bindSubject()


        Using mycon As New SqlConnection(con)
            mycon.Open()
            Dim strSQL As String = "SELECT SubjectAbility.id,ProgramAbility.ability FROM SubjectAbility,ProgramAbility where SubjectAbility.abilityID=ProgramAbility.id and SubjectAbility.subject_code=@subject  "



            Using cmd As New SqlCommand()
                cmd.Connection = mycon
                cmd.CommandText = strSQL
                cmd.Parameters.AddWithValue("@subject", ListBox3.SelectedValue)

                Dim mySqlAdapter As New SqlDataAdapter(cmd)
                Dim myDataSet As New DataSet()
                mySqlAdapter.Fill(myDataSet)

                GridViewAbility.DataSource = myDataSet
                GridViewAbility.AllowPaging = True
                GridViewAbility.PageSize = 10
                GridViewAbility.DataBind()
            End Using
            mycon.Close()
        End Using

    End Sub
    Public Function program() As String


        Dim strArr() As String
        Dim count As Integer
        Dim result As String = ""
        Dim char1 As Char() = New [Char]() {",", "_"}
        strArr = Session("Programme").Split(char1)
        For count = 0 To strArr.Length - 1 Step 2

            If (count = strArr.Length - 2) Then
                result = result + "'" + strArr(count + 1) + "'"

            Else
                result = result + "'" + strArr(count + 1) + "'" + ","

            End If

        Next
        Return result
    End Function

    Public Sub bindProgramList()
        ListBox1.Items.Clear()

        Try
            Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
            Using mycon As New SqlConnection(con)
                mycon.Open()
                Dim strSQL As String = "SELECT * FROM program_info WHERE SIMPLIFY_CODE in  (" + program() + ")"

                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL
                    Dim reader As SqlDataReader = cmd.ExecuteReader()
                    If reader.HasRows Then
                        While reader.Read()

                            ListBox1.Items.Add(New ListItem(reader("PROGRAM_COMPOSITE_EN").ToString(), reader("CODE").ToString()))
                        End While
                    End If
                End Using
                mycon.Close()
            End Using

        Catch ex As Exception
            Response.Write("<script>alert('Web Error!')</script>")
        End Try


    End Sub
    Public Sub bindProgramAddList()
        ListBox4.Items.Clear()
        Try
            Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
            Using mycon As New SqlConnection(con)
                mycon.Open()
                Dim strSQL As String = "SELECT * FROM program_info WHERE SIMPLIFY_CODE in  (" + program() + ")"

                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL
                    Dim reader As SqlDataReader = cmd.ExecuteReader()
                    If reader.HasRows Then
                        While reader.Read()

                            ListBox4.Items.Add(New ListItem(reader("PROGRAM_COMPOSITE_EN").ToString(), reader("CODE").ToString()))
                        End While
                    End If
                End Using
                mycon.Close()
            End Using

        Catch ex As Exception
            Response.Write("<script>alert('Web Error!')</script>")
        End Try


    End Sub
    Public Sub GetSubjectInfo()
        Try

            Using mycon As New SqlConnection(con)
                mycon.Open()
                Dim strSQL As String = "SELECT distinct SUBJECT_CODE, SUBJECT_CH, SUBJECT_EN  FROM academic_result_info where SUBJECT_CODE=@code"

                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL
                    cmd.Parameters.AddWithValue("@code", ListBox3.SelectedValue)

                    Dim reader As SqlDataReader = cmd.ExecuteReader()
                    If reader.HasRows Then
                        While reader.Read()
                            subCode.Text = reader("SUBJECT_CODE").ToString()
                            subcname.Text = reader("SUBJECT_CH").ToString()
                            subpname.Text = reader("SUBJECT_EN").ToString()
                        End While
                    Else
                        subCode.Text = ""
                        subcname.Text = ""
                        subpname.Text = ""
                    End If
                End Using
                mycon.Close()
            End Using

        Catch ex As Exception
            Response.Write("<script>alert('Web Error!')</script>")
        End Try
    End Sub
    Protected Sub SearchBtn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SearchBtn.Click
        bindSubject()
        GetSubjectInfo()
        code.Visible = True
        cname.Visible = True
        pname.Visible = True
    End Sub

    Protected Sub addAbility_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles addAbility.Click

        MultiView1.ActiveViewIndex = 1

    End Sub

    Protected Sub backBtn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles backBtn.Click
        bindSubject()
        MultiView1.ActiveViewIndex = 0
    End Sub

    Protected Sub abilityIns_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles abilityIns.Click
        Try

            Using mycon As New SqlConnection(con)
                mycon.Open()
                Dim strSQL As String = "insert into SubjectAbility(subject_code,abilityID,program_code)values(@code,@abilityID,@program_code)"

                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL
                    cmd.Parameters.AddWithValue("@code", ListBox6.SelectedValue)
                    cmd.Parameters.AddWithValue("@abilityID", ListBox7.SelectedValue)
                    cmd.Parameters.AddWithValue("@program_code", ListBox4.SelectedValue)
                    cmd.ExecuteNonQuery()
                End Using
                mycon.Close()
            End Using

        Catch ex As Exception

            Response.Write("<script>alert('Insert Error!')</script>")

            Return

        End Try
        Response.Write("<script>alert('Insert Succefully !'); </script>")
    End Sub

    Protected Sub ListBox1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ListBox1.SelectedIndexChanged
        ListBox2.Items.Clear()
        ListBox2.Items.Add(New ListItem("First Year", "1"))
        ListBox2.Items.Add(New ListItem("Second Year", "2"))
        ListBox2.Items.Add(New ListItem("Third Year", "3"))
        ListBox2.Items.Add(New ListItem("Fourth Year", "4"))
    End Sub

    Protected Sub ListBox7_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ListBox7.SelectedIndexChanged
        ListBox5.Items.Clear()
        ListBox5.Items.Add(New ListItem("First Year", "1"))
        ListBox5.Items.Add(New ListItem("Second Year", "2"))
        ListBox5.Items.Add(New ListItem("Third Year", "3"))
        ListBox5.Items.Add(New ListItem("Fourth Year", "4"))
    End Sub

    Protected Sub GridViewAbility_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GridViewAbility.RowDeleting
        If (delmsg.Value = "No") Then
            e.Cancel = True
            Return
        End If
        Try
            Using mycon As New SqlConnection(con)
                mycon.Open()
                Dim strSQL As String = "delete from SubjectAbility  where id=@id "

                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL
                    cmd.Parameters.AddWithValue("@id", GridViewAbility.DataKeys(e.RowIndex).Value.ToString())
                    cmd.ExecuteNonQuery()
                End Using
                mycon.Close()
            End Using
        Catch ex As Exception

            Response.Write("<script>alert('web error')</script>")

        End Try
        bindSubject()

    End Sub


    Protected Sub home_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles home.Click
        Response.Redirect("~/Instructor/home.aspx")
    End Sub
End Class


