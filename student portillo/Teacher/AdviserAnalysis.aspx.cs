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


public partial class Teacher_AdviserAnalysis : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["CODE"] != null)
        {
            if (!Page.IsPostBack)
            {
                
                loadDropDownList();
            }       
        }
        else
        {
            //Response.Write("<script>alert('Please login!')</script>");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please login!'); window.location='../login.aspx';", true);

            //Response.Redirect("~/login.aspx");
        }


    }


    private bool showResult()
    {         

        try
        {
            saveSelection();

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ToString());
            con.Open();

            StringBuilder sql = new StringBuilder();            

            //sql.Append(" SELECT s.pess_cod, s.name_pt as student_name , t.name_pt as teacher_name , s.gpa, a.subject_en ,a.SUBJECT_CODE , a.subject_status ");
            sql.Append(" SELECT a.student_id as [STUDENT_ID], s.pess_cod as [PESS COD], s.name_pt as [STUDENT NAME] , s.gpa as [GPA] , a.subject_code as [SUBJECT_CODE]  ,a.subject_code+' - '+a.subject_en as [SUBJECT], ra.id as [RID] ,ra.title as [REMARK TITLE] , convert(char(10), ra.postDate, 120) as [REMARK DATE] , t.code as [TEACHER_CODE], t.name_pt as [TEACHER_NAME]");
            sql.Append(" FROM (SELECT * FROM AdvisoryRemark WHERE year = @year)  ra ");
            sql.Append(" LEFT OUTER JOIN (SELECT * FROM academic_result_info WHERE section_year = @year) a ");
            sql.Append(" ON ra.std_id = a.student_id  ");
            sql.Append(" AND ra.class_CODE = a.subject_code  ");
            //sql.Append(" FROM (SELECT * FROM academic_result_info WHERE section_year = @year)  a ");
            sql.Append(" LEFT OUTER JOIN (SELECT * FROM teacher_course_info WHERE section_year = @year) t ");
            sql.Append(" ON a.SECTION_CODE = t.SECTION_CODE ");
            sql.Append(" LEFT OUTER JOIN (SELECT * FROM student_academic_info  ) s ");
            sql.Append(" ON a.pess_cod = s.pess_cod ");
            sql.Append(" WHERE ((CONVERT(decimal(18,4),  s.gpa) <= (CASE WHEN (@gpaChecked = 1) THEN 1.5 ELSE 5.0 END) AND CONVERT(decimal(18,4),  s.gpa) <>0) ");

            if (failChkBox.Checked)
            {
                sql.Append("        AND s.pess_cod IN (SELECT pess_cod FROM academic_result_info  ");
                sql.Append("                           WHERE  subject_status = 'F' AND section_year = @year ");
                sql.Append("                           GROUP BY pess_cod ");
                sql.Append("                           HAVING COUNT(pess_cod) >=3 )) ");
            }
            else
                sql.Append(" ) ");

            if (ProgrammeDdList.SelectedIndex != 0)
            {
                sql.Append("        AND s.program_code = @proCode ");
            }


            if (CourseDdList.SelectedIndex != 0)
            {
                sql.Append("        AND a.subject_code = @subjectCode ");
            }

            //sql.Append(" AND t.teacher_course_info ='');
            sql.Append(" GROUP BY a.student_id ,s.pess_cod, s.name_pt ,s.gpa, a.subject_code , a.subject_en , ra.id ,ra.title , ra.postDate , t.code, t.name_pt");
            sql.Append(" ORDER BY ra.postDate; ");
            
            SqlCommand cmd = new SqlCommand(sql.ToString(), con);

            cmd.Parameters.AddWithValue("@year", YearDdList.SelectedValue);
            cmd.Parameters.AddWithValue("@subjectCode", CourseDdList.SelectedValue);
            cmd.Parameters.AddWithValue("@proCode", ProgrammeDdList.SelectedValue);

            if (gpaChkBox.Checked)            
                cmd.Parameters.AddWithValue("@gpaChecked", 1);            
            else
                cmd.Parameters.AddWithValue("@gpaChecked", 0);


            SqlDataAdapter da = new SqlDataAdapter(cmd);

            DataSet ds = new DataSet();
            da.Fill(ds);

            ResultGrid.DataSource = ds.Tables[0];
            ResultGrid.DataBind();

            if (ds.Tables[0].Rows.Count == 0)
            {
                NoResultLabel.Text = "No record found";
            }

           /* if (ResultGrid.HeaderRow != null)
            {                
                ResultGrid.HeaderRow.Cells[0].ControlStyle.Width = Unit.Pixel(100);
                ResultGrid.HeaderRow.Cells[1].ControlStyle.Width = Unit.Pixel(300);
                ResultGrid.HeaderRow.Cells[2].ControlStyle.Width = Unit.Pixel(100);
                ResultGrid.HeaderRow.Cells[3].ControlStyle.Width = Unit.Pixel(200);
                ResultGrid.HeaderRow.Cells[4].ControlStyle.Width = Unit.Pixel(200);
            }*/
           

            con.Close();

            Session["role"] = "teacher";
            Session["role_teacher"] = "teacher";
            //Session["std_id"] = Session["teacherCode"].ToString();
            Session["author"] = Session["teacher_name"].ToString();
            

            return true;
        }
        catch (Exception ex)
        {
            throw ex;
            return false;
        }
        
    }

    private bool loadDropDownList()
    {
        if (loadYearDdList())
        {
            loadProgrammeList();
            //loadCourseList();
        }
        return true;
    }

    private void saveSelection()
    {
        HttpContext.Current.Session["aaYearSelected"] = YearDdList.SelectedIndex;
        HttpContext.Current.Session["aaCourseSelected"] = CourseDdList.SelectedIndex;
        HttpContext.Current.Session["aaProgrammeSelected"] = ProgrammeDdList.SelectedIndex;
        HttpContext.Current.Session["aaGpaChecked"] = gpaChkBox.Checked;
        HttpContext.Current.Session["aaFailChecked"] = failChkBox.Checked;
        
    }

    private void restoreSelection()
    {        
        YearDdList.SelectedIndex = Int16.Parse(HttpContext.Current.Session["aaYearSelected"].ToString());
        CourseDdList.SelectedIndex = Int16.Parse(HttpContext.Current.Session["aaCourseSelected"].ToString());
        ProgrammeDdList.SelectedIndex = Int16.Parse(HttpContext.Current.Session["aaProgrammeSelected"].ToString());
        gpaChkBox.Checked = Boolean.Parse(HttpContext.Current.Session["aaGpaChecked"].ToString());
        failChkBox.Checked = Boolean.Parse(HttpContext.Current.Session["aaFailChecked"].ToString());
    }

    private bool loadYearDdList()
    {
        int nowYear = Int16.Parse(DateTime.Now.ToString("yyyy"));
        ArrayList allYear = new ArrayList();

        for (int i = nowYear-1; i >=1999; i--)
        {
            string sectionYear = i.ToString().Substring(2,2) + "/" +  (i+1).ToString().Substring(2,2);
            YearDdList.Items.Add(new ListItem(sectionYear,sectionYear));
        }

        YearDdList.DataBind();
        YearDdList.SelectedIndex = 1;
        return true;
    }



    private bool loadCourseList()
    {
        try
        {
            CourseDdList.Items.Clear();
            CourseDdList.Items.Add(new ListItem("--Select Course--", null));

            if (YearDdList.SelectedIndex != 0 && ProgrammeDdList.SelectedIndex != 0)
            {

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ToString());
                con.Open();

                StringBuilder sql = new StringBuilder();
                sql.Append(" SELECT a.subject_code ");
                sql.Append(" FROM (SELECT * FROM academic_result_info WHERE section_year = @year) a ");
                sql.Append(" LEFT OUTER JOIN student_academic_info s ");
                sql.Append(" ON a.pess_cod = s.pess_cod ");
                sql.Append(" WHERE s.PROGRAM_CODE = @proCode ");
                sql.Append(" GROUP BY a.subject_code ");
                sql.Append(" ORDER BY a.subject_code ");

                SqlCommand cmd = new SqlCommand(sql.ToString(), con);
                cmd.Parameters.AddWithValue("@year", YearDdList.SelectedValue);
                cmd.Parameters.AddWithValue("@proCode", ProgrammeDdList.SelectedValue);

                SqlDataAdapter da = new SqlDataAdapter(cmd);

                DataSet ds = new DataSet();
                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        CourseDdList.Items.Add(new ListItem(dr[0].ToString(), dr[0].ToString()));
                    }
                }

                CourseDdList.DataBind();
                con.Close();

            }

            return true;
        }
        catch (Exception ex)
        {
            throw ex;
            return false;
        }
    }

    private bool loadProgrammeList()
    {
        try
        {
            ProgrammeDdList.Items.Clear();
            ProgrammeDdList.Items.Add(new ListItem("--Select Programme--", null));

            if (YearDdList.SelectedIndex != 0)
            {

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ToString());
                con.Open();

                StringBuilder sql = new StringBuilder();
                sql.Append(" SELECT s.program_en  , s.program_code ");
                sql.Append(" FROM student_academic_info s ");
                sql.Append(" LEFT OUTER JOIN academic_result_info a ");
                sql.Append(" ON s.pess_cod = a.pess_cod ");
                sql.Append(" LEFT OUTER JOIN teacher_course_info t ");
                sql.Append(" ON a.section_year = t.section_year AND a.section_code = t.section_code ");
                sql.Append(" WHERE t.code = @tcode ");
                sql.Append(" GROUP BY s.program_en , s.program_code;");


                SqlCommand cmd = new SqlCommand(sql.ToString(), con);
                cmd.Parameters.AddWithValue("@tcode", Session["CODE"].ToString());

                SqlDataAdapter da = new SqlDataAdapter(cmd);

                DataSet ds = new DataSet();
                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        ProgrammeDdList.Items.Add(new ListItem(dr[0].ToString(), dr[1].ToString()));
                    }
                }

                ProgrammeDdList.DataBind();
                con.Close();

            }

            return true;
        }
        catch (Exception ex)
        {
            throw ex;
            return false;
        }
    }

    protected void YearDdList_SelectedIndexChanged(object sender, EventArgs e)
    {
        loadCourseList();
    }


    protected void failChkBox_CheckedChanged(object sender, EventArgs e)
    {

    }


    protected void searchButton_Click(object sender, EventArgs e)
    {
        if (Session["CODE"] != null)
        {
            ResultGrid.PageIndex = 0;
            if (YearDdList.SelectedIndex != 0 && ProgrammeDdList.SelectedIndex != 0)
            {
                showResult();
            }
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please login!'); window.location='../login.aspx';", true);
        }
    
    }


    protected void ResultGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        restoreSelection();
        ResultGrid.PageIndex = e.NewPageIndex;
        showResult();
    }

    protected void ResultGrid_Sorting(object sender, GridViewSortEventArgs e)
    {
        restoreSelection();        
    }

    protected void ProgrammeDdList_SelectedIndexChanged(object sender, EventArgs e)
    {
        loadCourseList();
    }
}