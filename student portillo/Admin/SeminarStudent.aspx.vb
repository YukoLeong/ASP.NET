Imports System.IO
Imports System.Net
Imports System.Net.Mail
Imports System.Data
Imports System.Data.SqlClient
Partial Class Admin_SeminarStudent
    Inherits System.Web.UI.Page
    Public Sub bindGridViewRegGift()

        Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
        Using mycon As New SqlConnection(con)
            mycon.Open()
            Dim strSQL As String = "select stud.pess_cod,stud.student_id, stud.name_ch, stud.name_pt, stud.primary_email from "
            strSQL += "(select y.STUDENT_ID, y.NAME_CH, y.NAME_PT, y.PRIMARY_EMAIL, y.pess_cod, y.ALUN_NUMERO_SEQ from(select  pess_cod, max(ALUN_NUMERO_SEQ) as maxSEQ from student_academic_info "
            strSQL += "group by pess_cod) as x inner join student_academic_info as y on x.pess_cod = y.pess_cod and x.maxSEQ = y.ALUN_NUMERO_SEQ)as stud where stud.pess_cod in "
            strSQL += "(select pess_cod from gift where register_time<=@register_time and status=@status) "


            Using cmd As New SqlCommand()
                cmd.Connection = mycon
                cmd.CommandText = strSQL
                cmd.Parameters.AddWithValue("@register_time", TextBox1.Text)
                cmd.Parameters.AddWithValue("@status", "Registered")

                Dim mySqlAdapter As New SqlDataAdapter(cmd)
                Dim myDataSet As New DataSet()
                mySqlAdapter.Fill(myDataSet)

                GridViewRegGift.DataSource = myDataSet
                GridViewRegGift.AllowPaging = True
                GridViewRegGift.PageSize = 10
                GridViewRegGift.DataBind()
            End Using
            mycon.Close()
        End Using



    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        bindGridViewRegGift()
        Button2.Visible = True
        Button3.Visible = True
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
     
        Dim regID As New List(Of Integer)()
        Dim giftID As New List(Of Integer)()
        Dim quantity As New List(Of Integer)()
        Dim updateTime As New List(Of String)()


        Try
            Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
            Using mycon As New SqlConnection(con)
                mycon.Open()
                Dim strSQL As String = "select id, gift_id, gift_quantity, update_time from gift where register_time<=@register_time and status=@status order by register_time asc "


                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL
                    cmd.Parameters.AddWithValue("@register_time", TextBox1.Text)
                    cmd.Parameters.AddWithValue("status", "Registered")

                    Dim reader As SqlDataReader = cmd.ExecuteReader()

                    While reader.Read()
                        regID.Add(reader("id").ToString())
                        giftID.Add(reader("gift_id").ToString())
                        quantity.Add(reader("gift_quantity").ToString())
                        updateTime.Add(reader("update_time").ToString())

                    End While

                End Using
                mycon.Close()
            End Using

        Catch ex As Exception
            Response.Write("<script>alert('Web Error!')</script>")
        End Try
        Dim del As Boolean
        Dim msg As Boolean
        For i As Integer = 0 To regID.Count - 1

            Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
            Try

                Using mycon As New SqlConnection(con)
                    mycon.Open()
                    Dim strSQL As String = "SELECT update_time from gift where id=@id "

                    Using cmd As New SqlCommand()
                        cmd.Connection = mycon
                        cmd.CommandText = strSQL
                        cmd.Parameters.AddWithValue("@id", regID(i))

                        Dim reader As SqlDataReader = cmd.ExecuteReader()
                        If reader.HasRows Then
                            While reader.Read()

                                If (reader("update_time").ToString()) = updateTime(i) Then
                                    del = True
                                Else
                                    msg = True
                                End If


                            End While
                        Else
                            msg = True
                        End If
                    End Using
                    mycon.Close()
                End Using

            Catch ex As Exception
                Response.Write("<script>alert('Web Error!')</script>")
                Exit Sub
            End Try

            If del = True Then


                Try

                    Using mycon As New SqlConnection(con)
                        mycon.Open()
                        Dim strSQL As String = "delete from gift where id=@id;"
                        strSQL = strSQL + "update gift_info set quantity = quantity + @gift_quantity, update_time=GETDATE() where id=@giftID "
                        Using cmd As New SqlCommand()
                            cmd.Connection = mycon
                            cmd.CommandText = strSQL
                            cmd.Parameters.AddWithValue("@id", regID(i))
                            cmd.Parameters.AddWithValue("@gift_quantity", quantity(i))
                            cmd.Parameters.AddWithValue("@giftID", giftID(i))

                            cmd.ExecuteNonQuery()
                            del = False
                        End Using
                        mycon.Close()
                    End Using
                Catch ex As Exception
                    Response.Write("<script>alert('web error')</script>")
                    Exit Sub
                End Try
            End If

        Next

        If msg = True Then
            Response.Write("<script>alert('some registered student have not been deleted, Please delete again!')</script>")
        End If

        Response.Write("<script>alert('Cancel Registered Students Successfully!')</script>")






    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click

        Dim email As New List(Of String)()


        Try
            Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
            Using mycon As New SqlConnection(con)
                mycon.Open()
                Dim strSQL As String = "select stud.primary_email from "
                strSQL += "(select y.STUDENT_ID, y.NAME_CH, y.NAME_PT, y.PRIMARY_EMAIL, y.pess_cod, y.ALUN_NUMERO_SEQ from(select  pess_cod, max(ALUN_NUMERO_SEQ) as maxSEQ from student_academic_info "
                strSQL += "group by pess_cod) as x inner join student_academic_info as y on x.pess_cod = y.pess_cod and x.maxSEQ = y.ALUN_NUMERO_SEQ)as stud where stud.pess_cod in "
                strSQL += "(select pess_cod from gift where register_time<=@register_time and status=@status) "

                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL
                    cmd.Parameters.AddWithValue("@register_time", TextBox1.Text)
                    cmd.Parameters.AddWithValue("@status", "Registered")

                    Dim reader As SqlDataReader = cmd.ExecuteReader()

                    While reader.Read()
                        email.Add(reader("primary_email").ToString())
                      End While

                End Using
                mycon.Close()
            End Using

        Catch ex As Exception
            Response.Write("<script>alert('Web Error!')</script>")
        End Try
        For i As Integer = 0 To email.Count - 1
            If i = email.Count - 1 Then
                txtTo.Text = txtTo.Text + email(i)
            Else
                txtTo.Text = txtTo.Text + email(i) + ","
            End If

        Next
        txtSubject.Text = ""
        txtBody.Text = ""
        txtEmail.Text = ""
        txtPassword.Text = ""
        MultiView1.ActiveViewIndex = 1
    End Sub


    

    Protected Sub Button4_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button4.Click
        Dim [to] As String = txtTo.Text
        Dim from As String = txtEmail.Text
        Dim subject As String = txtSubject.Text
        Dim body As String = txtBody.Text
        Using mm As New MailMessage(txtEmail.Text, txtTo.Text)
            mm.Subject = txtSubject.Text
            mm.Body = txtBody.Text

            mm.IsBodyHtml = False
            Dim smtp As New SmtpClient()
            smtp.Host = "smtp.macau.ctm.net"
            smtp.EnableSsl = True
            Dim NetworkCred As New NetworkCredential(txtEmail.Text, txtPassword.Text)
            smtp.UseDefaultCredentials = True
            smtp.Credentials = NetworkCred
            smtp.Port = 25
            smtp.Send(mm)
            ClientScript.RegisterStartupScript(Me.GetType, "alert", "alert('Email sent.');", True)
        End Using
        MultiView1.ActiveViewIndex = 0
    End Sub

    Protected Sub Button5_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button5.Click
        MultiView1.ActiveViewIndex = 0
    End Sub

    Protected Sub GridViewRegGift_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewRegGift.SelectedIndexChanged
        txtTo.Text = Me.GridViewRegGift.SelectedValue
        MultiView1.ActiveViewIndex = 1

    End Sub

   
    Protected Sub GridViewRegGift_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridViewRegGift.PageIndexChanging
        Me.GridViewRegGift.PageIndex = e.NewPageIndex
        bindGridViewRegGift()
    End Sub

    Protected Sub ImageButton2_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton2.Click
        Response.Redirect("home.aspx")
    End Sub
End Class
