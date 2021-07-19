<%@ WebHandler Language="C#" Class="AttendanceHandler" %>

using System;
using System.Web;
using System.IO;
using System.Collections.Generic;

public class AttendanceHandler : IHttpHandler {
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        context.Response.Expires = -1;
        IList<CalendarDTO> tasksList = new List<CalendarDTO>();

        tasksList.Add(new CalendarDTO
        {
            id = 1,
            title = "MPI search",
            start = ToUnixTimespan(DateTime.Now),
            end = ToUnixTimespan(DateTime.Now.AddHours(4)),
            url = "www.Mpi.com"
        });
        tasksList.Add(new CalendarDTO
        {
            id = 1,
            title = "Macao search",
            start = ToUnixTimespan(DateTime.Now.AddDays(1)),
            end = ToUnixTimespan(DateTime.Now.AddDays(1).AddHours(4)),
            url = "www.Macao.com"
        });
        System.Web.Script.Serialization.JavaScriptSerializer oSerializer =
         new System.Web.Script.Serialization.JavaScriptSerializer();
        string sJSON = oSerializer.Serialize(tasksList);
        context.Response.Write(sJSON);
    }

    private long ToUnixTimespan(DateTime date)
    {
        TimeSpan tspan = date.ToUniversalTime().Subtract(
            new DateTime(1970, 1, 1, 0, 0, 0));

        return (long)Math.Truncate(tspan.TotalSeconds);
    }

    public bool IsReusable
    {
        get
        {
            return true;//false;
        }
    }
    public class CalendarDTO
    {
        public int id { get; set; }
        public string title { get; set; }
        public long start { get; set; }
        public long end { get; set; }
        public string url { get; set; }
    }
    //public void ProcessRequest (HttpContext context) {
    //    context.Response.ContentType = "text/plain";
    //    context.Response.Write("Hello World");
    //}
 
    //public bool IsReusable {
    //    get {
    //        return false;
    //    }
    //}

}