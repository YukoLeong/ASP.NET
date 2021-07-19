Imports System.Data
Imports System.Data.SqlClient
Partial Class Operator_GiftManagement
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
      
    
        If Session("Role_Type") Is Nothing Then

            Response.Write("<script>alert('Please Log In !'); window.location.href='../staff.aspx'; </script>")
            Response.End()
        End If
        success.Text = ""
        fail.Text = ""

    End Sub





    

    Protected Sub GridViewGift_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles GridViewGift.RowUpdating
        Dim update As Boolean = False

        Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
        Try
            Using mycon As New SqlConnection(con)
                mycon.Open()
                Dim strSQL As String = "SELECT update_time from gift_info where id=@id "

                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL
                    cmd.Parameters.AddWithValue("@id", GridViewGift.DataKeys(e.RowIndex).Value.ToString())

                    Dim reader As SqlDataReader = cmd.ExecuteReader()
                    If reader.HasRows Then
                        While reader.Read()

                            If (Format(reader("update_time"), "yyyy-MM-dd HH:mm:ss.fff")) = CType(Me.GridViewGift.Rows(e.RowIndex).FindControl("time_edit"), Label).Text.Trim Then
                                update = True
                            End If


                        End While
                    Else
                        Response.Write("<script>alert('someone updating, please try later'); window.location.href='../Admin/home.aspx'; </script>")


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
            Response.Write("<script>alert('someone updating, please try later'); window.location.href='../Admin/home.aspx'; </script>")

        End If

        Dim flag As Boolean = False

        Dim file As FileUpload = CType(Me.GridViewGift.Rows(e.RowIndex).FindControl("FileUpload_edit"), FileUpload)

        If (file.HasFile) Then
            Dim Path As String = Server.MapPath("~/Admin/image/")
            If (System.IO.Directory.Exists(Path & "GiftImage") = False) Then
                System.IO.Directory.CreateDirectory(Path & "GiftImage")
            End If
            GiftImage.SelectCommand = "Select image from gift_info where image is not NULL"
            Dim dv_path_check As Data.DataView = GiftImage.Select(New DataSourceSelectArguments)
            For i As Integer = 0 To dv_path_check.Count - 1
                If dv_path_check.Item(i).Item("image") = "~/Admin/image/GiftImage/" + file.FileName Then
                    Response.Write("<script>alert('Image name is existed, change another name please!')</script>")
                    flag = True
                    e.Cancel = True
                End If

            Next
            If flag = False Then
                GiftImage.SelectCommand = "Select image from gift_info where id='" & GridViewGift.DataKeys(e.RowIndex)("id").ToString() & "'"
                Dim dv_path As Data.DataView = GiftImage.Select(New DataSourceSelectArguments)
                If Not IsDBNull(dv_path.Item(0).Item("image")) Then

                    Dim strArr() As String
                    strArr = dv_path.Item(0).Item("image").Split("/")
                    System.IO.File.Delete(Path & "GiftImage" & "/" & strArr(strArr.Length - 1))


                End If
                file.SaveAs(Server.MapPath("~/Admin/image/GiftImage/" + file.FileName))
           
                GiftInfo.UpdateParameters("image").DefaultValue = "~/Admin/image/GiftImage/" + file.FileName.ToString()
               End If

        Else



            GiftInfo.UpdateParameters("image").DefaultValue = CType(Me.GridViewGift.Rows(e.RowIndex).FindControl("image"), Label).Text.Trim()
        End If


        GiftInfo.UpdateParameters("title").DefaultValue = CType(Me.GridViewGift.Rows(e.RowIndex).FindControl("title"), TextBox).Text.Trim()
        GiftInfo.UpdateParameters("detail").DefaultValue = CType(Me.GridViewGift.Rows(e.RowIndex).FindControl("detail"), TextBox).Text.Trim()
        GiftInfo.UpdateParameters("quantity").DefaultValue = CType(Me.GridViewGift.Rows(e.RowIndex).FindControl("quantity"), TextBox).Text.Trim()
        GiftInfo.UpdateParameters("credit").DefaultValue = CType(Me.GridViewGift.Rows(e.RowIndex).FindControl("credit"), TextBox).Text.Trim()
        GiftInfo.UpdateParameters("max_exchange").DefaultValue = CType(Me.GridViewGift.Rows(e.RowIndex).FindControl("maxExchange"), TextBox).Text.Trim()
        GiftInfo.UpdateParameters("active").DefaultValue = CType(Me.GridViewGift.Rows(e.RowIndex).FindControl("active"), CheckBox).Checked

        GiftInfo.Update()




    End Sub

    Protected Sub GridViewGift_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GridViewGift.RowDeleting
        If (message.Value = "No") Then
            e.Cancel = True
            Return
        End If

        Dim delete As Boolean = False
        Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
        Try
            Using mycon As New SqlConnection(con)
                mycon.Open()
                Dim strSQL As String = "SELECT update_time from gift_info where id=@id "

                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL
                    cmd.Parameters.AddWithValue("@id", GridViewGift.DataKeys(e.RowIndex).Value.ToString())

                    Dim reader As SqlDataReader = cmd.ExecuteReader()
                    If reader.HasRows Then
                        While reader.Read()

                            If (Format(reader("update_time"), "yyyy-MM-dd HH:mm:ss.fff")) = CType(Me.GridViewGift.Rows(e.RowIndex).FindControl("time"), Label).Text.Trim Then
                                delete = True
								  GiftImage.SelectCommand = "Select image from gift_info where id='" & GridViewGift.DataKeys(e.RowIndex)("id").ToString() & "'"
                                  Dim dv_path As Data.DataView = GiftImage.Select(New DataSourceSelectArguments)
                                  If Not IsDBNull(dv_path.Item(0).Item("image")) Then
                                    Dim Path As String = Server.MapPath("~/Admin/image/")
                                    Dim strArr() As String
                                    strArr = dv_path.Item(0).Item("image").Split("/")
               
                                    System.IO.File.Delete(Path & "GiftImage" & "/" & strArr(strArr.Length - 1))
                                 End If
                            End If


                        End While
                    Else
                        Response.Write("<script>alert('someone updating, please try later'); window.location.href='../Admin/home.aspx'; </script>")


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
            Response.Write("<script>alert('someone updating, please try later'); window.location.href='../Admin/home.aspx'; </script>")

        End If


    End Sub


    Protected Sub pic_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Dim row As GridViewRow = DirectCast(DirectCast(sender, ImageButton).NamingContainer, GridViewRow)

        DirectCast(row.NamingContainer, GridView).SelectedIndex = row.RowIndex
        Try

            Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
            Using mycon As New SqlConnection(con)
                mycon.Open()
                Dim strSQL As String = "select * FROM [gift_info] where id=@id"
                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL
                    cmd.Parameters.AddWithValue("@id", GridViewGift.Rows(DirectCast(row.NamingContainer, GridView).SelectedIndex).Cells(1).Text)

                    Dim reader As SqlDataReader = cmd.ExecuteReader()
                    If reader.HasRows Then
                        While reader.Read()
                            picture.ImageUrl = reader("image").ToString()

                        End While
                    Else
                        picture.ImageUrl = ""
                    End If
                End Using
                mycon.Close()
            End Using
            Dim strArr() As String
            strArr = picture.ImageUrl.Split("/")
            Dim Path As String = Server.MapPath("~/Admin/image/")
            Dim fs As System.IO.FileStream

            Dim img As System.Drawing.Image
            If picture.ImageUrl = "" Then

                picture.ImageUrl = "~/Admin/image/noImage.jpg"
                fs = New System.IO.FileStream(Path & "/" & "noImage.jpg", IO.FileMode.Open, IO.FileAccess.Read)
                img = System.Drawing.Image.FromStream(fs)
                fs.Close()

            Else
                fs = New System.IO.FileStream(Path & "GiftImage" & "/" & strArr(strArr.Length - 1), IO.FileMode.Open, IO.FileAccess.Read)
                img = System.Drawing.Image.FromStream(fs)
                fs.Close()

            End If



            




            If img.Width > 780 Then
                picture.Width = 600
            Else
                picture.Width = img.Width
            End If

            If img.Height > 602 Then
                picture.Height = 500
            Else
                picture.Height = img.Height
            End If

            Popup.Show()


        Catch ex As Exception
            Response.Write("<script>alert('Web Error!')</script>")
        End Try
    End Sub




    Protected Sub ImageButton2_Click1(sender As Object, e As ImageClickEventArgs) Handles ImageButton2.Click
        Response.Redirect("home.aspx")
    End Sub



    Protected Sub addGift_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles addGift.Click
        titleText.Text = ""
        describText.Text = ""
        giftQuaText.Text = ""
        giftCreditText.Text = ""
        giftMaxText.Text = ""
        giftActiveBox.Checked = False
        MultiView1.ActiveViewIndex = 1

    End Sub

    Protected Sub insBtn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles insBtn.Click

        Dim file As FileUpload = giftImgFile
     
        Try
            GiftImage.SelectCommand = "Select image from gift_info where image is not NULL"
            Dim dv_path_check As Data.DataView = GiftImage.Select(New DataSourceSelectArguments)
            For i As Integer = 0 To dv_path_check.Count - 1
                If dv_path_check.Item(i).Item("image") = "~/Admin/image/GiftImage/" + file.FileName Then
                    Response.Write("<script>alert('Image name is existed, change another name please!')</script>")
                    Exit Sub
                End If

            Next
            Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
            Using mycon As New SqlConnection(con)
                mycon.Open()
                Dim strSQL As String
                If (file.HasFile) Then
                    Dim Path As String = Server.MapPath("~/Admin/image/")
                    If (System.IO.Directory.Exists(Path & "GiftImage") = False) Then
                        System.IO.Directory.CreateDirectory(Path & "GiftImage")
                    End If
                    strSQL = "INSERT INTO [gift_info] ([image], [title], [detail], [quantity], [credit], [active],[max_exchange],[update_time],[uid],[COD]) VALUES (@image, @title, @detail, @quantity, @credit, @active, @max_exchange, GETDATE(), @uid, @COD)"

                Else
                    strSQL = "INSERT INTO [gift_info] ([image], [title], [detail], [quantity], [credit], [active],[max_exchange],[update_time],[uid],[COD]) VALUES (NULL, @title, @detail, @quantity, @credit, @active, @max_exchange, GETDATE(), @uid, @COD)"
                End If

                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL
                    If (file.HasFile) Then
                      cmd.Parameters.AddWithValue("@image", "~/Admin/image/GiftImage/" + file.FileName.ToString())
                  
                    End If
                    cmd.Parameters.AddWithValue("@title", titleText.Text)
                    cmd.Parameters.AddWithValue("@detail", describText.Text)
                    cmd.Parameters.AddWithValue("@quantity", giftQuaText.Text)
                    cmd.Parameters.AddWithValue("@credit", giftCreditText.Text)
                    cmd.Parameters.AddWithValue("@active", giftActiveBox.Checked)
                    cmd.Parameters.AddWithValue("@max_exchange", giftMaxText.Text)
                    cmd.Parameters.AddWithValue("@uid", Session("ID"))
                    cmd.Parameters.AddWithValue("@COD", Session("COD"))



                    cmd.ExecuteNonQuery()
                End Using
                mycon.Close()
            End Using

        Catch ex As Exception

            Response.Write("<script>alert('Web Error!')</script>")

            Exit Sub

        End Try
        success.Text = "Insert Successfully"
        fail.Text = ""
        GridViewGift.DataBind()
        titleText.Text = ""
        describText.Text = ""
        giftQuaText.Text = ""
        giftCreditText.Text = ""
        giftMaxText.Text = ""
        giftActiveBox.Checked = False

        MultiView1.ActiveViewIndex = 0
    End Sub

    Protected Sub cancelBtn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cancelBtn.Click
        titleText.Text = ""
        describText.Text = ""
        giftQuaText.Text = ""
        giftCreditText.Text = ""
        giftMaxText.Text = ""
        giftActiveBox.Checked = False
        MultiView1.ActiveViewIndex = 0
        
    End Sub
End Class
