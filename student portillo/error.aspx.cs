using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class error : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
		
    }
	
	protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("http://www.ipm.edu.mo/en/index.php");
    }
	
	protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("http://172.26.122.66/siweb/logout.asp");
        // Response.Redirect("https://wire.ipm.edu.mo/cas/logout?url=http://172.25.2.163/ep/home.aspx");
    }
}