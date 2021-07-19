Imports System.Data
Imports System.Data.SqlClient
Partial Class Operator_ManagerSeminar
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            Dim dv_verify As Data.DataView = verify.Select(New DataSourceSelectArguments)

            If Session("Role_Type") Is Nothing Then

                Response.Write("<script>alert('Please Log In !'); window.location.href='../staff.aspx'; </script>")
                Response.End()
            End If


            If dv_verify.Item(0).Item("sm") = "False" Then

                Response.Write("<script>alert('You do not have Permission to view it !');window.history.back(-1); </script>")

            End If

        End If

        success.Text = ""
        fail.Text = ""

    End Sub





    'Protected Sub home_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles home.Click
    '    Response.Redirect("home.aspx")
    'End Sub
    Protected Sub ImageButton2_Click1(ByVal sender As Object, ByVal e As ImageClickEventArgs) Handles ImageButton2.Click
        Response.Redirect("home.aspx")
    End Sub


    Protected Sub addSem_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles addSem.Click
        titleText.Text = ""
        'typeText.Text = ""
        semYearText.Text = ""
        durationText.Text = ""
        orgText.Text = ""
        pointText.Text = ""
        titleTextCht.Text = ""
        'typeTextCht.Text = ""
        orgTextCht.Text = ""
        MultiView1.ActiveViewIndex = 1


    End Sub

    Protected Sub insBtn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles insBtn.Click
        If typeText.Text = "" Then
            typeText.Text = "Not define"

        End If
        If durationText.Text = "" And pointText.Text = "" Then
            Try
                Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
                Using mycon As New SqlConnection(con)
                    mycon.Open()

                    Dim strSQL As String = "INSERT INTO [Seminar_Info] ([topicName], [category], [startDate], [duration], [organizer], [bonus_point], [status], [update_time],[topicNameCht],[categoryCht],[organizerCht],[uid],[COD],[eventType]) VALUES (@topicName, @category, @startDate, '-1', @organizer, NULL, @status, GETDATE(), @topicNameCht, @categoryCht, @organizerCht, @uid, @COD, @eventType)"

                    Using cmd As New SqlCommand()
                        cmd.Connection = mycon
                        cmd.CommandText = strSQL
                        cmd.Parameters.AddWithValue("@topicName", titleText.Text)
                        cmd.Parameters.AddWithValue("@category", typeText.SelectedValue)
                        cmd.Parameters.AddWithValue("@startDate", semYearText.Text)
                        cmd.Parameters.AddWithValue("@organizer", orgText.Text)
                        cmd.Parameters.AddWithValue("@status", "Internal")
                        cmd.Parameters.AddWithValue("@topicNameCht", titleTextCht.Text)
                        cmd.Parameters.AddWithValue("@categoryCht", typeTextCht.SelectedValue)
                        cmd.Parameters.AddWithValue("@organizerCht", orgTextCht.Text)
                        cmd.Parameters.AddWithValue("@uid", Session("ID"))
                        cmd.Parameters.AddWithValue("@COD", Session("COD"))
                        cmd.Parameters.AddWithValue("@eventType", eventType.SelectedValue)

                        cmd.ExecuteNonQuery()
                    End Using
                    mycon.Close()
                End Using

            Catch ex As Exception

                Response.Write("<script>alert('Insert Error!')</script>")

                Exit Sub

            End Try
        ElseIf durationText.Text = "" Then
            Try
                Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
                Using mycon As New SqlConnection(con)
                    mycon.Open()

                    Dim strSQL As String = "INSERT INTO [Seminar_Info] ([topicName], [category], [startDate], [duration], [organizer], [bonus_point], [status], [update_time],[topicNameCht],[categoryCht],[organizerCht],[uid],[COD],[eventType]) VALUES (@topicName, @category, @startDate, '-1', @organizer, @bonus_point, @status, GETDATE(), @topicNameCht, @categoryCht, @organizerCht, @uid, @COD,@eventType)"

                    Using cmd As New SqlCommand()
                        cmd.Connection = mycon
                        cmd.CommandText = strSQL
                        cmd.Parameters.AddWithValue("@topicName", titleText.Text)
                        cmd.Parameters.AddWithValue("@category", typeText.SelectedValue)
                        cmd.Parameters.AddWithValue("@startDate", semYearText.Text)
                        cmd.Parameters.AddWithValue("@organizer", orgText.Text)
                        cmd.Parameters.AddWithValue("@bonus_point", pointText.Text)
                        cmd.Parameters.AddWithValue("@status", "Internal")
                        cmd.Parameters.AddWithValue("@topicNameCht", titleTextCht.Text)
                        cmd.Parameters.AddWithValue("@categoryCht", typeTextCht.SelectedValue)
                        cmd.Parameters.AddWithValue("@organizerCht", orgTextCht.Text)
                        cmd.Parameters.AddWithValue("@uid", Session("ID"))
                        cmd.Parameters.AddWithValue("@COD", Session("COD"))
                        cmd.Parameters.AddWithValue("@eventType", eventType.SelectedValue)
                        cmd.ExecuteNonQuery()
                    End Using
                    mycon.Close()
                End Using

            Catch ex As Exception

                Response.Write("<script>alert('Insert Error!')</script>")

                Exit Sub

            End Try
        ElseIf pointText.Text = "" Then
            Try
                Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
                Using mycon As New SqlConnection(con)
                    mycon.Open()

                    Dim strSQL As String = "INSERT INTO [Seminar_Info] ([topicName], [category], [startDate], [duration], [organizer], [bonus_point], [status], [update_time],[topicNameCht],[categoryCht],[organizerCht],[uid],[COD],[eventType]) VALUES (@topicName, @category, @startDate, @duration, @organizer, NULL, @status, GETDATE(), @topicNameCht, @categoryCht, @organizerCht, @uid, @COD,@eventType)"

                    Using cmd As New SqlCommand()
                        cmd.Connection = mycon
                        cmd.CommandText = strSQL
                        cmd.Parameters.AddWithValue("@topicName", titleText.Text)
                        cmd.Parameters.AddWithValue("@category", typeText.SelectedValue)
                        cmd.Parameters.AddWithValue("@startDate", semYearText.Text)
                        cmd.Parameters.AddWithValue("@duration", durationText.Text)
                        cmd.Parameters.AddWithValue("@organizer", orgText.Text)
                        cmd.Parameters.AddWithValue("@status", "Internal")
                        cmd.Parameters.AddWithValue("@topicNameCht", titleTextCht.Text)
                        cmd.Parameters.AddWithValue("@categoryCht", typeTextCht.SelectedValue)
                        cmd.Parameters.AddWithValue("@organizerCht", orgTextCht.Text)
                        cmd.Parameters.AddWithValue("@uid", Session("ID"))
                        cmd.Parameters.AddWithValue("@COD", Session("COD"))
                        cmd.Parameters.AddWithValue("@eventType", eventType.SelectedValue)
                        cmd.ExecuteNonQuery()
                    End Using
                    mycon.Close()
                End Using

            Catch ex As Exception

                Response.Write("<script>alert('Insert Error!')</script>")

                Exit Sub

            End Try
        Else
            Try
                Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
                Using mycon As New SqlConnection(con)
                    mycon.Open()

                    Dim strSQL As String = "INSERT INTO [Seminar_Info] ([topicName], [category], [startDate], [duration], [organizer], [bonus_point], [status], [update_time],[topicNameCht],[categoryCht],[organizerCht],[uid],[COD],[eventType]) VALUES (@topicName, @category, @startDate, @duration, @organizer, @bonus_point, @status, GETDATE(), @topicNameCht, @categoryCht, @organizerCht, @uid, @COD,@eventType)"

                    Using cmd As New SqlCommand()
                        cmd.Connection = mycon
                        cmd.CommandText = strSQL
                        cmd.Parameters.AddWithValue("@topicName", titleText.Text)
                        cmd.Parameters.AddWithValue("@category", typeText.SelectedValue)
                        cmd.Parameters.AddWithValue("@startDate", semYearText.Text)
                        cmd.Parameters.AddWithValue("@duration", durationText.Text)
                        cmd.Parameters.AddWithValue("@organizer", orgText.Text)
                        cmd.Parameters.AddWithValue("@bonus_point", pointText.Text)
                        cmd.Parameters.AddWithValue("@status", "Internal")
                        cmd.Parameters.AddWithValue("@topicNameCht", titleTextCht.Text)
                        cmd.Parameters.AddWithValue("@categoryCht", typeTextCht.SelectedValue)
                        cmd.Parameters.AddWithValue("@organizerCht", orgTextCht.Text)
                        cmd.Parameters.AddWithValue("@uid", Session("ID"))
                        cmd.Parameters.AddWithValue("@COD", Session("COD"))
                        cmd.Parameters.AddWithValue("@eventType", eventType.SelectedValue)
                        cmd.ExecuteNonQuery()
                    End Using
                    mycon.Close()
                End Using

            Catch ex As Exception

                Response.Write("<script>alert('Insert Error!')</script>")

                Exit Sub

            End Try
        End If

        success.Text = "Insert Successfully"
        fail.Text = ""



        year.DataBind()
        category.DataBind()

        Dim dateString As String = semYearText.Text
        Dim chr As Char() = New Char() {"/"c, ":"c}
        Dim str As String() = dateString.Split(chr)
        year.SelectedValue = str(0)

        category.SelectedValue = typeText.Text
        GridViewSeminar.Visible = True
        GridViewSeminar.DataBind()
        titleText.Text = ""
        ' typeText.Text = ""
        semYearText.Text = ""
        durationText.Text = ""
        orgText.Text = ""
        pointText.Text = ""
        titleTextCht.Text = ""
        'typeTextCht.Text = ""
        orgTextCht.Text = ""
        MultiView1.ActiveViewIndex = 0

    End Sub

    Protected Sub cancelBtn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cancelBtn.Click
        titleText.Text = ""
        ' typeText.Text = ""
        semYearText.Text = ""
        durationText.Text = ""
        orgText.Text = ""
        pointText.Text = ""
        titleTextCht.Text = ""
        'typeTextCht.Text = ""
        orgTextCht.Text = ""
        MultiView1.ActiveViewIndex = 0

    End Sub

    Protected Sub GridViewSeminar_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewSeminar.SelectedIndexChanged
        DetailsViewSeminar.DataBind()
        MultiView1.ActiveViewIndex = 2



    End Sub

    Protected Sub back_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles back.Click
        MultiView1.ActiveViewIndex = 0


    End Sub

    Protected Sub DetailsViewSeminar_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdateEventArgs) Handles DetailsViewSeminar.ItemUpdating
        Dim update As Boolean = False

        Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
        Try
            Using mycon As New SqlConnection(con)
                mycon.Open()
                Dim strSQL As String = "SELECT update_time from Seminar_Info where id=@id "

                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL
                    cmd.Parameters.AddWithValue("@id", GridViewSeminar.SelectedValue)

                    Dim reader As SqlDataReader = cmd.ExecuteReader()
                    If reader.HasRows Then
                        While reader.Read()

                            If (Format(reader("update_time"), "yyyy-MM-dd HH:mm:ss.fff")) = CType(Me.DetailsViewSeminar.FindControl("DetailTimeEdit"), Label).Text.Trim Then
                                update = True
                            End If


                        End While
                    Else
                        Response.Write("<script>alert('someone updating, please try later'); window.location.href='../Operator/home.aspx'; </script>")


                    End If
                End Using
                mycon.Close()
            End Using

        Catch ex As Exception

            e.Cancel = True
            Response.Write("<script>alert('Web Error!')</script>")
            Exit Sub

        End Try

        If update <> True Then
            e.Cancel = True
            Response.Write("<script>alert('someone updating, please try later'); window.location.href='../Operator/home.aspx'; </script>")

        End If
    End Sub

    Protected Sub DetailsViewSeminar_ItemDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewDeleteEventArgs) Handles DetailsViewSeminar.ItemDeleting
        If (message.Value = "No") Then
            e.Cancel = True
            Return
        End If

        Dim delete As Boolean = False
        Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
        Try
            Using mycon As New SqlConnection(con)
                mycon.Open()
                Dim strSQL As String = "SELECT update_time from Seminar_Info where id=@id "

                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL
                    cmd.Parameters.AddWithValue("@id", GridViewSeminar.SelectedValue)

                    Dim reader As SqlDataReader = cmd.ExecuteReader()
                    If reader.HasRows Then
                        While reader.Read()

                            If (Format(reader("update_time"), "yyyy-MM-dd HH:mm:ss.fff")) = CType(Me.DetailsViewSeminar.FindControl("DetailTime"), Label).Text.Trim Then
                                delete = True
                            End If


                        End While
                    Else
                        Response.Write("<script>alert('someone updating, please try later'); window.location.href='../Operator/home.aspx'; </script>")


                    End If
                End Using
                mycon.Close()
            End Using

        Catch ex As Exception

            e.Cancel = True
            Response.Write("<script>alert('Web Error!')</script>")
            Exit Sub
        End Try

        If delete <> True Then
            e.Cancel = True
            Response.Write("<script>alert('someone updating, please try later'); window.location.href='../Operator/home.aspx'; </script>")

        End If

    End Sub

    Protected Sub DetailsViewSeminar_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles DetailsViewSeminar.ItemUpdated
        year.DataBind()
        category.DataBind()
        Dim dateString As String = CType(Me.DetailsViewSeminar.FindControl("TextBox1"), TextBox).Text.Trim
        Dim chr As Char() = New Char() {"/"c, ":"c}
        Dim str As String() = dateString.Split(chr)
        year.SelectedValue = str(0)
        If CType(Me.DetailsViewSeminar.FindControl("TextBox4"), TextBox).Text.Trim = "" Then
            category.SelectedValue = "Not define"
        Else
            category.SelectedValue = CType(Me.DetailsViewSeminar.FindControl("TextBox4"), TextBox).Text.Trim
        End If

        GridViewSeminar.DataBind()
        MultiView1.ActiveViewIndex = 0
    End Sub

    Protected Sub DetailsViewSeminar_ItemDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewDeletedEventArgs) Handles DetailsViewSeminar.ItemDeleted

        Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
        Try
            Using mycon As New SqlConnection(con)
                mycon.Open()
                Dim strSQL As String = "SELECT count(startDate)as Count from Seminar_Info where year(startDate)=@startDate and category=@category "

                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL
                    cmd.Parameters.AddWithValue("@startDate", year.SelectedValue)
                    cmd.Parameters.AddWithValue("@category", category.SelectedValue)

                    Dim reader As SqlDataReader = cmd.ExecuteReader()
                    If reader.HasRows Then
                        While reader.Read()
                            If reader("Count") <> 0 Then
                                year.DataBind()
                                category.DataBind()
                                Dim dateString As String = CType(Me.DetailsViewSeminar.FindControl("Label1"), Label).Text.Trim
                                Dim chr As Char() = New Char() {"/"c, ":"c}
                                Dim str As String() = dateString.Split(chr)
                                year.SelectedValue = str(0)
                                category.SelectedValue = CType(Me.DetailsViewSeminar.FindControl("Label4"), Label).Text.Trim
                            Else
                                year.DataBind()
                                category.DataBind()
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


        GridViewSeminar.DataBind()
        MultiView1.ActiveViewIndex = 0


    End Sub

    Protected Sub DetailsViewSeminar_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles DetailsViewSeminar.ItemInserted

        year.DataBind()
        category.DataBind()
        Dim dateString As String = CType(Me.DetailsViewSeminar.FindControl("TextBox1"), TextBox).Text.Trim
        Dim chr As Char() = New Char() {"/"c, ":"c}
        Dim str As String() = dateString.Split(chr)
        year.SelectedValue = str(0)
        If CType(Me.DetailsViewSeminar.FindControl("TextBox4"), TextBox).Text.Trim = "" Then
            category.SelectedValue = "Not define"
        Else
            category.SelectedValue = CType(Me.DetailsViewSeminar.FindControl("TextBox4"), TextBox).Text.Trim
        End If

        GridViewSeminar.DataBind()
        MultiView1.ActiveViewIndex = 0
    End Sub



End Class

