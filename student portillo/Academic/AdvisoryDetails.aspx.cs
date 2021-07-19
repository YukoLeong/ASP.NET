using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Text;
using System.Text.RegularExpressions;
using System.Drawing;
using System.Net;
using System.Threading;
using System.Globalization;

public partial class Advice_AdvisoryDetails : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["id"] != null
                && Session["CODE"] != null
                && Session["class_Code"] != null
                && Session["role_teacher"] != null
                && Session["advisory_history"] != null)
            {

                // Previous Comments
                if (Session["advisory_history"].ToString() == "true")
                {
                    if (Session["CurrentUI"] != null && Session["CurrentUI"].ToString().Equals("zh-TW"))
                    {
                        ImageButton2.ImageUrl = "../images/homebluec.png";
                        ImageButton2.Attributes.Add("onmouseover", "this.src='../images/homebluec_hover.png'");
                        ImageButton2.Attributes.Add("onmouseout", "this.src='../images/homebluec.png'");
                    }

                    teacherPanel.Visible = false;
                    btn_post.Visible = false;
				    

                    string stdID = Session["stdID"].ToString();
                    string tc = Session["teacherCode"].ToString();

                    if (Session["class_Code"] != null && Session["class_Code"].ToString() != "" && Session["class_Code"].ToString().Contains("Advice"))
                        getPTopics(Session["id"].ToString(), Session["teacherCode"].ToString());
                    else
                    if (Session["class_Code"] != null && Session["class_Code"].ToString() != "")
                        getPTopics(Session["id"].ToString(), Session["class_Code"].ToString(), Session["teacherCode"].ToString());
                    else
                        getPTopics(Session["id"].ToString(), Session["teacherCode"].ToString() );

						getPCommentsByID(Session["id"].ToString());
                }
                else
                    if (Session["role_teacher"].ToString() == "teacher"
                        && Session["advisory_history"].ToString() == "false")
                    {
                        if (Session["CurrentUI"] != null && Session["CurrentUI"].ToString().Equals("zh-TW"))
                        {
                            ImageButton2.ImageUrl = "../images/homebluec.png";
                            ImageButton2.Attributes.Add("onmouseover", "this.src='../images/homebluec_hover.png'");
                            ImageButton2.Attributes.Add("onmouseout", "this.src='../images/homebluec.png'");
                        }

                        txt_teacherCode.Text = Session["teacherCode"].ToString();
                        txt_ClassCode.Text = Session["class_Code"].ToString();
                        if (Session["teacherName"] != null)
                            txt_teacherName.Text = Session["teacherName"].ToString();

                        //getStdNameByID(txt_StdID.Text);

                        string stdID = Session["stdID"].ToString();

                        if (Session["class_Code"] != null && Session["class_Code"].ToString() != "" && Session["class_Code"].ToString().Contains("Advice"))
                            getTopics(Session["id"].ToString(), Session["teacherCode"].ToString());
                        else
                        if (Session["class_Code"] != null && Session["class_Code"].ToString()!="")
                            getTopics(Session["id"].ToString(), Session["class_Code"].ToString(), Session["teacherCode"].ToString());
                        else
                            getTopics(Session["id"].ToString(), Session["teacherCode"].ToString());

                        setStatusToView(Session["id"].ToString());
                        getCommentsByID(Session["id"].ToString());
                        teacherPanel.Visible = true;
                        btn_post.Visible = true;
                    }

            }
            else
            {
                 ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please login!'); window.location='../staff.aspx';", true);  
            }

        }
    }

    private void setStatusToView(string id)
    {
        try
        {
            con.Open();

            StringBuilder sb = new StringBuilder();

            sb.Append("update AdvisoryDetails set status=1 where  topicID=@id and role = 'student' ");
            SqlCommand cmd = new SqlCommand(sb.ToString(), con);

            cmd.Parameters.AddWithValue("@id", id);

            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
        }
    }


    private void getPTopics(string id, string tc)
    {
        try
        {

            con.Open();

            StringBuilder sb = new StringBuilder();
            //sb.Append("SELECT distinct a.CODE, b.SUBJECT_EN, c.class_code, c.postDate, c.message, c.author ");
            //sb.Append("FROM teacher_course_info a inner join academic_result_info b ");
            //sb.Append("on a.SECTION_CODE = b.SECTION_CODE  inner join AdvisoryRemark c ");
            //sb.Append("on a.CODE = c.teacher_code ");
            //sb.Append("where  a.CODE=@tc and b.SUBJECT_CODE =@class_code and c.id=@id");


            sb.Append("SELECT distinct a.teacher_code,  a.class_code, a.postDate,a.message, 'Teacher' as author, 'false'e as display  ");
            sb.Append("from AdvisoryRemark a ");
            sb.Append("where a.teacher_code = @tc  and a.id= @id ");
            sb.Append("order by a.postDate desc;");


            SqlCommand cmd = new SqlCommand(sb.ToString(), con);
            cmd.Parameters.AddWithValue("@id", id);
            cmd.Parameters.AddWithValue("@tc", tc);



            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);


            SqlDataReader rdr1 = null;
            rdr1 = cmd.ExecuteReader();



            rpt2.DataSource = ds;
            rpt2.DataBind();
            rdr1.Close();

            rpt2.Visible = true;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
        }
    }

    private void getTopics(string id, string tc)
    {
        try
        {

            con.Open();

            StringBuilder sb = new StringBuilder();
            //sb.Append("SELECT distinct a.CODE, b.SUBJECT_EN, c.class_code, c.postDate, c.message, c.author ");
            //sb.Append("FROM teacher_course_info a inner join academic_result_info b ");
            //sb.Append("on a.SECTION_CODE = b.SECTION_CODE  inner join AdvisoryRemark c ");
            //sb.Append("on a.CODE = c.teacher_code ");
            //sb.Append("where  a.CODE=@tc and b.SUBJECT_CODE =@class_code and c.id=@id");


            sb.Append("SELECT distinct a.teacher_code,  a.class_code, a.postDate,a.message, a.author, 'true' as display ");
            sb.Append("from AdvisoryRemark a ");
            sb.Append("where a.teacher_code = @tc  and a.id= @id ");
            sb.Append("order by a.postDate desc;");


            SqlCommand cmd = new SqlCommand(sb.ToString(), con);
            cmd.Parameters.AddWithValue("@id", id);
            cmd.Parameters.AddWithValue("@tc", tc);
            


            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);


            SqlDataReader rdr1 = null;
            rdr1 = cmd.ExecuteReader();



            rpt2.DataSource = ds;
            rpt2.DataBind();
            rdr1.Close();

            rpt2.Visible = true;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
        }
    }

    private void getPTopics(string id, string class_code, string tc)
    {
        try
        {

            con.Open();

            StringBuilder sb = new StringBuilder();
            //sb.Append("SELECT distinct a.CODE, b.SUBJECT_EN, c.class_code, c.postDate, c.message, c.author ");
            //sb.Append("FROM teacher_course_info a inner join academic_result_info b ");
            //sb.Append("on a.SECTION_CODE = b.SECTION_CODE  inner join AdvisoryRemark c ");
            //sb.Append("on a.CODE = c.teacher_code ");
            //sb.Append("where  a.CODE=@tc and b.SUBJECT_CODE =@class_code and c.id=@id");


            sb.Append("SELECT distinct a.teacher_code, b.SUBJECT_EN+ ' '+b.SUBJECT_CH as subject_name, a.class_code, a.postDate,a.message, 'Teacher' as author,  'false' as display ");
            sb.Append("from AdvisoryRemark a inner join academic_result_info b ");
            sb.Append("on a.class_code = b.SUBJECT_CODE and a.std_id = b.STUDENT_ID ");
            sb.Append("where a.teacher_code = @tc  and a.class_code = @class_code and a.id= @id ");
            sb.Append("order by a.postDate desc;");


            SqlCommand cmd = new SqlCommand(sb.ToString(), con);
            cmd.Parameters.AddWithValue("@id", id);
            cmd.Parameters.AddWithValue("@tc", tc);
            cmd.Parameters.AddWithValue("@class_code", class_code);


            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);


            SqlDataReader rdr1 = null;
            rdr1 = cmd.ExecuteReader();

            rptTopics.DataSource = ds;
            rptTopics.DataBind();
            rdr1.Close();

            rptTopics.Visible = true;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
        }

    }


    private void getTopics(string id, string class_code, string tc)
    {
        try
        {

            con.Open();

            StringBuilder sb = new StringBuilder();
            //sb.Append("SELECT distinct a.CODE, b.SUBJECT_EN, c.class_code, c.postDate, c.message, c.author ");
            //sb.Append("FROM teacher_course_info a inner join academic_result_info b ");
            //sb.Append("on a.SECTION_CODE = b.SECTION_CODE  inner join AdvisoryRemark c ");
            //sb.Append("on a.CODE = c.teacher_code ");
            //sb.Append("where  a.CODE=@tc and b.SUBJECT_CODE =@class_code and c.id=@id");


            sb.Append("SELECT distinct a.teacher_code, b.SUBJECT_EN + ' '+ b.SUBJECT_CH  as subject_name , a.class_code, a.postDate,a.message, a.author, 'true' as display ");
            sb.Append("from AdvisoryRemark a inner join academic_result_info b ");
            sb.Append("on a.class_code = b.SUBJECT_CODE and a.std_id = b.STUDENT_ID ");
            sb.Append("where a.teacher_code = @tc  and a.class_code = @class_code and a.id= @id ");
            sb.Append("order by a.postDate desc;");
         

            SqlCommand cmd = new SqlCommand(sb.ToString(), con);
            cmd.Parameters.AddWithValue("@id", id);
            cmd.Parameters.AddWithValue("@tc", tc);
            cmd.Parameters.AddWithValue("@class_code", class_code);


            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);


            SqlDataReader rdr1 = null;
            rdr1 = cmd.ExecuteReader();

            rptTopics.DataSource = ds;
            rptTopics.DataBind();
            rdr1.Close();

            rptTopics.Visible = true;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
        }

    }

    private void getCommentsByID(string id)
    {
        try
        {

            con.Open();

            StringBuilder sb = new StringBuilder();


            sb.Append("SELECT distinct a.std_id, a.author,  b.message, b.postDate, a.class_code, b.id, b.topicID, b.role, b.poster, 'true' as display_date, b.status ");
            sb.Append("FROM AdvisoryRemark a right outer join AdvisoryDetails b ");
            sb.Append("on a.id = b.topicID ");
            sb.Append("where a.id= @id ");
            sb.Append("order by b.postDate ");
          

            SqlCommand cmd = new SqlCommand(sb.ToString(), con);

            cmd.Parameters.AddWithValue("@id", id);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);

            DataTable table = new DataTable();
            da.Fill(table);

            PagedDataSource pds = new PagedDataSource();
            pds.DataSource = table.DefaultView;
            pds.AllowPaging = true;
            pds.PageSize = 15;


            SqlDataReader rdr1 = null;
            rdr1 = cmd.ExecuteReader();


            int currentPage;

            if (Request.QueryString["page"] != null)
            {
                currentPage = Int32.Parse(Request.QueryString["page"]);
            }
            else
            {
                currentPage = pds.PageCount;
                linkNext.Style.Add("text-decoration", "none");
            }

            pds.CurrentPageIndex = currentPage - 1;

            if (Session["CurrentUI"] != null && Session["CurrentUI"].ToString().Equals("en-US"))
                Label1.Text = "Page " + currentPage + " of " + pds.PageCount;
            else if (Session["CurrentUI"] != null && Session["CurrentUI"].ToString().Equals("zh-TW"))
                Label1.Text = "第 " + currentPage + " 頁/ " + pds.PageCount + " 頁";

            if (!pds.IsFirstPage)
            {
                linkPrev.NavigateUrl = Request.CurrentExecutionFilePath + "?page=" + (currentPage - 1);
                linkNext.Style.Add("text-decoration", "none");
            }

            if (!pds.IsLastPage)
            {
                linkNext.NavigateUrl = Request.CurrentExecutionFilePath + "?page=" + (currentPage + 1);
                linkPrev.Style.Add("text-decoration", "none");
            }


            rptComments.DataSource = pds;
            rptComments.DataBind();
            rdr1.Close();




        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
        }

    }


    private void getPCommentsByID(string id)
    {
        try
        {

            con.Open();

            StringBuilder sb = new StringBuilder();


            //sb.Append("SELECT distinct a.std_id, a.author,  b.message, b.postDate, a.class_code, b.id, b.topicID, b.role, b.poster ");
            sb.Append("SELECT distinct 'std' as std_id, 'Teacher' as author,  b.message, b.postDate, a.class_code, b.id, b.topicID, b.role, b.role as poster, 'false' as display_date, b.status ");
            sb.Append("FROM AdvisoryRemark a right outer join AdvisoryDetails b ");
            sb.Append("on a.id = b.topicID ");
            sb.Append("where a.id= @id ");
            sb.Append("order by b.postDate ");


            SqlCommand cmd = new SqlCommand(sb.ToString(), con);

            cmd.Parameters.AddWithValue("@id", id);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);

            DataTable table = new DataTable();
            da.Fill(table);

            PagedDataSource pds = new PagedDataSource();
            pds.DataSource = table.DefaultView;
            pds.AllowPaging = true;
            pds.PageSize = 15;


            SqlDataReader rdr1 = null;
            rdr1 = cmd.ExecuteReader();


            int currentPage;

            if (Request.QueryString["page"] != null)
            {
                currentPage = Int32.Parse(Request.QueryString["page"]);
            }
            else
            {
                currentPage = pds.PageCount;
                linkNext.Style.Add("text-decoration", "none");
            }

            pds.CurrentPageIndex = currentPage - 1;

            if (Session["CurrentUI"] != null && Session["CurrentUI"].ToString().Equals("en-US"))
                Label1.Text = "Page " + currentPage + " of " + pds.PageCount;
            else if (Session["CurrentUI"] != null && Session["CurrentUI"].ToString().Equals("zh-TW"))
                Label1.Text = "第 " + currentPage + " 頁/ " + pds.PageCount +" 頁";

            if (!pds.IsFirstPage)
            {
                linkPrev.NavigateUrl = Request.CurrentExecutionFilePath + "?page=" + (currentPage - 1);
                linkNext.Style.Add("text-decoration", "none");
            }

            if (!pds.IsLastPage)
            {
                linkNext.NavigateUrl = Request.CurrentExecutionFilePath + "?page=" + (currentPage + 1);
                linkPrev.Style.Add("text-decoration", "none");
            }


            rptComments.DataSource = pds;
            rptComments.DataBind();
            rdr1.Close();




        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
        }

    }


    protected void btn_back_Click(object sender, EventArgs e)
    {
        
        Response.Redirect("AdvisoryRemark.aspx");
    }

    protected string removeHtmlTag(string Txt)
    {
        if (!Txt.Contains("br") && !Txt.Contains("img"))
            return Regex.Replace(Txt, "<[^>]*>", string.Empty);
        else
            return Txt;
    }


    public static Boolean isAlphaNumeric(string strToCheck)
    {
        Regex rg = new Regex(@"^[a-zA-Z0-9\s,]*$");
        return rg.IsMatch(strToCheck);
    } 


    protected void btn_post_Click(object sender, EventArgs e)
    {
        try
        {
			if ( Session["role_teacher"] ==null && Session["id"] == null)
				 ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please login!'); window.location='../staff.aspx';", true);
			 else
            if (txt_comments.Text == "" )
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please enter comments!'); ", true);
            else
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO AdvisoryDetails (topicID, message, postDate, poster, role, status) " +
                    "VALUES (@topicID, @message, @postDate, @poster, @role, @status)", con);

                cmd.Parameters.AddWithValue("@topicID", Session["id"].ToString());
                cmd.Parameters.AddWithValue("@message", removeHtmlTag(txt_comments.Text));
				/*
                string wrapText = addAutoBrTag(txt_comments.Text);

                cmd.Parameters.AddWithValue("@message", wrapText);
				*/
                cmd.Parameters.AddWithValue("@postDate", DateTime.Now);
                cmd.Parameters.AddWithValue("@poster", txt_teacherName.Text);
                cmd.Parameters.AddWithValue("@role", Session["role_teacher"].ToString());
                cmd.Parameters.AddWithValue("@status", false);

                cmd.ExecuteNonQuery();
            }

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            getCommentsByID(Session["id"].ToString());
            txt_comments.Text = "";
        }
    }

    protected void btn_home_Click(object sender, EventArgs e)
    {
        if (Session["Role_Type"] != null)
        {
            Response.Redirect("~/Academic/home.aspx");
        }
        else
        {
            if (Session["CurrentUI"] != null && Session["CurrentUI"].ToString().Equals("en-US"))
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please login!'); window.location='../staff.aspx';", true);
            else if (Session["CurrentUI"] != null && Session["CurrentUI"].ToString().Equals("zh-TW"))
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('請從新登入!'); window.location='../staff.aspx';", true);
        }

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