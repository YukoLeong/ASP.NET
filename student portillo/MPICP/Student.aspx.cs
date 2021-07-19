using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MPICP_Student : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ConnectionString);
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();

        conn.Open();
        SqlCommand sqlcode = new SqlCommand("select b.Organize,b.Organize_en, * from CareerForm a inner join CareerCompanyRegist b on a.CompanyID=b.CompanyID where a.CompanyID is not null and a.canpost=1 ORDER BY CareerFormID desc", conn);
        //sqlcode.Parameters.AddWithValue("@CompanyID", Session["CompanyID"]);
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
            //Response.Write("no data");
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


    protected void BackButton_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Student.aspx");
    }


    protected void LogoImageButton_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Student.aspx");
    }

    protected void OnSelectedIndexChanged(object sender, EventArgs e)
    {
        string idtemp = (GridView1.SelectedRow.FindControl("CareerFormID") as Label).Text;
        string idtemp2 = (GridView1.SelectedRow.FindControl("Organize") as Label).Text;
        string idtemp3 = (GridView1.SelectedRow.FindControl("Organize_en") as Label).Text;
        string idtemp4 = (GridView1.SelectedRow.FindControl("Views") as Label).Text;
        Session["CompanyFormID"] = idtemp;
        Session["Organize"] = idtemp2;
        Session["Organize_en"] = idtemp3;
        Session["ViewCount"] = idtemp4;
        Response.Redirect("StudentView.aspx");
        //Response.Write(Session["CompanyFormID"]);
    }
}