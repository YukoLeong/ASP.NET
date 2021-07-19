using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Teacher_RdRedirect : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        /* if (HttpContext.Current.Session["teacherCode"] != null)
         {
             Label1.Text = HttpContext.Current.Session["teacherCode"].ToString();            
         }
         else
         {
             Response.Write("<script>alert('Please login!')</script>");
             Response.Redirect("~/login.aspx");
         }*/
        if (!Page.IsPostBack)
        {

            if (Session["CODE"] != null                
                && Session["role_teacher"] != null)
            {
                if (Session["role_teacher"].ToString() == "teacher")
                {
                    Session["id"] = Request.QueryString["rid"];
                    Session["class_Code"] = Request.QueryString["ccode"]; 
                    Session["teacherCode"] = Request.QueryString["tcode"];
                    Session["teacherName"] = Request.QueryString["tname"];
					Session["aa"]="true";
                    Session["stdID"] = Request.QueryString["sid"];
                    Session["advisory_history"] = "false";
                }
            }
            
        }
        //Response.Write(Request.QueryString["rid"]);

        Response.Redirect("~/Advice/AdvisoryDetails.aspx");
    }
}