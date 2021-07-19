Imports Microsoft.Reporting.WebForms
Partial Class Student_Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        ReportViewer1.LocalReport.EnableExternalImages = True
        ReportViewer1.LocalReport.Refresh()
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        If IsPostBack Then

            Dim Path As String = Server.MapPath("~/Student/StudentImages/")

            Dim FileOk As Boolean = False
            Dim fileExtension As String
            Dim i As Integer
            If Me.FileUpload1.HasFile Then
                fileExtension = IO.Path.GetExtension(Me.FileUpload1.FileName).ToLower
                Dim allowedExtensions As String() = {".jpg", ".jpeg", ".png", ".gif"}
                For i = 0 To allowedExtensions.Length - 1
                    If fileExtension = allowedExtensions(i) Then
                        FileOk = True
                    End If
                Next
                If FileOk Then
                    Try
                        Me.FileUpload1.PostedFile.SaveAs(Path & Me.FileUpload1.FileName)
                        Me.Label1.Text = "Upload Success!!"

                        Dim Param As New ReportParameter
                        Param.Name = "ReportParameter1"
                        Param.Values.Add(Path & Me.FileUpload1.FileName)
                        ReportViewer1.LocalReport.SetParameters(Param)
                        ReportViewer1.LocalReport.EnableExternalImages = True
                        ReportViewer1.LocalReport.Refresh()

                    Catch ex As Exception
                        Me.Label1.Text = "Upload False!! <br>" + ex.Message

                    End Try
                Else
                    Me.Label1.Text = "picture upload failed, confirm the type please !!"
                End If
            End If
        End If



    End Sub


End Class
