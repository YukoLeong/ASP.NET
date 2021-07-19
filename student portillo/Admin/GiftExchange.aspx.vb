Imports System.Data
Imports System.Data.SqlClient
Partial Class Operator_GiftExchange
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Role_Type") Is Nothing Then

            Response.Write("<script>alert('Please Log In !'); window.location.href='../staff.aspx'; </script>")
            Response.End()
        End If
        If Not IsPostBack Then

            Dim dv_time As Data.DataView = AccessTime.Select(New DataSourceSelectArguments)
            If (dv_time.Item(0).Item("active")) = False Then
                Response.Redirect("~/Admin/invaild.aspx")
                Exit Sub
            End If

            Dim startDate As String = Format(dv_time.Item(0).Item("startTimeEx"), "yyyy/MM/dd")
            Dim endDate As String = DateTime.Now.ToString("yyyy/MM/dd")
            Dim startArr() As String
            Dim endArr() As String
            Dim flag As Boolean = False
            startArr = startDate.Split("/")
            endArr = endDate.Split("/")


            If ((Convert.ToInt32(startArr(0))) > (Convert.ToInt32(endArr(0)))) Then

                Response.Redirect("~/Admin/invaild.aspx")
                Exit Sub


            End If
            If ((Convert.ToInt32(startArr(0))) = (Convert.ToInt32(endArr(0))) And (Convert.ToInt32(startArr(1))) > (Convert.ToInt32(endArr(1)))) Then

                Response.Redirect("~/Admin/invaild.aspx")
                Exit Sub
            End If


            If ((Convert.ToInt32(startArr(0))) = (Convert.ToInt32(endArr(0))) And (Convert.ToInt32(startArr(1))) = (Convert.ToInt32(endArr(1))) And (Convert.ToInt32(startArr(2))) > (Convert.ToInt32(endArr(2)))) Then

                Response.Redirect("~/Admin/invaild.aspx")
                Exit Sub


            End If

            Dim startDate1 As String = DateTime.Now.ToString("yyyy/MM/dd")
            Dim endDate1 As String = Format(dv_time.Item(0).Item("endTimeEx"), "yyyy/MM/dd")
            Dim startArr1() As String
            Dim endArr1() As String
            Dim flag1 As Boolean = False
            startArr1 = startDate1.Split("/")
            endArr1 = endDate1.Split("/")


            If ((Convert.ToInt32(startArr1(0))) > (Convert.ToInt32(endArr1(0)))) Then
                Response.Redirect("~/Admin/invaild.aspx")
                Exit Sub



            End If
            If ((Convert.ToInt32(startArr1(0))) = (Convert.ToInt32(endArr1(0))) And (Convert.ToInt32(startArr1(1))) > (Convert.ToInt32(endArr1(1)))) Then

                Response.Redirect("~/Admin/invaild.aspx")
                Exit Sub

            End If


            If ((Convert.ToInt32(startArr1(0))) = (Convert.ToInt32(endArr1(0))) And (Convert.ToInt32(startArr1(1))) = (Convert.ToInt32(endArr1(1))) And (Convert.ToInt32(startArr1(2))) > (Convert.ToInt32(endArr1(2)))) Then

                Response.Redirect("~/Admin/invaild.aspx")
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
            If Request.QueryString("view") = 1 Then
                SeminarTotalCount()
                GetSemStudentInfo()
                bindGridViewSeminar()
            End If

            If Request.QueryString("view") = 2 Then
                GiftTotalCount()
                GetGiftStudentInfo()
                bindGridViewGift()

            End If

            If Request.QueryString("view") = 3 Then
                SeminarTotalCount()
                ValidCount()

                bindGridViewCart()

            End If
            If Request.QueryString("stuid") <> "" Then
                bindGridViewStudentSearch()
                searchBack.Visible = True
            End If

            searchTxt.Focus()


        End If



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
                    cmd.Parameters.AddWithValue("@pess_cod", Request("pesscod"))

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
                    cmd.Parameters.AddWithValue("@pess_cod", Request("pesscod"))

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
    Function FindSemCredit() As Integer
        Dim result As Integer
        Try
            Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
            Using mycon As New SqlConnection(con)
                mycon.Open()
                Dim strSQL As String = "select Seminar.pess_cod,SUM(Seminar_Info.bonus_point) as Total_Point from Seminar,Seminar_Info "
                strSQL += "where Seminar.Seminar_info_id=Seminar_Info.id and Seminar.pess_cod=@pess_cod group by Seminar.pess_cod"
                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL
                    cmd.Parameters.AddWithValue("@pess_cod", Request("pesscod"))

                    Dim reader As SqlDataReader = cmd.ExecuteReader()
                    If reader.HasRows Then
                        While reader.Read()
                            result = Convert.ToInt32(reader("Total_Point").ToString())
                        End While
                    Else
                        result = "0"
                    End If
                End Using
                mycon.Close()
            End Using

        Catch ex As Exception
            Response.Write("<script>alert('Seminar Count Error!')</script>")
        End Try
        FindSemCredit = result


    End Function
    Function FindGiftCredit() As Integer
        Dim result As Integer
        Try
            Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
            Using mycon As New SqlConnection(con)
                mycon.Open()
                Dim strSQL As String = "select gift.pess_cod, sum(gift_info.credit*gift_quantity)as used_credit from  gift inner join gift_info on gift_info.id=gift.gift_id and gift.pess_cod=@pess_cod "
                strSQL += "group by gift.pess_cod"
                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL
                    cmd.Parameters.AddWithValue("@pess_cod", Request("pesscod"))

                    Dim reader As SqlDataReader = cmd.ExecuteReader()
                    If reader.HasRows Then
                        While reader.Read()

                            result = Convert.ToInt32(reader("used_credit").ToString())
                        End While
                    Else
                        result = 0
                    End If
                End Using
                mycon.Close()
            End Using

        Catch ex As Exception
            Response.Write("<script>alert('Gift Count Error!')</script>")
        End Try
        FindGiftCredit = result


    End Function

    Public Sub ValidCount()
        Try
            Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
            Using mycon As New SqlConnection(con)
                mycon.Open()
                Dim strSQL As String = "select gift.pess_cod,(temp.Total_Point-sum(gift_info.credit*gift.gift_quantity))as valid_credit from gift inner join gift_info on gift_info.id=gift.gift_id inner join "
                strSQL += "(select Seminar.pess_cod, SUM(Seminar_Info.bonus_point) as Total_Point from Seminar,Seminar_Info "
                strSQL += "where Seminar.Seminar_info_id = Seminar_Info.id and Seminar.pess_cod=@pess_cod group by Seminar.pess_cod)as temp on gift.pess_cod=temp.pess_cod "
                strSQL += "group by gift.pess_cod,temp.Total_Point"
                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL
                    cmd.Parameters.AddWithValue("@pess_cod", Request("pesscod"))

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
                Dim strSQL As String = "select stud.STUDENT_ID as sid, stud.NAME_CH as cname, stud.NAME_PT as pname from "
                strSQL += "(select y.STUDENT_ID, y.NAME_CH, y.NAME_PT, y.pess_cod, y.ALUN_NUMERO_SEQ from(select  pess_cod, max(ALUN_NUMERO_SEQ) as maxSEQ from student_academic_info "
                strSQL += "group by pess_cod) as x inner join student_academic_info as y on x.pess_cod = y.pess_cod and x.maxSEQ = y.ALUN_NUMERO_SEQ)as stud inner join  Seminar "
                strSQL += "on stud.pess_cod=Seminar.pess_cod where Seminar.pess_cod=@pess_cod"


           
                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL
                    cmd.Parameters.AddWithValue("@pess_cod", Request("pesscod"))

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
                Dim strSQL As String = "select stud.STUDENT_ID as sid, stud.NAME_CH as cname, stud.NAME_PT as pname from "
                strSQL += "(select y.STUDENT_ID, y.NAME_CH, y.NAME_PT, y.pess_cod, y.ALUN_NUMERO_SEQ from(select  pess_cod, max(ALUN_NUMERO_SEQ) as maxSEQ from student_academic_info "
                strSQL += "group by pess_cod) as x inner join student_academic_info as y on x.pess_cod = y.pess_cod and x.maxSEQ = y.ALUN_NUMERO_SEQ)as stud inner join  Seminar "
                strSQL += "on stud.pess_cod=Seminar.pess_cod where Seminar.pess_cod=@pess_cod"
                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL
                    cmd.Parameters.AddWithValue("@pess_cod", Request("pesscod"))

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



    Public Sub bindGridViewSeminar()

        Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
        Using mycon As New SqlConnection(con)
            mycon.Open()
            Dim strSQL As String = "select Seminar.id,Seminar.pess_cod,Seminar_Info.topicName, Seminar_Info.category, Seminar_Info.startDate, Seminar_Info.duration, Seminar_Info.organizer, Seminar_Info.bonus_point from "
            strSQL += "(select y.STUDENT_ID, y.NAME_CH, y.NAME_PT, y.pess_cod, y.ALUN_NUMERO_SEQ from(select  pess_cod, max(ALUN_NUMERO_SEQ) as maxSEQ from student_academic_info "
            strSQL += "group by pess_cod) as x inner join student_academic_info as y on x.pess_cod = y.pess_cod and x.maxSEQ = y.ALUN_NUMERO_SEQ)as stud inner join Seminar on stud.pess_cod=Seminar.pess_cod "
            strSQL += "inner join Seminar_Info on Seminar.Seminar_info_id=Seminar_Info.id where stud.pess_cod=@pesscod"

            Using cmd As New SqlCommand()
                cmd.Connection = mycon
                cmd.CommandText = strSQL
                cmd.Parameters.AddWithValue("@pesscod", Request("pesscod"))

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

    Protected Sub GridViewSeminar_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridViewSeminar.PageIndexChanging
        Me.GridViewSeminar.PageIndex = e.NewPageIndex
        bindGridViewSeminar()
    End Sub


    Public Sub bindGridViewStudentSearch()

        Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
        Using mycon As New SqlConnection(con)
            mycon.Open()
            Dim strSQL As String = "select record.STUDENT_ID,record.PATRON_ID,record.NAME_CH,record.NAME_PT,record.pess_cod,record.Total_Point,sum(record.used_credit)as used_credit, (record.Total_Point-sum(record.used_credit))as valid_credit from  "
            strSQL += " (select stud.STUDENT_ID,stud.PATRON_ID,stud.NAME_CH,stud.NAME_PT,stud.pess_cod,temp.Total_Point, ISNULL((gift_info.credit*gift_quantity),0)as used_credit,(temp.Total_Point-ISNULL((gift_info.credit*gift_quantity),0))as valid_credit,gift.exchange_time from "
            strSQL += " (select y.STUDENT_ID,y.PATRON_ID,y.NAME_CH,y.NAME_PT,y.pess_cod,y.ALUN_NUMERO_SEQ from(select  pess_cod, max(ALUN_NUMERO_SEQ) as maxqty from student_academic_info "
            strSQL += "group by pess_cod) as x inner join student_academic_info as y on x.pess_cod = y.pess_cod and x.maxqty = y.ALUN_NUMERO_SEQ)as stud left join gift on stud.PESS_COD=gift.pess_cod  "
            strSQL += " left join gift_info on gift_info.id=gift.gift_id inner join Seminar on stud.PESS_COD=Seminar.pess_cod   "
            strSQL += " left join (select Seminar.pess_cod, SUM(Seminar_Info.bonus_point) as Total_Point from Seminar,Seminar_Info,student_academic_info   "
            strSQL += " where Seminar.Seminar_info_id=Seminar_Info.id and student_academic_info.PESS_COD=Seminar.pess_cod group by Seminar.pess_cod)as temp on stud.pess_cod=temp.pess_cod   "
            strSQL += " group by stud.pess_cod,temp.Total_Point,stud.STUDENT_ID,stud.PATRON_ID,stud.NAME_CH,stud.NAME_PT,gift_info.credit,gift.gift_quantity,gift.exchange_time)as record where record.STUDENT_ID=@stuid or record.NAME_CH=@NAME_CH or record.PATRON_ID=@PATRON_ID"
            strSQL += " group by record.STUDENT_ID,record.PATRON_ID,record.NAME_CH,record.NAME_PT,record.pess_cod,record.Total_Point  "
            Using cmd As New SqlCommand()
                cmd.Connection = mycon
                cmd.CommandText = strSQL
                cmd.Parameters.AddWithValue("@stuid", searchTxt.Text)
                cmd.Parameters.AddWithValue("@NAME_CH", searchTxt.Text)
                cmd.Parameters.AddWithValue("@PATRON_ID", searchTxt.Text)
                Dim mySqlAdapter As New SqlDataAdapter(cmd)
                Dim myDataSet As New DataSet()
                mySqlAdapter.Fill(myDataSet)

                GridViewSearch.DataSource = myDataSet
                GridViewSearch.DataBind()
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
            Dim strSQL As String = "SELECT stud.pess_cod,stud.student_id, stud.name_ch,gift_info.id as giftID,gift_info.title,gift_info.detail,gift_info.credit,gift.id as exchangeID, gift.exchange_time, gift.update_time, gift.gift_quantity, gift.status from "
            strSQL += "(select y.STUDENT_ID, y.NAME_CH, y.NAME_PT, y.pess_cod, y.ALUN_NUMERO_SEQ from(select  pess_cod, max(ALUN_NUMERO_SEQ) as maxSEQ from student_academic_info "
            strSQL += "group by pess_cod) as x inner join student_academic_info as y on x.pess_cod = y.pess_cod and x.maxSEQ = y.ALUN_NUMERO_SEQ)as stud inner join gift on stud.pess_cod=gift.pess_cod  "
            strSQL += "inner join gift_info on  gift.gift_id=gift_info.id where gift.pess_cod=@pesscod order by gift.exchange_time desc"



            Using cmd As New SqlCommand()
                cmd.Connection = mycon
                cmd.CommandText = strSQL
                cmd.Parameters.AddWithValue("@pesscod", Request("pesscod"))

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

    Protected Sub GridViewGift_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridViewGift.PageIndexChanging
        Me.GridViewGift.PageIndex = e.NewPageIndex
        bindGridViewGift()
    End Sub

    Protected Sub ExchangeBack_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ExchangeBack.Click
        MultiView1.ActiveViewIndex = 3
    End Sub

    Protected Sub EarnedBack_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles EarnedBack.Click

        Response.Redirect("GiftExchange.aspx")


    End Sub

    Protected Sub UsedBack_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles UsedBack.Click

        Response.Redirect("GiftExchange.aspx")

    End Sub

    Protected Sub CartBack_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CartBack.Click


        Response.Redirect("GiftExchange.aspx")


    End Sub


   


    Protected Sub GridViewSeminar_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GridViewSeminar.RowDeleting
        If (delmsg.Value = "No") Then
            e.Cancel = True
            Return
        End If

        Dim delete As Boolean = False

        Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
        Try
            Using mycon As New SqlConnection(con)
                mycon.Open()
                Dim strSQL As String = "SELECT pess_cod from Seminar where id=@id"

                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL
                    cmd.Parameters.AddWithValue("@id", GridViewSeminar.DataKeys(e.RowIndex).Value.ToString())

                    Dim reader As SqlDataReader = cmd.ExecuteReader()
                    If reader.HasRows = False Then
                        e.Cancel = True
                        Response.Write("<script>alert('someone updating, please try later');window.location.href='../Admin/GiftExchange.aspx'; </script>")
                        Exit Sub
                    End If
                End Using
                mycon.Close()
            End Using

        Catch ex As Exception
            e.Cancel = True
            Response.Write("<script>alert('web error')</script>")
            Exit Sub
        End Try

        If (Convert.ToInt32(GridViewSeminar.DataKeys(e.RowIndex)("bonus_point").ToString()) + FindGiftCredit()) > FindSemCredit() Then
            Response.Write("<script>alert('this seminar can not be deleted, because your used credit is more than the total seminar bonus point when it deleted!')</script>")
            Exit Sub
        End If
        Application.Lock()
        Try

            Using mycon As New SqlConnection(con)
                mycon.Open()
                Dim strSQL As String = "delete from Seminar where id=@id;"
                strSQL = strSQL + "update Learning_Records_Correspond set count = count - 1 where pess_cod=@pess_cod and experience_id='1'"
                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL
                    cmd.Parameters.AddWithValue("@id", GridViewSeminar.DataKeys(e.RowIndex)("id").ToString())
                    cmd.Parameters.AddWithValue("@pess_cod", GridViewSeminar.DataKeys(e.RowIndex)("pess_cod").ToString())



                    cmd.ExecuteNonQuery()
                End Using
                mycon.Close()
            End Using
        Catch ex As Exception
            Application.UnLock()
            Response.Write("<script>alert('web error')</script>")

        End Try
        Application.UnLock()
        bindGridViewSeminar()
        SeminarTotalCount()
    End Sub


    Protected Sub GridViewGift_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GridViewGift.RowDeleting
       
        Dim delete As Boolean = False

        Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
        Try
            Using mycon As New SqlConnection(con)
                mycon.Open()
                Dim strSQL As String = "SELECT update_time from gift where id=@id"

                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL
                    cmd.Parameters.AddWithValue("@id", GridViewGift.DataKeys(e.RowIndex).Value.ToString())

                    Dim reader As SqlDataReader = cmd.ExecuteReader()
                    If reader.HasRows = False Then
                        e.Cancel = True
                        Response.Write("<script>alert('someone updating, please try later');window.location.href='../Admin/GiftExchange.aspx'; </script>")
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
                        Response.Write("<script>alert('someone updating, please try later');window.location.href='../Admin/GiftExchange.aspx'; </script>")
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

            Response.Write("<script>alert('someone updating, please try later');window.location.href='../Admin/GiftExchange.aspx'; </script>")
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
            bindGridViewGift()
            GiftTotalCount()
            MultiView1.ActiveViewIndex = 2

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
            bindGridViewGift()
            GiftTotalCount()
            MultiView1.ActiveViewIndex = 2
        End If


    End Sub



    Protected Sub ExchangeBtn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ExchangeBtn.Click
        If (message.Value = "No") Then
            MultiView1.ActiveViewIndex = 4
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
                        Response.Write("<script>alert('someone updating, please try later');window.location.href='../Admin/GiftExchange.aspx'; </script>")

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

            Response.Write("<script>alert('someone updating, please try later');window.location.href='../Admin/GiftExchange.aspx'; </script>")

            Exit Sub
        End If


        Application.Lock()

        Try

            Using mycon As New SqlConnection(con)
                mycon.Open()
                Dim strSQL As String = "insert into gift (pess_cod,gift_id,gift_quantity,register_time,exchange_time,update_time,status,operator)values(@pess_cod,@gift_id,@gift_quantity,getdate(),getdate(),getdate(),@status,@operator);"
                strSQL = strSQL + "update gift_info set quantity = quantity - @quantity, update_time=GETDATE() where id=@id"
                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL
                    cmd.Parameters.AddWithValue("@pess_cod", Request("pesscod").ToString())
                    cmd.Parameters.AddWithValue("@gift_id", id.Value)
                    cmd.Parameters.AddWithValue("@gift_quantity", giftCount.SelectedValue)
                    cmd.Parameters.AddWithValue("@quantity", giftCount.SelectedValue)
                    cmd.Parameters.AddWithValue("@id", id.Value)
                    cmd.Parameters.AddWithValue("@status", "Exchanged")
                    cmd.Parameters.AddWithValue("@operator", Session("ID"))


                    cmd.ExecuteNonQuery()
                End Using
                mycon.Close()
            End Using

        Catch ex As Exception
            Application.UnLock()
            Response.Write("<script>alert('Exchange Error!')</script>")

            Return

        End Try


        ValidCount()
        MultiView1.ActiveViewIndex = 3
        bindGridViewCart()
        Application.UnLock()
        Response.Write("<script>alert('Exchange Succefully !'); </script>")
    End Sub




    Protected Sub giftDelBack_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles giftDelBack.Click
        MultiView1.ActiveViewIndex = 2
    End Sub

    Protected Sub Search_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Search.Click

        bindGridViewStudentSearch()


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
                    cmd.Parameters.AddWithValue("@id", GridViewCart.Rows(DirectCast(row.NamingContainer, GridView).SelectedIndex).Cells(0).Text)

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
            Dim Path As String = Server.MapPath("~/Admin/image")
            Dim img As System.Drawing.Image = System.Drawing.Image.FromFile(Path & "/" & strArr(strArr.Length - 1))

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
                        Response.Write("<script>alert('someone updating, please try later');window.location.href='../Admin/GiftExchange.aspx'; </script>")

                    End If
                End Using
                mycon.Close()
            End Using

        Catch ex As Exception
            Response.Write("<script>alert('Web Error!')</script>")
            Exit Sub
        End Try

        If update <> True Then

            Response.Write("<script>alert('someone updating, please try later');window.location.href='../Admin/GiftExchange.aspx'; </script>")
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

      

        MultiView1.ActiveViewIndex = 4
    End Sub

    Protected Sub GridViewGift_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GridViewGift.RowCommand
    

        If e.CommandName = "Delete" Then

            Dim myRow As GridViewRow = CType(e.CommandSource, LinkButton).NamingContainer
            Dim rowIndex As Integer = myRow.RowIndex
            giftCountDel.Items.Clear()

            For i As Integer = 1 To GridViewGift.DataKeys(rowIndex)("gift_quantity")
                giftCountDel.Items.Add(New ListItem(i, i))
            Next

            exchangeID.Value = GridViewGift.DataKeys(rowIndex)("exchangeID").ToString()
            giftID.Value = GridViewGift.DataKeys(rowIndex)("giftID").ToString()
            gift_quantity.Value = GridViewGift.DataKeys(rowIndex)("gift_quantity")
            giftTime.Value = (Format(GridViewGift.DataKeys(rowIndex)("update_time"), "yyyy-MM-dd HH:mm:ss.fff"))

        End If
    End Sub



    Protected Sub ImageButton2_Click1(sender As Object, e As ImageClickEventArgs) Handles ImageButton2.Click
        Response.Redirect("home.aspx")
    End Sub


End Class
