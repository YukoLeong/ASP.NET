using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_CareerFormStudent : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ToString());
    private static DataTable table = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Role_Type"] == null)
            {
                Response.Write("<script>alert('Please Log In !'); window.location.href='../home.aspx'; </script>");
                return;
            }

            //dll part
            SqlCommand industrycmd = new SqlCommand("select Industry_EN+' '+Industry_ZH as name,id,Industry_EN from CareerIndustry", conn);
            conn.Open();
            IndustryDll.DataSource = industrycmd.ExecuteReader();
            IndustryDll.DataTextField = "name";
            IndustryDll.DataValueField = "Industry_EN";
            IndustryDll.DataBind();
            IndustryDll.Items.Insert(0, "- - All Industry - -");
            JobNatureDll.Items.Insert(0, "- - All JobNature - -");
            conn.Close();



            //GridView part
            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter();
            DataSet ds = new DataSet();
            SqlCommand sqlcode = new SqlCommand("select CareerFormID,CONVERT(varchar(20), ts, 111) as tss,OrganiztionName1,career,VacancyNumber,Salary,views from CareerForm where IsApproval='1' order by CareerFormID desc", conn);
            da.SelectCommand = sqlcode;
            da.Fill(ds);
            table = ds.Tables[0];
            GridView1.DataSource = ds;
            GridView1.DataBind();

            conn.Close();
        }
        NoDataLabel.Text = "";
    }
    protected void ImageButton2_Click(object sender, EventArgs e)
    {
        if (Session["Role_Type"] == "student") { Response.Redirect("home.aspx"); }

        if (Session["Role_Type"] == "teacher" || Session["Role_Type"] == "tutor" || Session["Role_Type"] == "coordinator" || Session["Role_Type"] == "director")
        { Response.Redirect("schoolStaff.aspx"); }

        Response.Write("<script>alert('Please Log In !'); window.location.href='../home.aspx'; </script>");
    }
    protected void IndustryDll_SelectedIndexChanged(object sender, EventArgs e)
    {


        conn.Open();
        SqlCommand jobnaturecmd = new SqlCommand("select JobNatureEN,JobNatureEN+' '+JobNatureZH as name from CareerJobNature where Industry_ID=(select id from CareerIndustry where Industry_EN=@Industry_EN)", conn);
        jobnaturecmd.Parameters.AddWithValue("@Industry_EN", IndustryDll.SelectedValue);
        JobNatureDll.DataSource = jobnaturecmd.ExecuteReader();
        JobNatureDll.DataTextField = "name";
        JobNatureDll.DataValueField = "JobNatureEN";
        JobNatureDll.DataBind();
        JobNatureDll.Items.Insert(0, "- - All JobNature - -");
        conn.Close();



        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();
        if (this.IndustryDll.SelectedIndex != 0)
        {
            conn.Open();
            SqlCommand sqlcode = new SqlCommand("select CareerFormID,CONVERT(varchar(20), ts, 111) as tss,OrganiztionName1,career,VacancyNumber,Salary,views from CareerForm where Industry=@Industry and IsApproval='1' order by CareerFormID desc", conn);
            sqlcode.Parameters.AddWithValue("@Industry", this.IndustryDll.SelectedValue.Trim());
            da.SelectCommand = sqlcode;
            da.Fill(ds);
            table = ds.Tables[0];
            if (ds.Tables[0].Rows.Count > 0)
            {
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
            else
            {
                GridView1.DataSource = ds;
                GridView1.DataBind();
                NoDataLabel.Text = "Your search did not match.";
            }
            conn.Close();
        }
        else
        {
            conn.Open();
            SqlCommand sqlcode = new SqlCommand("select CareerFormID,CONVERT(varchar(20), ts, 111) as tss,OrganiztionName1,career,VacancyNumber,Salary,views from CareerForm where IsApproval='1' order by CareerFormID desc", conn);
            da.SelectCommand = sqlcode;
            da.Fill(ds);
            table = ds.Tables[0];
            GridView1.DataSource = ds;
            GridView1.DataBind();
            conn.Close();
        }
    }
    protected void JobNatureDll_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();
        if (this.JobNatureDll.SelectedIndex != 0)
        {
            conn.Open();
            SqlCommand sqlcode = new SqlCommand("select CareerFormID,CONVERT(varchar(20), ts, 111) as tss,OrganiztionName1,career,VacancyNumber,Salary,views from CareerForm where Industry=@Industry and BusinessNature=@BusinessNature and IsApproval='1' order by CareerFormID desc", conn);
            sqlcode.Parameters.AddWithValue("@Industry", this.IndustryDll.SelectedValue.Trim());
            sqlcode.Parameters.AddWithValue("@BusinessNature", this.JobNatureDll.SelectedValue.Trim());
            da.SelectCommand = sqlcode;
            da.Fill(ds);
            table = ds.Tables[0];
            if (ds.Tables[0].Rows.Count > 0)
            {
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
            else
            {
                GridView1.DataSource = ds;
                GridView1.DataBind();
                NoDataLabel.Text = "Your search did not match.";
            }
            conn.Close();
        }
        else
        {
            conn.Open();
            SqlCommand sqlcode = new SqlCommand("select CareerFormID,CONVERT(varchar(20), ts, 111) as tss,OrganiztionName1,career,VacancyNumber,Salary,views from CareerForm where Industry=@Industry and IsApproval='1' order by CareerFormID desc", conn);
            sqlcode.Parameters.AddWithValue("@Industry", this.IndustryDll.SelectedValue.Trim());
            da.SelectCommand = sqlcode;
            da.Fill(ds);
            table = ds.Tables[0];
            if (ds.Tables[0].Rows.Count > 0)
            {
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
            else
            {
                GridView1.DataSource = ds;
                GridView1.DataBind();
                NoDataLabel.Text = "Your search did not match.";
            }
            conn.Close();
        }
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        DataView dv = new DataView(table);
        GridView1.DataSource = dv;
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataBind();
    }


    protected void OnSelectedIndexChanged(object sender, EventArgs e)
    {
        string idtemp = (GridView1.SelectedRow.FindControl("CareerFormID") as Label).Text;
        Session["IDTemp"] = idtemp;
        //Response.Redirect("CareerFormStudentView.aspx");
        ClientScript.RegisterClientScriptBlock(this.GetType(), "Message", "window.open('CareerFormStudentView.aspx','_blank');", true);
    }



}