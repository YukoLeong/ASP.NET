using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class gridview01 : System.Web.UI.Page
{
    //private static DataTable table = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ConnectionString);
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();

        conn.Open();
        SqlCommand sqlcode = new SqlCommand("select CareerFormID,ts,career,Industry from CareerForm where CompanyID=@CompanyID", conn);
        sqlcode.Parameters.AddWithValue("@CompanyID", '1');
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

    //protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    //{
    //    DataView dv = new DataView(table);
    //    GridView1.DataSource = dv;
    //    GridView1.PageIndex = e.NewPageIndex;
    //    GridView1.DataBind();
    //}



}