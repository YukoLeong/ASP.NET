Imports System.Threading
Imports System.Globalization
Partial Class Student_AcademicRecord
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("Role_Type") Is Nothing Then

            Response.Write("<script>alert('Please Log In !'); location.href='http://172.26.122.66/siweb/logout.asp'; </script>")
            Response.End()

        End If
        Dim dv_verify As Data.DataView = SqlDataSource1.Select(New DataSourceSelectArguments)
        If Session("Role_Type") = "student" Then
            If dv_verify.Item(0).Item("ar") = "False" Then

                Response.Write("<script>alert('You do not have Permission to view it !');window.history.back(-1); </script>")

            End If
        End If
    
        If Session("CurrentUI") = "zh-TW" Then
            btn_home.ImageUrl = "../images/homebluec.png"
            btn_home.Attributes.Add("onmouseover", "src='../images/homebluec_hover.png'")
            btn_home.Attributes.Add("onmouseout", "src='../images/homebluec.png'")
        End If

    End Sub

   
    Protected Sub btn_home_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btn_home.Click
        Response.Redirect("home.aspx")
    End Sub

    Protected Overrides Sub InitializeCulture()
   
         If Session("CurrentUI") IsNot Nothing Then

            Dim selectedLanguage As String = Session("CurrentUI").ToString()
            UICulture = selectedLanguage
            Culture = selectedLanguage


            Thread.CurrentThread.CurrentCulture =
                CultureInfo.CreateSpecificCulture(selectedLanguage)
            Thread.CurrentThread.CurrentUICulture = New CultureInfo(selectedLanguage)
        End If

        MyBase.InitializeCulture()
    End Sub
End Class
