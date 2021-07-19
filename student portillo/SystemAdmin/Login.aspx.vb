Imports System.Data
Imports System.IO
Imports System.Net
Imports System.Web.Configuration


Partial Class login
    Inherits System.Web.UI.Page
   
  
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        ' Dim USE_CAS As Boolean = ConfigurationManager.AppSettings("USE_CAS")
        ' Dim CASHOST As String = ConfigurationManager.AppSettings("CASHOST")

        Dim USE_CAS As Boolean = True
        Dim CASHOST As String = "https://wire.ipm.edu.mo/cas/"
        If Not USE_CAS Then
            Exit Sub

        End If
        Dim tkt As String = Request.QueryString("ticket")
        Dim service As String = Request.Url.GetLeftPart(UriPartial.Path)
        If tkt Is Nothing Then
            Dim redir As String = CASHOST & "login?" & "service=" + service
            Response.Redirect(redir)
            Exit Sub

        End If

        Dim validateurl As String = CASHOST & "serviceValidate?" & "ticket=" & tkt & "&" & "service=" & service
        Dim client As New WebClient
        Dim data As Stream = client.OpenRead(validateurl)
        Dim reader As New StreamReader(data)
        Dim s As String = reader.ReadToEnd
        reader.Close()
        data.Close()
        Dim tmp_id As String = ""
        Dim cas_ind As String = "<cas:user>"
        Dim ind As Integer = s.IndexOf(cas_ind)

        If ind > 0 Then
            tmp_id = s.Substring(ind + cas_ind.Length, s.IndexOf("</cas:user>") - ind - cas_ind.Length).Trim
            If tmp_id.Length > 0 Then
                ' get_info(tmp_id)
                'FormsAuthentication.SetAuthCookie(tmp_id, False)
                Response.Write(tmp_id)

            End If


        End If
    End Sub

    
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Response.Redirect("test.aspx")
    End Sub
End Class
