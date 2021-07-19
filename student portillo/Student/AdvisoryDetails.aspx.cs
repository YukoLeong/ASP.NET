using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Text.RegularExpressions;
using System.Text;
using System.Net;
using System.Threading;
using System.Globalization;

public partial class Student_AdvisoryDetails : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
       if (!IsPostBack) {
           if (Session["id"] != null
               && Session["std_id"] != null 
               && Session["class_Code"] != null
               && Session["role"]!=null
               && Session["TCode"]!=null)
           {
               if (Session["role"].ToString() == "student")
               {
                   if (Session["CurrentUI"] != null && Session["CurrentUI"].ToString().Equals("zh-TW"))
                   {
                       ImageButton2.ImageUrl = "../images/homebluec.png";
                       ImageButton2.Attributes.Add("onmouseover", "this.src='../images/homebluec_hover.png'");
                       ImageButton2.Attributes.Add("onmouseout", "this.src='../images/homebluec.png'");
                      
                   }

                   txt_StdID.Text = Session["std_id"].ToString();
                   txt_ClassCode.Text = Session["class_Code"].ToString();                
                   
                   getStdNameByID(txt_StdID.Text);

                   getTopics(Session["id"].ToString(), Session["std_id"].ToString(), Session["class_Code"].ToString(), Session["TCode"].ToString());
                   setStatusToView(Session["id"].ToString());
                   getCommentsByID(Session["id"].ToString());
                   stdPanel.Visible = true;

                   //setViewed
                
               }

           }
           else
           {
              
                   ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please login!'); window.location='../home.aspx';", true);
           
           }

       }
    }


    private void setStatusToView(string id)
    {
        try
        {
            con.Open();

            StringBuilder sb = new StringBuilder();

            sb.Append("update AdvisoryDetails set status=1 where  topicID=@id and role = 'teacher' ");
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
   
    private void getStdNameByID(string id)
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * FROM ep_class_grade where STUDENT_ID=@sID", con);

            cmd.Parameters.AddWithValue("@sID", id);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
          


            SqlDataReader rdr1 = null;
            rdr1 = cmd.ExecuteReader();

            while (rdr1.Read())
                if (rdr1["NAME"] != null)
                {
                    txt_StdName.Text = rdr1["NAME"].ToString();

                }
                

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


    private void getTopics(string id, string stdID, string class_code, string tc)
    {
        try
        {
            
            con.Open();

            SqlCommand cmd = null;
            if (class_code.Contains("Advice"))
            {
                StringBuilder sb = new StringBuilder();

                sb.Append("SELECT TOP 1 a.std_id, a.message ,a.class_code, a.author, a.postDate, b.COURSE ");
                sb.Append("FROM  AdvisoryRemark a left join ep_class_grade b ");
                sb.Append("on a.std_id = b.STUDENT_ID  ");
                sb.Append("where a.std_id = @stdID and a.id=@id");


                 cmd = new SqlCommand(sb.ToString(), con);
                cmd.Parameters.AddWithValue("@id", id);
                cmd.Parameters.AddWithValue("@stdID", stdID);
                cmd.Parameters.AddWithValue("@class_code", class_code);
            }
            else
            {
                StringBuilder sb = new StringBuilder();

                sb.Append("SELECT TOP 1 a.std_id, a.message ,a.class_code, a.author, a.postDate, b.COURSE +' '+ b.COURSE_CH as COURSE ");
                sb.Append("FROM  AdvisoryRemark a left join ep_class_grade b ");
                sb.Append("on a.std_id = b.STUDENT_ID and a.class_code = b.CLASS_CODE ");
                sb.Append("where a.std_id = @stdID and a.class_code =@class_code  and a.id=@id");


                 cmd = new SqlCommand(sb.ToString(), con);
                cmd.Parameters.AddWithValue("@id", id);
                cmd.Parameters.AddWithValue("@stdID", stdID);
                cmd.Parameters.AddWithValue("@class_code", class_code);
            }

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);



            SqlDataReader rdr1 = null;
            rdr1 = cmd.ExecuteReader();

            rptTopics.DataSource = rdr1;
            rptTopics.DataBind();
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

    private void getCommentsByID(string id)
    {
        try
        {

            con.Open();

            SqlCommand cmd = new SqlCommand("Select * FROM AdvisoryDetails  " +
                "where topicID = @ID " +
                "order by postDate ", con);

            cmd.Parameters.AddWithValue("@ID", id);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);

            DataTable table = new DataTable();
            da.Fill(table);

            PagedDataSource pds = new PagedDataSource();
            pds.DataSource = table.DefaultView;
            pds.AllowPaging = true;
            pds.PageSize = 10;

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

            SqlDataReader rdr1 = null;
            rdr1 = cmd.ExecuteReader();


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

    private string addAutoBrTag(string str)
    {
        bool fHasSpace = str.Contains(" ");

        if (str.Length > 62 && !fHasSpace && isAlphaNumeric(str))
        {
            return str.Substring(0, 62) + "<br />" + str.Substring(63);
        }


        return str;
    }

    protected void btn_post_Click(object sender, EventArgs e)
    {
        string str="";

        try {
			if ( Session["role"] ==null && Session["id"] == null)
				 ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please login!'); window.location='../home.aspx';", true);
			 else
            if (txt_comments.Text == "")
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please enter comments!'); ", true);
            else
            {
                str = txt_comments.Text;

                con.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO AdvisoryDetails (topicID, message, postDate, poster, role, status) " +
                    "VALUES (@topicID, @message, @postDate, @poster, @role, @status)", con);

                cmd.Parameters.AddWithValue("@topicID", Session["id"].ToString());
                //cmd.Parameters.AddWithValue("@message", removeHtmlTag(str));
				/*
                string wrapText = addAutoBrTag(txt_comments.Text);

                cmd.Parameters.AddWithValue("@message", wrapText);
				*/
                cmd.Parameters.AddWithValue("@message", removeHtmlTag(txt_comments.Text));

                cmd.Parameters.AddWithValue("@postDate", DateTime.Now);
                cmd.Parameters.AddWithValue("@poster", txt_StdName.Text);
                cmd.Parameters.AddWithValue("@role", Session["role"].ToString());
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


    protected void rRepeater_OnItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Update")
        {

            string id = ((Label)e.Item.FindControl("rlblID")).Text;
            string rmessage = ((Label)e.Item.FindControl("rlblMessage")).Text;
            //string rlbClassCode = ((Label)e.Item.FindControl("rlbClassCode")).Text;
            string rlblSender = ((Label)e.Item.FindControl("rlblSender")).Text;
            string rlblPostDate = ((Label)e.Item.FindControl("rlblPostDate")).Text;

            Session["commentsID"] = id;
            Session["rmessage"] = rmessage;
            //Session["rlbClassCode"] =rlbClassCode ;
            Session["rlblSender"]=rlblSender;
            Session["rlblPostDate"] = rlblPostDate;

            Response.Redirect("EditComments.aspx");
        }

    }

    protected void btn_home_Click(object sender, EventArgs e)
    {
        if (Session["Role_Type"]!=null && Session["Role_Type"].ToString() == "student")
        {
            Response.Redirect("home.aspx");

        } 
        else
        if (Session["position"] != null && Session["position"].ToString() == "studentview")
        {
            if (Session["Role_Type"].ToString() == "teacher" || Session["Role_Type"].ToString() == "tutor" || Session["Role_Type"].ToString() == "coordinator" || Session["Role_Type"].ToString() == "director")
            {
                Session["Role_Type"] = "teacher";
                Response.Redirect("schoolStaff.aspx");
            }
        }

        Response.Write("<script>alert('Please Log In !'); window.location.href='../home.aspx'; </script>");

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