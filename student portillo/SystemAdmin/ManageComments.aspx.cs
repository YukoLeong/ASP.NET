using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Operator_ManageComments : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       // Session["Role_Type"] = "operator";
       // Session["ID"] = "garychan";

        if (!Page.IsPostBack)
        {


            if (string.IsNullOrEmpty((string)System.Web.HttpContext.Current.Session["sysadminID"]))
            {

                Session["Role_Type"] = "";
                Response.Write("<script>alert('Please Log In !'); window.location.href='../staff.aspx'; </script>");
            }
            else
            {
                ViewState["RT"] = Session["Role_Type"].ToString();
                ViewState["ID"] = Session["sysadminID"].ToString();
                DropDownList1.DataSource = mvManageComments.Views;
                DropDownList1.DataTextField = "ID";
                DropDownList1.DataBind();
                LoadStudentDatas();

            }
        }
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        SqlConnection sqlcon = new SqlConnection(WebConfigurationManager.ConnectionStrings["EPConnectionString"].ConnectionString);
        sqlcon.Open();
        SqlCommand sqlcom;
        string sqlstr = "delete from ep_usertalk where id='" + GridView1.DataKeys[e.RowIndex].Value.ToString() + "'";
        sqlcom = new SqlCommand(sqlstr, sqlcon);
        sqlcom.ExecuteNonQuery();
        sqlcon.Close();
        LoadStudentDatas();         
    }
    protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        SqlConnection sqlcon = new SqlConnection(WebConfigurationManager.ConnectionStrings["EPConnectionString"].ConnectionString);
        sqlcon.Open();
        SqlCommand sqlcom;
        string sqlstr = "delete from ep_instructortalk where id='" + GridView2.DataKeys[e.RowIndex].Value.ToString() + "'";
        sqlcom = new SqlCommand(sqlstr, sqlcon);
        sqlcom.ExecuteNonQuery();
        sqlcon.Close();
        LoadInstructorDatas();
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
      
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
			e.Row.Attributes.Add("onMouseOver","Color=this.style.backgroundColor;this.style.backgroundColor='#FFF000'");
			e.Row.Attributes.Add("onMouseOut","this.style.backgroundColor=Color;");
			e.Row.Cells[3].Text=StringFormat.HighLight(e.Row.Cells[3].Text,true);
            if (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate)
            {
                ((LinkButton)e.Row.Cells[4].Controls[0]).Attributes.Add("onclick", "javascript:return confirm('Are you sure you want to delete the data ?')");
            }
			e.Row.Cells[3].Text=StringFormat.Out(e.Row.Cells[3].Text,25);
        }
		
    }
    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onMouseOver", "Color=this.style.backgroundColor;this.style.backgroundColor='#FFF000'");
            e.Row.Attributes.Add("onMouseOut", "this.style.backgroundColor=Color;");
            e.Row.Cells[3].Text = StringFormat.HighLight(e.Row.Cells[3].Text, true);
            if (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate)
            {
                ((LinkButton)e.Row.Cells[4].Controls[0]).Attributes.Add("onclick", "javascript:return confirm('Are you sure you want to delete the data ?')");
            }
            e.Row.Cells[3].Text = StringFormat.Out(e.Row.Cells[3].Text, 25);
        }

    }
    protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        LoadStudentDatas();
    }
    protected void GridView2_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        LoadInstructorDatas();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        LoadStudentDatas();
    }
    protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView2.PageIndex = e.NewPageIndex;
        LoadInstructorDatas();
    }
    private void LoadStudentDatas()
    {
        p1.Visible = false;
        SqlConnection sqlcon = new SqlConnection(WebConfigurationManager.ConnectionStrings["EPConnectionString"].ConnectionString);
        sqlcon.Open();
        string strsqls = "select * from ep_usertalk  where isreturn='0' order by id ";
        SqlDataAdapter adsa = new SqlDataAdapter(strsqls, sqlcon);
        DataSet adds = new DataSet();
        adsa.Fill(adds);
        if (adds.Tables[0].Rows.Count > 0)
        {
            GridView1.DataSource = adds;
            GridView1.DataKeyNames = new string[] { "id" };
            GridView1.DataBind();
        }
        else
        {
            GridView1.DataBind();
            p1.Visible = true;
        }
		sqlcon.Close();
    }
    private void LoadInstructorDatas()
    {
        p2.Visible = false;
        SqlConnection sqlcon = new SqlConnection(WebConfigurationManager.ConnectionStrings["EPConnectionString"].ConnectionString);
        sqlcon.Open();
        string strsqls = "select * from ep_instructortalk  where isreturn='0' order by id ";
        SqlDataAdapter adsa = new SqlDataAdapter(strsqls, sqlcon);
        DataSet adds = new DataSet();
        adsa.Fill(adds);
        if (adds.Tables[0].Rows.Count > 0)
        {
            GridView2.DataSource = adds;
            GridView2.DataKeyNames = new string[] { "id" };
            GridView2.DataBind();
        }
        else
        {
            GridView2.DataBind();
            p2.Visible = true;
        }
        sqlcon.Close();

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        panel1.Visible = true;
        
        int index = GridView1.SelectedIndex;
        SqlConnection sqlcon = new SqlConnection(WebConfigurationManager.ConnectionStrings["EPConnectionString"].ConnectionString);
        sqlcon.Open();
        ViewState["vs"] = GridView1.SelectedDataKey.Values["id"];
        string strselect = string.Format("select * from ep_usertalk where isreturn=0 and id={0} ", GridView1.SelectedDataKey.Values["id"]);
        SqlCommand sqlcmd = new SqlCommand(strselect, sqlcon);
        SqlDataReader dr = sqlcmd.ExecuteReader();
        if (dr.Read())
        {
            TextBox1.Text =HttpUtility.HtmlDecode(dr["username"].ToString());
            TextBox3.Text =HttpUtility.HtmlDecode(dr["usercontents"].ToString());
            TextBox6.Text =HttpUtility.HtmlDecode(dr["talkdate"].ToString());
        }
		sqlcon.Close();
        Response.Write("<script>window.location.href='#bbox'; </script>");
    }
    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {
        panel2.Visible = true;
        int index = GridView2.SelectedIndex;
        SqlConnection sqlcon = new SqlConnection(WebConfigurationManager.ConnectionStrings["EPConnectionString"].ConnectionString);
        sqlcon.Open();
        ViewState["vs2"] = GridView2.SelectedDataKey.Values["id"];
        string strselect = string.Format("select * from ep_instructortalk where isreturn=0 and id={0} ", GridView2.SelectedDataKey.Values["id"]);
        SqlCommand sqlcmd = new SqlCommand(strselect, sqlcon);
        SqlDataReader dr = sqlcmd.ExecuteReader();
        if (dr.Read())
        {
            TextBox7.Text = HttpUtility.HtmlDecode(dr["username"].ToString());
            TextBox8.Text = HttpUtility.HtmlDecode(dr["usercontents"].ToString());
            TextBox9.Text = HttpUtility.HtmlDecode(dr["talkdate"].ToString());
        }
        sqlcon.Close();
        Response.Write("<script>window.location.href='#abox'; </script>");
      
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (TextBox4.Text == "" || TextBox5.Text == "")
        {
            Response.Write("<script> alert('The reply and reply contents can not be empty!'); window.location.href='#bbox'; </script>");
          
            return;
        }
         else if (Session["ValidNums"].ToString() != this.tbCode.Text.Trim())
        {
            Response.Write("<script> alert('Verification code input errors!');window.location.href='#bbox'; </script>");
            return;
        }
        else
        
        {
            try
            {
                SqlConnection sqlcon = new SqlConnection(WebConfigurationManager.ConnectionStrings["EPConnectionString"].ConnectionString);
                sqlcon.Open();
                string strqxs = "";
                //strqxs = "update ep_usertalk set rename='" + TextBox4.Text + "',recontents='" + TextBox5.Text + "',redate='" + DateTime.Now.ToString() + "',isreturn=1 where id='" + ViewState["vs"].ToString() + "'";
                strqxs = "update ep_usertalk set rename=@rename,recontents=@recontents ,redate=@redate,uid=@uid,role=@role,isreturn=1 where id='" + ViewState["vs"].ToString() + "'";
                SqlCommand sqlcmd = new SqlCommand(strqxs, sqlcon);

                sqlcmd.Parameters.Add("@rename", SqlDbType.NVarChar);
                sqlcmd.Parameters["@rename"].Value = HttpUtility.HtmlEncode(this.TextBox4.Text.ToString());
                sqlcmd.Parameters.Add("@recontents", SqlDbType.NVarChar);
                sqlcmd.Parameters["@recontents"].Value = HttpUtility.HtmlEncode(this.TextBox5.Text.ToString());
				sqlcmd.Parameters.Add("@uid", SqlDbType.NVarChar,30);
				sqlcmd.Parameters["@uid"].Value = ViewState["ID"].ToString();
				sqlcmd.Parameters.Add("@role", SqlDbType.NVarChar,50);
				sqlcmd.Parameters["@role"].Value = ViewState["RT"].ToString();
                sqlcmd.Parameters.Add("@redate", SqlDbType.DateTime);
                sqlcmd.Parameters["@redate"].Value = DateTime.Now;
                sqlcmd.ExecuteNonQuery();
                sqlcon.Close();
            }
               
            catch (Exception ex)
            {
                Response.Write("<script> alert('Verification code input errors, please refresh the page!') </script>");
            }
          
        }
		Response.Write("<script> alert('Success Reply!') </script>");
        panel1.Visible = false;
        LoadStudentDatas();
    }
    protected void btnSub_Click(object sender, EventArgs e)
    {
        if (TextBox10.Text == "" || TextBox11.Text == "")
        {
            Response.Write("<script> alert('The reply and reply contents can not be empty!'); window.location.href='#bbox'; </script>");

            return;
        }
        else if (Session["ValidNums"].ToString() != this.tbCode2.Text.Trim())
        {
            Response.Write("<script> alert('Verification code input errors!');window.location.href='#abox'; </script>");
            return;
        }
        else
        {
            try
            {
                SqlConnection sqlcon = new SqlConnection(WebConfigurationManager.ConnectionStrings["EPConnectionString"].ConnectionString);
                sqlcon.Open();
                string strqxs = "";
                //strqxs = "update ep_usertalk set rename='" + TextBox4.Text + "',recontents='" + TextBox5.Text + "',redate='" + DateTime.Now.ToString() + "',isreturn=1 where id='" + ViewState["vs"].ToString() + "'";
                strqxs = "update ep_instructortalk set rename=@rename,recontents=@recontents ,redate=@redate,uid=@uid,role=@role,isreturn=1 where id='" + ViewState["vs2"].ToString() + "'";
                SqlCommand sqlcmd = new SqlCommand(strqxs, sqlcon);

                sqlcmd.Parameters.Add("@rename", SqlDbType.NVarChar,50);
                sqlcmd.Parameters["@rename"].Value = HttpUtility.HtmlEncode(this.TextBox10.Text.ToString());
                sqlcmd.Parameters.Add("@recontents", SqlDbType.NVarChar,50);
                sqlcmd.Parameters["@recontents"].Value = HttpUtility.HtmlEncode(this.TextBox11.Text.ToString());
                sqlcmd.Parameters.Add("@uid", SqlDbType.NVarChar, 30);
                sqlcmd.Parameters["@uid"].Value = ViewState["ID"].ToString();
                sqlcmd.Parameters.Add("@role", SqlDbType.NVarChar, 50);
                sqlcmd.Parameters["@role"].Value = ViewState["RT"].ToString();
                sqlcmd.Parameters.Add("@redate", SqlDbType.DateTime);
                sqlcmd.Parameters["@redate"].Value = DateTime.Now;
                sqlcmd.ExecuteNonQuery();
                sqlcon.Close();
            }

            catch (Exception ex)
            {
                Response.Write("<script> alert('Verification code input errors, please refresh the page!') </script>");
            }

        }
        Response.Write("<script> alert('Success Reply!') </script>");
        panel2.Visible = false;
        LoadInstructorDatas();

    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        panel1.Visible = false;               
    }
    protected void btnCan_Click(object sender, EventArgs e)
    {
        panel2.Visible = false;   
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("home.aspx");
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        mvManageComments.ActiveViewIndex = DropDownList1.SelectedIndex;
        if(DropDownList1.SelectedIndex==DropDownList1.Items.IndexOf(DropDownList1.Items.FindByValue("TeacherComments")))
        {
            LoadInstructorDatas();
            
        }

    }
   
}