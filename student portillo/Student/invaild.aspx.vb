
Partial Class Student_invaild
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim dv_time As Data.DataView = AccessTime.Select(New DataSourceSelectArguments)
          If (dv_time.Item(0).Item("active")) = False Then
                MultiView1.ActiveViewIndex = 1
                Exit Sub
            End If
            Label1.Text = Format(dv_time.Item(0).Item("startTime"), "yyyy/MM/dd")
            Label2.Text = Format(dv_time.Item(0).Item("endTime"), "yyyy/MM/dd")
            Label3.Text = Format(dv_time.Item(0).Item("startTime"), "yyyy/MM/dd")
            Label4.Text = Format(dv_time.Item(0).Item("endTime"), "yyyy/MM/dd")
       

            Dim startDate As String = Format(dv_time.Item(0).Item("startTime"), "yyyy/MM/dd")
            Dim endDate As String = DateTime.Now.ToString("yyyy/MM/dd")
            Dim startArr() As String
            Dim endArr() As String
            Dim flag As Boolean = False
            startArr = startDate.Split("/")
            endArr = endDate.Split("/")


            If ((Convert.ToInt32(startArr(0))) > (Convert.ToInt32(endArr(0)))) Then

                MultiView1.ActiveViewIndex = 0
                Exit Sub


            End If
            If ((Convert.ToInt32(startArr(0))) = (Convert.ToInt32(endArr(0))) And (Convert.ToInt32(startArr(1))) > (Convert.ToInt32(endArr(1)))) Then

                MultiView1.ActiveViewIndex = 0
                Exit Sub
            End If


            If ((Convert.ToInt32(startArr(0))) = (Convert.ToInt32(endArr(0))) And (Convert.ToInt32(startArr(1))) = (Convert.ToInt32(endArr(1))) And (Convert.ToInt32(startArr(2))) > (Convert.ToInt32(endArr(2)))) Then

                MultiView1.ActiveViewIndex = 0
                Exit Sub


            End If

            Dim startDate1 As String = DateTime.Now.ToString("yyyy/MM/dd")
            Dim endDate1 As String = Format(dv_time.Item(0).Item("endTime"), "yyyy/MM/dd")
            Dim startArr1() As String
            Dim endArr1() As String
            Dim flag1 As Boolean = False
            startArr1 = startDate1.Split("/")
            endArr1 = endDate1.Split("/")


            If ((Convert.ToInt32(startArr1(0))) > (Convert.ToInt32(endArr1(0)))) Then
                MultiView1.ActiveViewIndex = 1
                Exit Sub



            End If
            If ((Convert.ToInt32(startArr1(0))) = (Convert.ToInt32(endArr1(0))) And (Convert.ToInt32(startArr1(1))) > (Convert.ToInt32(endArr1(1)))) Then

                MultiView1.ActiveViewIndex = 1
                Exit Sub

            End If


            If ((Convert.ToInt32(startArr1(0))) = (Convert.ToInt32(endArr1(0))) And (Convert.ToInt32(startArr1(1))) = (Convert.ToInt32(endArr1(1))) And (Convert.ToInt32(startArr1(2))) > (Convert.ToInt32(endArr1(2)))) Then

                MultiView1.ActiveViewIndex = 1
                Exit Sub
            End If
        End If
    End Sub

    Protected Sub ImageButton2_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton2.Click
        Response.Redirect("home.aspx")
    End Sub
End Class
