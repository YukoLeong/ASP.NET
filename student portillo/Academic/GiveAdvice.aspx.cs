using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Text.RegularExpressions;
using System.Collections;
using System.Text;
using System.Threading;
using System.Globalization;

public partial class Advice_GiveAdvice : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ToString());

    string std_id = "";
    string yrs = "";
    string class_code = "";
    string teacher_code = "";
    string pess_cod = "";

    protected void Page_Load(object sender, EventArgs e)
    {


        if (Session["CODE"]!=null && Session["studentID"] != null &&
            Session["class_code"]!=null && Session["year"] !=null )
        {

            if (Session["class_code"].ToString().Contains("Advice") || String.IsNullOrEmpty(Session["class_code"].ToString()))
            { 
                lbl_classCode.Style.Add("display","none");
                txt_class_code.Style.Add("display", "none");
            }

            std_id = Session["studentID"].ToString();
            yrs = Session["year"].ToString();
            class_code = Session["class_code"].ToString();
            teacher_code = Session["CODE"].ToString();
            pess_cod=getPessCodeByStdID(std_id);

            ArrayList result = new ArrayList();

            result = EpDao.getALUN_NUMERO(std_id);
            
            this.txt_receiver.Text = getStdNameByNumero(result[0].ToString(), result[1].ToString());

            //this.txt_receiver.Text = getStdNameByNumero(Session["ALUN_NUMERO"].ToString(), Session["ALUN_NUMERO_SEQ"].ToString());
            this.txt_author.Text = getTeacherNameByCode(teacher_code);
            this.txt_sid.Text = std_id;
            this.txt_class_code.Text = class_code;

           

            txt_alun_numero.Text = result[0].ToString();
            txt_alun_seq.Text = result[1].ToString();
         
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please login!'); window.location='../staff.aspx';", true);
        }

    }

    private string getPessCodeByStdID(string stdID)
    {
        string pess_code = null;

        try
        {
            con.Open();

            StringBuilder sql = new StringBuilder();

            sql.Append("SELECT PESS_COD ");

            sql.Append("FROM student_academic_info ");

            sql.Append("where STUDENT_ID = @stdID;");

            SqlCommand cmd = new SqlCommand(sql.ToString(), con);

            cmd.Parameters.AddWithValue("@stdID", stdID);

            SqlDataReader rdr1 = null;
            rdr1 = cmd.ExecuteReader();

            while (rdr1.Read())
            {
                if (rdr1["PESS_COD"] != null)
                    pess_code = rdr1["PESS_COD"].ToString();

            }

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
        }

        return pess_code;
    }


    public string getStdNameByNumero(string numero, string numeroSeq)
    {
        string std_name = "";

        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT distinct name " +
                 "FROM ep_class_grade a where a.NUMERO =@numero  and a.NUMERO_SEQ=@numeroseq", con);

            cmd.Parameters.AddWithValue("@numero", numero);
            cmd.Parameters.AddWithValue("@numeroseq", numeroSeq);

            SqlDataReader rdr3 = null;
            rdr3 = cmd.ExecuteReader();

            while (rdr3.Read())
            {
                if (rdr3["name"] != null)
                    std_name = rdr3["name"].ToString();

            }

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
        }


        return std_name;
    }

    public string getTeacherNameByCode(string code)
    {
        string teacherName = "";

        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT distinct isnull(name_ch, name_pt) as name "+
                        "FROM teacher_course_info "+
                        "where CODE = @tcode", con);

            cmd.Parameters.AddWithValue("@tcode", code);

            SqlDataReader rdr3 = null;
            rdr3 = cmd.ExecuteReader();

            while (rdr3.Read())
            {
                if (rdr3["name"] != null)
                    teacherName = rdr3["name"].ToString();

            }

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
        }


        return teacherName;
    }


    public static string RemoveHTMLTag(string htmlSource)
    {
        //remove javascript code.
        //htmlSource = Regex.Replace(htmlSource, @"<script[\d\D]*?>[\d\D]*?</script>", String.Empty);

        //remove html tag.
        if (!htmlSource.Contains("br") && !htmlSource.Contains("img"))
            return Regex.Replace(htmlSource, @"<[^>]*>", String.Empty);
        else 
        return htmlSource;
    }

    protected void btn_send_Click(object sender, EventArgs e)
    {

        try
        {
            if (txt_message.Text == "")
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please enter comments!'); ", true);
            else
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("INSERT INTO AdvisoryRemark (std_id, year, class_code, title,message, author ,postDate ,status, teacher_code, ALUN_NUMERO, ALUN_NUMERO_SEQ, PESS_COD) " +
                    "VALUES (@std_id, @year, @class_code, @title, @message, @author, @post_date, @status, @teacherCode, @alun_num, @alun_seq, @pess)", con);

                cmd.Parameters.AddWithValue("@std_id", std_id);
                cmd.Parameters.AddWithValue("@year", yrs);

                if (class_code == "")
                {
                    switch (Session["Role_Type"].ToString())
                    {
                        case "director":
                            cmd.Parameters.AddWithValue("@class_code", "DirectorAdvice");
                            break;
                        case "coordinator":
                            cmd.Parameters.AddWithValue("@class_code", "CoordinatorAdvice");
                            break;
                        case "tutor":
                            cmd.Parameters.AddWithValue("@class_code", "tutorAdvice");
                            break;
                        default:
                            cmd.Parameters.AddWithValue("@class_code", class_code);
                            break;
                    }
                }
                else
                    cmd.Parameters.AddWithValue("@class_code", class_code);


                cmd.Parameters.AddWithValue("@title", this.txt_title.Text);
                cmd.Parameters.AddWithValue("@message", RemoveHTMLTag(this.txt_message.Text.ToString()));
                cmd.Parameters.AddWithValue("@author", this.txt_author.Text);
                cmd.Parameters.AddWithValue("@post_date", DateTime.Now);
                cmd.Parameters.AddWithValue("@teacherCode", teacher_code);
                cmd.Parameters.AddWithValue("@status", "Unread");
                cmd.Parameters.AddWithValue("@alun_num", txt_alun_numero.Text);
                cmd.Parameters.AddWithValue("@alun_seq", txt_alun_seq.Text);
                cmd.Parameters.AddWithValue("@pess", pess_cod);

                cmd.ExecuteNonQuery();
                Response.Redirect("AdvisoryRemark.aspx");
            }

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
           // txt_success.Visible = true;
            btn_send.Enabled = false;

           
        }
    }

    protected void btn_back_Click(object sender, EventArgs e)
    {
        //if (Session["Role_Type"].ToString() == "teacher")
        //{
            
        //    Response.Redirect("../Teacher/"+Session["page"].ToString());
        //}

        //if (Session["Role_Type"].ToString() == "tutor")
        //{

        //    Response.Redirect("../YearTutor/"+Session["page"].ToString());
        //}

        //if (Session["Role_Type"].ToString() == "coordinator")
        //{

        //    Response.Redirect("../ProgrammeCoordinator/" + Session["page"].ToString());
        //}

        //if (Session["Role_Type"].ToString() == "director")
        //{

        //    Response.Redirect("../Director/"+Session["page"].ToString());

        //}

        /*
        System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<script language='javascript' >");
            sb.Append(" alert('hello')");
            sb.Append("</script>");

            Page.ClientScript.RegisterStartupScript(this.GetType(), "", sb.ToString(), false);
    */   
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