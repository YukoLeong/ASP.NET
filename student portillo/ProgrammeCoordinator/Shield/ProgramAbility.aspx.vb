Imports System.Data.SqlClient
Imports System.Data
Partial Class Student_ProgramAbility
    Inherits System.Web.UI.Page
    Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            If Session("Role_Type") Is Nothing Then

                Response.Write("<script>alert('Please Log In !'); window.location.href='../staff.aspx'; </script>")

            End If
            bindProgramList()
        End If

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

    Public Sub bindProgram()


        Using mycon As New SqlConnection(con)
            mycon.Open()

            Dim strSQL As String = " select ProgramAbility.id, ProgramAbility.ability from ProgramAbility,program_info where ProgramAbility.program_code=program_info.code and ProgramAbility.program_code=@code "



            Using cmd As New SqlCommand()
                cmd.Connection = mycon
                cmd.CommandText = strSQL
                cmd.Parameters.AddWithValue("@code", ListBox1.SelectedValue)

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


    Protected Sub SearchBtn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SearchBtn.Click
        bindProgram()
    End Sub

    Protected Sub addAbility_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles addAbility.Click
        MultiView1.ActiveViewIndex = 1
        bindAddProgramList()
        ability.Text = ""

    End Sub

    Protected Sub backBtn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles backBtn.Click
        bindProgram()
        MultiView1.ActiveViewIndex = 0
    End Sub

    Protected Sub abilityIns_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles abilityIns.Click
        Try

            Using mycon As New SqlConnection(con)
                mycon.Open()
                Dim strSQL As String = "SELECT ability from ProgramAbility where program_code=@program_code "

                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL
                    cmd.Parameters.AddWithValue("@program_code", ListBox2.SelectedValue)

                    Dim reader As SqlDataReader = cmd.ExecuteReader()
                    If reader.HasRows Then
                        While reader.Read()
                            If ability.Text = reader("ability") Then
                                Response.Write("<script>alert('The program ability have already existed,try an another please')</script>")
                                ability.Text = ""
                                Exit Sub
                            End If


                        End While
                    End If
                End Using
                mycon.Close()
            End Using

        Catch ex As Exception
            Response.Write("<script>alert('Web Error!')</script>")
            Exit Sub
        End Try
        Try

            Using mycon As New SqlConnection(con)
                mycon.Open()
                Dim strSQL As String = "insert into ProgramAbility(program_code,ability)values(@code,@ability)"

                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL
                    cmd.Parameters.AddWithValue("@code", ListBox2.SelectedValue)
                    cmd.Parameters.AddWithValue("@ability", ability.Text)

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
    Public Sub bindAddProgramList()
        ListBox2.Items.Clear()
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

                            ListBox2.Items.Add(New ListItem(reader("PROGRAM_COMPOSITE_EN").ToString(), reader("CODE").ToString()))
                        End While
                    End If
                End Using
                mycon.Close()
            End Using

        Catch ex As Exception
            Response.Write("<script>alert('Web Error!')</script>")
        End Try


    End Sub

    Protected Sub GridViewAbility_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles GridViewAbility.RowEditing
        GridViewAbility.EditIndex = e.NewEditIndex
        bindProgram()
    End Sub

    Protected Sub GridViewAbility_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles GridViewAbility.RowUpdating
        Try
            Using mycon As New SqlConnection(con)
                mycon.Open()
                Dim strSQL As String = "update ProgramAbility set ability=@ability where id=@id "

                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL
                    cmd.Parameters.AddWithValue("@id", GridViewAbility.DataKeys(e.RowIndex).Value.ToString())
                    cmd.Parameters.AddWithValue("@ability", CType(Me.GridViewAbility.Rows(e.RowIndex).FindControl("TextBox1"), TextBox).Text.Trim())

                    cmd.ExecuteNonQuery()
                End Using
                mycon.Close()
            End Using
        Catch ex As Exception

            Response.Write("<script>alert('web error')</script>")

        End Try
        GridViewAbility.EditIndex = -1
        bindProgram()


    End Sub

    Protected Sub GridViewAbility_RowCancelingEdit(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCancelEditEventArgs) Handles GridViewAbility.RowCancelingEdit
        GridViewAbility.EditIndex = -1
        bindProgram()

    End Sub

    Protected Sub GridViewAbility_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GridViewAbility.RowDeleting
        If (delmsg.Value = "No") Then
            e.Cancel = True
            Return
        End If
        Try
            Using mycon As New SqlConnection(con)
                mycon.Open()
                Dim strSQL As String = "delete from ProgramAbility  where id=@id "

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
        bindProgram()

    End Sub

    Protected Sub home_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles home.Click
        Response.Redirect("~/Instructor/home.aspx")
    End Sub
End Class

