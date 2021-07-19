Imports System.Data
Imports System.IO
Imports System.Net
Imports System.Web.Configuration
Imports System.Xml

Partial Class testSingle
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim ticketInitial As New FormsAuthenticationTicket(1, Request("Name"), DateTime.Now, DateTime.Now.AddMinutes(30), False, String.Empty, FormsAuthentication.FormsCookiePath)
        Dim ticket As String = FormsAuthentication.Encrypt(ticketInitial)
        Dim USE_CAS As Boolean = ConfigurationManager.AppSettings("USE_CAS")
        Dim CASHOST As String = ConfigurationManager.AppSettings("CASHOST")
		
			
			
        If Not USE_CAS Then
            Exit Sub

        End If
       ' Dim tkt As String = Request.QueryString("ticket")
		 
		 'Response.Write(tkt)
		 Dim tkt As String =  @"<?xml version='1.0' encoding='utf-8' ?><cas:user>p1108381</cas:user>"
		 
      Dim service As String = Request.Url.GetLeftPart(UriPartial.Path)
        If tkt Is Nothing Then
           Dim redir As String = CASHOST & "login?" & "service=" + service
           Response.Redirect(redir)
           Exit Sub

       End If
		
        Dim validateurl As String = CASHOST & "serviceValidate?" & "ticket=" & tkt & "&" & "service=" & service
		'Dim validateurl As String = tkt 
		
        Dim client As New WebClient
        Dim data As Stream = client.OpenRead(validateurl)
        Dim reader As New StreamReader(data)
        Dim s As String = reader.ReadToEnd
        reader.Close()
        data.Close()
        Dim tmp_id As String = ""
        Dim cas_ind As String = "<cas:user>"
        Dim ind As Integer = s.IndexOf(cas_ind)
	
		Response.Write(ind)
		
        If ind > 0 Then
            tmp_id = s.Substring(ind + cas_ind.Length, s.IndexOf("</cas:user>") - ind - cas_ind.Length).Trim
			
			 
			 
            If tmp_id.Length > 0 Then
                ' get_info(tmp_id)
                'FormsAuthentication.SetAuthCookie(tmp_id, False)
                Response.Write(tmp_id)
                ' Response.Redirect("Default.aspx")
            End If


        End If
    End Sub
End Class
