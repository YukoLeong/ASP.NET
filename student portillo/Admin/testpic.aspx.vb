
Partial Class Operator_testpic
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim Path As String = Server.MapPath("~/Executive/image/GiftImage")
        If (System.IO.Directory.Exists(Path) = False) Then
            System.IO.Directory.CreateDirectory(Path)
        End If


        System.IO.File.Delete(Path & "giftPic5.jpg")

        ' System.IO.File.Delete(Path & "giftPic8.jpg")

    End Sub
End Class
SELECT ISNULL(image,'~/Executive/image/image.jpg') as image


  SelectCommand="SELECT ISNULL(image,'~/Executive/image/image.jpg') as image, [title], [detail], [quantity], [credit], [active], [max_exchange], [update_time] FROM [gift_info] WHERE [COD] = @COD order by id asc" 