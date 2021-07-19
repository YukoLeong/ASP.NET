using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class gridviewtext01 : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SqlCommand cmd = new SqlCommand("select * from CareerForm where CompanyID is not null ORDER BY CareerFormID desc", conn);
            conn.Open();
            GridView1.DataSource = cmd.ExecuteReader();
            GridView1.DataBind();
            conn.Close();
        }
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (e.Row.Cells[2].Text == "1")
            {
                e.Row.Cells[2].Text = "Yes";
                e.Row.Cells[2].ForeColor = System.Drawing.Color.Green;
                //e.Row.Cells[2].BackColor = System.Drawing.Color.Blue;
            }
            else if (e.Row.Cells[2].Text == "0")
            {
                e.Row.Cells[2].Text = "No";
                e.Row.Cells[2].ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}