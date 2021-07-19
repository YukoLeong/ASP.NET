using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Text;
using System.Collections;
using System.Web.Services;
using System.Threading;
using System.Globalization;
public partial class Instructor_Attendance : System.Web.UI.Page
{
    protected string strAo="";
	protected string strAq="";
	protected string strCurrent="";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
           
           
			if(	string.IsNullOrEmpty((string) System.Web.HttpContext.Current.Session["ALUN_NUMERO"]))
            {
                        
						
						Session["ALUN_NUMERO_SEQ"]="";
           				Response.Write("<script>alert('Please Log In !'); window.location.href='http://172.26.122.66/siweb/logout.asp'; </script>");
			}
			else
			{ 
		                strAo=Session["ALUN_NUMERO"].ToString();
				        strAq=Session["ALUN_NUMERO_SEQ"].ToString();
			}
        }
    }
       protected override void InitializeCulture()
    {
        base.InitializeCulture();

        if (Session["CurrentUI"] != null)
        {
            String selectedLanguage = (string)Session["CurrentUI"];
            UICulture = selectedLanguage;
            Culture = selectedLanguage;
            strCurrent=selectedLanguage;
            Thread.CurrentThread.CurrentCulture =
                CultureInfo.CreateSpecificCulture(selectedLanguage);
            Thread.CurrentThread.CurrentUICulture = new
                CultureInfo(selectedLanguage);
        }

        base.InitializeCulture();
    }

}