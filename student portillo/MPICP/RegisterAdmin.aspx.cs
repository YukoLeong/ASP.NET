using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MPICP_RegisterAdmin : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            fetchDate();
            //SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ConnectionString);
            //SqlDataAdapter da = new SqlDataAdapter();
            //DataSet ds = new DataSet();

            //conn.Open();
            //SqlCommand sqlcode = new SqlCommand("select * from CareerForm where CompanyID is not null ORDER BY ts desc", conn);
            ////sqlcode.Parameters.AddWithValue("@CompanyID", Session["CompanyID"]);
            //da.SelectCommand = sqlcode;
            //da.Fill(ds);
            //if (ds.Tables[0].Rows.Count > 0)
            //{
            //    //table = ds.Tables[0];
            //    GridView1.DataSource = ds;
            //    GridView1.DataBind();
            //}
            //else
            //{
            //    GridView1.DataSource = ds;
            //    GridView1.DataBind();
            //    //Response.Write("no data");
            //}



            //conn.Close();
        }
    }

    //protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    //{
    //    DataView dv = new DataView(table);
    //    GridView1.DataSource = dv;
    //    GridView1.PageIndex = e.NewPageIndex;
    //    GridView1.DataBind();
    //}


    public void fetchDate()
    {
        SqlCommand cmd = new SqlCommand("select * from CareerCompanyRegist ORDER BY CompanyID desc", conn);
        conn.Open();
        GridView1.DataSource = cmd.ExecuteReader();
        GridView1.DataBind();
        conn.Close();
    }


    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            if (e.Row.Cells[4].Text == "1")
            {
                e.Row.Cells[4].Text = "Yes";
                e.Row.Cells[4].ForeColor = System.Drawing.Color.Green;
                //e.Row.Cells[4].BackColor = System.Drawing.Color.Blue;
            }
            else if (e.Row.Cells[4].Text == "0")
            {
                e.Row.Cells[4].Text = "No";
                e.Row.Cells[4].ForeColor = System.Drawing.Color.Red;
            }

        }

    }

    //protected void BackButton_Click(object sender, ImageClickEventArgs e)
    //{
    //    Response.Redirect("RegisterAdmin.aspx");
    //}


    protected void LogoImageButton_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("home.aspx");
    }

    protected void OnSelectedIndexChanged(object sender, EventArgs e)
    {
        string idtemp = (GridView1.SelectedRow.FindControl("CompanyID") as Label).Text;
        Session["EditCompanyID"] = idtemp;
        Response.Redirect("RegisterAdmin_Edit.aspx");
        //Response.Write(Session["CompanyFormID"]);
    }


}