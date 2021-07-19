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
using System.Collections;
using System.Web.Services;
using System.Threading;
using System.Globalization;

public partial class Instructor_Attendance : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ToString());
    public int total_Stu = 0;
    public string year = "";
    public string class_code = "";
    public string teacher_code = "";
	protected string strCurrent="";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //Session["CODE"] = "0342";
            if (Session["CODE"] != null)
            {
                teacher_code = Session["CODE"].ToString();
                loadSubjectCode();
             }
            else
            {
                Response.Write("<script>alert('Please Log In !'); window.location.href='../home.aspx'; </script>");
            }
        }
    }
    private void loadSubjectCode()
    {
        subjectList.Items.Clear();
        try
        {
            con.Open();


            subjectList.Items.Clear();

            StringBuilder sb = new StringBuilder();

            sb.Append(" SELECT distinct a.SECTION_YEAR,a.SECTION_CODE,b.CLASS_CODE,b.SEMESTRE  ");
            sb.Append(" FROM teacher_course_info a  ");
            sb.Append(" Inner JOIN ep_class_grade b on  ");
            sb.Append(" a.SECTION_YEAR=b.SECT_ANOL_ANO AND a.SECTION_CODE=b.SECT_COD  ");
            sb.Append(" where  a.CODE=@tc and b.CLASS_CODE is not null  ");
            sb.Append(" order by a.SECTION_YEAR desc ");         

            SqlCommand cmd = new SqlCommand(sb.ToString(), con);
            cmd.Parameters.AddWithValue("@tc", teacher_code);


            SqlDataReader rdr = null;
            rdr = cmd.ExecuteReader();

            while (rdr.Read())
            {
                string item = rdr["SECTION_YEAR"].ToString().Trim() + "->" + rdr["CLASS_CODE"].ToString().Trim() + "->" + rdr["SECTION_CODE"].ToString().Trim();
                string value = rdr["SECTION_YEAR"].ToString().Trim() + "|" + rdr["SECTION_CODE"].ToString().Trim() + "|" + teacher_code;
                subjectList.Items.Add(new ListItem(item, value));
             }
            subjectList.DataBind();

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

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        if (Session["CODE"] != null)
            Response.Redirect("~/Academic/home.aspx");
        else
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
            strCurrent=selectedLanguage;
            Thread.CurrentThread.CurrentCulture =
                CultureInfo.CreateSpecificCulture(selectedLanguage);
            Thread.CurrentThread.CurrentUICulture = new
                CultureInfo(selectedLanguage);
        }

        base.InitializeCulture();
    }
}