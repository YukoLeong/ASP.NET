Imports System.Data
Imports System.Data.SqlClient
Imports System.Threading
Imports System.Globalization
Partial Class Student_RegisterGift
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
     If Session("Role_Type") Is Nothing Then

            Response.Write("<script>alert('Please Log In !'); location.href='http://172.26.122.66/siweb/logout.asp'; </script>")
            Response.End()
        
        End If

       

        If Not IsPostBack Then
            Dim dv_time As Data.DataView = AccessTime.Select(New DataSourceSelectArguments)
         
            Dim startDate As String = Format(dv_time.Item(0).Item("startTime"), "yyyy/MM/dd")
            Dim endDate As String = DateTime.Now.ToString("yyyy/MM/dd")
            Dim startArr() As String
            Dim endArr() As String
            Dim flag As Boolean = False
            startArr = startDate.Split("/")
            endArr = endDate.Split("/")


            If ((Convert.ToInt32(startArr(0))) > (Convert.ToInt32(endArr(0)))) Then

                  Response.Redirect("~/Student/invaild.aspx")
                Exit Sub


            End If
            If ((Convert.ToInt32(startArr(0))) = (Convert.ToInt32(endArr(0))) And (Convert.ToInt32(startArr(1))) > (Convert.ToInt32(endArr(1)))) Then

                 Response.Redirect("~/Student/invaild.aspx")
                Exit Sub
            End If


            If ((Convert.ToInt32(startArr(0))) = (Convert.ToInt32(endArr(0))) And (Convert.ToInt32(startArr(1))) = (Convert.ToInt32(endArr(1))) And (Convert.ToInt32(startArr(2))) > (Convert.ToInt32(endArr(2)))) Then

                  Response.Redirect("~/Student/invaild.aspx")
                Exit Sub


            End If

            Dim startDate1 As String = DateTime.Now.ToString("yyyy/MM/dd")
            Dim endDate1 As String = Format(dv_time.Item(0).Item("endTime"), "yyyy/MM/dd")
            Dim startArr1() As String
            Dim endArr1() As String
            Dim flag1 As Boolean = False
            startArr1 = startDate1.Split("/")
            endArr1 = endDate1.Split("/")


            If ((Convert.ToInt32(startArr1(0))) > (Convert.ToInt32(endArr1(0)))) Then
                  Response.Redirect("~/Student/invaild.aspx")
                Exit Sub



            End If
            If ((Convert.ToInt32(startArr1(0))) = (Convert.ToInt32(endArr1(0))) And (Convert.ToInt32(startArr1(1))) > (Convert.ToInt32(endArr1(1)))) Then

                Response.Redirect("~/Student/invaild.aspx")
                Exit Sub

            End If


            If ((Convert.ToInt32(startArr1(0))) = (Convert.ToInt32(endArr1(0))) And (Convert.ToInt32(startArr1(1))) = (Convert.ToInt32(endArr1(1))) And (Convert.ToInt32(startArr1(2))) > (Convert.ToInt32(endArr1(2)))) Then

                  Response.Redirect("~/Student/invaild.aspx")
                Exit Sub
            End If

         Select Case Request("view")
                Case 1
                    MultiView1.ActiveViewIndex = 1
                Case 2
                    MultiView1.ActiveViewIndex = 2
                Case 3
                    MultiView1.ActiveViewIndex = 3

            End Select
            SeminarTotalCount()
            ValidCount()

            bindGridViewCart()
        End If

        RegGift.Visible = False
        EarnedCredit.Visible = False
        UsedCredit.Visible = False
        CancelGift.Visible = False
        ImageButton2.Visible = False

        If Session("CurrentUI") = "en-US" Then
            ImageButtonapic9.ImageUrl = "~/Student/animatedmenu3/apic8.png"
            ImageButtonapic1.ImageUrl = "~/Student/animatedmenu3/cpic1.png"
            ImageButtonapic2.ImageUrl = "~/Student/animatedmenu3/cpic2.png"
            ImageButtonapic3.ImageUrl = "~/Student/animatedmenu3/cpic3.png"
            ImageButtonapic4.ImageUrl = "~/Student/animatedmenu3/cpic4.png"

        End If

        If Session("CurrentUI") = "zh-TW" Then
            ImageButtonapic9.ImageUrl = "~/Student/animatedmenu3/homec.png"
            ImageButtonapic1.ImageUrl = "~/Student/animatedmenu3/cccd1.png"
            ImageButtonapic2.ImageUrl = "~/Student/animatedmenu3/cccd2.png"
            ImageButtonapic3.ImageUrl = "~/Student/animatedmenu3/cccd3.png"
            ImageButtonapic4.ImageUrl = "~/Student/animatedmenu3/cccd4.png"

        End If



    End Sub


    Protected Sub ImageButtonapic1_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButtonapic1.Click

        MultiView1.ActiveViewIndex = 0
        ValidCount()
        bindGridViewCart()

        ImageButtonapic1.CssClass = "aimgactive"
        ImageButtonapic2.CssClass = "aimg"
        ImageButtonapic3.CssClass = "aimg"
        ImageButtonapic4.CssClass = "aimg"

    End Sub

    Protected Sub ImageButtonapic2_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButtonapic2.Click
    

        MultiView1.ActiveViewIndex = 2
        SeminarTotalCount()
        GetSemStudentInfo()
        bindGridViewSeminar()


        ImageButtonapic1.CssClass = "aimg"
        ImageButtonapic2.CssClass = "aimgactive"
        ImageButtonapic3.CssClass = "aimg"
        ImageButtonapic4.CssClass = "aimg"


    End Sub

    Protected Sub ImageButtonapic3_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButtonapic3.Click
     

        MultiView1.ActiveViewIndex = 3
        GiftTotalCount()
        GetGiftStudentInfo()
        bindGridViewGift()



        ImageButtonapic1.CssClass = "aimg"
        ImageButtonapic2.CssClass = "aimg"
        ImageButtonapic3.CssClass = "aimgactive"
        ImageButtonapic4.CssClass = "aimg"



    End Sub

    Protected Sub ImageButtonapic4_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButtonapic4.Click
     
        MultiView1.ActiveViewIndex = 4
        GiftRegTotalCount()
        GetGiftRegStudentInfo()
        bindGridViewRegGift()



        ImageButtonapic1.CssClass = "aimg"
        ImageButtonapic2.CssClass = "aimg"
        ImageButtonapic3.CssClass = "aimg"
        ImageButtonapic4.CssClass = "aimgactive"



    End Sub

    Protected Sub ImageButtonapic9_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButtonapic9.Click

        If Session("Role_Type") = "student" Then
            Response.Redirect("home.aspx")
        End If

        If Session("Role_Type") = "teacher" Or Session("Role_Type") = "tutor" Or Session("Role_Type") = "coordinator" Or Session("Role_Type") = "director" Then
            Response.Redirect("schoolStaff.aspx")
        End If

        Response.Write("<script>alert('Please Log In !'); window.location.href='http://172.26.122.66/siweb/logout.asp'; </script>")

    End Sub









    Public Sub SeminarTotalCount()
        Try
            Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
            Using mycon As New SqlConnection(con)
                mycon.Open()
                Dim strSQL As String = "select Seminar.pess_cod,SUM(Seminar_Info.bonus_point) as Total_Point from Seminar,Seminar_Info "
                strSQL += "where Seminar.Seminar_info_id=Seminar_Info.id and Seminar.pess_cod=@pess_cod group by Seminar.pess_cod"
                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL
                    cmd.Parameters.AddWithValue("@pess_cod", Session("pess_cod"))

                    Dim reader As SqlDataReader = cmd.ExecuteReader()
                    If reader.HasRows Then
                        While reader.Read()
                            TotalSem.Text = reader("Total_Point").ToString()
                        End While
                    Else
                        TotalSem.Text = "0"
                    End If
                End Using
                mycon.Close()
            End Using

        Catch ex As Exception
            Response.Write("<script>alert('Seminar Count Error!')</script>")
        End Try
    End Sub
    Public Sub GiftTotalCount()
        Try
            Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
            Using mycon As New SqlConnection(con)
                mycon.Open()
                Dim strSQL As String = "select gift.pess_cod, sum(gift_info.credit*gift_quantity)as used_credit from  gift inner join gift_info on gift_info.id=gift.gift_id and gift.pess_cod=@pess_cod "
                strSQL += "group by gift.pess_cod"
                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL
                    cmd.Parameters.AddWithValue("@pess_cod", Session("pess_cod"))

                    Dim reader As SqlDataReader = cmd.ExecuteReader()
                    If reader.HasRows Then
                        While reader.Read()
                            TotalUsed.Text = reader("used_credit").ToString()
                        End While
                    Else
                        TotalUsed.Text = "0"
                    End If
                End Using
                mycon.Close()
            End Using

        Catch ex As Exception
            Response.Write("<script>alert('Gift Count Error!')</script>")
        End Try
    End Sub

    Public Sub GiftRegTotalCount()
        Try
            Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
            Using mycon As New SqlConnection(con)
                mycon.Open()
                Dim strSQL As String = "select gift.pess_cod, sum(gift_info.credit*gift_quantity)as reg_credit from  gift inner join gift_info on gift_info.id=gift.gift_id and gift.pess_cod=@pess_cod and gift.status=@status "
                strSQL += "group by gift.pess_cod"
                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL
                    cmd.Parameters.AddWithValue("@pess_cod", Session("pess_cod"))
                    cmd.Parameters.AddWithValue("@status", "Registered")

                    Dim reader As SqlDataReader = cmd.ExecuteReader()
                    If reader.HasRows Then
                        While reader.Read()
                            regCredit.Text = reader("reg_credit").ToString()
                        End While
                    Else
                        regCredit.Text = "0"
                    End If
                End Using
                mycon.Close()
            End Using

        Catch ex As Exception
            Response.Write("<script>alert('Gift Count Error!')</script>")
        End Try
    End Sub
    Public Sub ValidCount()
        Try
            Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
            Using mycon As New SqlConnection(con)
                mycon.Open()
                Dim strSQL As String = "select gift.pess_cod,(temp.Total_Point-sum(gift_info.credit*gift_quantity))as valid_credit from gift inner join gift_info on gift_info.id=gift.gift_id inner join "
                strSQL += "(select Seminar.pess_cod, SUM(Seminar_Info.bonus_point) as Total_Point from Seminar,Seminar_Info "
                strSQL += "where Seminar.Seminar_info_id = Seminar_Info.id and Seminar.pess_cod=@pess_cod group by Seminar.pess_cod)as temp on gift.pess_cod=temp.pess_cod "
                strSQL += "group by gift.pess_cod,temp.Total_Point"
                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL
                    cmd.Parameters.AddWithValue("@pess_cod", Session("pess_cod"))

                    Dim reader As SqlDataReader = cmd.ExecuteReader()
                    If reader.HasRows Then
                        While reader.Read()
                            validCredit.Text = reader("valid_credit").ToString()
                        End While
                    Else
                        validCredit.Text = TotalSem.Text
                    End If
                End Using
                mycon.Close()
            End Using

        Catch ex As Exception
            Response.Write("<script>alert('Valid Count Error!')</script>")
        End Try
    End Sub



    Public Sub GetSemStudentInfo()
        Try
            Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
            Using mycon As New SqlConnection(con)
                mycon.Open()
                Dim strSQL As String = "SELECT TOP 1 student_id as sid, name_ch as cname, name_pt as pname FROM [student_academic_info] where pess_cod=@pess_cod order by ALUN_NUMERO_SEQ desc"

                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL
                    cmd.Parameters.AddWithValue("@pess_cod", Session("pess_cod"))

                    Dim reader As SqlDataReader = cmd.ExecuteReader()
                    If reader.HasRows Then
                        While reader.Read()
                            studID.Text = reader("sid").ToString()
                            chname.Text = reader("cname").ToString()
                            pnname.Text = reader("pname").ToString()
                        End While
                    Else
                        stuID.Text = ""
                        cname.Text = ""
                        pname.Text = ""
                    End If
                End Using
                mycon.Close()
            End Using

        Catch ex As Exception
            Response.Write("<script>alert('Web Error!')</script>")
        End Try
    End Sub

    Public Sub GetGiftStudentInfo()
        Try
            Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
            Using mycon As New SqlConnection(con)
                mycon.Open()
                Dim strSQL As String = "SELECT TOP 1 student_id as sid, name_ch as cname, name_pt as pname FROM [student_academic_info] where pess_cod=@pess_cod order by ALUN_NUMERO_SEQ desc"
                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL
                    cmd.Parameters.AddWithValue("@pess_cod", Session("pess_cod"))

                    Dim reader As SqlDataReader = cmd.ExecuteReader()
                    If reader.HasRows Then
                        While reader.Read()
                            stuID.Text = reader("sid").ToString()
                            cname.Text = reader("cname").ToString()
                            pname.Text = reader("pname").ToString()
                        End While
                    Else
                        stuID.Text = ""
                        cname.Text = ""
                        pname.Text = ""
                    End If
                End Using
                mycon.Close()
            End Using

        Catch ex As Exception
            Response.Write("<script>alert('Web Error!')</script>")
        End Try
    End Sub

    Public Sub GetGiftRegStudentInfo()
        Try
            Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
            Using mycon As New SqlConnection(con)
                mycon.Open()
                Dim strSQL As String = "SELECT TOP 1 student_id as sid, name_ch as cname, name_pt as pname FROM [student_academic_info] where pess_cod=@pess_cod order by ALUN_NUMERO_SEQ desc"
                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL
                    cmd.Parameters.AddWithValue("@pess_cod", Session("pess_cod"))

                    Dim reader As SqlDataReader = cmd.ExecuteReader()
                    If reader.HasRows Then
                        While reader.Read()
                            stuidReg.Text = reader("sid").ToString()
                            chnReg.Text = reader("cname").ToString()
                            enameReg.Text = reader("pname").ToString()
                        End While
                    Else
                        stuidReg.Text = ""
                        chnReg.Text = ""
                        enameReg.Text = ""
                    End If
                End Using
                mycon.Close()
            End Using

        Catch ex As Exception
            Response.Write("<script>alert('Web Error!')</script>")
        End Try
    End Sub
    Public Sub bindGridViewSeminar()

        Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
        Using mycon As New SqlConnection(con)
            mycon.Open()
            Dim strSQL As String = "select Seminar.id,Seminar.pess_cod,Seminar_Info.topicName, Seminar_Info.category, Seminar_Info.startDate, Seminar_Info.duration, Seminar_Info.organizer, Seminar_Info.bonus_point from "
            strSQL += "(select y.STUDENT_ID, y.NAME_CH, y.NAME_PT, y.pess_cod, y.ALUN_NUMERO_SEQ from(select  pess_cod, max(ALUN_NUMERO_SEQ) as maxSEQ from student_academic_info "
            strSQL += "group by pess_cod) as x inner join student_academic_info as y on x.pess_cod = y.pess_cod and x.maxSEQ = y.ALUN_NUMERO_SEQ)as stud inner join Seminar on stud.pess_cod=Seminar.pess_cod "
            strSQL += "inner join Seminar_Info on Seminar.Seminar_info_id=Seminar_Info.id where stud.pess_cod=@pesscod order by Seminar_Info.startDate desc"
            Using cmd As New SqlCommand()
                cmd.Connection = mycon
                cmd.CommandText = strSQL
                cmd.Parameters.AddWithValue("@pesscod", Session("pess_cod"))

                Dim mySqlAdapter As New SqlDataAdapter(cmd)
                Dim myDataSet As New DataSet()
                mySqlAdapter.Fill(myDataSet)

                GridViewSeminar.DataSource = myDataSet
                GridViewSeminar.AllowPaging = True
                GridViewSeminar.PageSize = 10
                GridViewSeminar.DataBind()
            End Using
            mycon.Close()
        End Using

    End Sub



    Public Sub bindGridViewCart()

        Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
        Using mycon As New SqlConnection(con)
            mycon.Open()
            Dim strSQL As String = "SELECT * FROM [gift_info] WHERE [active] = @active"

            Using cmd As New SqlCommand()
                cmd.Connection = mycon
                cmd.CommandText = strSQL
                cmd.Parameters.AddWithValue("@active", "True")
                Dim mySqlAdapter As New SqlDataAdapter(cmd)
                Dim myDataSet As New DataSet()
                mySqlAdapter.Fill(myDataSet)

                GridViewCart.DataSource = myDataSet
                GridViewCart.AllowPaging = True
                GridViewCart.PageSize = 10
                GridViewCart.DataBind()
            End Using
            mycon.Close()
        End Using

    End Sub

    Public Sub bindGridViewGift()

        Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
        Using mycon As New SqlConnection(con)
            mycon.Open()
            Dim strSQL As String = "SELECT stud.pess_cod,stud.student_id, stud.name_ch,gift_info.id as giftID,gift_info.title,gift_info.detail,gift_info.credit,gift.id as exchangeID, gift.register_time, gift.exchange_time, gift.update_time, gift.gift_quantity, gift.status from "
            strSQL += "(select y.STUDENT_ID, y.NAME_CH, y.NAME_PT, y.pess_cod, y.ALUN_NUMERO_SEQ from(select  pess_cod, max(ALUN_NUMERO_SEQ) as maxSEQ from student_academic_info "
            strSQL += "group by pess_cod) as x inner join student_academic_info as y on x.pess_cod = y.pess_cod and x.maxSEQ = y.ALUN_NUMERO_SEQ)as stud inner join gift on stud.pess_cod=gift.pess_cod  "
            strSQL += "inner join gift_info on  gift.gift_id=gift_info.id where gift.pess_cod=@pesscod order by gift.register_time desc"



            Using cmd As New SqlCommand()
                cmd.Connection = mycon
                cmd.CommandText = strSQL
                cmd.Parameters.AddWithValue("@pesscod", Session("pess_cod"))

                Dim mySqlAdapter As New SqlDataAdapter(cmd)
                Dim myDataSet As New DataSet()
                mySqlAdapter.Fill(myDataSet)

                GridViewGift.DataSource = myDataSet
                GridViewGift.AllowPaging = True
                GridViewGift.PageSize = 10
                GridViewGift.DataBind()
            End Using
            mycon.Close()
        End Using



    End Sub


    Protected Sub ExchangeBack_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ExchangeBack.Click
        MultiView1.ActiveViewIndex = 0
        ValidCount()
        bindGridViewCart()
    End Sub



    Protected Sub RegisterBtn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles RegisterBtn.Click
        If (message.Value = "No") Then
            MultiView1.ActiveViewIndex = 1
            Exit Sub
        End If

        Dim update As Boolean = False
        Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
        Try

            Using mycon As New SqlConnection(con)
                mycon.Open()
                Dim strSQL As String = "SELECT update_time from gift_info where id=@id "

                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL
                    cmd.Parameters.AddWithValue("@id", id.Value)

                    Dim reader As SqlDataReader = cmd.ExecuteReader()
                    If reader.HasRows Then
                        While reader.Read()

                            If (Format(reader("update_time"), "yyyy-MM-dd HH:mm:ss.fff")) = time.Value Then
                                update = True
                            End If


                        End While
                    Else
                        Response.Write("<script>alert('someone updating, please try later');window.location.href='../Operator/GiftExchange.aspx'; </script>")

                        Exit Sub
                    End If
                End Using
                mycon.Close()
            End Using

        Catch ex As Exception
            Response.Write("<script>alert('Web Error!')</script>")

            Exit Sub
        End Try

        If update <> True Then

            Response.Write("<script>alert('someone updating, please try later');window.location.href='../Operator/GiftExchange.aspx'; </script>")

            Exit Sub
        End If


        Application.Lock()

        Try

            Using mycon As New SqlConnection(con)
                mycon.Open()
                Dim strSQL As String = "insert into gift (pess_cod,gift_id,gift_quantity,register_time,update_time,status)values(@pess_cod,@gift_id,@gift_quantity,getdate(),getdate(),@status);"
                strSQL = strSQL + "update gift_info set quantity = quantity - @quantity, update_time=GETDATE() where id=@id"
                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL
                    cmd.Parameters.AddWithValue("@pess_cod", Session("pess_cod"))
                    cmd.Parameters.AddWithValue("@gift_id", id.Value)
                    cmd.Parameters.AddWithValue("@gift_quantity", giftCount.SelectedValue)
                    cmd.Parameters.AddWithValue("@quantity", giftCount.SelectedValue)
                    cmd.Parameters.AddWithValue("@id", id.Value)
                    cmd.Parameters.AddWithValue("@status", "Registered")

                    cmd.ExecuteNonQuery()
                End Using
                mycon.Close()
            End Using

        Catch ex As Exception
            Application.UnLock()
            Response.Write("<script>alert('Register Error!')</script>")

            Return

        End Try


        ValidCount()
        MultiView1.ActiveViewIndex = 0
        bindGridViewCart()
        Application.UnLock()
        If Session("CurrentUI") = "zh-TW" Then
            Response.Write("<script>alert('登記成功!'); </script>")
        Else
            Response.Write("<script>alert('Register Successfully!'); </script>")
        End If

    End Sub








    Protected Sub GridViewCart_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewCart.RowDataBound

        For i = 0 To GridViewCart.Rows.Count - 1
            If Convert.ToInt32(GridViewCart.Rows(i).Cells(5).Text) > 0 And Convert.ToInt32(GridViewCart.Rows(i).Cells(6).Text) <= Convert.ToInt32(validCredit.Text) Then
                GridViewCart.Rows(i).Cells(7).Enabled = True

            Else
                GridViewCart.Rows(i).Cells(7).Enabled = False

            End If


        Next

    End Sub



    Protected Sub ImageBtn_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Dim row As GridViewRow = DirectCast(DirectCast(sender, ImageButton).NamingContainer, GridViewRow)
        DirectCast(row.NamingContainer, GridView).SelectedIndex = row.RowIndex
        Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
        Try

            Using mycon As New SqlConnection(con)
                mycon.Open()
                Dim strSQL As String = "select * FROM [gift_info] where id=@id"
                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL
                    cmd.Parameters.AddWithValue("@id", GridViewCart.Rows(DirectCast(row.NamingContainer, GridView).SelectedIndex).Cells(1).Text)

                    Dim reader As SqlDataReader = cmd.ExecuteReader()
                    If reader.HasRows Then
                        While reader.Read()
                            pic.ImageUrl = reader("image").ToString()

                        End While
                    Else
                        pic.ImageUrl = ""
                    End If
                End Using
                mycon.Close()
            End Using
            Dim strArr() As String
            strArr = pic.ImageUrl.Split("/")
            Dim Path As String = Server.MapPath("~/Admin/image/")
            Dim img As System.Drawing.Image
            If pic.ImageUrl = "" Then
                img = System.Drawing.Image.FromFile(Path & "/" & "noImage.jpg")
            Else
                img = System.Drawing.Image.FromFile(Path & "GiftImage" & "/" & strArr(strArr.Length - 1))
            End If

            If img.Width > 780 Then
                pic.Width = 600
            Else
                pic.Width = img.Width
            End If

            If img.Height > 602 Then
                pic.Height = 500
            Else
                pic.Height = img.Height
            End If

            ModalPopupExtender1.Show()


        Catch ex As Exception
           Response.Write("<script>alert('Web Error!')</script>")
        End Try
    End Sub
    Protected Sub GridViewCart_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridViewCart.PageIndexChanging
        Me.GridViewCart.PageIndex = e.NewPageIndex
        bindGridViewCart()
    End Sub



    Protected Sub GridViewCart_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewCart.SelectedIndexChanged

        id.Value = GridViewCart.DataKeys(GridViewCart.SelectedIndex).Values(0).ToString()
        time.Value = (Format(GridViewCart.DataKeys(GridViewCart.SelectedIndex).Values(1), "yyyy-MM-dd HH:mm:ss.fff"))
        Dim update As Boolean = False
        Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
        Try

            Using mycon As New SqlConnection(con)
                mycon.Open()
                Dim strSQL As String = "SELECT update_time from gift_info where id=@id "

                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL
                    cmd.Parameters.AddWithValue("@id", id.Value)

                    Dim reader As SqlDataReader = cmd.ExecuteReader()
                    If reader.HasRows Then
                        While reader.Read()

                            If (Format(reader("update_time"), "yyyy-MM-dd HH:mm:ss.fff")) = time.Value Then
                                update = True
                            End If


                        End While
                    Else
                        Response.Write("<script>alert('someone updating, please try later');window.location.href='../Operator/GiftExchange.aspx'; </script>")

                    End If
                End Using
                mycon.Close()
            End Using

        Catch ex As Exception
            Response.Write("<script>alert('Web Error!')</script>")
            Exit Sub
        End Try

        If update <> True Then

            Response.Write("<script>alert('someone updating, please try later');window.location.href='../Operator/GiftExchange.aspx'; </script>")
            Exit Sub
        End If



        giftCount.Items.Clear()

        Try
            Using mycon As New SqlConnection(con)
                mycon.Open()
                Dim strSQL As String = "SELECT max_exchange from gift_info where id=@id "

                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL
                    cmd.Parameters.AddWithValue("@id", id.Value)

                    Dim reader As SqlDataReader = cmd.ExecuteReader()
                    If reader.HasRows Then
                        While reader.Read()

                            maxExchange.Value = reader("max_exchange").ToString()



                        End While

                    End If
                End Using
                mycon.Close()
            End Using

        Catch ex As Exception
            Response.Write("<script>alert('Web Error!')</script>")
            Exit Sub
        End Try

        Dim a As Integer

        a = Int((Convert.ToInt32(validCredit.Text)) / Convert.ToInt32((Me.GridViewCart.SelectedRow.Cells(6).Text)))
        If (Convert.ToInt32(Me.GridViewCart.SelectedRow.Cells(5).Text)) >= a And a <= Convert.ToInt32(maxExchange.Value) Then
            For i As Integer = 1 To a

                giftCount.Items.Add(New ListItem(i, i))
            Next
        End If
        If (Convert.ToInt32(Me.GridViewCart.SelectedRow.Cells(5).Text)) >= a And a > Convert.ToInt32(maxExchange.Value) Then
            For i As Integer = 1 To Convert.ToInt32(maxExchange.Value)

                giftCount.Items.Add(New ListItem(i, i))
            Next
        End If

        If (Convert.ToInt32(Me.GridViewCart.SelectedRow.Cells(5).Text)) < a And (Convert.ToInt32(Me.GridViewCart.SelectedRow.Cells(5).Text)) <= Convert.ToInt32(maxExchange.Value) Then
            For i As Integer = 1 To (Convert.ToInt32(Me.GridViewCart.SelectedRow.Cells(5).Text))

                giftCount.Items.Add(New ListItem(i, i))
            Next
        End If
        If (Convert.ToInt32(Me.GridViewCart.SelectedRow.Cells(5).Text)) < a And (Convert.ToInt32(Me.GridViewCart.SelectedRow.Cells(5).Text)) > Convert.ToInt32(maxExchange.Value) Then
            For i As Integer = 1 To Convert.ToInt32(maxExchange.Value)

                giftCount.Items.Add(New ListItem(i, i))
            Next
        End If

        MultiView1.ActiveViewIndex = 1
    End Sub



    'Protected Sub home_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles home.Click
    '    Response.Redirect("home.aspx")
    'End Sub

    Protected Sub ImageButton2_Click1(ByVal sender As Object, ByVal e As ImageClickEventArgs) Handles ImageButton2.Click
        Response.Redirect("home.aspx")
    End Sub


    Protected Sub RegGift_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles RegGift.Click
        MultiView1.ActiveViewIndex = 0
        ValidCount()
        bindGridViewCart()
    End Sub

    Protected Sub EarnedCredit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles EarnedCredit.Click
        MultiView1.ActiveViewIndex = 2
        SeminarTotalCount()
        GetSemStudentInfo()
        bindGridViewSeminar()

    End Sub

    Protected Sub UsedCredit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles UsedCredit.Click
        MultiView1.ActiveViewIndex = 3
        GiftTotalCount()
        GetGiftStudentInfo()
        bindGridViewGift()
    End Sub



    Protected Sub GridViewRegGift_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GridViewRegGift.RowCommand

        If e.CommandName = "Delete" Then

            Dim myRow As GridViewRow = CType(e.CommandSource, LinkButton).NamingContainer
            Dim rowIndex As Integer = myRow.RowIndex
            giftCountDel.Items.Clear()

            For i As Integer = 1 To GridViewRegGift.DataKeys(rowIndex)("gift_quantity")
                giftCountDel.Items.Add(New ListItem(i, i))
            Next

            exchangeID.Value = GridViewRegGift.DataKeys(rowIndex)("exchangeID").ToString()
            giftID.Value = GridViewRegGift.DataKeys(rowIndex)("giftID").ToString()
            gift_quantity.Value = GridViewRegGift.DataKeys(rowIndex)("gift_quantity")
            giftTime.Value = (Format(GridViewRegGift.DataKeys(rowIndex)("update_time"), "yyyy-MM-dd HH:mm:ss.fff"))

        End If
    End Sub




    Protected Sub GridViewRegGift_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GridViewRegGift.RowDeleting

        Dim delete As Boolean = False

        Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
        Try
            Using mycon As New SqlConnection(con)
                mycon.Open()
                Dim strSQL As String = "SELECT update_time from gift where id=@id"

                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL
                    cmd.Parameters.AddWithValue("@id", GridViewRegGift.DataKeys(e.RowIndex).Value.ToString())

                    Dim reader As SqlDataReader = cmd.ExecuteReader()
                    If reader.HasRows = False Then
                        e.Cancel = True
                        Response.Write("<script>alert('someone updating, please try later');window.location.href='../Student/RegisterGift.aspx'; </script>")
                    End If
                End Using
                mycon.Close()
            End Using

        Catch ex As Exception
            e.Cancel = True
            Response.Write("<script>alert('web error')</script>")
            Exit Sub
        End Try


        MultiView1.ActiveViewIndex = 5
    End Sub

    Protected Sub DelBtn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles DelBtn.Click
        If (delmsg.Value = "No") Then
            MultiView1.ActiveViewIndex = 5
            Exit Sub

        End If
        Dim delete As Boolean = False
        Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
        Try

            Using mycon As New SqlConnection(con)
                mycon.Open()
                Dim strSQL As String = "SELECT update_time from gift where id=@id "

                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL
                    cmd.Parameters.AddWithValue("@id", exchangeID.Value)

                    Dim reader As SqlDataReader = cmd.ExecuteReader()
                    If reader.HasRows Then
                        While reader.Read()

                            If (Format(reader("update_time"), "yyyy-MM-dd HH:mm:ss.fff")) = giftTime.Value Then
                                delete = True
                            End If


                        End While
                    Else
                        Response.Write("<script>alert('someone updating, please try later');window.location.href='../Student/RegisterGift.aspx'; </script>")
                        Exit Sub
                    End If
                End Using
                mycon.Close()
            End Using

        Catch ex As Exception
            Response.Write("<script>alert('Web Error!')</script>")
            Exit Sub
        End Try

        If delete <> True Then

            Response.Write("<script>alert('someone updating, please try later');window.location.href='../Student/RegisterGift.aspx'; </script>")
            Exit Sub
        End If


        Application.Lock()
        If gift_quantity.Value = giftCountDel.SelectedValue Then

            Try

                Using mycon As New SqlConnection(con)
                    mycon.Open()
                    Dim strSQL As String = "delete from gift where id=@id;"
                    strSQL = strSQL + "update gift_info set quantity = quantity + @gift_quantity, update_time=GETDATE() where id=@giftID "
                    Using cmd As New SqlCommand()
                        cmd.Connection = mycon
                        cmd.CommandText = strSQL
                        cmd.Parameters.AddWithValue("@id", exchangeID.Value)
                        cmd.Parameters.AddWithValue("@gift_quantity", giftCountDel.SelectedValue)
                        cmd.Parameters.AddWithValue("@giftID", giftID.Value)

                        cmd.ExecuteNonQuery()
                    End Using
                    mycon.Close()
                End Using
            Catch ex As Exception
                Response.Write("<script>alert('web error')</script>")
                Exit Sub
            End Try
            bindGridViewRegGift()
            GiftRegTotalCount()
            MultiView1.ActiveViewIndex = 4

        Else
            Try

                Using mycon As New SqlConnection(con)
                    mycon.Open()
                    Dim strSQL As String = "update gift set gift_quantity=gift_quantity-@count, update_time=GETDATE() where id=@id;"
                    strSQL = strSQL + "update gift_info set quantity = quantity + @gift_quantity, update_time=GETDATE() where id=@giftID "
                    Using cmd As New SqlCommand()
                        cmd.Connection = mycon
                        cmd.CommandText = strSQL
                        cmd.Parameters.AddWithValue("@count", giftCountDel.SelectedValue)
                        cmd.Parameters.AddWithValue("@id", exchangeID.Value)
                        cmd.Parameters.AddWithValue("@gift_quantity", giftCountDel.SelectedValue)
                        cmd.Parameters.AddWithValue("@giftID", giftID.Value)

                        cmd.ExecuteNonQuery()
                    End Using
                    mycon.Close()
                End Using
            Catch ex As Exception
                Response.Write("<script>alert('web error')</script>")
                Exit Sub
            End Try
            Application.UnLock()
            bindGridViewRegGift()
            GiftRegTotalCount()
            MultiView1.ActiveViewIndex = 4
        End If

    End Sub
    Public Sub bindGridViewRegGift()

        Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
        Using mycon As New SqlConnection(con)
            mycon.Open()

            Dim strSQL As String = "SELECT stud.pess_cod,stud.student_id, stud.name_ch,gift_info.id as giftID,gift_info.title,gift_info.detail,gift_info.credit,gift.id as exchangeID, gift.exchange_time, gift.update_time, gift.gift_quantity, gift.status from "
            strSQL += "(select y.STUDENT_ID, y.NAME_CH, y.NAME_PT, y.pess_cod, y.ALUN_NUMERO_SEQ from(select  pess_cod, max(ALUN_NUMERO_SEQ) as maxSEQ from student_academic_info "
            strSQL += "group by pess_cod) as x inner join student_academic_info as y on x.pess_cod = y.pess_cod and x.maxSEQ = y.ALUN_NUMERO_SEQ)as stud inner join gift on stud.pess_cod=gift.pess_cod  "
            strSQL += "inner join gift_info on  gift.gift_id=gift_info.id where gift.pess_cod=@pesscod and gift.status=@status order by gift.exchange_time desc"


            Using cmd As New SqlCommand()
                cmd.Connection = mycon
                cmd.CommandText = strSQL
                cmd.Parameters.AddWithValue("@pesscod", Session("pess_cod"))
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

    Protected Sub CancelGift_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CancelGift.Click
        MultiView1.ActiveViewIndex = 4
        GiftRegTotalCount()
        GetGiftRegStudentInfo()
        bindGridViewRegGift()

    End Sub

    Protected Sub giftDelBack_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles giftDelBack.Click
        MultiView1.ActiveViewIndex = 4
        GiftRegTotalCount()
        GetGiftRegStudentInfo()
        bindGridViewRegGift()
    End Sub
    Protected Overrides Sub InitializeCulture()

        If Session("CurrentUI") IsNot Nothing Then

            Dim selectedLanguage As String = Session("CurrentUI").ToString()
            UICulture = selectedLanguage
            Culture = selectedLanguage


            Thread.CurrentThread.CurrentCulture =
                CultureInfo.CreateSpecificCulture(selectedLanguage)
            Thread.CurrentThread.CurrentUICulture = New CultureInfo(selectedLanguage)
        End If

        MyBase.InitializeCulture()
    End Sub

    Protected Sub GridViewSeminar_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridViewSeminar.PageIndexChanging
        Me.GridViewSeminar.PageIndex = e.NewPageIndex
        bindGridViewSeminar()
    End Sub

    Protected Sub GridViewGift_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridViewGift.PageIndexChanging
        Me.GridViewGift.PageIndex = e.NewPageIndex
        bindGridViewGift()
    End Sub

    Protected Sub GridViewRegGift_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridViewRegGift.PageIndexChanging
        Me.GridViewRegGift.PageIndex = e.NewPageIndex
        bindGridViewRegGift()
    End Sub
End Class



