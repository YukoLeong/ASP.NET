using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Threading;
using System.Globalization;

public class PageNums
{
    
    public static string GetPageNum(DataSet ds, DataList datalistname, int pagesize,string ss)
    {
        PagedDataSource objPds = new PagedDataSource();
        objPds.DataSource = ds.Tables[0].DefaultView;
        objPds.AllowPaging = true;
        int total = ds.Tables[0].Rows.Count;
        objPds.PageSize = pagesize;
        int page;
		string str=ss;
        if (HttpContext.Current.Request.QueryString["page"] != null)
            page = Convert.ToInt32(HttpContext.Current.Request.QueryString["page"]);
        else
            page = 1;
        objPds.CurrentPageIndex = page - 1;
        datalistname.DataSource = objPds;
        datalistname.DataBind();
        int allpage = 0;
        int next = 0;
        int pre = 0;
        int startcount = 0;
        int endcount = 0;
        string pagestr = "";
        if (page < 1) { page = 1; }
        //Calculate the total number of pages
        if (pagesize != 0)
        {
            allpage = (total / pagesize);
            allpage = ((total % pagesize) != 0 ? allpage + 1 : allpage);
            allpage = (allpage == 0 ? 1 : allpage);
        }
        next = page + 1;
        pre = page - 1;
        startcount = (page + 5) > allpage ? allpage - 9 : page - 4;//Intermediate page starting sequence number
        //Terminated intermediate page number
        endcount = page < 5 ? 10 : page + 5;
        if (startcount < 1) { startcount = 1; } //To avoid generating negative output when the set is less than 1 starts from No. 1
        if (allpage < endcount) { endcount = allpage; } //Page possibilities +5 will produce the final output is greater than the total page number, then it would be controlled in the number of page
        
		
	  if(str=="zh-TW")
		{
			pagestr = "<a >" + "總數:" + allpage + "</a>&nbsp;&nbsp;&nbsp;&nbsp;";
        pagestr += page > 1 ? "<a href=\"" + HttpContext.Current.Request.CurrentExecutionFilePath + "?page=1\">首頁</a>&nbsp;&nbsp;<a href=\"" + HttpContext.Current.Request.CurrentExecutionFilePath + "?page=" + pre + "\">前頁</a>" : "<a>首頁</a>" + "&nbsp;&nbsp;" + "<a>前頁</a>";
        //Intermediate page process, this increases the time complexity, space complexity is reduced
        for (int i = startcount; i <= endcount; i++)
        {
            pagestr += page == i ? "&nbsp;&nbsp;" +"<a class=\"cpb\">"+ i + "</a>" : "&nbsp;&nbsp;<a href=\"" + HttpContext.Current.Request.CurrentExecutionFilePath + "?page=" + i + "\">" + i + "</a>";
        }
        pagestr += page != allpage ? "&nbsp;&nbsp;<a href=\"" + HttpContext.Current.Request.CurrentExecutionFilePath + "?page=" + next + "\">下頁</a>&nbsp;&nbsp;<a href=\"" + HttpContext.Current.Request.CurrentExecutionFilePath + "?page=" + allpage + "\">尾頁</a>" : "&nbsp;&nbsp;" + "<a >下頁</a>" + "&nbsp;&nbsp;" + "<a >尾頁</a>";
        return pagestr;
			
		}
		else if(str == null || str=="en-US")
	     {
		   pagestr = "<a >" + "Total:" + allpage + "</a>&nbsp;&nbsp;&nbsp;&nbsp;";
           pagestr += page > 1 ? "<a href=\"" + HttpContext.Current.Request.CurrentExecutionFilePath + "?page=1\">First</a>&nbsp;&nbsp;<a href=\"" + HttpContext.Current.Request.CurrentExecutionFilePath + "?page=" + pre + "\">Previous</a>" : "<a>First</a>" + "&nbsp;&nbsp;" + "<a>Previous</a>";
     //Intermediate page process, this increases the time complexity, space complexity is reduced
         for (int i = startcount; i <= endcount; i++)
         {
        pagestr += page == i ? "&nbsp;&nbsp;" +"<a class=\"cpb\">"+ i + "</a>" : "&nbsp;&nbsp;<a href=\"" + HttpContext.Current.Request.CurrentExecutionFilePath + "?page=" + i + "\">" + i + "</a>";
          }
            pagestr += page != allpage ? "&nbsp;&nbsp;<a href=\"" + HttpContext.Current.Request.CurrentExecutionFilePath + "?page=" + next + "\">Next</a>&nbsp;&nbsp;<a href=\"" + HttpContext.Current.Request.CurrentExecutionFilePath + "?page=" + allpage + "\">End</a>" : "&nbsp;&nbsp;" + "<a >Next</a>" + "&nbsp;&nbsp;" + "<a >End</a>";
        return pagestr;
		}
		else
			{
			pagestr = "<a >" + "總數:" + allpage + "</a>&nbsp;&nbsp;&nbsp;&nbsp;";
        pagestr += page > 1 ? "<a href=\"" + HttpContext.Current.Request.CurrentExecutionFilePath + "?page=1\">首頁</a>&nbsp;&nbsp;<a href=\"" + HttpContext.Current.Request.CurrentExecutionFilePath + "?page=" + pre + "\">前頁</a>" : "<a>首頁</a>" + "&nbsp;&nbsp;" + "<a>前頁</a>";
        //Intermediate page process, this increases the time complexity, space complexity is reduced
        for (int i = startcount; i <= endcount; i++)
        {
            pagestr += page == i ? "&nbsp;&nbsp;" +"<a class=\"cpb\">"+ i + "</a>" : "&nbsp;&nbsp;<a href=\"" + HttpContext.Current.Request.CurrentExecutionFilePath + "?page=" + i + "\">" + i + "</a>";
        }
        pagestr += page != allpage ? "&nbsp;&nbsp;<a href=\"" + HttpContext.Current.Request.CurrentExecutionFilePath + "?page=" + next + "\">下頁</a>&nbsp;&nbsp;<a href=\"" + HttpContext.Current.Request.CurrentExecutionFilePath + "?page=" + allpage + "\">尾頁</a>" : "&nbsp;&nbsp;" + "<a >下頁</a>" + "&nbsp;&nbsp;" + "<a >尾頁</a>";
        return pagestr;
			
		}
    }
}