Public Class studentWorks
    Inherits System.Web.UI.Page

   
    Private Sub studentWorks_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init

        If DesignMode = True Then
            Return
        End If

        If Session("pess_cod") Is Nothing Then

            MsgBox("please login in")

            Response.Redirect("~/login.aspx")
        End If

        Dim conn As New SqlClient.SqlConnection("Data Source=172.25.2.64;Initial Catalog=EP;Persist Security Info=True;User ID=ep_client;Password=46709394")
        Dim tmp_da As New SqlClient.SqlDataAdapter("Select top 1 * from StudentWorks where pess_cod=" & Session("pess_cod"), conn)
        Dim tmp_ds As New DataSet
        Dim tmp_dr As DataRow

        conn.Open()
        tmp_da.Fill(tmp_ds, "StudentWorks")
        tmp_da.FillSchema(tmp_ds, SchemaType.Source, "StudentWorks")
        If tmp_ds.Tables("StudentWorks").Rows.Count = 0 Then
            tmp_dr = tmp_ds.Tables("StudentWorks").NewRow
            tmp_dr("pess_cod") = Session("pess_cod")
            tmp_dr("topic") = "You can start to add Student Work here!"
            tmp_ds.Tables("StudentWorks").Rows.Add(tmp_dr)
            Dim myobj As New SqlClient.SqlCommandBuilder(tmp_da)
            tmp_da.Update(tmp_ds, "StudentWorks")
        End If
        conn.Close()

    End Sub



    Private Sub DetailsViewStudentWorks_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles DetailsViewStudentWorks.ItemInserted
        GridViewStudentWorks.DataBind()

    End Sub

    Private Sub DetailsViewStudentWorks_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles DetailsViewStudentWorks.ItemUpdated
        GridViewStudentWorks.DataBind()

    End Sub

    Protected Sub DetailsViewStudentWorks_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewPageEventArgs) Handles DetailsViewStudentWorks.PageIndexChanging

    End Sub


    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        If IsPostBack Then

            Dim Path As String = Server.MapPath("~/Student/UploadFile/")
            Dim Path1 As String = "~/Student/UploadFile/"
            Dim FileOk As Boolean = False
            Dim fileExtension As String
            Dim i As Integer

            If Me.FileUpload1.HasFile Then
                fileExtension = IO.Path.GetExtension(Me.FileUpload1.FileName).ToLower
                Dim allowedExtensions As String() = {".jpg", ".jpeg", ".png", ".gif", ".doc"}
                For i = 0 To allowedExtensions.Length - 1
                    If fileExtension = allowedExtensions(i) Then
                        FileOk = True
                    End If
                Next
                If FileOk Then
                    Try
                        Me.FileUpload1.PostedFile.SaveAs(Path & Me.FileUpload1.FileName)
                        Me.Label1.Text = Me.FileUpload1.FileName & " Upload Success!!"

                        If fileExtension = ".jpg" Or fileExtension = ".jpeg" Or fileExtension = ".png" Or fileExtension = ".gif" Then

                            Image2.ImageUrl = Path1 & Me.FileUpload1.FileName

                        End If



                        If fileExtension = ".doc" Then

                            Image2.Visible = False

                        End If


                    Catch ex As Exception
                        Me.Label1.Text = "Upload False!! <br>" + ex.Message

                    End Try
                Else
                    Me.Label1.Text = "file upload failed, confirm the type please !!"
                End If
            End If
        End If

    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton1.Click
        Response.Redirect("home.aspx")
    End Sub
End Class