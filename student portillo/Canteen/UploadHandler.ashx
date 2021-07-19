<%@ WebHandler Language="C#" Class="UploadHandler" %>

using System;
using System.Web;

public class UploadHandler : IHttpHandler
{
    //string nowtime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss tt");
    string nowtime = DateTime.Now.ToString("yyyy-MM-dd");
    public void ProcessRequest(HttpContext context)
    {
        if (context.Request.Files.Count > 0)
        {
            HttpFileCollection selectedFiles = context.Request.Files;
            for (int i = 0; i < selectedFiles.Count; i++)
            {
                System.Threading.Thread.Sleep(1000);
                HttpPostedFile PostedFile = selectedFiles[i];
                string FileName = context.Server.MapPath("Uploads/1/"
                    +"TM_" +nowtime + System.IO.Path.GetFileName(PostedFile.FileName));
                PostedFile.SaveAs(FileName);
            }
        }
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}