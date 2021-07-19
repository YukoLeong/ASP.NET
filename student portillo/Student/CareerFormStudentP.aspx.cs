using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Student_CareerFormStudentP : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ConnectionString);
            SqlDataAdapter da = new SqlDataAdapter();
            DataSet ds = new DataSet();
            conn.Open();
            SqlCommand sqlcode = new SqlCommand("select CONVERT(varchar(20), ts, 111) as tss,Career,views,CareerFormID from CareerForm where IsApproval=1 order by ts desc ", conn);
            da.SelectCommand = sqlcode;
            da.Fill(ds);

            //GridView內容置中
            GridView1.Columns[0].ItemStyle.HorizontalAlign = HorizontalAlign.Center;
            //GridView1.Columns[1].ItemStyle.HorizontalAlign = HorizontalAlign.Center;
            GridView1.Columns[2].ItemStyle.HorizontalAlign = HorizontalAlign.Center;

            if (ds.Tables[0].Rows.Count > 0)
            {
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
            conn.Close();
        }
    }


    protected void OnSelectedIndexChanged(object sender, EventArgs e)
    {

        string idtemp = (GridView1.SelectedRow.FindControl("CareerFormID") as Label).Text;
        Session["IDTemp"] = idtemp;
        Response.Redirect("CareerFormStudentView.aspx");

    }
}