Imports System.Security.Cryptography
Imports System.Data.SqlClient
Imports System.Data
Partial Class SystemAdmin_SeminarReg
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim key As String
        key = "seminar"
        loginID.Value = Request("loginID")
        'time.Value = Request("time")
        verify.Value = Request("verify")
        confirm.Value = hashOfString(loginID.Value + HttpContext.Current.Request.UserHostAddress + key)
        Response.Write(hashOfString(loginID.Value + HttpContext.Current.Request.UserHostAddress + key) + "<br />")
        Response.Write(Request("loginID") + "<br />")
        Response.Write(Request("verify") + "<br />")
        Response.Write(HttpContext.Current.Request.UserHostAddress)




    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        Dim conn As New SqlClient.SqlConnection("Data Source=172.25.2.64;Initial Catalog=EP;Persist Security Info=True;User ID=ep_client;Password=46709394")
        Dim cmd As New SqlCommand("Select ID from useraccount where ID='" & Request("loginID") & "'", conn)
        conn.Open()
        Dim reader As SqlDataReader = cmd.ExecuteReader()
        If reader.HasRows = False Then
            Response.Write("<script>alert('Invaild login ID!')</script>")

            Return

        End If
        If confirm.Value = verify.Value Then


            Session("topic") = DropDownList1.SelectedValue
            Session("loginID") = Request("loginID")
            Session("verify") = Request("verify")
            conn.Close()
            '  Response.Redirect("SeminarMark.aspx?loginID=" & loginID.Value & "&verify=" & verify.Value)
            Response.Redirect("SeminarMark.aspx")


        Else
            conn.Close()
            Response.Write("<script>alert('Invaild Visit!')</script>")


        End If
    End Sub

    Public Function GetIPAddress()

        Dim b As System.Net.IPHostEntry = System.Net.Dns.GetHostEntry(System.Net.Dns.GetHostName)

        Return b.AddressList.GetValue(1).ToString

    End Function


    Public Function encode(ByVal RequestInformation As String) As String
        Dim i As Integer
        Dim strChar, hexStr, totalStr As String

        totalStr = ""
        For i = 0 To RequestInformation.Length - 1

            strChar = RequestInformation.Substring(i, 1)

            hexStr = Hex(Asc(strChar) + 15)

            totalStr += hexStr

        Next
        Return (totalStr)

    End Function


    Public Function decode(ByVal RequestInformation As String) As String
        Dim i As Integer
        Dim strChar, charNum, totalStr As String

        totalStr = ""
        For i = 0 To RequestInformation.Length - 1 Step 2

            strChar = RequestInformation.Substring(i, 2)

            charNum = Convert.ToChar((CInt("&H" & strChar)) - 15)

            totalStr += charNum

        Next
        Return (totalStr)

    End Function

    Public Function hashOfString(ByVal stringToHash As String) As String
        Dim sha1 As New SHA1CryptoServiceProvider

        Dim bytesToHash() As Byte = System.Text.Encoding.UTF8.GetBytes(stringToHash)

        bytesToHash = sha1.ComputeHash(bytesToHash)

        Dim strResult As String = ""

        For Each b As Byte In bytesToHash

            strResult += b.ToString("x2")
        Next

        Return strResult

    End Function

End Class
