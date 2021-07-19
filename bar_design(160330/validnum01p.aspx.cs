using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class validnum01p : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Label1.Text = Session["ValidNums"].ToString();
    }
    protected void ValidButton_Click(object sender, EventArgs e)
    {
        if (Session["ValidNums"].ToString() != this.entervalid.Text.Trim())
        {
            Response.Write("fail");
        }
        else
        {
            //Response.Write("<script> alert('Verification code input errors!');window.location.href='#bbox'; </script>");
            Response.Write("success");
        }
    }
}