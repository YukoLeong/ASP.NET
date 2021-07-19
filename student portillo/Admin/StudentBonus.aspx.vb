Imports System.Data.SqlClient
Imports System.Data

Partial Class Admin_StudentBonus
    Inherits System.Web.UI.Page
    Dim table As DataTable = New DataTable()
         
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
  

        If Not IsPostBack Then
          

            bindGridViewStudentSearch()


        End If




    End Sub
 Public Sub bindGridViewStudentSearch()

        table.Columns.Add("STUDENT_ID", GetType(String))
        table.Columns.Add("NAME_PT", GetType(String))
        table.Columns.Add("NAME_CH", GetType(String))
        table.Columns.Add("Total_Point", GetType(String))
        table.Columns.Add("used_credit", GetType(String))
        table.Columns.Add("valid_credit", GetType(String))
      
        Try
            Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
            Using mycon As New SqlConnection(con)
                mycon.Open()
                Dim strSQL As String = "select record.STUDENT_ID,record.QUALIFIED_YEAR,record.NAME_CH,record.NAME_PT,record.pess_cod,record.Total_Point,sum(record.used_credit)as used_credit, (record.Total_Point-sum(record.used_credit))as valid_credit from  "
                strSQL += " (select stud.STUDENT_ID,stud.QUALIFIED_YEAR,stud.NAME_CH,stud.NAME_PT,stud.pess_cod,temp.Total_Point, ISNULL((gift_info.credit*gift_quantity),0)as used_credit,(temp.Total_Point-ISNULL((gift_info.credit*gift_quantity),0))as valid_credit,gift.exchange_time from "
                strSQL += " (select y.STUDENT_ID,y.QUALIFIED_YEAR,y.NAME_CH,y.NAME_PT,y.pess_cod,y.ALUN_NUMERO_SEQ from(select  pess_cod, max(ALUN_NUMERO_SEQ) as maxqty from student_academic_info "
                strSQL += "group by pess_cod) as x inner join student_academic_info as y on x.pess_cod = y.pess_cod and x.maxqty = y.ALUN_NUMERO_SEQ)as stud left join gift on stud.PESS_COD=gift.pess_cod  "
                strSQL += " left join gift_info on gift_info.id=gift.gift_id inner join Seminar on stud.PESS_COD=Seminar.pess_cod   "
                strSQL += " left join (select Seminar.pess_cod, SUM(Seminar_Info.bonus_point) as Total_Point from Seminar,Seminar_Info,student_academic_info   "
                strSQL += " where Seminar.Seminar_info_id=Seminar_Info.id and student_academic_info.PESS_COD=Seminar.pess_cod group by Seminar.pess_cod)as temp on stud.pess_cod=temp.pess_cod   "
                strSQL += " group by stud.pess_cod,temp.Total_Point,stud.STUDENT_ID,stud.QUALIFIED_YEAR,stud.NAME_CH,stud.NAME_PT,gift_info.credit,gift.gift_quantity,gift.exchange_time)as record where record.QUALIFIED_YEAR=@QUALIFIED_YEAR "
                strSQL += " group by record.STUDENT_ID,record.QUALIFIED_YEAR,record.NAME_CH,record.NAME_PT,record.pess_cod,record.Total_Point  "

                Using cmd As New SqlCommand()
                    cmd.Connection = mycon
                    cmd.CommandText = strSQL
                    cmd.Parameters.AddWithValue("@QUALIFIED_YEAR", DropDownList1.SelectedValue)
                    Dim reader As SqlDataReader = cmd.ExecuteReader()
                    If reader.HasRows Then
                        While reader.Read()
                            Dim tableRow As DataRow = table.NewRow()
                            tableRow("STUDENT_ID") = reader("STUDENT_ID").ToString()
                            tableRow("NAME_PT") = reader("NAME_PT").ToString()
                            tableRow("NAME_CH") = reader("NAME_CH").ToString()
                            tableRow("Total_Point") = reader("Total_Point").ToString()
                            tableRow("used_credit") = reader("used_credit").ToString()
                            tableRow("valid_credit") = reader("valid_credit").ToString()
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
        GridViewBonus.DataSource = table
        GridViewBonus.DataBind()


    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList1.SelectedIndexChanged
        bindGridViewStudentSearch()

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

   

    Protected Sub GridViewBonus_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridViewBonus.PageIndexChanging
   
        Me.GridViewBonus.PageIndex = e.NewPageIndex
        Me.GridViewBonus.DataSource = Session("sortState")
        Me.GridViewBonus.DataBind()
        If Me.GridViewBonus.DataSource Is Nothing Then
            bindGridViewStudentSearch()

        End If
    End Sub

    Protected Sub GridViewBonus_Sorting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewSortEventArgs) Handles GridViewBonus.Sorting
        Dim sortingDirection As String = String.Empty

        If dir = SortDirection.Ascending Then
            dir = SortDirection.Descending
            sortingDirection = "Desc"
        Else
            dir = SortDirection.Ascending
            sortingDirection = "Asc"
        End If
        bindGridViewStudentSearch()
        Dim sortedView As New DataView(table)
        sortedView.Sort = Convert.ToString(e.SortExpression) & " " & sortingDirection

        GridViewBonus.DataSource = sortedView
        GridViewBonus.DataBind()
        Session("sortState") = sortedView
    End Sub

    
    Protected Sub ImageButton2_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton2.Click
        Response.Redirect("home.aspx")
    End Sub
End Class
