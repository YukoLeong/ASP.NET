using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class controls_form_header : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["anol_ano_full"] != null)
        {
            year.InnerText = Session["anol_ano_full"].ToString();
        }
    }
}