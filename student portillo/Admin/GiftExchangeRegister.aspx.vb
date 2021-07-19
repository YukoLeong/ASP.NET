Imports System.Data
Imports System.Data.SqlClient
Partial Class Operator_GiftExchangeRegister
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

            End Select
            If Request.QueryString("view") = 1 Then
                GiftTotalCount()
                GetGiftStudentInfo()
                bindGridViewGift()

            End If
            searchTxt.Focus()

        End If

    End Sub



    Public Sub GiftTotalCount()
        Try
            Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
            Using mycon As New SqlConnection(con)
                mycon.Open()
                Dim strSQL As String = "select gift.pess_cod, sum(gift_info.credit*gift_quantity)as used_credit from  gift inner join gift_info on gift_info.id=gift.gift_id and gift.pess_cod=@pess_cod and gift.status=@status "
                strSQL += "group by gift.pess_cod"
                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL
                    cmd.Parameters.AddWithValue("@pess_cod", Request("pesscod"))
                    cmd.Parameters.AddWithValue("@status", "Registered")
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



    Public Sub bindGridViewStudentSearch()

        Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
        Using mycon As New SqlConnection(con)
            mycon.Open()
            Dim strSQL As String = "select record.STUDENT_ID,record.PATRON_ID,record.NAME_CH,record.NAME_PT,record.pess_cod,record.Total_Point,sum(record.used_credit)as used_credit, (record.Total_Point-sum(record.used_credit))as valid_credit from  "
            strSQL += " (select stud.STUDENT_ID,stud.PATRON_ID,stud.NAME_CH,stud.NAME_PT,stud.pess_cod,temp.Total_Point, ISNULL((gift_info.credit*gift_quantity),0)as used_credit,(temp.Total_Point-ISNULL((gift_info.credit*gift_quantity),0))as valid_credit,gift.exchange_time from "
            strSQL += " (select y.STUDENT_ID,y.PATRON_ID,y.NAME_CH,y.NAME_PT,y.pess_cod,y.ALUN_NUMERO_SEQ from(select  pess_cod, max(ALUN_NUMERO_SEQ) as maxqty from student_academic_info "
            strSQL += "group by pess_cod) as x inner join student_academic_info as y on x.pess_cod = y.pess_cod and x.maxqty = y.ALUN_NUMERO_SEQ)as stud left join gift on stud.PESS_COD=gift.pess_cod and gift.status=@val "
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
                cmd.Parameters.AddWithValue("@val", "Registered")
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


    Public Sub bindGridViewGift()

        Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
        Using mycon As New SqlConnection(con)
            mycon.Open()
          Dim strSQL As String = "SELECT stud.pess_cod,stud.student_id, stud.name_ch,gift_info.id as giftID,gift_info.title,gift_info.detail,gift_info.credit,gift.id as exchangeID, gift.update_time, gift.gift_quantity from "
            strSQL += "(select y.STUDENT_ID, y.NAME_CH, y.NAME_PT, y.pess_cod, y.ALUN_NUMERO_SEQ from(select  pess_cod, max(ALUN_NUMERO_SEQ) as maxSEQ from student_academic_info "
            strSQL += "group by pess_cod) as x inner join student_academic_info as y on x.pess_cod = y.pess_cod and x.maxSEQ = y.ALUN_NUMERO_SEQ)as stud inner join gift on stud.pess_cod=gift.pess_cod and  gift.status=@val "
            strSQL += "inner join gift_info on  gift.gift_id=gift_info.id where gift.pess_cod=@pesscod order by gift.exchange_time desc"

            Using cmd As New SqlCommand()
                cmd.Connection = mycon
                cmd.CommandText = strSQL
                cmd.Parameters.AddWithValue("@pesscod", Request("pesscod"))
                cmd.Parameters.AddWithValue("@val", "Registered")

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



    Protected Sub UsedBack_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles UsedBack.Click




        Response.Redirect("GiftExchangeRegister.aspx")



    End Sub

    Protected Sub GridViewGift_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GridViewGift.RowCommand
        If (message.Value = "No") Then
            MultiView1.ActiveViewIndex = 1
            Exit Sub

        End If

        If e.CommandName = "Exchange" Then
            Dim myRow As GridViewRow = CType(e.CommandSource, LinkButton).NamingContainer
            Dim rowIndex As Integer = myRow.RowIndex
            exchangeID.Value = GridViewGift.DataKeys(rowIndex)("exchangeID").ToString()
            time.Value = (Format(GridViewGift.DataKeys(rowIndex)("update_time"), "yyyy-MM-dd HH:mm:ss.fff"))

            Dim update As Boolean = False
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

                                If (Format(reader("update_time"), "yyyy-MM-dd HH:mm:ss.fff")) = time.Value Then
                                    update = True
                                End If


                            End While
                        Else
                            Response.Write("<script>alert('someone updating, please try later');window.location.href='../Admin/GiftExchangeRegister.aspx'; </script>")

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

                Response.Write("<script>alert('someone updating, please try later');window.location.href='../Admin/GiftExchangeRegister.aspx'; </script>")

                Exit Sub
            End If


            Application.Lock()
            Try

                Using mycon As New SqlConnection(con)
                    mycon.Open()
                    Dim strSQL As String = " update gift set status=@val,exchange_time=GETDATE(),update_time=GETDATE(),operator=@operator where id=@id "

                    Using cmd As New SqlCommand()
                        cmd.Connection = mycon
                        cmd.CommandText = strSQL
                        cmd.Parameters.AddWithValue("@val", "Exchanged")
                        cmd.Parameters.AddWithValue("@id", exchangeID.Value)
                        cmd.Parameters.AddWithValue("@operator", Session("ID"))
                        cmd.ExecuteNonQuery()
                    End Using
                    mycon.Close()
                End Using

            Catch ex As Exception
                Response.Write("<script>alert('Web Error!')</script>")
                Exit Sub
            End Try
            Response.Write("<script>alert('Exchange Succefully');</script>")
            GiftTotalCount()
            GetGiftStudentInfo()
            bindGridViewGift()
            Application.UnLock()
        End If
    End Sub




    Protected Sub ImageButton2_Click1(sender As Object, e As ImageClickEventArgs) Handles ImageButton2.Click
        Response.Redirect("home.aspx")
    End Sub



    Protected Sub Search_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Search.Click
        bindGridViewStudentSearch()
    End Sub
End Class
