Public Class seminarManagement
    Inherits System.Web.UI.Page
    Private Sub seminarManagement_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If DesignMode = True Then
            Return
        End If
        If Session("admin_password") Is Nothing Then

            MsgBox("please login in")

            Response.Redirect("~/login.aspx")
        End If


        Dim conn As New SqlClient.SqlConnection("Data Source=172.25.2.64;Initial Catalog=EP;Persist Security Info=True;User ID=ep_client;Password=46709394")
        Dim tmp_da As New SqlClient.SqlDataAdapter("Select top 1 * from Seminar_Info", conn)
        Dim tmp_da1 As New SqlClient.SqlDataAdapter("Select top 1 * from seminarAttribute", conn)
       
        Dim tmp_ds As New DataSet
        Dim tmp_dr As DataRow

        conn.Open()

        tmp_da.Fill(tmp_ds, "Seminar_Info")
        tmp_da.FillSchema(tmp_ds, SchemaType.Source, "Seminar_Info")
        If tmp_ds.Tables("Seminar_Info").Rows.Count = 0 Then
            tmp_dr = tmp_ds.Tables("Seminar_Info").NewRow

            tmp_dr("topicName") = "You can start to add Seminar Information here!"

            tmp_ds.Tables("Seminar_Info").Rows.Add(tmp_dr)
            Dim myobj As New SqlClient.SqlCommandBuilder(tmp_da)
            tmp_da.Update(tmp_ds, "Seminar_Info")
        End If

        tmp_da1.Fill(tmp_ds, "seminarAttribute")
        tmp_da1.FillSchema(tmp_ds, SchemaType.Source, "seminarAttribute")
        If tmp_ds.Tables("seminarAttribute").Rows.Count = 0 Then
            tmp_dr = tmp_ds.Tables("seminarAttribute").NewRow

            tmp_dr("atribute") = "You can start to add Seminar Attribute here!"

            tmp_ds.Tables("seminarAttribute").Rows.Add(tmp_dr)
            Dim myobj As New SqlClient.SqlCommandBuilder(tmp_da1)
            tmp_da1.Update(tmp_ds, "seminarAttribute")
        End If

      
        conn.Close()
    End Sub
   

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        MultiView1.ActiveViewIndex = 0
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button2.Click
        MultiView1.ActiveViewIndex = 1
    End Sub

   Protected Sub LinkButton2_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton2.Click
        Response.Redirect("home.aspx")
    End Sub
End Class