Imports System.Data
Imports System.Data.SqlClient
Partial Class Operator_Analysis
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Role_Type") Is Nothing Then

            Response.Write("<script>alert('Please Log In !'); window.location.href='../staff.aspx'; </script>")
            Response.End()
        End If
        BindSemData()
        BindSemWeekData()
        BindGiftData()
        BindGiftWeekData()

    End Sub
    Public Sub BindSemData()
        Dim table As DataTable = New DataTable()
        table.Columns.Add("Category", GetType(String))
        table.Columns.Add("Percent", GetType(Double))
        If TotalSemCount() <> 0 Then
            Try
                Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
                Using mycon As New SqlConnection(con)
                    mycon.Open()
                    Dim strSQL As String = "select TOP 10 Seminar_Info.category as category, count(Seminar_Info.id)as semCount FROM [Seminar],[Seminar_Info] where Seminar.Seminar_info_id=Seminar_Info.id group by Seminar_Info.category order by count(Seminar_Info.id) desc"
                    Using cmd As New SqlCommand()
                        cmd.Connection = mycon
                        cmd.CommandText = strSQL

                        Dim reader As SqlDataReader = cmd.ExecuteReader()
                        If reader.HasRows Then
                            While reader.Read()
                                Dim tableRow As DataRow = table.NewRow()
                                tableRow("Category") = " " + reader("category").ToString() + " (" + reader("semCount").ToString() + ")"

                                Dim per As Double = Math.Round((Int32.Parse(reader("semCount").ToString()) / TotalSemCount()), 2)

                                tableRow("Percent") = per

                                table.Rows.Add(tableRow)

                                tableRow = table.NewRow()


                                Dim total_Stu As Integer = 0
                                total_Stu = Int32.Parse(reader("semCount").ToString())
                            End While
                        Else

                        End If
                    End Using
                    mycon.Close()
                End Using

            Catch ex As Exception
                Response.Write("<script>alert('Web Error!')</script>")
            End Try
            SeminarChart.DataSource = table
            SeminarChart.DataBind()


        End If
    End Sub
    Private Function TotalSemCount() As Integer
        Try
            Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
            Using mycon As New SqlConnection(con)
                mycon.Open()
                Dim strSQL As String = "select count(Seminar.Seminar_info_id)as TotalSemCount FROM Seminar, Seminar_Info where Seminar.Seminar_info_id=Seminar_Info.id and Seminar_Info.category in (select TOP 10 Seminar_Info.category FROM [Seminar],[Seminar_Info] where Seminar.Seminar_info_id=Seminar_Info.id group by Seminar_Info.category order by count(Seminar_Info.id) desc)"
                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL


                    Dim reader As SqlDataReader = cmd.ExecuteReader()
                    If reader.HasRows Then
                        While reader.Read()
                            Return (reader("TotalSemCount").ToString())
                        End While
                    Else
                        Return 0
                    End If
                End Using
                mycon.Close()
            End Using

        Catch ex As Exception
            Response.Write("<script>alert('Total Count Error!')</script>")

        End Try
        Return 0
    End Function
    Public Sub BindGiftData()
        Dim table As DataTable = New DataTable()
        table.Columns.Add("GiftCount", GetType(String))
        table.Columns.Add("Percent", GetType(Double))
        If TotalGiftCount() <> 0 Then
            Try
                Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
                Using mycon As New SqlConnection(con)
                    mycon.Open()
                    Dim strSQL As String = "select TOP 10 gift.gift_id, sum(gift.gift_quantity)as giftCount,gift_info.title FROM [gift],[gift_info] where gift.gift_id=gift_info.id group by gift.gift_id, gift_info.title order by sum(gift.gift_quantity) desc"

                    Using cmd As New SqlCommand()
                        cmd.Connection = mycon
                        cmd.CommandText = strSQL

                        Dim reader As SqlDataReader = cmd.ExecuteReader()
                        If reader.HasRows Then
                            While reader.Read()
                                Dim tableRow As DataRow = table.NewRow()
                                tableRow("GiftCount") = " " + reader("title").ToString() + " (" + reader("giftCount").ToString() + ")"

                                Dim per As Double = Math.Round((Int32.Parse(reader("giftCount").ToString()) / TotalGiftCount()), 2)

                                tableRow("Percent") = per

                                table.Rows.Add(tableRow)

                                tableRow = table.NewRow()


                                Dim total_Stu As Integer = 0
                                total_Stu = Int32.Parse(reader("giftCount").ToString())
                            End While
                        Else

                        End If
                    End Using
                    mycon.Close()
                End Using

            Catch ex As Exception
                Response.Write("<script>alert('Web Error!')</script>")
            End Try
            GiftChart.DataSource = table
            GiftChart.DataBind()


        End If
    End Sub
    Private Function TotalGiftCount() As Integer
        Try
            Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
            Using mycon As New SqlConnection(con)
                mycon.Open()
                Dim strSQL As String = "select ISNULL(sum(gift.gift_quantity),0) as TotalGiftCount from gift where gift_id in (select TOP 10 gift.gift_id FROM [gift],[gift_info] where gift.gift_id=gift_info.id group by gift.gift_id order by sum(gift.gift_quantity) desc)"

                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL


                    Dim reader As SqlDataReader = cmd.ExecuteReader()
                    If reader.HasRows Then

                        While reader.Read()
                            Return (reader("TotalGiftCount").ToString())
                        End While
                    Else
                        Return 0
                    End If
                End Using
                mycon.Close()
            End Using

        Catch ex As Exception
            Response.Write("<script>alert('Total Count Error!')</script>")

        End Try
        Return 0
    End Function

    Public Sub BindSemWeekData()
        Dim CurrentDate As DateTime = DateTime.Today
        Dim thisWeekStart As DateTime = CurrentDate.AddDays(-Integer.Parse(CurrentDate.DayOfWeek))
        Dim thisWeekEnd As DateTime = thisWeekStart.AddDays(7).AddSeconds(-1)
        Dim table As DataTable = New DataTable()
        table.Columns.Add("SemWeekCount", GetType(String))
        table.Columns.Add("Percent", GetType(Double))
        If TotalSemWeekCount() <> 0 Then
            Try
                Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
                Using mycon As New SqlConnection(con)
                    mycon.Open()

                    Dim strSQL As String = "select TOP 10 Seminar_Info.category as category, count(Seminar_Info.id)as SemWeekCount FROM [Seminar],[Seminar_Info] where Seminar.Seminar_info_id=Seminar_Info.id and Seminar_Info.startDate>@startDate and Seminar_Info.startDate<@endDate group by Seminar_Info.category order by count(Seminar_Info.id) desc"
                    Using cmd As New SqlCommand()
                        cmd.Connection = mycon
                        cmd.CommandText = strSQL
                        cmd.Parameters.AddWithValue("@startDate", thisWeekStart)
                        cmd.Parameters.AddWithValue("@endDate", thisWeekEnd)
                        Dim reader As SqlDataReader = cmd.ExecuteReader()
                        If reader.HasRows Then
                            While reader.Read()
                                Dim tableRow As DataRow = table.NewRow()
                                tableRow("SemWeekCount") = " " + reader("category").ToString() + " (" + reader("SemWeekCount").ToString() + ")"

                                Dim per As Double = Math.Round((Int32.Parse(reader("SemWeekCount").ToString()) / TotalSemWeekCount()), 2)

                                tableRow("Percent") = per

                                table.Rows.Add(tableRow)

                                tableRow = table.NewRow()


                                Dim total_Stu As Integer = 0
                                total_Stu = Int32.Parse(reader("SemWeekCount").ToString())
                            End While
                        Else

                        End If
                    End Using
                    mycon.Close()
                End Using

            Catch ex As Exception
                Response.Write("<script>alert('Web Error!')</script>")
            End Try
            SemWeekChart.DataSource = table
            SemWeekChart.DataBind()


        End If
    End Sub

    Private Function TotalSemWeekCount() As Integer
        Dim CurrentDate As DateTime = DateTime.Today
        Dim thisWeekStart As DateTime = CurrentDate.AddDays(-Integer.Parse(CurrentDate.DayOfWeek))
        Dim thisWeekEnd As DateTime = thisWeekStart.AddDays(7).AddSeconds(-1)
        Try
            Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
            Using mycon As New SqlConnection(con)
                mycon.Open()

                Dim strSQL As String = "select count(Seminar.Seminar_info_id)as TotalSemWeekCount FROM Seminar, Seminar_Info where Seminar.Seminar_info_id=Seminar_Info.id and Seminar_Info.category in (select TOP 10 Seminar_Info.category  FROM [Seminar],[Seminar_Info] where Seminar.Seminar_info_id=Seminar_Info.id and Seminar_Info.startDate>@startDate and Seminar_Info.startDate<@endDate group by Seminar_Info.category order by count(Seminar_Info.id) desc)and Seminar_Info.startDate>@startDate and Seminar_Info.startDate<@endDate"
                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL
                    cmd.Parameters.AddWithValue("@startDate", thisWeekStart)
                    cmd.Parameters.AddWithValue("@endDate", thisWeekEnd)

                    Dim reader As SqlDataReader = cmd.ExecuteReader()
                    If reader.HasRows Then
                        While reader.Read()
                            Return (reader("TotalSemWeekCount").ToString())
                        End While
                    Else
                        Return 0
                    End If
                End Using
                mycon.Close()
            End Using

        Catch ex As Exception
            Response.Write("<script>alert('Total Count Error!')</script>")

        End Try
        Return 0
    End Function

    Public Sub BindGiftWeekData()

        Dim CurrentDate As DateTime = DateTime.Today
        Dim thisWeekStart As DateTime = CurrentDate.AddDays(-Integer.Parse(CurrentDate.DayOfWeek))
        Dim thisWeekEnd As DateTime = thisWeekStart.AddDays(7).AddSeconds(-1)
        Dim table As DataTable = New DataTable()
        table.Columns.Add("GiftWeekCount", GetType(String))
        table.Columns.Add("Percent", GetType(Double))
        If TotalGiftWeekCount() <> 0 Then
            Try
                Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
                Using mycon As New SqlConnection(con)
                    mycon.Open()

                    Dim strSQL As String = "select TOP 10 gift.gift_id, sum(gift.gift_quantity)as GiftWeekCount, gift_info.title FROM [gift],[gift_info] where gift.gift_id=gift_info.id and gift.exchange_time>@startDate and gift.exchange_time<@endDate group by gift.gift_id, gift_info.title order by sum(gift.gift_quantity) desc"
                    Using cmd As New SqlCommand()
                        cmd.Connection = mycon
                        cmd.CommandText = strSQL
                        cmd.Parameters.AddWithValue("@startDate", thisWeekStart)
                        cmd.Parameters.AddWithValue("@endDate", thisWeekEnd)
                        Dim reader As SqlDataReader = cmd.ExecuteReader()
                        If reader.HasRows Then
                            While reader.Read()
                                Dim tableRow As DataRow = table.NewRow()
                                tableRow("GiftWeekCount") = " " + reader("title").ToString() + " (" + reader("GiftWeekCount").ToString() + ")"

                                Dim per As Double = Math.Round((Int32.Parse(reader("GiftWeekCount").ToString()) / TotalGiftWeekCount()), 2)

                                tableRow("Percent") = per

                                table.Rows.Add(tableRow)

                                tableRow = table.NewRow()


                                Dim total_Stu As Integer = 0
                                total_Stu = Int32.Parse(reader("GiftWeekCount").ToString())
                            End While
                        Else

                        End If
                    End Using
                    mycon.Close()
                End Using

            Catch ex As Exception
                Response.Write("<script>alert('Web Error!')</script>")
            End Try
            GiftWeekChart.DataSource = table
            GiftWeekChart.DataBind()


        End If
    End Sub
    Private Function TotalGiftWeekCount() As Integer
        Dim CurrentDate As DateTime = DateTime.Today
        Dim thisWeekStart As DateTime = CurrentDate.AddDays(-Integer.Parse(CurrentDate.DayOfWeek))
        Dim thisWeekEnd As DateTime = thisWeekStart.AddDays(7).AddSeconds(-1)
        Try
            Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
            Using mycon As New SqlConnection(con)
                mycon.Open()

                Dim strSQL As String = "select ISNULL(sum(gift.gift_quantity),0) as TotalGiftWeekCount FROM [gift] where gift_id in(select TOP 10 gift.gift_id FROM [gift],[gift_info] where gift.gift_id=gift_info.id and gift.exchange_time>@startDate and gift.exchange_time<@endDate group by gift.gift_id order by sum(gift.gift_quantity) desc) and gift.exchange_time>@startDate and gift.exchange_time<@endDate"
                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL
                    cmd.Parameters.AddWithValue("@startDate", thisWeekStart)
                    cmd.Parameters.AddWithValue("@endDate", thisWeekEnd)

                    Dim reader As SqlDataReader = cmd.ExecuteReader()
                    If reader.HasRows Then

                        While reader.Read()
                            Return (reader("TotalGiftWeekCount").ToString())
                        End While
                    Else
                        Return 0
                    End If
                End Using
                mycon.Close()
            End Using

        Catch ex As Exception
            Response.Write("<script>alert('Total Count Error!')</script>")

        End Try
        Return 0
    End Function



    Protected Sub ImageButton2_Click1(sender As Object, e As ImageClickEventArgs) Handles ImageButton2.Click
        Response.Redirect("home.aspx")
    End Sub



End Class
