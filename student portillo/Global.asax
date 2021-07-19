<%@ Application Language="C#" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup
		
    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs
		//string logPath = ConfigurationManager.AppSettings["SIPLogPath"];
	
		string logPath = HttpContext.Current.Server.MapPath("~/log/");
		
	
		Exception exception = Server.GetLastError();
		Response.Clear();
       	HttpException httpException = exception as HttpException;
        Exception error = Server.GetLastError();
		
        string err =  "///////////////Exception Start//////////////"+ "\n";	  		
		err +=	"[" + DateTime.Now.ToString() + "]" + "\n" ;	
        err += "Page is ：" + Request.Url.ToString() + "\n";
		if (Session["student_id"]!=null)
			err+= "Student ID is ：" +Session["student_id"].ToString()  + "\n";
		else
		if (Session["CODE"]!=null)
			err+= "Teacher Code is ：" +Session["CODE"].ToString()  + "\n";
		
        err += "Exception：" + error.Message + "\n";
        err += "Source:" + error.Source + "\n";
		// err += "StackTrace:" + error.StackTrace + "\n";	
		err += "Exception Message:"+ error.InnerException.Message+ "\n";
		err += "StackTrace: " + error.InnerException.StackTrace+ "\n";
		err += "///////////////Exception End///////////////////"+ "\n";
		
		 if (httpException != null) {
			

			switch (httpException.GetHttpCode()) {
			//case 404:
			// page not found
				//Response.Redirect("~/404.aspx", false);
			//break;
			case 500:
			// server error
				SaveTextToFile(err, logPath + "log.txt");
				//Response.Redirect("~/error.aspx", false);
			break;
			default:
				SaveTextToFile(err, logPath + "log.txt");
				//Response.Redirect("~/error.aspx", false);
			break;
			}
      }
	 
		// Log the exception 
		
	  
		
		  // Clear the error from the server
		//Server.ClearError();
    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
	
	public void SaveTextToFile(string strData, string FullPath)
    {      
        System.IO.StreamWriter objReader = null;
        try
        {
            // objReader = new StreamWriter(Request.PhysicalApplicationPath + FullPath);
            if (!(System.IO.File.Exists(FullPath)))
            {
                objReader = new System.IO.StreamWriter(FullPath);
                objReader.WriteLine(strData);
                objReader.WriteLine("\n");
                objReader.Close();
             
            }
        else
            {

                System.IO.File.AppendAllText(FullPath, "\t" + strData);
                
            }
        }
        catch (Exception Ex)
        {
          

        }
     
    }
       
</script>
