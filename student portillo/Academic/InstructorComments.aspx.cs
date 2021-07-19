using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;
using System.Globalization;
public partial class Instructor_InstructorComments : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Session["CODE"] = "Swng";
        //Session["Role_Type"] = "teacher";
        if (!Page.IsPostBack)
        {


            if (string.IsNullOrEmpty((string)System.Web.HttpContext.Current.Session["CODE"]))
            {


                Session["Role_Type"] = "";
                Response.Write("<script>alert('Please Log In !'); window.location.href='../staff.aspx'; </script>");
            }
            else
            {
                ViewState["code"] = Session["CODE"].ToString();
                ViewState["roletype"] = Session["Role_Type"].ToString();
                dlBind();

            }
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (tbName.Text == "" || tbContents.Text == "")
        {
            Response.Write("<script> alert('The name and contents can not be empty!'); window.location.href='#bbox'; </script>");
            return;
        }
        else if (Session["ValidNums"].ToString() != this.tbCode.Text.Trim())
        {
            Response.Write("<script> alert('Verification code input errors!');window.location.href='#bbox'; </script>");
            return;
        }
        else
        {
            // Connect to the database
            try
            {
                SqlConnection sqlcon = new SqlConnection(WebConfigurationManager.ConnectionStrings["EPConnectionString"].ConnectionString);

                sqlcon.Open();
                string strselect = "select * from ep_instructortalk where usercontents=@usercontents and username=@username ";
                SqlCommand sqlcmd = new SqlCommand(strselect, sqlcon);

                sqlcmd.Parameters.Add("@username", SqlDbType.NVarChar);
                sqlcmd.Parameters["@username"].Value = HttpUtility.HtmlEncode(this.tbName.Text.ToString());
                sqlcmd.Parameters.Add("@usercontents", SqlDbType.NVarChar, 5000);
                sqlcmd.Parameters["@usercontents"].Value = HttpUtility.HtmlEncode(this.tbContents.Text.ToString());
                string StrInsert = "";
                // Query is executed, it is determined whether to save the same message
                SqlDataReader dr = sqlcmd.ExecuteReader();
                if (dr.Read())
                {
                    Response.Write("<script> alert('Messages can not be repeated!') </script>");
                    return;
                }
                // Close Read
                dr.Close();
                // Insert data

                StrInsert = "insert into ep_instructortalk(username,useremail,code,roletype,usercontents,talkdate,isreturn) values(@username,@useremail,@code,@roletype,@usercontents,@talkdate, 0 )";

                SqlCommand cmd = new SqlCommand(StrInsert, sqlcon);
                //Add the parameter and set the parameter values
                cmd.Parameters.Add("@username", SqlDbType.NVarChar, 50);
                cmd.Parameters["@username"].Value = HttpUtility.HtmlEncode(this.tbName.Text.ToString());
                cmd.Parameters.Add("@useremail", SqlDbType.NVarChar, 50);
                cmd.Parameters["@useremail"].Value = this.tbEmail.Text.ToString();
                cmd.Parameters.Add("@code", SqlDbType.NVarChar, 30);
                cmd.Parameters["@code"].Value = ViewState["code"].ToString();
                cmd.Parameters.Add("@roletype", SqlDbType.NVarChar, 30);
                cmd.Parameters["@roletype"].Value = ViewState["roletype"].ToString();
                cmd.Parameters.Add("@usercontents", SqlDbType.NVarChar, 5000);
                cmd.Parameters["@usercontents"].Value = HttpUtility.HtmlEncode(this.tbContents.Text.ToString());

                cmd.Parameters.Add("@talkdate", SqlDbType.DateTime, 50);
                cmd.Parameters["@talkdate"].Value = DateTime.Now;
                // Perform an operation to insert data
                cmd.ExecuteNonQuery();
                sqlcon.Close();
                dlBind();
                Response.Write("<script> alert('Success Message!') </script>");
            }
            catch (Exception ex)
            {    //Response.Write(ex.StackTrace.ToString());
                Response.Write("<script> alert('Verification code input errors, please refresh the page!') </script>");
            }


        }
    }

    public void dlBind()
    {
        DataSet ds = new DataSet();
        try
        {
            SqlConnection sqlcon = new SqlConnection(WebConfigurationManager.ConnectionStrings["EPConnectionString"].ConnectionString);
            sqlcon.Open();
            SqlDataAdapter da = new SqlDataAdapter("select id,username,useremail,usercontents,talkdate,isreturn,recontents from ep_instructortalk  order by id desc", sqlcon);
            da.Fill(ds, "iid");
            sqlcon.Close();
        }
        catch (Exception ex)
        {

            Response.Write(ex.ToString());
        }
        // Paging function call
        if (Session["CurrentUI"] != null)
            this.PageInfo.InnerHtml = PageNums.GetPageNum(ds, DataList1, 10, Session["CurrentUI"].ToString());
        else
            this.PageInfo.InnerHtml = PageNums.GetPageNum(ds, DataList1, 10, null);


    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        this.tbName.Text = "";
        this.tbContents.Text = "";
        this.tbEmail.Text = "";
        this.tbCode.Text = "";
        Response.Write("<script>window.location.href='#bbox'; </script>");
    }

    protected override void InitializeCulture()
    {
        base.InitializeCulture();

        if (Session["CurrentUI"] != null)
        {
            String selectedLanguage = (string)Session["CurrentUI"];
            UICulture = selectedLanguage;
            Culture = selectedLanguage;

            Thread.CurrentThread.CurrentCulture =
                CultureInfo.CreateSpecificCulture(selectedLanguage);
            Thread.CurrentThread.CurrentUICulture = new
                CultureInfo(selectedLanguage);
        }

        base.InitializeCulture();
    }

}