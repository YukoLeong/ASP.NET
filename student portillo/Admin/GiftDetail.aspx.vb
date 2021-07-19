Imports System.Data
Imports System.Data.SqlClient
Partial Class Operator_GiftDetail
    Inherits System.Web.UI.Page

    Dim table As DataTable = New DataTable()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Role_Type") Is Nothing Then

            Response.Write("<script>alert('Please Log In !'); window.location.href='../staff.aspx'; </script>")
            Response.End()
        End If
        If Not IsPostBack Then
            Select Case Request("view")
                Case 1
                    MultiView1.ActiveViewIndex = 1
                Case 2
                    MultiView1.ActiveViewIndex = 2
                Case 3
                    MultiView1.ActiveViewIndex = 3

            End Select
            status.Value = "true"

            BindYear()


            If status.Value = "true" Then

                BindGiftData()
            End If

        End If


    End Sub
    Public Sub BindGiftData()
       
        table.Columns.Add("id", GetType(Integer))
        table.Columns.Add("Gift", GetType(String))
        table.Columns.Add("total", GetType(String))
        table.Columns.Add("GiftReg", GetType(String))
        table.Columns.Add("GiftRegNotExc", GetType(String))
        table.Columns.Add("GiftExchange", GetType(String))
        table.Columns.Add("Quantity", GetType(String))
        table.Columns.Add("PerReg", GetType(Double))
        table.Columns.Add("PerExchange", GetType(Double))
        table.Columns.Add("PerTotal", GetType(Double))

        Try
            Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
            Using mycon As New SqlConnection(con)
                mycon.Open()
                Dim strSQL As String = "select gift_info.id,ISNULL(temp.giftExchange,0)as giftExchange,ISNULL(temp1.giftExchangeReg,0)as giftExchangeReg, gift_info.title, (ISNULL(sum(gift.gift_quantity),0)+gift_info.quantity) as total,gift_info.quantity FROM [gift_info] left join [gift] on gift.gift_id=gift_info.id left join "
                strSQL += " (select gift_info.id, ISNULL(sum(gift.gift_quantity),0)as giftExchange FROM [gift_info] left join [gift] on gift.gift_id=gift_info.id where gift.status='exchanged' and year(gift.register_time)=@regTime group by gift_info.id, gift_info.title, gift_info.quantity) as temp  "
                strSQL += " on temp.id=gift_info.id left join (select gift_info.id, ISNULL(sum(gift.gift_quantity),0)as giftExchangeReg FROM [gift_info] left join [gift] on gift.gift_id=gift_info.id where gift.status='registered' and year(gift.register_time)=@regTime group by gift_info.id, gift_info.title, gift_info.quantity) as temp1 "
                strSQL += " on temp1.id=gift_info.id group by gift_info.id, gift_info.title, gift_info.quantity,temp.giftExchange,temp1.giftExchangeReg "


                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL
                    cmd.Parameters.AddWithValue("@regTime", yearReg.SelectedValue)
                    Dim reader As SqlDataReader = cmd.ExecuteReader()
                    If reader.HasRows Then
                        While reader.Read()
                            Dim tableRow As DataRow = table.NewRow()
                            tableRow("id") = reader("id").ToString()
                            tableRow("Gift") = reader("title").ToString()
                            tableRow("total") = reader("total").ToString()
                            tableRow("GiftRegNotExc") = reader("giftExchangeReg").ToString()
                            tableRow("GiftReg") = (Int32.Parse(reader("giftExchangeReg").ToString())) + (Int32.Parse(reader("giftExchange").ToString()))
                            tableRow("Quantity") = reader("quantity").ToString()
                            tableRow("GiftExchange") = reader("giftExchange").ToString()
                            Dim perReg As Double = Math.Round((Int32.Parse(reader("giftExchangeReg").ToString()) / reader("total").ToString()), 2)
                            tableRow("PerReg") = perReg
                            Dim perExchange As Double = Math.Round((Int32.Parse(reader("giftExchange").ToString()) / reader("total").ToString()), 2)
                            tableRow("PerExchange") = perExchange
                            Dim perTotal As Double = Math.Round((Int32.Parse(reader("giftExchangeReg").ToString()) + Int32.Parse(reader("giftExchange").ToString())) / reader("total").ToString(), 2)
                            tableRow("PerTotal") = perTotal
                            table.Rows.Add(tableRow)

                            tableRow = table.NewRow()



                        End While
                    Else

                    End If
                End Using
                mycon.Close()
            End Using

        Catch ex As Exception
            Response.Write("<script>alert('Web Error!')</script>")
        End Try
        GridViewGift.DataSource = table
        GridViewGift.DataBind()



    End Sub



    Public Property dir() As SortDirection
        Get
            If ViewState("dirState") Is Nothing Then
                ViewState("dirState") = SortDirection.Ascending
            End If

            Return DirectCast(ViewState("dirState"), SortDirection)
        End Get

        Set(ByVal value As SortDirection)
            ViewState("dirState") = value
        End Set
    End Property




    Protected Sub GridViewGift_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridViewGift.PageIndexChanging
        Me.GridViewGift.PageIndex = e.NewPageIndex
        Me.GridViewGift.DataSource = Session("sortState")
        Me.GridViewGift.DataBind()
        If Me.GridViewGift.DataSource Is Nothing Then
           BindGiftData()

        End If
    End Sub

    Protected Sub GridViewGift_Sorting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewSortEventArgs) Handles GridViewGift.Sorting
        Dim sortingDirection As String = String.Empty

        If dir = SortDirection.Ascending Then
            dir = SortDirection.Descending
            sortingDirection = "Desc"
        Else
            dir = SortDirection.Ascending
            sortingDirection = "Asc"
        End If
        BindGiftData()
        Dim sortedView As New DataView(table)
        sortedView.Sort = Convert.ToString(e.SortExpression) & " " & sortingDirection

        GridViewGift.DataSource = sortedView
        GridViewGift.DataBind()
        Session("sortState") = sortedView
    End Sub
    Public Sub BindYear()

        Try
            Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
            Using mycon As New SqlConnection(con)
                mycon.Open()
                Dim strSQL As String = "SELECT distinct year(register_time) as reg FROM gift order by year(register_time) desc "
            

                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL

                    Dim reader As SqlDataReader = cmd.ExecuteReader()

                    If reader.HasRows Then
                        While reader.Read()

                            yearReg.Items.Add(New ListItem(reader("reg").ToString(), reader("reg").ToString()))
                          


                        End While
                    Else
                        status.Value = "false"

                        Response.Write("<script>alert('There are no registered students!')</script>")
                        Exit Sub
                    End If
                End Using
                mycon.Close()
            End Using

        Catch ex As Exception
            Response.Write("<script>alert('Web Error!')</script>")
        End Try
    End Sub



    Protected Sub ImageButton2_Click1(sender As Object, e As ImageClickEventArgs) Handles ImageButton2.Click
        Response.Redirect("home.aspx")
    End Sub



    Protected Sub yearReg_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles yearReg.SelectedIndexChanged
        BindGiftData()
    End Sub
End Class
