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

public partial class MPICP_Management : System.Web.UI.Page
{
    //private static DataTable table = new DataTable();

    ButtonField bfSelect = new ButtonField();

    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ConnectionString);
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();

        conn.Open();
        SqlCommand sqlcode = new SqlCommand("select * from CareerForm where CompanyID=@CompanyID ORDER BY ts desc", conn);
        sqlcode.Parameters.AddWithValue("@CompanyID", Session["CompanyID"]);
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



    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (e.Row.Cells[4].Text == "1")
            {
                e.Row.Cells[4].Text = "Yes";
                e.Row.Cells[4].ForeColor = System.Drawing.Color.Green;
                //e.Row.Cells[6].Text = "Motify";
                //e.Row.Cells[6].Attributes.Add("style","display:none");
            }
            else if (e.Row.Cells[4].Text == "0")
            {
                e.Row.Cells[4].Text = "No";
                e.Row.Cells[4].ForeColor = System.Drawing.Color.Red;

                //(GridView1.SelectedRow.FindControl("LinkButton1") as Label).Text = "Edit";
                //e.Row.Cells[7].Attributes.Add("style", "display:none");
            }

            //if (e.Row.Cells[5].Text == "1")
            //{
            //    e.Row.Cells[5].Text = "Yes";
            //    e.Row.Cells[5].ForeColor = System.Drawing.Color.Green;
            //    //e.Row.Cells[5].BackColor = System.Drawing.Color.Blue;
            //}
            //else if (e.Row.Cells[5].Text == "0")
            //{
            //    e.Row.Cells[5].Text = "No";
            //    e.Row.Cells[5].ForeColor = System.Drawing.Color.Red;
            //}

        }

    }



    protected void BackButton_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("RecruitmentMenu.aspx");
    }


    protected void LogoImageButton_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("home.aspx");
    }

    protected void OnSelectedIndexChanged(object sender, EventArgs e)
    {
        string idtemp = (GridView1.SelectedRow.FindControl("CareerFormID") as Label).Text;
        Session["CompanyFormID"] = idtemp;
        Response.Redirect("Management_Edit.aspx");
    }



    protected void LinkButton1_Click(object sender, EventArgs e)
    {

        //GridViewRow clickedRow = ((LinkButton)sender).NamingContainer as GridViewRow;
        //Session["CompanyFormID"] = (Label)clickedRow.FindControl("CareerFormID");

        //Response.Write(Session["CompanyFormID"]);
        //Response.Redirect("Management_Edit.aspx");

        


        //string idtemp2 = (GridView1.SelectedRow.FindControl("CareerFormID") as Label).Text;
        //Session["CompanyFormID"] = idtemp2;
        //Response.Redirect("Management_Edit.aspx");
    }
}