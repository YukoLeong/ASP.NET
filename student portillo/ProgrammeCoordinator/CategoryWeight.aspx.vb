
Partial Class CategoryWeight
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
        Dim dv_verify As Data.DataView = SqlDataSource2.Select(New DataSourceSelectArguments)

        If Session("Role_Type") Is Nothing Then

            Response.Write("<script>alert('Please Log In !'); window.location.href='../login.aspx'; </script>")
            Exit Sub
        End If


        If dv_verify.Item(0).Item("paa") = "False" Then

            Response.Write("<script>alert('You do not have Permission to view it !');window.history.back(-1); </script>")

        End If
        End If
    End Sub
    Private Sub DetailsViewCategory_ItemDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewDeletedEventArgs) Handles DetailsViewCategory.ItemDeleted
        GridViewCategory.DataBind()
    End Sub


    Protected Sub DetailsViewCategory_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles DetailsViewCategory.ItemUpdated
        GridViewCategory.DataBind()
    End Sub





    Protected Sub GridViewCategory_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewCategory.SelectedIndexChanged


        Dim XValue(Me.GridViewCategory.Columns.Count - 4) As String
        Dim XValue1(Me.GridViewCategory.Columns.Count - 4) As String
        Dim YValue1_1(Me.GridViewCategory.Columns.Count - 4) As Integer
        Dim YValue1_s(Me.GridViewCategory.Columns.Count - 4) As Integer

        Dim XValue1_prof(Me.GridViewCategory.Columns.Count - 4) As Integer

        Dim ProgramName As String
        Dim SchoolName As String
        Dim curPageIndex As Integer


        curPageIndex = GridViewCategory.PageIndex

        ProgramName = Me.GridViewCategory.SelectedRow.Cells(1).Text
        SchoolName = Me.GridViewCategory.SelectedRow.Cells(2).Text


        For i As Integer = 3 To Me.GridViewCategory.Columns.Count - 1
            XValue(i - 3) = Me.GridViewCategory.Columns(i).ToString
            XValue1(i - 3) = Regex.Replace(XValue(i - 3), "_", " ")
            YValue1_1(i - 3) = Me.GridViewCategory.SelectedRow.Cells(i).Text
        Next


        Do While GridViewCategory.PageIndex > 0 And SchoolName = Me.GridViewCategory.Rows(0).Cells(2).Text
            GridViewCategory.PageIndex = GridViewCategory.PageIndex - 1
            GridViewCategory.DataBind()
        Loop


        Do While GridViewCategory.PageIndex < GridViewCategory.PageCount

            For j As Integer = 0 To GridViewCategory.Rows.Count - 1
                If SchoolName = Me.GridViewCategory.Rows(j).Cells(2).Text Then

                    For k As Integer = 3 To Me.GridViewCategory.Columns.Count - 1
                        YValue1_s(k - 3) = Me.GridViewCategory.Rows(j).Cells(k).Text + YValue1_s(k - 3)
                    Next

                End If
            Next

            If GridViewCategory.PageIndex + 1 < GridViewCategory.PageCount And SchoolName = Me.GridViewCategory.Rows(GridViewCategory.Rows.Count - 1).Cells(2).Text Then
                GridViewCategory.PageIndex = GridViewCategory.PageIndex + 1
                GridViewCategory.DataBind()
            Else
                Exit Do
            End If

        Loop




        SchoolAttribute.Series.Item(0).Name = SchoolName
        SchoolAttribute.Series(SchoolName).Points.DataBindXY(XValue1, YValue1_s)

        ProgrammeAttribute.Series.Item(0).Name = ProgramName
        ProgrammeAttribute.Series(ProgramName).Points.DataBindXY(XValue1, YValue1_1)

        ProgrammeAttrPie.Series.Item(0).Name = ProgramName
        ProgrammeAttrPie.Series(ProgramName).Points.DataBindXY(XValue1, YValue1_1)


        SchoolAttribute.Series.Item(1).Name = ProgramName
        SchoolAttribute.Series(ProgramName).Points.DataBindXY(XValue1, YValue1_1)

        SqlDataSource4.SelectCommand = "SELECT * FROM [CategoryWeight] where school = '" & SchoolName & "' and program_name='" & Session("Programme") & "'  order by programme desc"
        SqlDataSource4.DataBind()

        Dim dv_ability As Data.DataView = SqlDataSource4.Select(New DataSourceSelectArguments)

        For i As Integer = 0 To dv_ability.Count - 1
            Chart1.Series(0).Points.AddXY(dv_ability.Item(i).Item(0).ToString, dv_ability.Item(i).Item(2).ToString)
            Chart2.Series(0).Points.AddXY(dv_ability.Item(i).Item(0).ToString, dv_ability.Item(i).Item(3).ToString)
            Chart3.Series(0).Points.AddXY(dv_ability.Item(i).Item(0).ToString, dv_ability.Item(i).Item(4).ToString)
            Chart4.Series(0).Points.AddXY(dv_ability.Item(i).Item(0).ToString, dv_ability.Item(i).Item(5).ToString)
            Chart5.Series(0).Points.AddXY(dv_ability.Item(i).Item(0).ToString, dv_ability.Item(i).Item(6).ToString)
            Chart6.Series(0).Points.AddXY(dv_ability.Item(i).Item(0).ToString, dv_ability.Item(i).Item(7).ToString)
            Chart7.Series(0).Points.AddXY(dv_ability.Item(i).Item(0).ToString, dv_ability.Item(i).Item(8).ToString)
            Chart8.Series(0).Points.AddXY(dv_ability.Item(i).Item(0).ToString, dv_ability.Item(i).Item(9).ToString)
            Chart9.Series(0).Points.AddXY(dv_ability.Item(i).Item(0).ToString, dv_ability.Item(i).Item(10).ToString)
            ' Chart10.Series(0).Points.AddXY(dv_ability.Item(i).Item(0).ToString, dv_ability.Item(i).Item(11).ToString)

            If dv_ability.Item(i).Item(0).ToString = ProgramName Then
                Chart1.Series(0).Points(i).Color = Drawing.Color.Violet
                Chart2.Series(0).Points(i).Color = Drawing.Color.Purple
                Chart3.Series(0).Points(i).Color = Drawing.Color.Pink
                Chart4.Series(0).Points(i).Color = Drawing.Color.Plum
                Chart5.Series(0).Points(i).Color = Drawing.Color.RosyBrown
                Chart6.Series(0).Points(i).Color = Drawing.Color.Yellow
                Chart7.Series(0).Points(i).Color = Drawing.Color.Cyan
                Chart8.Series(0).Points(i).Color = Drawing.Color.Sienna
                Chart9.Series(0).Points(i).Color = Drawing.Color.Teal
                ' Chart10.Series(0).Points(i).Color = Drawing.Color.YellowGreen

            End If
        Next



        GridViewCategory.PageIndex = curPageIndex
        GridViewCategory.DataBind()


    End Sub



    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton1.Click
        Response.Redirect("home.aspx")
    End Sub
End Class

