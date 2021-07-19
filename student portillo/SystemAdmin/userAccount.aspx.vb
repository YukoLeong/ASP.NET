Public Class userAccount
    Inherits System.Web.UI.Page
    Private Sub userAccount_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init

        If DesignMode = True Then
            Return
        End If

        If Session("admin_password") Is Nothing Then

            MsgBox("please login in")

            Response.Redirect("~/login.aspx")
        End If


        Dim conn As New SqlClient.SqlConnection("Data Source=172.25.2.64;Initial Catalog=EP;Persist Security Info=True;User ID=ep_client;Password=46709394")
        Dim tmp_da1 As New SqlClient.SqlDataAdapter("Select top 1 * from director_info", conn)
        Dim tmp_da2 As New SqlClient.SqlDataAdapter("Select top 1 * from programme_info", conn)
        Dim tmp_da3 As New SqlClient.SqlDataAdapter("Select top 1 * from admin_info", conn)
        Dim tmp_da4 As New SqlClient.SqlDataAdapter("Select top 1 * from tutor_info", conn)
      
        Dim tmp_ds As New DataSet
        Dim tmp_dr As DataRow

        conn.Open()
       
        tmp_da1.Fill(tmp_ds, "director_info")
        tmp_da1.FillSchema(tmp_ds, SchemaType.Source, "director_info")
        If tmp_ds.Tables("director_info").Rows.Count = 0 Then
            tmp_dr = tmp_ds.Tables("director_info").NewRow

            tmp_dr("director_account") = "You can start to add Director Account here!"

            tmp_ds.Tables("director_info").Rows.Add(tmp_dr)
            Dim myobj As New SqlClient.SqlCommandBuilder(tmp_da1)
            tmp_da1.Update(tmp_ds, "director_info")
        End If

        tmp_da2.Fill(tmp_ds, "programme_info")
        tmp_da2.FillSchema(tmp_ds, SchemaType.Source, "programme_info")
        If tmp_ds.Tables("programme_info").Rows.Count = 0 Then
            tmp_dr = tmp_ds.Tables("programme_info").NewRow

            tmp_dr("programme_account") = "You can start to add Porgramme Account here!"

            tmp_ds.Tables("programme_info").Rows.Add(tmp_dr)
            Dim myobj As New SqlClient.SqlCommandBuilder(tmp_da2)
            tmp_da2.Update(tmp_ds, "programme_info")
        End If

        tmp_da3.Fill(tmp_ds, "admin_info")
        tmp_da3.FillSchema(tmp_ds, SchemaType.Source, "admin_info")
        If tmp_ds.Tables("admin_info").Rows.Count = 0 Then
            tmp_dr = tmp_ds.Tables("admin_info").NewRow

            tmp_dr("admin_account") = "You can start to add Admin Account here!"

            tmp_ds.Tables("admin_info").Rows.Add(tmp_dr)
            Dim myobj As New SqlClient.SqlCommandBuilder(tmp_da3)
            tmp_da3.Update(tmp_ds, "admin_info")
        End If

        tmp_da4.Fill(tmp_ds, "tutor_info")
        tmp_da4.FillSchema(tmp_ds, SchemaType.Source, "tutor_info")
        If tmp_ds.Tables("tutor_info").Rows.Count = 0 Then
            tmp_dr = tmp_ds.Tables("tutor_info").NewRow

            tmp_dr("tutor_account") = "You can start to add Tutor Account here!"

            tmp_ds.Tables("tutor_info").Rows.Add(tmp_dr)
            Dim myobj As New SqlClient.SqlCommandBuilder(tmp_da4)
            tmp_da4.Update(tmp_ds, "tutor_info")
        End If
        conn.Close()

    End Sub
   

   Protected Sub DetailsView2_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles DetailsView2.ItemInserted
        GridView2.DataBind()
    End Sub

    Protected Sub DetailsView3_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles DetailsView3.ItemInserted
        GridView3.DataBind()
    End Sub

    Protected Sub DetailsView4_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles DetailsView4.ItemInserted
        GridView4.DataBind()
    End Sub

    Protected Sub DetailsView5_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles DetailsView5.ItemInserted
        GridView5.DataBind()
    End Sub

   Protected Sub Button2_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button2.Click
        MultiView1.ActiveViewIndex = 1
    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button3.Click
        MultiView1.ActiveViewIndex = 2
    End Sub

    Protected Sub Button4_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button4.Click
        MultiView1.ActiveViewIndex = 3
    End Sub

    Protected Sub Button5_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button5.Click
        MultiView1.ActiveViewIndex = 4
    End Sub

  Protected Sub DetailsView2_ItemDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewDeletedEventArgs) Handles DetailsView2.ItemDeleted
        GridView2.DataBind()
    End Sub

    Protected Sub DetailsView2_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles DetailsView2.ItemUpdated
        GridView2.DataBind()
    End Sub

    Protected Sub DetailsView3_ItemDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewDeletedEventArgs) Handles DetailsView3.ItemDeleted
        GridView3.DataBind()
    End Sub

    Protected Sub DetailsView3_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles DetailsView3.ItemUpdated
        GridView3.DataBind()
    End Sub

    Protected Sub DetailsView4_ItemDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewDeletedEventArgs) Handles DetailsView4.ItemDeleted
        GridView4.DataBind()
    End Sub

    Protected Sub DetailsView4_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles DetailsView4.ItemUpdated
        GridView4.DataBind()
    End Sub

    Protected Sub DetailsView5_ItemDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewDeletedEventArgs) Handles DetailsView5.ItemDeleted
        GridView5.DataBind()
    End Sub

    Protected Sub DetailsView5_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles DetailsView5.ItemUpdated
        GridView5.DataBind()
    End Sub



    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton1.Click
        Response.Redirect("seminarManagement.aspx")
    End Sub

    Protected Sub LinkButton2_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton2.Click
        Response.Redirect("home.aspx")
    End Sub

    Protected Sub LinkButton3_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton3.Click
        Response.Redirect("SeminarAdd.aspx")
    End Sub

    Protected Sub DetailsView2_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertEventArgs) Handles DetailsView2.ItemInserting
        Dim dv_Password As Data.DataView = SqlDataSource12.Select(New DataSourceSelectArguments)
        For i As Integer = 0 To dv_Password.Count - 1
            If dv_Password.Item(i).Item("director_password") = CType(Me.DetailsView2.FindControl("TextBox1"), TextBox).Text.Trim Then

                e.Cancel = True
                Response.Write(<script>alert("The password is used by people,type another one please!")</script>)

            End If

        Next

    End Sub

    Protected Sub DetailsView2_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdateEventArgs) Handles DetailsView2.ItemUpdating
        Dim dv_Password As Data.DataView = SqlDataSource12.Select(New DataSourceSelectArguments)
        For i As Integer = 0 To dv_Password.Count - 1
            If dv_Password.Item(i).Item("director_password") = CType(Me.DetailsView2.FindControl("TextBox1"), TextBox).Text.Trim Then

                e.Cancel = True
                Response.Write(<script>alert("The password is used by people,type another one please!")</script>)

            End If

        Next


        Dim dv_updateTime As Data.DataView = SqlDataSource17.Select(New DataSourceSelectArguments)
        Dim update As Boolean

        For i As Integer = 0 To dv_updateTime.Count - 1
            If dv_updateTime.Item(i).Item("update_time") = CType(Me.DetailsView2.FindControl("Label9"), Label).Text.Trim Then

                update = True
            End If

        Next
        If update <> True Then
            e.Cancel = True
            Response.Write(<script>alert("someone updating, please cancel the edit mode and try it later")</script>)
        End If

    End Sub

    Protected Sub DetailsView3_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertEventArgs) Handles DetailsView3.ItemInserting
        Dim dv_Password As Data.DataView = SqlDataSource13.Select(New DataSourceSelectArguments)
        For i As Integer = 0 To dv_Password.Count - 1
            If dv_Password.Item(i).Item("coordinator_password") = CType(Me.DetailsView3.FindControl("TextBox1"), TextBox).Text.Trim Then

                e.Cancel = True
                Response.Write(<script>alert("The password is used by people,type another one please!")</script>)

            End If

        Next

       
    End Sub

    Protected Sub DetailsView3_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdateEventArgs) Handles DetailsView3.ItemUpdating
        Dim dv_Password As Data.DataView = SqlDataSource13.Select(New DataSourceSelectArguments)
        For i As Integer = 0 To dv_Password.Count - 1
            If dv_Password.Item(i).Item("coordinator_password") = CType(Me.DetailsView3.FindControl("TextBox1"), TextBox).Text.Trim Then

                e.Cancel = True
                Response.Write(<script>alert("The password is used by people,type another one please!")</script>)

            End If

        Next

        Dim dv_updateTime As Data.DataView = SqlDataSource18.Select(New DataSourceSelectArguments)
        Dim update As Boolean

        For i As Integer = 0 To dv_updateTime.Count - 1
            If dv_updateTime.Item(i).Item("update_time") = CType(Me.DetailsView3.FindControl("Label11"), Label).Text.Trim Then

                update = True
            End If

        Next
        If update <> True Then
            e.Cancel = True
            Response.Write(<script>alert("someone updating, please cancel the edit mode and try it later")</script>)
        End If
    End Sub

    Protected Sub DetailsView4_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertEventArgs) Handles DetailsView4.ItemInserting
        Dim dv_Password As Data.DataView = SqlDataSource14.Select(New DataSourceSelectArguments)
        For i As Integer = 0 To dv_Password.Count - 1
            If dv_Password.Item(i).Item("admin_password") = CType(Me.DetailsView4.FindControl("TextBox1"), TextBox).Text.Trim Then

                e.Cancel = True
                Response.Write(<script>alert("The password is used by people,type another one please!")</script>)

            End If

        Next
    End Sub

    Protected Sub DetailsView4_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdateEventArgs) Handles DetailsView4.ItemUpdating
    
        Dim dv_Password As Data.DataView = SqlDataSource14.Select(New DataSourceSelectArguments)

        For i As Integer = 0 To dv_Password.Count - 1
            If dv_Password.Item(i).Item("admin_password") = CType(Me.DetailsView4.FindControl("TextBox1"), TextBox).Text.Trim Then

                e.Cancel = True
                Response.Write(<script>alert("The password is used by people,type another one please!")</script>)

            End If

        Next


        Dim dv_updateTime As Data.DataView = SqlDataSource16.Select(New DataSourceSelectArguments)
        Dim update As Boolean
        
        For i As Integer = 0 To dv_updateTime.Count - 1
            If dv_updateTime.Item(i).Item("update_time") = CType(Me.DetailsView4.FindControl("Label7"), Label).Text.Trim Then

                update = True
            End If

        Next
        If update <> True Then
            e.Cancel = True
            Response.Write(<script>alert("someone updating, please cancel the edit mode and try it later")</script>)
        End If

    End Sub

    Protected Sub DetailsView5_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertEventArgs) Handles DetailsView5.ItemInserting
        Dim dv_Password As Data.DataView = SqlDataSource15.Select(New DataSourceSelectArguments)
        For i As Integer = 0 To dv_Password.Count - 1
            If dv_Password.Item(i).Item("tutor_password") = CType(Me.DetailsView5.FindControl("TextBox1"), TextBox).Text.Trim Then

                e.Cancel = True
                Response.Write(<script>alert("The password is used by people, type another one please!")</script>)

            End If

        Next
    End Sub

    Protected Sub DetailsView5_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdateEventArgs) Handles DetailsView5.ItemUpdating
        Dim dv_Password As Data.DataView = SqlDataSource15.Select(New DataSourceSelectArguments)
        For i As Integer = 0 To dv_Password.Count - 1
            If dv_Password.Item(i).Item("tutor_password") = CType(Me.DetailsView5.FindControl("TextBox1"), TextBox).Text.Trim Then

                e.Cancel = True
                Response.Write(<script>alert("The password is used by people,type another one please!")</script>)

            End If

        Next

        Dim dv_updateTime As Data.DataView = SqlDataSource19.Select(New DataSourceSelectArguments)
        Dim update As Boolean

        For i As Integer = 0 To dv_updateTime.Count - 1
            If dv_updateTime.Item(i).Item("update_time") = CType(Me.DetailsView5.FindControl("Label13"), Label).Text.Trim Then

                update = True
            End If

        Next
        If update <> True Then
            e.Cancel = True
            Response.Write(<script>alert("someone updating, please cancel the edit mode and try it later")</script>)
        End If
    End Sub

    Protected Sub DetailsView4_ItemDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewDeleteEventArgs) Handles DetailsView4.ItemDeleting
        Dim dv_updateTime As Data.DataView = SqlDataSource16.Select(New DataSourceSelectArguments)
        Dim delete As Boolean
        For i As Integer = 0 To dv_updateTime.Count - 1
            If dv_updateTime.Item(i).Item("update_time") = Me.GridView4.SelectedRow.Cells(3).Text Then

                delete = True
            End If

        Next
        If delete <> True Then
            e.Cancel = True
            Response.Write(<script>alert("someone updating, please try later")</script>)
        End If

       
    End Sub

  

    

    Protected Sub DetailsView2_ItemDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewDeleteEventArgs) Handles DetailsView2.ItemDeleting
        Dim dv_updateTime As Data.DataView = SqlDataSource17.Select(New DataSourceSelectArguments)
        Dim delete As Boolean
        For i As Integer = 0 To dv_updateTime.Count - 1
            If dv_updateTime.Item(i).Item("update_time") = Me.GridView2.SelectedRow.Cells(4).Text Then

                delete = True
            End If

        Next
        If delete <> True Then
            e.Cancel = True
            Response.Write(<script>alert("someone updating, please try later")</script>)
        End If


    End Sub

    


    Protected Sub DetailsView3_ItemDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewDeleteEventArgs) Handles DetailsView3.ItemDeleting
        Dim dv_updateTime As Data.DataView = SqlDataSource18.Select(New DataSourceSelectArguments)
        Dim delete As Boolean
        For i As Integer = 0 To dv_updateTime.Count - 1
            If dv_updateTime.Item(i).Item("update_time") = Me.GridView3.SelectedRow.Cells(4).Text Then

                delete = True
            End If

        Next
        If delete <> True Then
            e.Cancel = True
            Response.Write(<script>alert("someone updating, please try later")</script>)
        End If

    End Sub

    Protected Sub DetailsView3_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles DetailsView3.PreRender
        GridView3.DataBind()
        DetailsView3.DataBind()
    End Sub

    Protected Sub GridView4_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView4.PreRender
        GridView4.DataBind()
        DetailsView4.DataBind()
    End Sub


    Protected Sub DetailsView2_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles DetailsView2.PreRender
        GridView2.DataBind()
        DetailsView2.DataBind()
    End Sub

    Protected Sub DetailsView5_ItemDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewDeleteEventArgs) Handles DetailsView5.ItemDeleting
        Dim dv_updateTime As Data.DataView = SqlDataSource19.Select(New DataSourceSelectArguments)
        Dim delete As Boolean
        For i As Integer = 0 To dv_updateTime.Count - 1
            If dv_updateTime.Item(i).Item("update_time") = Me.GridView5.SelectedRow.Cells(4).Text Then

                delete = True
            End If

        Next
        If delete <> True Then
            e.Cancel = True
            Response.Write(<script>alert("someone updating, please try later")</script>)
        End If

    End Sub

    Protected Sub DetailsView5_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles DetailsView5.PreRender
        GridView5.DataBind()
        DetailsView5.DataBind()
    End Sub
End Class