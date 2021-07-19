Imports System.Data.SqlClient

Partial Class userGroup
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim dv_verify As Data.DataView = SqlDataSource2.Select(New DataSourceSelectArguments)

            If Session("Role_Type") Is Nothing Then

                Response.Write("<script>alert('Please Log In !'); window.location.href='../staff.aspx'; </script>")
                Response.End()
            End If


            If dv_verify.Item(0).Item("ugm") = "False" Then

                Response.Write("<script>alert('You do not have Permission to view it !');window.history.back(-1); </script>")

            End If
        End If
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Response.Redirect("home.aspx")
    End Sub

    Protected Sub userGView_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles userGView.RowDataBound
       
           If Me.userGView.EditIndex = 0 Then

            Try
                If DataBinder.Eval(e.Row.DataItem, "id").ToString() = "coordinator" Then
                    DirectCast(e.Row.FindControl("CheckBox5"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox11"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox12"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox13"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox14"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox15"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox16"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox24"), CheckBox).Enabled = True


                End If
            Catch ex As Exception

            End Try

        End If

        If Me.userGView.EditIndex = 1 Then

            Try
                If DataBinder.Eval(e.Row.DataItem, "id").ToString() = "director" Then
                    DirectCast(e.Row.FindControl("CheckBox5"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox11"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox12"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox13"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox14"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox15"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox16"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox24"), CheckBox).Enabled = True


                End If
            Catch ex As Exception

            End Try

        End If

        If Me.userGView.EditIndex = 2 Then


            Try
                If DataBinder.Eval(e.Row.DataItem, "id").ToString() = "manager" Then

                    DirectCast(e.Row.FindControl("CheckBox17"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox18"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox50"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox20"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox36"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox38"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox40"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox42"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox44"), CheckBox).Enabled = True
                End If
            Catch ex As Exception

            End Try

        End If

        If Me.userGView.EditIndex = 3 Then


            Try
                If DataBinder.Eval(e.Row.DataItem, "id").ToString() = "operator" Then

                    DirectCast(e.Row.FindControl("CheckBox17"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox18"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox50"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox20"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox36"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox38"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox40"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox42"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox44"), CheckBox).Enabled = True
                End If
            Catch ex As Exception

            End Try

        End If

        If Me.userGView.EditIndex = 4 Then


            Try
                If DataBinder.Eval(e.Row.DataItem, "id").ToString() = "schooladmin" Then

                    DirectCast(e.Row.FindControl("CheckBox17"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox18"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox50"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox20"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox36"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox38"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox40"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox42"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox44"), CheckBox).Enabled = True
                End If
            Catch ex As Exception

            End Try

        End If
        If Me.userGView.EditIndex = 5 Then


            Try
                If DataBinder.Eval(e.Row.DataItem, "id").ToString() = "student" Then

                    DirectCast(e.Row.FindControl("CheckBox1"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox2"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox3"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox4"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox5"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox6"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox7"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox8"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox9"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox10"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox26"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox28"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox30"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox32"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox34"), CheckBox).Enabled = True

                End If
            Catch ex As Exception

            End Try

        End If

        If Me.userGView.EditIndex = 6 Then


            Try
                If DataBinder.Eval(e.Row.DataItem, "id").ToString() = "studentview" Then

                    DirectCast(e.Row.FindControl("CheckBox1"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox2"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox3"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox4"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox5"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox6"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox7"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox8"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox9"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox10"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox26"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox28"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox30"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox32"), CheckBox).Enabled = True
                End If
            Catch ex As Exception

            End Try

        End If

        If Me.userGView.EditIndex = 7 Then


            Try
                If DataBinder.Eval(e.Row.DataItem, "id").ToString() = "sysadmin" Then
                    DirectCast(e.Row.FindControl("CheckBox21"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox22"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox23"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox46"), CheckBox).Enabled = True
                End If
            Catch ex As Exception

            End Try

        End If

        If Me.userGView.EditIndex = 8 Then


            Try
                If DataBinder.Eval(e.Row.DataItem, "id").ToString() = "teacher" Then
                    DirectCast(e.Row.FindControl("CheckBox5"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox11"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox12"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox13"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox14"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox15"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox16"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox24"), CheckBox).Enabled = True

                End If
            Catch ex As Exception

            End Try

        End If

        If Me.userGView.EditIndex = 9 Then


            Try
                If DataBinder.Eval(e.Row.DataItem, "id").ToString() = "tutor" Then
                    DirectCast(e.Row.FindControl("CheckBox5"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox11"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox12"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox13"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox14"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox15"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox16"), CheckBox).Enabled = True
                    DirectCast(e.Row.FindControl("CheckBox24"), CheckBox).Enabled = True
                End If
            Catch ex As Exception

            End Try

        End If

    End Sub

    Protected Sub userGView_RowUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdatedEventArgs) Handles userGView.RowUpdated
        Dim dv_update As Data.DataView = SqlDataSource3.Select(New DataSourceSelectArguments)
        If dv_update.Item(0).Item("ia") = "False" Then
            DeleteData("ia")
        End If
        If dv_update.Item(0).Item("sp") = "False" Then
            DeleteData("sp")
        End If
        If dv_update.Item(0).Item("ea") = "False" Then
            DeleteData("ea")
        End If
        If dv_update.Item(0).Item("ap") = "False" Then
            DeleteData("ap")
        End If
        If dv_update.Item(0).Item("lr") = "False" Then
            DeleteData("lr")
        End If
        If dv_update.Item(0).Item("cv") = "False" Then
            DeleteData("cv")
        End If
        If dv_update.Item(0).Item("jms") = "False" Then
            DeleteData("jms")
        End If
        If dv_update.Item(0).Item("lra") = "False" Then
            DeleteData("lra")
        End If
        If dv_update.Item(0).Item("rg") = "False" Then
            DeleteData("rg")
        End If
        If dv_update.Item(0).Item("sa") = "False" Then
            DeleteData("sa")
        End If
        If dv_update.Item(0).Item("sara") = "False" Then
            DeleteData("sara")
        End If
        If dv_update.Item(0).Item("sscs") = "False" Then
            DeleteData("sscs")
        End If
        If dv_update.Item(0).Item("ra") = "False" Then
            DeleteData("ra")
        End If
        If dv_update.Item(0).Item("str") = "False" Then
            DeleteData("str")
        End If
    End Sub
    Private Sub DeleteData(ByVal img As String)
        Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
        Try

            Using mycon As New SqlConnection(con)
                mycon.Open()
                Dim strSQL As String = "delete from CustomSettings where imgName=@imgName"

                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL
                    cmd.Parameters.AddWithValue("@imgName", img)
                    cmd.ExecuteNonQuery()
                End Using
                mycon.Close()
            End Using
        Catch ex As Exception
            Application.UnLock()
            Response.Write("<script>alert('web error')</script>")

        End Try
    End Sub
  
End Class
