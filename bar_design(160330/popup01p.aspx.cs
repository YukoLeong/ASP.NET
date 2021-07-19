using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class popup01p : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["test1"] = 114;
        TextBox1.Text = Session["test1"].ToString();

        SqlCommand cmd = new SqlCommand("select * from CareerForm where CareerFormID=@CareerFormID", conn);
        conn.Open();
        cmd.Parameters.AddWithValue("@CareerFormID", Session["test1"]);
        SqlDataReader sdr = cmd.ExecuteReader();
        while (sdr.Read())
        {
            if (sdr["career"] != null)
            {
                TextBox2.Text = sdr["career"].ToString();
            }
        }
        sdr.Close();
        conn.Close();

    }
}