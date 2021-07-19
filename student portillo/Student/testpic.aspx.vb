
Partial Class Student_testpic
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim Path As String = Server.MapPath("~/Student/StudentImages/")
        System.IO.File.Delete(Path & "bg1.jpg")

    End Sub
End Class
