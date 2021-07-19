Imports System.Data.SqlClient
Imports System.Data

Partial Class SystemAdmin_RoleAccount
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim dv_verify As Data.DataView = SqlDataSource4.Select(New DataSourceSelectArguments)

            If Session("Role_Type") Is Nothing Then

                Response.Write("<script>alert('Please Log In !'); window.location.href='../staff.aspx'; </script>")
                Response.End()
            End If


            If dv_verify.Item(0).Item("uam") = "False" Then

                Response.Write("<script>alert('You do not have Permission to view it !');window.history.back(-1); </script>")

            End If
        End If
    End Sub
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        MultiView1.ActiveViewIndex = 0


    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click
        MultiView1.ActiveViewIndex = 1

    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList1.SelectedIndexChanged
        If DropDownList1.SelectedValue = "tutor" Then
            Dim tutor As DropDownList = DropDownList2
            tutor.Items.Clear()
            tutor.Items.Add(New ListItem("1", "1"))
            tutor.Items.Add(New ListItem("2", "2"))
            tutor.Items.Add(New ListItem("3", "3"))
            tutor.Items.Add(New ListItem("4", "4"))
        Else
            Dim tutor As DropDownList = DropDownList2
            tutor.Items.Clear()
        End If
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        Dim con As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString)
        Dim dv_uid As Data.DataView = SqlDataSource5.Select(New DataSourceSelectArguments)
        Dim flag As Boolean
        flag = False
        If TextBox1.Text = "" Then
            Response.Write("<script>alert('Net ID is empty!')</script>")
            Exit Sub
        End If
        If DropDownList1.SelectedValue = "operator" Then


            Try
                con.Open()
                Dim tmp_da As SqlDataAdapter = New SqlDataAdapter()
                Dim tmp_ds As New DataSet
                Dim tmp_dr As DataRow


                Dim cmd As SqlCommand = New SqlCommand("Select TOP 1 * from student_academic_info where netid=@id order by ALUN_NUMERO_SEQ desc ", con)
                cmd.Parameters.AddWithValue("@id", TextBox1.Text)
                tmp_da.SelectCommand = cmd


                tmp_da.Fill(tmp_ds, "student_academic_info")


                If tmp_ds.Tables("student_academic_info").Rows.Count <> 0 Then
                    tmp_dr = tmp_ds.Tables("student_academic_info").Rows(0)

                    Dim cmd1 As SqlCommand = New SqlCommand("insert into RoleAccount(uid,position,tutor_year,COD)values(@uid,@position,@tutor_year,@COD) ", con)

                    cmd1.Parameters.AddWithValue("@uid", TextBox1.Text)
                    cmd1.Parameters.AddWithValue("@position", "operator")
                    cmd1.Parameters.AddWithValue("@tutor_year", "Not define")
                    cmd1.Parameters.AddWithValue("@COD", tmp_dr("SCHOOL_CODE"))
                    cmd1.ExecuteNonQuery()
                    Response.Write("<script>alert('Insert Successfully')</script>")
                    GridView1.DataBind()
                    TextBox1.Text = ""
                    TextBox1.Focus()
                    Exit Sub
                Else

                    For i As Integer = 0 To dv_uid.Count - 1
                        If IsDBNull(dv_uid.Item(i).Item("uid")) Then
                        Else

                            If dv_uid.Item(i).Item("uid") = TextBox1.Text Then
                                flag = True
                                Try
                                    Dim conn As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
                                    Using mycon As New SqlConnection(conn)
                                        mycon.Open()
                                        Dim strSQL As String = "insert into RoleAccount(uid,position,tutor_year,COD)values(@uid,@position,@tutor_year,@COD);"

                                        Using cmd2 As New SqlCommand()
                                            cmd2.Connection = mycon
                                            cmd2.CommandText = strSQL
                                            cmd2.Parameters.AddWithValue("@uid", TextBox1.Text)
                                            cmd2.Parameters.AddWithValue("@position", "operator")
                                            cmd2.Parameters.AddWithValue("@tutor_year", "Not define")
                                            cmd2.Parameters.AddWithValue("@COD", dv_uid.Item(i).Item("COD"))
                                            cmd2.ExecuteNonQuery()
                                        End Using
                                        mycon.Close()
                                    End Using
                                Catch ex As Exception

                                    Response.Write("<script>alert('Web Error')</script>")

                                    Return

                                End Try
                                Response.Write("<script>alert('Insert Successfully')</script>")
                                GridView1.DataBind()
                                TextBox1.Text = ""
                                TextBox1.Focus()
                                Exit Sub
                            End If
                        End If
                    Next
    
                    If flag = False Then
                        Response.Write("<script>alert('Net ID is invalid')</script>")
                        TextBox1.Text = ""
                        TextBox1.Focus()
                        Exit Sub
                    End If
                End If


            Catch ex As Exception

                Response.Write("<script>alert('Incorrect account or password!'); location.href='home.aspx'; </script>")
            End Try
            con.Close()


        Else

            For i As Integer = 0 To dv_uid.Count - 1
                If IsDBNull(dv_uid.Item(i).Item("uid")) Then
                Else

                    If dv_uid.Item(i).Item("uid") = TextBox1.Text Then
                        flag = True
                        Try
                            Dim conn As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
                            Using mycon As New SqlConnection(conn)
                                mycon.Open()
                                Dim strSQL As String = "insert into RoleAccount(uid,position,tutor_year,COD)values(@uid,@position,@tutor_year,@COD);"

                                Using cmd3 As New SqlCommand()
                                    cmd3.Connection = mycon
                                    cmd3.CommandText = strSQL
                                    cmd3.Parameters.AddWithValue("@uid", TextBox1.Text)
                                    cmd3.Parameters.AddWithValue("@position", DropDownList1.SelectedValue)
                                    If DropDownList1.SelectedValue = "tutor" Then
                                        cmd3.Parameters.AddWithValue("@tutor_year", DropDownList2.SelectedValue)
                                    Else
                                        cmd3.Parameters.AddWithValue("@tutor_year", "Not define")
                                    End If
                                    cmd3.Parameters.AddWithValue("@COD", dv_uid.Item(i).Item("COD"))
                                    cmd3.ExecuteNonQuery()
                                End Using
                                mycon.Close()
                            End Using
                        Catch ex As Exception

                            Response.Write("<script>alert('Web Error')</script>")

                            Return

                        End Try
                        Response.Write("<script>alert('Insert Successfully')</script>")
                        GridView1.DataBind()
                        TextBox1.Text = ""
                        TextBox1.Focus()
                    End If
                End If
            Next
         
            If flag = False Then
                Response.Write("<script>alert('Net ID is invalid')</script>")
                TextBox1.Text = ""
                TextBox1.Focus()
            End If

        End If

       
    End Sub

    Protected Sub Button4_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button4.Click
        Try
            Dim conn As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
            Using mycon As New SqlConnection(conn)
                mycon.Open()
                Dim strSQL As String = "insert into SystemAdmin(uid,password,position)values(@uid,@password,@position);"

                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL
                    cmd.Parameters.AddWithValue("@uid", TextBox2.Text)
                    cmd.Parameters.AddWithValue("@password", System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(TextBox3.Text, System.Web.Configuration.FormsAuthPasswordFormat.SHA1.ToString()))
                    cmd.Parameters.AddWithValue("@position", "sysadmin")

                    cmd.ExecuteNonQuery()
                End Using
                mycon.Close()
            End Using
        Catch ex As Exception

            Response.Write("<script>alert('Web Error')</script>")

            Return

        End Try
        GridView2.DataBind()
        Response.Write("<script>alert('Insert Successfully')</script>")
        TextBox2.Focus()

    End Sub

    Protected Sub GridView1_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GridView1.RowDeleting
        If (message.Value = "No") Then
            e.Cancel = True
            Return
        End If
    End Sub

    Protected Sub GridView2_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GridView2.RowDeleting

        If (message.Value = "No") Then
            e.Cancel = True
            Return
        End If
    End Sub

    Protected Sub LinkButton3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton3.Click
        Response.Redirect("home.aspx")
    End Sub
End Class
