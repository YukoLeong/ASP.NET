using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class ChartDescription: System.Web.UI.Page
{
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btn_back_Click(object sender, EventArgs e)
        {
            Response.Redirect("StudentResultAnalysis.aspx");
        }

        protected void btn_home_Click(object sender, EventArgs e)
        {
            Response.Redirect("home.aspx");
        }
 }
