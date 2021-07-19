using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class gridviewpic01 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ConnectionString);
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();

        conn.Open();
        SqlCommand sqlcode = new SqlCommand("select * from testimg", conn);
        //sqlcode.Parameters.AddWithValue("@CompanyID", '1');
        da.SelectCommand = sqlcode;
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            //table = ds.Tables[0];
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        else
        {
            GridView1.DataSource = ds;
            GridView1.DataBind();
            Response.Write("no data");
        }
        //da.Dispose();
        //ds.Dispose();

        //GridView1.Columns[0].ItemStyle.HorizontalAlign = HorizontalAlign.Center;
        //GridView1.Columns[1].ItemStyle.HorizontalAlign = HorizontalAlign.Center;
        //GridView1.Columns[2].ItemStyle.HorizontalAlign = HorizontalAlign.Center;
        //GridView1.Columns[3].ItemStyle.HorizontalAlign = HorizontalAlign.Center;

        conn.Close();
    }
}