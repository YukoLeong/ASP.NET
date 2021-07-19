using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class radiobutton02 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ToString());
        if (!IsPostBack)
        {
            StringBuilder sb = new StringBuilder();
            conn.Open();
            SqlCommand cmd = new SqlCommand("select jscontroller from testjs", conn);
            SqlDataReader sqr = cmd.ExecuteReader();
            while (sqr.Read())
            {
                if (sqr["jscontroller"].ToString() == "1")
                {
                    sb.Append("<input type='radio' name='rdo' id='yes' checked />");
                    sb.Append("<input type='radio' name='rdo' id='no' />");
                    TextBox1.Text = "1";
                }
                else
                {
                    sb.Append("<input type='radio' name='rdo' id='yes' />");
                    sb.Append("<input type='radio' name='rdo' id='no' checked/>");
                    TextBox1.Text = "0";
                }
            }
            Literal1.Text = sb.ToString();
            sqr.Close();
            conn.Close();
        }

    }
}