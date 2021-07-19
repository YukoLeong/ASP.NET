using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.DataVisualization.Charting;
using System.Drawing;
using System.Data;
using System.Collections;
using System.Threading;
using System.Globalization;




public partial class ProgrammeCoordinator_ProgramSubjects : System.Web.UI.Page
{
    public struct AverageStdevp
    {
        public Double Average { get; set; }
        public Double Stdevp { get; set; }

    }

    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Role_Type"] != null
                && Session["School_code"] != null
                && Session["Programme"]!=null)
            {
                if (Session["CurrentUI"] != null && Session["CurrentUI"].ToString().Equals("zh-TW"))
                {
                    ImageButton2.ImageUrl = "../images/homebluec.png";
                    ImageButton2.Attributes.Add("onmouseover", "this.src='../images/homebluec_hover.png'");
                    ImageButton2.Attributes.Add("onmouseout", "this.src='../images/homebluec.png'");

                    viewButton.ImageUrl = "../images/detailc1.png";
                    viewButton.Attributes.Add("onmouseover", "this.src='../images/detailc2.png'");
                    viewButton.Attributes.Add("onmouseout", "this.src='../images/detailc1.png'");


                    btn_search.ImageUrl = "../images/searchc1.png";
                    btn_search.Attributes.Add("onmouseover", "this.src='../images/searchc2.png'");
                    btn_search.Attributes.Add("onmouseout", "this.src='../images/searchc1.png'");


                    adviseButton.ImageUrl = "../images/advicec1.png";
                    adviseButton.Attributes.Add("onmouseover", "this.src='../images/advicec1.png'");
                    adviseButton.Attributes.Add("onmouseout", "this.src='../images/advicec1.png'");
                                       
                }


                txt_school.Text = EpDao.getSchoolName(Session["School_code"].ToString());
                
                //HashSet<String> hs = getSchool(Session["Programme"].ToString());

                //foreach (String s in hs)
                //{
                //    txt_school.Items.Add(new ListItem( EpDao.getSchoolNameEN(s),  EpDao.getSchoolNameEN(s)));
                //}

                string programCodeList = getProgram(Session["Programme"].ToString());

                bindProgramNameEN(programCodeList);
                
               // getAcadYear();

               // getCourse();
            }

            else
            {
               ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please login!'); window.location='../staff.aspx';", true);
            }
            
        }
    }

    protected HashSet<String> getSchool(string programStr)
    {
        //StringBuilder proString = new StringBuilder();

        HashSet<String> hashset = new HashSet<String>();

        string s = programStr;
        string[] words = s.Split('.', '_', ',');

        int i = 0;
        int nexti = 0;

        while (nexti <= words.Length - 1)
        {
           
            hashset.Add(words[nexti].ToString());
            
            i++;
            nexti = 2 * i ;
            
        }

        return hashset;
    }
    protected string  getProgram(string programStr)
    {
        StringBuilder proString = new StringBuilder();

        string s = programStr;
        string[] words = s.Split('.', '_', ',');

        int i = 1;
        int nexti = 1;

        while (nexti <= words.Length-1)
        {
            if (nexti == words.Length - 1)
                proString.Append("'"+ words[nexti].ToString() +"'");
            else
                proString.Append( "'"+ words[nexti].ToString()+ "'," );

            nexti = 2 * i + 1;
            i++;
        }

        return proString.ToString();
    }

    public void bindProgramNameEN(string programString)
    {
             
        try
        {
            conn.Open();
            StringBuilder sb = new StringBuilder();
            HashSet<String> hashset = new HashSet<String>();

            SqlCommand cmd = new SqlCommand("SELECT DISTINCT " +
           "CODE, NAME, PROGRAM_COMPOSITE_EN, PROGRAM_EN " +
           "FROM program_info " +
           "WHERE SIMPLIFY_CODE in (" + programString + ")", conn);

            //cmd.Parameters.AddWithValue("@str", programString);         


            SqlDataReader rdr = null;
            rdr = cmd.ExecuteReader();

            while (rdr.Read())
            {
                if (rdr["PROGRAM_EN"] != null)
                {
                   // programList.Items.Add(new ListItem(rdr["PROGRAM_EN"].ToString(), rdr["PROGRAM_EN"].ToString()));
                    //hashset.Add(rdr["PROGRAM_PT"].ToString());

                    programList.Items.Add(new ListItem(rdr["CODE"].ToString() + " " + rdr["NAME"].ToString() + " " +
                    rdr["PROGRAM_COMPOSITE_EN"].ToString(), rdr["CODE"].ToString()));
                }
            }

           // foreach (String s in hashset)
           // {
               // programList.Items.Add(new ListItem(s,s));
           // }
				
		   
		   
		   
            programList.DataBind();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }
        
    }

    protected void getAcadYear()
    {
        //ListBox1.Items.Clear();
        //ListBox1.Items.Insert(0, new ListItem("--Select--", ""));
        yearList.Items.Clear();
        yearList.Items.Insert(0, new ListItem(GetGlobalResourceObject("Resource", "sip_pls_select2").ToString(), ""));
        try
        {
            conn.Open();
           
           // SqlCommand cmd = new SqlCommand("SELECT distinct substring(subjectCode,0,6)as subject FROM teacherSt order by substring(subjectCode,0,6) desc", conn);
            //SqlCommand cmd = new SqlCommand("SELECT distinct YEAR "+
            //                                "FROM ep_class_grade "+
            //                                "WHERE SCHOOL = @school and SIMPLIFY_CODE=@sc order by year", conn);

                SqlCommand cmd = new SqlCommand("SELECT distinct b.YEAR "+
                "FROM student_academic_info a "+
                "inner join ep_class_grade b on a.ALUN_NUMERO = b.NUMERO and a.ALUN_NUMERO_SEQ =b.NUMERO_SEQ "+
                "where a.PROGRAM_COMPOSITE_CODE=@sc "+
                "order by year", conn);


            //cmd.Parameters.AddWithValue("@school", txt_school.SelectedValue);
            cmd.Parameters.AddWithValue("@sc", programList.SelectedValue);

            SqlDataReader sqr = cmd.ExecuteReader();
            
            while (sqr.Read())
            {
                if (sqr["YEAR"] != null)

                    yearList.Items.Add(new ListItem(sqr["YEAR"].ToString()));

            }
            yearList.DataBind();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }
    }
   
   

    protected void cursoList_SelectedIndexChanged(object sender, System.EventArgs e)
    {
			piePanel.Visible = false;
			dataPanel.Visible = false;
            linePanel.Visible = false;
            txt_subjectName.Text = "";
            yearList.Items.Clear();
            subjectCodeList.Items.Clear();
            classNameList.Items.Clear();
            getAcadYear();
        
    }


    protected void yearList_SelectedIndexChanged(object sender, EventArgs e)
    {
        piePanel.Visible = false;
        linePanel.Visible = false;
        dataPanel.Visible = false;

        subjectCodeList.Items.Clear();
        classNameList.Items.Clear();
        txt_subjectName.Text = "";

        if (Session["School_code"]!=null)
        {
        try
        {          
            conn.Open();

            StringBuilder sb = new StringBuilder();

            sb.Append("SELECT distinct b.SUBJECT_CODE ");
            sb.Append("FROM teacher_course_info a ");
            sb.Append("inner join academic_result_info b on ");
            sb.Append("a.SECTION_CODE = b.SECTION_CODE and a.SECTION_YEAR = b.SECTION_YEAR ");
            sb.Append("inner join student_academic_info c ");
            sb.Append("on b.ALUN_NUMERO=c.ALUN_NUMERO and b.ALUN_NUMERO_SEQ = c.ALUN_NUMERO_SEQ ");
            sb.Append("where a.SCHOOL_CODE=@schoolCode and a.SECTION_YEAR=@yrs and ");
            sb.Append("b.STUDENT_STATUS_EN='Active' and b.SECTION_YEAR=@yrs and b.SCHOOL_CODE=@schoolCode ");
            sb.Append("and c.SCHOOL_EN = @school and c.PROGRAM_COMPOSITE_CODE = @program  ");
            sb.Append("order by b.SUBJECT_CODE");

            SqlCommand cmd = new SqlCommand(sb.ToString(), conn);


            cmd.Parameters.AddWithValue("@yrs", yearList.SelectedValue);
            cmd.Parameters.AddWithValue("@schoolCode", Session["School_code"].ToString());
            cmd.Parameters.AddWithValue("@school", EpDao.getSchoolNameEN(Session["School_code"].ToString()));
            cmd.Parameters.AddWithValue("@program", programList.SelectedValue);

            SqlDataReader sqr = null;
            sqr = cmd.ExecuteReader();

            while (sqr.Read())
            {
                if (sqr["SUBJECT_CODE"] != null)
                    subjectCodeList.Items.Add(new ListItem(sqr["SUBJECT_CODE"].ToString(), sqr["SUBJECT_CODE"].ToString()));
            }
            subjectCodeList.DataBind();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }
        }

    }
    protected void subjectCodeList_SelectedIndexChanged(object sender, EventArgs e)
    {

        piePanel.Visible = false;
        linePanel.Visible = false;
        dataPanel.Visible = false;
        classNameList.Items.Clear();
        txt_subjectName.Text = "";

        try
        {
            conn.Open();

            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT distinct SUBJECT_EN, SUBJECT_CH ");
            sb.Append("FROM academic_result_info ");
            sb.Append("where SUBJECT_CODE =@subject_code ");

            SqlCommand cmd = new SqlCommand(sb.ToString(), conn);
            cmd.Parameters.AddWithValue("@subject_code", subjectCodeList.SelectedValue);

            SqlDataReader rdr = null;
            rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {
                txt_subjectName.Text = rdr["SUBJECT_EN"].ToString() + " - " + rdr["SUBJECT_CH"].ToString();
            }

            rdr.Close();
           
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
            loadSubjectName();
        }
       
      
    }

    private void loadSubjectName()
    {
        classNameList.Items.Clear();
        classNameList.Items.Insert(0, new ListItem(GetGlobalResourceObject("Resource", "sip_pls_select2").ToString(), ""));
        classNameList.Items.Insert(1, new ListItem("All", ""));
        try
        {
            conn.Open();
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT distinct b.SECTION_NAME ");
            sb.Append("FROM teacher_course_info a ");
            sb.Append("inner join academic_result_info b on ");
            sb.Append("a.SECTION_CODE = b.SECTION_CODE and a.SECTION_YEAR = b.SECTION_YEAR  ");
            sb.Append("inner join student_academic_info c ");
            sb.Append("on b.ALUN_NUMERO=c.ALUN_NUMERO and b.ALUN_NUMERO_SEQ = c.ALUN_NUMERO_SEQ  ");
            sb.Append("where b.STUDENT_STATUS_EN='Active' and b.SECTION_YEAR=@yrs ");
            sb.Append("and c.SCHOOL_EN = @school  and c.PROGRAM_COMPOSITE_CODE =@program and b.SUBJECT_CODE= @subject_code ");

            SqlCommand cmd = new SqlCommand(sb.ToString(), conn);
            cmd.Parameters.AddWithValue("@subject_code", subjectCodeList.SelectedValue);
            cmd.Parameters.AddWithValue("@program", programList.SelectedValue);
            cmd.Parameters.AddWithValue("@school", EpDao.getSchoolNameEN(Session["School_code"].ToString()));
            cmd.Parameters.AddWithValue("@yrs", yearList.SelectedValue);
            
            SqlDataReader sqr = null;
            sqr = cmd.ExecuteReader();

            while (sqr.Read())
            {
                classNameList.Items.Add(new ListItem(sqr["SECTION_NAME"].ToString(), sqr["SECTION_NAME"].ToString()));
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }

    }

    private double[] strArrToDoubleArr(List<String> list)
    {

        double[] nums = new double[list.Count];

        int i = 0;

        foreach (string item in list)
        {
            if (item!="")
            nums[i] = Double.Parse(item);
            i++;
        }

        return nums;
    }

    private string getPessCodeByStdID(string stdID)
    {
        string pess_code = null;

        try
        {
            conn.Open();

            StringBuilder sql = new StringBuilder();

            sql.Append("SELECT PESS_COD ");

            sql.Append("FROM student_academic_info ");

            sql.Append("where STUDENT_ID = @stdID;");

            SqlCommand cmd = new SqlCommand(sql.ToString(), conn);

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
            conn.Close();
        }

        return pess_code;
    }


    [System.Web.Services.WebMethod]
    public static void SetSessionValue(string key, string value)
    {
        HttpContext.Current.Session[key] = value;
    }

    [System.Web.Services.WebMethod]
    public static string GetSessionValue(string key)
    {
        if (HttpContext.Current.Session[key] != null)
        {
            return HttpContext.Current.Session[key].ToString();
        }
        else
        {
            return "Session value not found";
        }
    }


    protected void viewButtonClick(object sender, EventArgs e)
    {
        if (id_txt.Text != "")
        {
            Session["student_id"] = id_txt.Text;

            ArrayList result = new ArrayList();

            result = EpDao.getALUN_NUMERO(id_txt.Text);

            Session["ALUN_NUMERO"] = result[0].ToString();
            Session["ALUN_NUMERO_SEQ"] = result[1].ToString();

            Session.Add("Index", "0");
           //Session["pess_cod"] = getPessCodeByStdID(id_txt.Text);

           //Response.Write("<script>window.open('../Student/schoolStaff.aspx','_blank');</script>");


            //Response.Redirect("~/Student/schoolStaff.aspx?studentid=" + id_txt.Text);

        }
        else
            return;
    }
    public void BindDataToChartcontrol(DataTable objdt)
    {
        pieChart.DataSource = objdt;
        pieChart.DataBind();

    }

    protected void loadDataTable()
    {
        StringBuilder sb = new StringBuilder();
        if (Session["School_code"] != null)
        {
            try
            {
                conn.Open();
                StringBuilder sql = new StringBuilder();
                SqlCommand cmd = null;

                if (classNameList.SelectedValue == "")
                {

                    string scode = Session["School_code"].ToString();
                    sql.Append("SELECT distinct a.STUDENT_ID as s_id, a.name as stu_name,c.SUBJECT_EN, a.class_code as class_code, a.CLASS_WORK_SCORE as class_work_score, ");
                    sql.Append("a.EXAM_SCORE as exam_score,a.final_score as final_score, a.grade as grade, isnull(b.gpa, '-') as gpa, b.ALUN_NUMERO , b.ALUN_NUMERO_SEQ, b.PESS_COD  ");
                    sql.Append("FROM   ep_class_grade a inner join  student_academic_info b  ");
                    sql.Append("on b.ALUN_NUMERO = a.NUMERO and b.ALUN_NUMERO_SEQ =a.NUMERO_SEQ inner join academic_result_info c ");
                    sql.Append("on c.ALUN_NUMERO = a.NUMERO and c.ALUN_NUMERO_SEQ =a.NUMERO_SEQ inner join teacher_course_info d ");
                    sql.Append("on c.SECTION_CODE = d.SECTION_CODE and c.SECTION_YEAR = d.SECTION_YEAR ");
                    sql.Append("where a.class_code=@class_code and a.year=@yrs and a.SCHOOL=@school ");
                    sql.Append("and b.SCHOOL_CODE=@school_code and b.STUDENT_STATUS_EN='Active' and b.PROGRAM_COMPOSITE_CODE=@s_code ");
                    sql.Append("and c.STUDENT_STATUS_EN='Active' and c.ACADEMIC_YEAR = @yrs and c.SCHOOL_CODE=@school_code and c.SUBJECT_CODE =@class_code ");
                    sql.Append("and d.SECTION_YEAR=@yrs and d.SCHOOL_CODE=@school_code ");
                    sql.Append("order by s_id; ");


                    cmd = new SqlCommand(sql.ToString(), conn);

                    cmd.Parameters.AddWithValue("@school", EpDao.getSchoolNameEN(Session["School_code"].ToString()));
                    cmd.Parameters.AddWithValue("@class_code", subjectCodeList.SelectedValue);
                    cmd.Parameters.AddWithValue("@s_code", programList.SelectedValue);
                    cmd.Parameters.AddWithValue("@school_code", Session["School_code"].ToString().Trim());
                    cmd.Parameters.AddWithValue("@yrs", yearList.SelectedValue);

                    // cmd.Parameters.AddWithValue("@lb3", ListBox3.SelectedValue);
                }
                else
                {
                    sql.Append("SELECT distinct a.STUDENT_ID as s_id, a.name as stu_name,c.SUBJECT_EN, a.class_code as class_code, a.CLASS_WORK_SCORE as class_work_score, ");
                    sql.Append("a.EXAM_SCORE as exam_score,a.final_score as final_score, a.grade as grade, isnull(b.gpa, '-') as gpa, b.ALUN_NUMERO , b.ALUN_NUMERO_SEQ, b.PESS_COD  ");
                    sql.Append("FROM   ep_class_grade a inner join  student_academic_info b  ");
                    sql.Append("on b.ALUN_NUMERO = a.NUMERO and b.ALUN_NUMERO_SEQ =a.NUMERO_SEQ inner join academic_result_info c ");
                    sql.Append("on c.ALUN_NUMERO = a.NUMERO and c.ALUN_NUMERO_SEQ =a.NUMERO_SEQ inner join teacher_course_info d ");
                    sql.Append("on c.SECTION_CODE = d.SECTION_CODE and c.SECTION_YEAR = d.SECTION_YEAR ");
                    sql.Append("where a.class_code=@class_code and a.year=@yrs and a.SCHOOL=@school ");
                    sql.Append("and b.SCHOOL_CODE=@school_code and b.STUDENT_STATUS_EN='Active' and b.PROGRAM_COMPOSITE_CODE=@s_code ");
                    sql.Append("and c.STUDENT_STATUS_EN='Active' and c.ACADEMIC_YEAR = @yrs and c.SCHOOL_CODE=@school_code and c.SUBJECT_CODE =@class_code and c.SECTION_NAME=@class_name ");
                    sql.Append("and d.SECTION_YEAR=@yrs and d.SCHOOL_CODE=@school_code ");
                    sql.Append("order by s_id; ");


                    cmd = new SqlCommand(sql.ToString(), conn);


                    cmd.Parameters.AddWithValue("@school", EpDao.getSchoolNameEN(Session["School_code"].ToString()));
                    cmd.Parameters.AddWithValue("@class_code", subjectCodeList.SelectedValue);
                    cmd.Parameters.AddWithValue("@s_code", programList.SelectedValue);
                    cmd.Parameters.AddWithValue("@school_code", Session["School_code"].ToString().Trim());
                    cmd.Parameters.AddWithValue("@yrs", yearList.SelectedValue);
                    cmd.Parameters.AddWithValue("@class_name", classNameList.SelectedValue);
                }

                SqlDataReader sqr = null;
                sqr = cmd.ExecuteReader();

                while (sqr.Read())
                {
                    sb.Append("<tr>");
                    sb.Append("<td>");
                    sb.Append(sqr["s_id"].ToString());
                    sb.Append("</td>");
                    sb.Append("<td>");
                    sb.Append(sqr["stu_name"].ToString());
                    sb.Append("</td>");
                    sb.Append("<td>");
                    sb.Append(sqr["class_work_score"].ToString());
                    sb.Append("</td>");
                    sb.Append("<td>");
                    sb.Append(sqr["exam_score"].ToString());
                    sb.Append("</td>");
                    sb.Append("<td>");
                    sb.Append(sqr["final_score"].ToString());
                    sb.Append("</td>");
                    sb.Append("<td>");
                    sb.Append(sqr["grade"].ToString());
                    sb.Append("</td>");
                    sb.Append("<td>");
                    sb.Append(sqr["gpa"].ToString());
                    sb.Append("</td>");
                    sb.Append("<td style='display:none;'>");
                    sb.Append(sqr["ALUN_NUMERO"].ToString());
                    sb.Append("</td>");
                    sb.Append("<td style='display:none;'>");
                    sb.Append(sqr["ALUN_NUMERO_SEQ"].ToString());
                    sb.Append("</td>");
                    sb.Append("<td style='display:none;'>");
                    sb.Append(sqr["PESS_COD"].ToString());
                    sb.Append("</td>");
                    sb.Append("</tr>");

                    //txt_subjectName.Text = sqr["SUBJECT_EN"].ToString();
                }
                ltData.Text = sb.ToString();
                ListBox3.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conn.Close();
				
				

                loadLineChart_classWork();
                loadLineChart_Exam();
                loadLineChart_finalScore();

                piePanel.Visible = true;
                linePanel.Visible = true;
                dataPanel.Visible = true;

				
                DataTable objdt = new DataTable();
                objdt = loadPieData();

                if (objdt.Rows.Count > 0)
                {
                    BindDataToChartcontrol(objdt);

                    piePanel.Visible = true;
                    linePanel.Visible = true;
                }
                else
                {
                    piePanel.Visible = false;
                    linePanel.Visible = false;
                }

            }
        }
    }


    public DataTable loadPieData()
    {
        DataTable objdt = new DataTable();

        if (Session["School_code"] != null)   {
            try
            {
                objdt.Columns.Add("Status", typeof(string));
                objdt.Columns.Add("Percentage", typeof(double));

                conn.Open();
                SqlCommand cmd = null;
                StringBuilder sql = new StringBuilder();

                /*
                sql.Append("select Count(*) as TotalRecords, ");
                sql.Append("Sum(case when  a.GRADE <>'F'  then 1 else 0 end) as PassRecords, ");
                sql.Append("Sum(case when  a.GRADE ='F' then 1 else 0 end) as FaileRecords ");
                sql.Append("from ep_class_grade a right outer  join academic_result_info c ");
                sql.Append("on c.ALUN_NUMERO = a.NUMERO and c.ALUN_NUMERO_SEQ =a.NUMERO_SEQ left join teacher_course_info d ");
                sql.Append("on c.SECTION_CODE = d.SECTION_CODE and c.SECTION_YEAR = d.SECTION_YEAR ");
                sql.Append("where a.YEAR=@yrs and a.CLASS_CODE=@class_code and c.STUDENT_STATUS_EN='Active' ");
                sql.Append("and c.SUBJECT_CODE=@class_code and  d.SECTION_YEAR=@yrs");
    */

                if (Session["School_code"] != null && classNameList.SelectedValue == "")
                {
					sql.Append("select Count(*) as TotalRecords, ");
					sql.Append("Sum(case when  temp1.GRADE <>'F'  then 1 else 0 end) as PassRecords,  ");
					sql.Append("Sum(case when  temp1.GRADE ='F' then 1 else 0 end) as FaileRecords ");
					sql.Append("from  (select distinct a.NUMERO, a.NUMERO_SEQ , a.GRADE ");
                    sql.Append("from ep_class_grade a inner join student_academic_info b on a.NUMERO = b.ALUN_NUMERO and a.NUMERO_SEQ = b.ALUN_NUMERO_SEQ ");
					sql.Append("where a.YEAR=@yrs and a.CLASS_CODE=@class_code and a.SCHOOL=@school ");
                    sql.Append("and b.STUDENT_STATUS_EN= 'Active' and b.PROGRAM_COMPOSITE_CODE=@s_code ");
					sql.Append(" )  temp1  inner join  (select distinct ar.ALUN_NUMERO, ar.ALUN_NUMERO_SEQ from  teacher_course_info d  ");
					sql.Append("inner join academic_result_info ar  on ar.SECTION_CODE = d.SECTION_CODE and ar.SECTION_YEAR = d.SECTION_YEAR ");
					sql.Append("where ar.ACADEMIC_YEAR=@yrs and ar.SCHOOL_CODE=@school_code and ar.SUBJECT_CODE=@class_code and ar.STUDENT_STATUS_EN='Active' ");
					sql.Append("and d.SCHOOL_CODE=@school_code and d.SECTION_YEAR=@yrs  ");
					sql.Append(") temp2  on temp1.NUMERO = temp2.ALUN_NUMERO and temp1.NUMERO_SEQ = temp2.ALUN_NUMERO_SEQ   ");

                    cmd = new SqlCommand(sql.ToString(), conn);

                    cmd.Parameters.AddWithValue("@yrs", yearList.SelectedValue);
                    cmd.Parameters.AddWithValue("@class_code", subjectCodeList.SelectedValue.Trim());
                    cmd.Parameters.AddWithValue("@school", EpDao.getSchoolNameEN(Session["School_code"].ToString()));
                    cmd.Parameters.AddWithValue("@school_code", Session["School_code"].ToString().Trim());
                    cmd.Parameters.AddWithValue("@s_code", programList.SelectedValue);

                }
                else
                {
					/*
                    sql.Append("select Count(*) as TotalRecords, ");
                    sql.Append("Sum(case when  temp1.GRADE <>'F'  then 1 else 0 end) as PassRecords, ");
                    sql.Append("Sum(case when  temp1.GRADE ='F' then 1 else 0 end) as FaileRecords from  ");
                    sql.Append("(select distinct a.NUMERO, a.NUMERO_SEQ , a.GRADE ");
                    sql.Append("from ep_class_grade a inner join academic_result_info c ");
                    sql.Append("on c.ALUN_NUMERO = a.NUMERO and c.ALUN_NUMERO_SEQ =a.NUMERO_SEQ  ");
                    sql.Append("where a.YEAR=@yrs and a.CLASS_CODE=@class_code and a.SCHOOL=@school  and a.SIMPLIFY_CODE =@s_code ");
                    sql.Append("and c.STUDENT_STATUS_EN='Active' and c.ACADEMIC_YEAR=@yrs and c.SCHOOL_CODE=@school_code and c.SUBJECT_CODE=@class_code and c.SECTION_NAME=@class_name )  temp1  ");
                    sql.Append("inner join  (select distinct ar.ALUN_NUMERO, ar.ALUN_NUMERO_SEQ from  teacher_course_info d ");
                    sql.Append("inner join academic_result_info ar  on ar.SECTION_CODE = d.SECTION_CODE and ar.SECTION_YEAR = d.SECTION_YEAR) temp2  ");
                    sql.Append("on temp1.NUMERO = temp2.ALUN_NUMERO and temp1.NUMERO_SEQ = temp2.ALUN_NUMERO_SEQ ");
					*/
					sql.Append("select Count(*) as TotalRecords, ");
					sql.Append("Sum(case when  temp1.GRADE <>'F'  then 1 else 0 end) as PassRecords,  ");
					sql.Append("Sum(case when  temp1.GRADE ='F' then 1 else 0 end) as FaileRecords ");
					sql.Append("from  (select distinct a.NUMERO, a.NUMERO_SEQ , a.GRADE ");
                    sql.Append("from ep_class_grade a inner join student_academic_info b on a.NUMERO = b.ALUN_NUMERO and a.NUMERO_SEQ = b.ALUN_NUMERO_SEQ ");
					sql.Append("where a.YEAR=@yrs and a.CLASS_CODE=@class_code and a.SCHOOL=@school ");
                    sql.Append("and b.STUDENT_STATUS_EN= 'Active' and b.PROGRAM_COMPOSITE_CODE=@s_code ");
					sql.Append(" )  temp1  inner join  (select distinct ar.ALUN_NUMERO, ar.ALUN_NUMERO_SEQ from  teacher_course_info d  ");
					sql.Append("inner join academic_result_info ar  on ar.SECTION_CODE = d.SECTION_CODE and ar.SECTION_YEAR = d.SECTION_YEAR ");
					sql.Append("where ar.ACADEMIC_YEAR=@yrs and ar.SCHOOL_CODE=@school_code and ar.SUBJECT_CODE=@class_code and ar.STUDENT_STATUS_EN='Active' and ar.SECTION_NAME=@class_name ");
					sql.Append("and d.SCHOOL_CODE=@school_code and d.SECTION_YEAR=@yrs  ");
					sql.Append(") temp2  on temp1.NUMERO = temp2.ALUN_NUMERO and temp1.NUMERO_SEQ = temp2.ALUN_NUMERO_SEQ   ");
					
					

                    cmd = new SqlCommand(sql.ToString(), conn);

                    cmd.Parameters.AddWithValue("@yrs", yearList.SelectedValue);
                    cmd.Parameters.AddWithValue("@class_code", subjectCodeList.SelectedValue.Trim());
                    cmd.Parameters.AddWithValue("@school", EpDao.getSchoolNameEN(Session["School_code"].ToString()));
                    cmd.Parameters.AddWithValue("@school_code", Session["School_code"].ToString().Trim());
                    cmd.Parameters.AddWithValue("@s_code", programList.SelectedValue);
                    cmd.Parameters.AddWithValue("@class_name", classNameList.SelectedValue);
                }

                SqlDataReader rdr1 = null;
                rdr1 = cmd.ExecuteReader();

                while (rdr1.Read())
                    if (rdr1["TotalRecords"] != null && rdr1["TotalRecords"].ToString() != "0")
                    {

                        var objrow = objdt.NewRow();
                        objrow["Status"] = GetGlobalResourceObject("Resource", "sip_total_pass").ToString()+" (" + rdr1["PassRecords"].ToString() + ")";

                        double tmp1 = Math.Round((double)Int32.Parse(rdr1["PassRecords"].ToString()) / Int32.Parse(rdr1["TotalRecords"].ToString()), 2);

                        objrow["Percentage"] = tmp1;

                        objdt.Rows.Add(objrow);

                        objrow = objdt.NewRow();



                        objrow["Status"] = GetGlobalResourceObject("Resource", "sip_total_fail").ToString() + " (" + rdr1["FaileRecords"].ToString() + ")"; ;

                        double tmp2 = (double)(Int32.Parse(rdr1["FaileRecords"].ToString())) / Int32.Parse(rdr1["TotalRecords"].ToString());

                        double tmp3 = Math.Round(tmp2, 2);

                        objrow["Percentage"] = tmp3;

                        objdt.Rows.Add(objrow);

                        totalPAX.Text = rdr1["TotalRecords"].ToString();
                        // total_Stu = Int32.Parse(rdr1["total_pass"].ToString());
                    }

                rdr1.Close();

                //SqlDataAdapter da = new SqlDataAdapter(cmd);
                // this will query your database and return the result to your datatable



            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conn.Close();
            }
        }

        return objdt;
    }
    protected void lineChart_finalScore_Init(object sender, EventArgs e)
    {

        lineChart_finalScore.Titles.Add(GetGlobalResourceObject("Resource", "sip_chart_title_final").ToString());
        lineChart_finalScore.ChartAreas["ChartArea1"].BackColor = Color.Wheat;
        lineChart_finalScore.ChartAreas["ChartArea1"].AxisX.Title = GetGlobalResourceObject("Resource", "sip_std_score").ToString();
        lineChart_finalScore.ChartAreas["ChartArea1"].AxisY.Title = GetGlobalResourceObject("Resource", "sip_score_prob").ToString();
        lineChart_finalScore.ChartAreas["ChartArea1"].AxisX.Maximum = 100;
        lineChart_finalScore.ChartAreas["ChartArea1"].AxisX.Interval = 10;
        lineChart_finalScore.ChartAreas["ChartArea1"].AxisX.Minimum = 0;
        lineChart_finalScore.ChartAreas["ChartArea1"].RecalculateAxesScale();

    }


    protected void lineChart_classwork_Init(object sender, EventArgs e)
    {
        lineChart_classWork.Titles.Add(GetGlobalResourceObject("Resource", "sip_chart_title_work").ToString());
        lineChart_classWork.ChartAreas["ChartArea1"].BackColor = Color.Wheat;
        lineChart_classWork.ChartAreas["ChartArea1"].AxisX.Title = GetGlobalResourceObject("Resource", "sip_std_score").ToString();
        lineChart_classWork.ChartAreas["ChartArea1"].AxisY.Title = GetGlobalResourceObject("Resource", "sip_score_prob").ToString();
        lineChart_classWork.ChartAreas["ChartArea1"].AxisX.Maximum = 100;
        lineChart_classWork.ChartAreas["ChartArea1"].AxisX.Interval = 10;
        lineChart_classWork.ChartAreas["ChartArea1"].AxisX.Minimum = 0;
        lineChart_classWork.ChartAreas["ChartArea1"].RecalculateAxesScale();

    }

    protected void lineChart_exam_Init(object sender, EventArgs e)
    {
        lineChart_exam.Titles.Add(GetGlobalResourceObject("Resource", "sip_chart_title_exam").ToString());
        lineChart_exam.ChartAreas["ChartArea1"].BackColor = Color.Wheat;
        lineChart_exam.ChartAreas["ChartArea1"].AxisX.Title = GetGlobalResourceObject("Resource", "sip_std_score").ToString();
        lineChart_exam.ChartAreas["ChartArea1"].AxisY.Title = GetGlobalResourceObject("Resource", "sip_score_prob").ToString();
        lineChart_exam.ChartAreas["ChartArea1"].AxisX.Maximum = 100;
        lineChart_exam.ChartAreas["ChartArea1"].AxisX.Interval = 10;
        lineChart_exam.ChartAreas["ChartArea1"].AxisX.Minimum = 0;
        lineChart_exam.ChartAreas["ChartArea1"].RecalculateAxesScale();


    }


    public AverageStdevp ComputingAvSt(Double[] d)
    {
        AverageStdevp avst = new AverageStdevp();
        avst.Average = d.Average();
        Double ad = d.Average();
        Double st = 0;
        if (d.Length != 0)
        {
            for (int i = 0; i < d.Length; i++)
            {
                st = st + ((Double)d.GetValue(i) - ad) * ((Double)d.GetValue(i) - ad);

            }
            avst.Stdevp = Math.Sqrt(st / d.Length);

            return avst;
        }
        else
        {
            avst.Average = 0;
            avst.Stdevp = 0;
            return avst;
        }
    }

    public void ComputingResult(Double[] d, AverageStdevp ast, List<Double> dResult)
    {
        double temResult;
        double eAgr;
        try
        {
            for (int i = 0; i < d.Length; i++)
            {
                eAgr = -((((double)d.GetValue(i) - ast.Average) * ((double)d.GetValue(i) - ast.Average)) / (2 * ast.Stdevp * ast.Stdevp));
                temResult = (1 / (ast.Stdevp * Math.Sqrt(2 * Math.PI))) * Math.Exp(eAgr);
                dResult.Add(temResult);

            }

        }
        catch (Exception e)
        {
            Response.Write(e.Message);
        }



    }
    protected void loadLineChart_classWork()
    {

        double[] d;
        List<String> scorelist = new List<String>();

        if (Session["School_code"] != null)
        {
            try
            {
                conn.Open();
                StringBuilder sql = new StringBuilder();
                SqlCommand cmd = null;

                if (classNameList.SelectedValue == "")
                {
					/*
                    sql.Append("select * ");
                    sql.Append("from ep_class_grade a inner join academic_result_info c ");
                    sql.Append("on c.ALUN_NUMERO = a.NUMERO and c.ALUN_NUMERO_SEQ =a.NUMERO_SEQ inner join teacher_course_info d ");
                    sql.Append("on c.SECTION_CODE = d.SECTION_CODE and c.SECTION_YEAR = d.SECTION_YEAR  inner join student_academic_info b ");
                    sql.Append("on a.NUMERO = b.ALUN_NUMERO and a.NUMERO_SEQ = b.ALUN_NUMERO_SEQ ");
                    sql.Append("where a.CLASS_CODE=@class_code and a.year=@yrs and a.SCHOOL=@school and a.SIMPLIFY_CODE =@scode ");
                    sql.Append("and  b.SCHOOL_CODE=@school_code ");
                    sql.Append("and c.ACADEMIC_YEAR=@yrs and c.STUDENT_STATUS_EN='Active' and c.SCHOOL_CODE=@school_code and c.SUBJECT_CODE =@class_code  ");
                    sql.Append("and d.SECTION_YEAR=@yrs  and d.SCHOOL_CODE=@school_code ");
                    sql.Append("order by CLASS_WORK_SCORE;");
					*/
					
						sql.Append("select * from ");
						sql.Append("(SELECT distinct c.ALUN_NUMERO, c.ALUN_NUMERO_SEQ FROM academic_result_info c ");
						sql.Append("inner join teacher_course_info d  ");
						sql.Append("on c.SECTION_CODE = d.SECTION_CODE and c.SECTION_YEAR = d.SECTION_YEAR  ");
						sql.Append("where c.ACADEMIC_YEAR = @yrs and c.SCHOOL_CODE=@school_code and c.SUBJECT_CODE =@class_code and c.STUDENT_STATUS_EN='Active' ");
						sql.Append("and d.SECTION_YEAR=@yrs  and d.SCHOOL_CODE=@school_code ) temp1  ");
						sql.Append("inner join ( ");
						sql.Append("select distinct a.NUMERO, a.NUMERO_SEQ, a.CLASS_WORK_SCORE from ep_class_grade a   ");
						sql.Append("inner join student_academic_info b on a.NUMERO = b.ALUN_NUMERO and a.NUMERO_SEQ = b.ALUN_NUMERO_SEQ  ");
                        sql.Append("where a.CLASS_CODE=@class_code and a.year=@yrs and a.SCHOOL=@school and  b.SCHOOL_CODE=@school_code   and b.PROGRAM_COMPOSITE_CODE=@scode  ");
						sql.Append(") temp2 ");
						sql.Append("on temp1.ALUN_NUMERO = temp2.NUMERO and temp1.ALUN_NUMERO_SEQ = temp2.NUMERO_SEQ ");
						sql.Append("order by temp2.CLASS_WORK_SCORE ");


                    cmd = new SqlCommand(sql.ToString(), conn);

                    cmd.Parameters.AddWithValue("@class_code", subjectCodeList.SelectedValue);
                    cmd.Parameters.AddWithValue("@yrs", yearList.SelectedValue);
                    cmd.Parameters.AddWithValue("@school_code", Session["School_code"].ToString().Trim());
                    cmd.Parameters.AddWithValue("@school", EpDao.getSchoolNameEN(Session["School_code"].ToString()));
					cmd.Parameters.AddWithValue("@scode", programList.SelectedValue);
                }
                else
                {
					
					/*
                    sql.Append("select * ");
                    sql.Append("from ep_class_grade a inner join academic_result_info c ");
                    sql.Append("on c.ALUN_NUMERO = a.NUMERO and c.ALUN_NUMERO_SEQ =a.NUMERO_SEQ inner join teacher_course_info d ");
                    sql.Append("on c.SECTION_CODE = d.SECTION_CODE and c.SECTION_YEAR = d.SECTION_YEAR  inner join student_academic_info b ");
                    sql.Append("on a.NUMERO = b.ALUN_NUMERO and a.NUMERO_SEQ = b.ALUN_NUMERO_SEQ ");
                    sql.Append("where a.CLASS_CODE=@class_code and a.year=@yrs and a.SCHOOL=@school and a.SIMPLIFY_CODE =@scode ");
                    sql.Append("and  b.SCHOOL_CODE=@school_code ");
                    sql.Append("and c.ACADEMIC_YEAR=@yrs and c.STUDENT_STATUS_EN='Active' and c.SCHOOL_CODE=@school_code and c.SUBJECT_CODE =@class_code and c.SECTION_NAME=@class_name ");
                    sql.Append("and d.SECTION_YEAR=@yrs  and d.SCHOOL_CODE=@school_code ");
                    sql.Append("order by CLASS_WORK_SCORE;");
					*/
					
					sql.Append("select * from ");
						sql.Append("(SELECT distinct c.ALUN_NUMERO, c.ALUN_NUMERO_SEQ FROM academic_result_info c ");
						sql.Append("inner join teacher_course_info d  ");
						sql.Append("on c.SECTION_CODE = d.SECTION_CODE and c.SECTION_YEAR = d.SECTION_YEAR  ");
						sql.Append("where c.ACADEMIC_YEAR = @yrs and c.SCHOOL_CODE=@school_code and c.SUBJECT_CODE =@class_code and c.STUDENT_STATUS_EN='Active' and c.SECTION_NAME=@class_name ");
						sql.Append("and d.SECTION_YEAR=@yrs  and d.SCHOOL_CODE=@school_code ) temp1  ");
						sql.Append("inner join ( ");
						sql.Append("select distinct a.NUMERO, a.NUMERO_SEQ, a.CLASS_WORK_SCORE from ep_class_grade a   ");
						sql.Append("inner join student_academic_info b on a.NUMERO = b.ALUN_NUMERO and a.NUMERO_SEQ = b.ALUN_NUMERO_SEQ  ");
                        sql.Append("where a.CLASS_CODE=@class_code and a.year=@yrs and a.SCHOOL=@school and  b.SCHOOL_CODE=@school_code and b.PROGRAM_COMPOSITE_CODE=@scode   ");
						sql.Append(") temp2 ");
						sql.Append("on temp1.ALUN_NUMERO = temp2.NUMERO and temp1.ALUN_NUMERO_SEQ = temp2.NUMERO_SEQ ");
						sql.Append("order by temp2.CLASS_WORK_SCORE ");


                    cmd = new SqlCommand(sql.ToString(), conn);

                    cmd.Parameters.AddWithValue("@class_code", subjectCodeList.SelectedValue);
                    cmd.Parameters.AddWithValue("@yrs", yearList.SelectedValue);
                    cmd.Parameters.AddWithValue("@school_code", Session["School_code"].ToString().Trim());
                    cmd.Parameters.AddWithValue("@school", EpDao.getSchoolNameEN(Session["School_code"].ToString()));
                    cmd.Parameters.AddWithValue("@class_name", classNameList.SelectedValue);
					cmd.Parameters.AddWithValue("@scode", programList.SelectedValue);
                }


                SqlDataReader rdr = null;
                rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    scorelist.Add(rdr["CLASS_WORK_SCORE"].ToString());
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conn.Close();
            }

            lineChart_classWork.Series.Add(new Series(GetGlobalResourceObject("Resource", "sip_avg_line").ToString())
            {
                ChartType = SeriesChartType.Line,
                BorderWidth = 1,
                ShadowOffset = 1,
                Color = Color.Tomato//PaleVioletRed
            });

            lineChart_classWork.Series.Add(new Series(GetGlobalResourceObject("Resource", "sip_pass_line").ToString())
            {
                ChartType = SeriesChartType.Line,
                BorderWidth = 1,
                ShadowOffset = 1,
                Color = Color.Turquoise//PaleVioletRed
            });

            lineChart_classWork.Series.Add(new Series(GetGlobalResourceObject("Resource", "sip_score_prob_line").ToString())
            {
                ChartType = SeriesChartType.Line,
                BorderWidth = 1,
                ShadowOffset = 1,
                Color = Color.SpringGreen//PaleVioletRed
            });
            /////////////////Testing Data Start////////////////////////////////


            List<Double> dResult = new List<Double>();
            AverageStdevp averageStdevp;




            if (scorelist.Count > 0)
            {
                d = strArrToDoubleArr(scorelist);
                averageStdevp = ComputingAvSt(strArrToDoubleArr(scorelist));

                if (averageStdevp.Average != 0 || averageStdevp.Stdevp != 0)
                {

                    ComputingResult(d, averageStdevp, dResult);
                }
                else
                { return; }

                lineChart_classWork.Series[GetGlobalResourceObject("Resource", "sip_score_prob_line").ToString()].Points.DataBindY(dResult);
                //lineChart.Series["SplineSeries"].Points.DataBindY(dResult);
                lineChart_classWork.Series[GetGlobalResourceObject("Resource", "sip_score_prob_line").ToString()].Points.DataBindXY(d, dResult);


                StripLine sLAverage = new StripLine();
                sLAverage.BorderWidth = 2;
                sLAverage.IntervalOffset = averageStdevp.Average;
                sLAverage.BorderColor = Color.Tomato;
                sLAverage.BorderDashStyle = ChartDashStyle.Solid;
                StripLine sLMiddle = new StripLine();
                sLMiddle.BorderWidth = 2;
                sLMiddle.IntervalOffset = 50;
                sLMiddle.BorderColor = Color.Turquoise;
                sLMiddle.BorderDashStyle = ChartDashStyle.Solid;
                lineChart_classWork.ChartAreas["ChartArea1"].AxisX.StripLines.Add(sLAverage);
                lineChart_classWork.ChartAreas["ChartArea1"].AxisX.StripLines.Add(sLMiddle);

                columnChart_classWork.Series.Add(new Series(GetGlobalResourceObject("Resource", "sip_num_std").ToString())
                {
                    ChartType = SeriesChartType.Column,
                    BorderWidth = 1,
                    ShadowOffset = 1,
                    Color = Color.SpringGreen
                });

                columnChart_classWork.Titles.Add(GetGlobalResourceObject("Resource", "sip_std_ach_seg").ToString());
                columnChart_classWork.ChartAreas["ChartArea1"].BackColor = Color.Wheat;
                columnChart_classWork.ChartAreas["ChartArea1"].AxisX.Maximum = 100;
                columnChart_classWork.ChartAreas["ChartArea1"].AxisX.Minimum = 0;
                columnChart_classWork.ChartAreas["ChartArea1"].AxisX.Interval = 10;
                columnChart_classWork.ChartAreas["ChartArea1"].AxisY.Interval = 1;
                columnChart_classWork.ChartAreas["ChartArea1"].AxisX.Title = GetGlobalResourceObject("Resource", "sip_std_score").ToString();
                columnChart_classWork.ChartAreas["ChartArea1"].AxisY.Title = GetGlobalResourceObject("Resource", "sip_num_std").ToString();


                if (d.Length > 0)
                {
                    int iCount = 0;
                    int iPut = 0;
                    string[] value = new string[d.Length];

                    for (int i = 0; i < d.Length; i++)
                    {
                        value[i] = d[i].ToString();
                    }

                    var source = value.GroupBy(t => t.Trim()).Select(t => new { count = t.Count(), key = t.Key }).ToArray();
                    foreach (var s in source)
                    {
                        columnChart_classWork.Series[GetGlobalResourceObject("Resource", "sip_num_std").ToString()].Points.AddXY(double.Parse(s.key), s.count); 
                        iCount++;
                    }

                    if (iCount < 1)
                    {
                        return;
                    }
                    else
                    {
                        double[] doubleArray = new double[iCount];
                        foreach (var s in source)
                            doubleArray[iPut++] = double.Parse(s.key);
                        DesStatistics dss = new DesStatistics(doubleArray);
                        classLowestWork.Text = dss.strLoweset;
                        classQ1Work.Text = dss.strQ1;
                        classMedianWork.Text = dss.strMedian;
                        classQ3Work.Text = dss.strQ3;
                        classHighestWork.Text = dss.strHighest;
                    }
                }
            }
        }
    }


    protected void loadLineChart_Exam()
    {

        double[] d;
        List<String> scorelist = new List<String>();

        if (Session["School_code"] != null)
        {
            try
            {
                conn.Open();

                StringBuilder sql = new StringBuilder();
                SqlCommand cmd = null;

                if (classNameList.SelectedValue == "")
                {
					/*
                    sql.Append("select * ");
                    sql.Append("from ep_class_grade a inner join academic_result_info c ");
                    sql.Append("on c.ALUN_NUMERO = a.NUMERO and c.ALUN_NUMERO_SEQ =a.NUMERO_SEQ inner join teacher_course_info d ");
                    sql.Append("on c.SECTION_CODE = d.SECTION_CODE and c.SECTION_YEAR = d.SECTION_YEAR  inner join student_academic_info b ");
                    sql.Append("on a.NUMERO = b.ALUN_NUMERO and a.NUMERO_SEQ = b.ALUN_NUMERO_SEQ ");
                    sql.Append("where a.CLASS_CODE=@class_code and a.year=@yrs and a.SCHOOL=@school and a.SIMPLIFY_CODE =@scode ");
                    sql.Append("and  b.SCHOOL_CODE=@school_code ");
                    sql.Append("and c.ACADEMIC_YEAR=@yrs and c.STUDENT_STATUS_EN='Active' and c.SCHOOL_CODE=@school_code and c.SUBJECT_CODE =@class_code  ");
                    sql.Append("and d.SECTION_YEAR=@yrs  and d.SCHOOL_CODE=@school_code ");
                    sql.Append("order by EXAM_SCORE;");
					*/
					
					    sql.Append("select * from ");
						sql.Append("(SELECT distinct c.ALUN_NUMERO, c.ALUN_NUMERO_SEQ FROM academic_result_info c ");
						sql.Append("inner join teacher_course_info d  ");
						sql.Append("on c.SECTION_CODE = d.SECTION_CODE and c.SECTION_YEAR = d.SECTION_YEAR  ");
						sql.Append("where c.ACADEMIC_YEAR = @yrs and c.SCHOOL_CODE=@school_code and c.SUBJECT_CODE =@class_code and c.STUDENT_STATUS_EN='Active' ");
						sql.Append("and d.SECTION_YEAR=@yrs and d.SCHOOL_CODE=@school_code ) temp1  ");
						sql.Append("inner join ( ");
						sql.Append("select distinct a.NUMERO, a.NUMERO_SEQ, a.EXAM_SCORE from ep_class_grade a   ");
						sql.Append("inner join student_academic_info b on a.NUMERO = b.ALUN_NUMERO and a.NUMERO_SEQ = b.ALUN_NUMERO_SEQ  ");
                        sql.Append("where a.CLASS_CODE=@class_code and a.year=@yrs and a.SCHOOL=@school and b.SCHOOL_CODE=@school_code and b.PROGRAM_COMPOSITE_CODE=@scode  ");
						sql.Append(") temp2 ");
						sql.Append("on temp1.ALUN_NUMERO = temp2.NUMERO and temp1.ALUN_NUMERO_SEQ = temp2.NUMERO_SEQ ");
						sql.Append("order by temp2.EXAM_SCORE ");


                    cmd = new SqlCommand(sql.ToString(), conn);

                    cmd.Parameters.AddWithValue("@class_code", subjectCodeList.SelectedValue);
                    cmd.Parameters.AddWithValue("@yrs", yearList.SelectedValue);
                    cmd.Parameters.AddWithValue("@school_code", Session["School_code"].ToString().Trim());
                    cmd.Parameters.AddWithValue("@school", EpDao.getSchoolNameEN(Session["School_code"].ToString()));
					cmd.Parameters.AddWithValue("@scode", programList.SelectedValue);
                }
                else
                {
					/*
                    sql.Append("select * ");
                    sql.Append("from ep_class_grade a inner join academic_result_info c ");
                    sql.Append("on c.ALUN_NUMERO = a.NUMERO and c.ALUN_NUMERO_SEQ =a.NUMERO_SEQ inner join teacher_course_info d ");
                    sql.Append("on c.SECTION_CODE = d.SECTION_CODE and c.SECTION_YEAR = d.SECTION_YEAR  inner join student_academic_info b ");
                    sql.Append("on a.NUMERO = b.ALUN_NUMERO and a.NUMERO_SEQ = b.ALUN_NUMERO_SEQ ");
                    sql.Append("where a.CLASS_CODE=@class_code and a.year=@yrs and a.SCHOOL=@school and a.SIMPLIFY_CODE =@scode ");
                    sql.Append("and  b.SCHOOL_CODE=@school_code ");
                    sql.Append("and c.ACADEMIC_YEAR=@yrs and c.STUDENT_STATUS_EN='Active' and c.SCHOOL_CODE=@school_code and c.SUBJECT_CODE =@class_code and c.SECTION_NAME=@class_name ");
                    sql.Append("and d.SECTION_YEAR=@yrs  and d.SCHOOL_CODE=@school_code ");
                    sql.Append("order by EXAM_SCORE;");
					*/
					
						sql.Append("select * from ");
						sql.Append("(SELECT distinct c.ALUN_NUMERO, c.ALUN_NUMERO_SEQ FROM academic_result_info c ");
						sql.Append("inner join teacher_course_info d  ");
						sql.Append("on c.SECTION_CODE = d.SECTION_CODE and c.SECTION_YEAR = d.SECTION_YEAR  ");
						sql.Append("where c.ACADEMIC_YEAR = @yrs and c.SCHOOL_CODE=@school_code and c.SUBJECT_CODE =@class_code and c.STUDENT_STATUS_EN='Active' and c.SECTION_NAME=@class_name ");
						sql.Append("and d.SECTION_YEAR=@yrs  and d.SCHOOL_CODE=@school_code ) temp1  ");
						sql.Append("inner join ( ");
						sql.Append("select distinct a.NUMERO, a.NUMERO_SEQ, a.EXAM_SCORE from ep_class_grade a ");
						sql.Append("inner join student_academic_info b on a.NUMERO = b.ALUN_NUMERO and a.NUMERO_SEQ = b.ALUN_NUMERO_SEQ  ");
                        sql.Append("where a.CLASS_CODE=@class_code and a.year=@yrs and a.SCHOOL=@school and b.SCHOOL_CODE=@school_code and b.PROGRAM_COMPOSITE_CODE=@scode ");
						sql.Append(") temp2 ");
						sql.Append("on temp1.ALUN_NUMERO = temp2.NUMERO and temp1.ALUN_NUMERO_SEQ = temp2.NUMERO_SEQ ");
						sql.Append("order by temp2.EXAM_SCORE ");


                    cmd = new SqlCommand(sql.ToString(), conn);

                    cmd.Parameters.AddWithValue("@class_code", subjectCodeList.SelectedValue);
                    cmd.Parameters.AddWithValue("@yrs", yearList.SelectedValue);
                    cmd.Parameters.AddWithValue("@school_code", Session["School_code"].ToString().Trim());
                    cmd.Parameters.AddWithValue("@school", EpDao.getSchoolNameEN(Session["School_code"].ToString()));
                    cmd.Parameters.AddWithValue("@class_name", classNameList.SelectedValue);
					cmd.Parameters.AddWithValue("@scode", programList.SelectedValue);
                }


                SqlDataReader rdr = null;
                rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    scorelist.Add(rdr["EXAM_SCORE"].ToString());
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conn.Close();
            }

            lineChart_exam.Series.Add(new Series(GetGlobalResourceObject("Resource", "sip_avg_line").ToString())
            {
                ChartType = SeriesChartType.Line,
                BorderWidth = 1,
                ShadowOffset = 1,
                Color = Color.Tomato//PaleVioletRed
            });

            lineChart_exam.Series.Add(new Series(GetGlobalResourceObject("Resource", "sip_pass_line").ToString())
            {
                ChartType = SeriesChartType.Line,
                BorderWidth = 1,
                ShadowOffset = 1,
                Color = Color.Turquoise//PaleVioletRed
            });

            lineChart_exam.Series.Add(new Series(GetGlobalResourceObject("Resource", "sip_score_prob_line").ToString())
            {
                ChartType = SeriesChartType.Line,
                BorderWidth = 1,
                ShadowOffset = 1,
                Color = Color.SpringGreen//PaleVioletRed
            });
            /////////////////Testing Data Start////////////////////////////////


            List<Double> dResult = new List<Double>();
            AverageStdevp averageStdevp;


            if (scorelist.Count > 0)
            {
                d = strArrToDoubleArr(scorelist);
                averageStdevp = ComputingAvSt(strArrToDoubleArr(scorelist));

                if (averageStdevp.Average != 0 || averageStdevp.Stdevp != 0)
                {

                    ComputingResult(d, averageStdevp, dResult);
                }
                else
                { return; }

                lineChart_exam.Series[GetGlobalResourceObject("Resource", "sip_score_prob_line").ToString()].Points.DataBindY(dResult);
                //lineChart.Series["SplineSeries"].Points.DataBindY(dResult);
                lineChart_exam.Series[GetGlobalResourceObject("Resource", "sip_score_prob_line").ToString()].Points.DataBindXY(d, dResult);


                StripLine sLAverage = new StripLine();
                sLAverage.BorderWidth = 2;
                sLAverage.IntervalOffset = averageStdevp.Average;
                sLAverage.BorderColor = Color.Tomato;
                sLAverage.BorderDashStyle = ChartDashStyle.Solid;
                StripLine sLMiddle = new StripLine();
                sLMiddle.BorderWidth = 2;
                sLMiddle.IntervalOffset = 50;
                sLMiddle.BorderColor = Color.Turquoise;
                sLMiddle.BorderDashStyle = ChartDashStyle.Solid;
                lineChart_exam.ChartAreas["ChartArea1"].AxisX.StripLines.Add(sLAverage);
                lineChart_exam.ChartAreas["ChartArea1"].AxisX.StripLines.Add(sLMiddle);

                columnChart_exam.Series.Add(new Series(GetGlobalResourceObject("Resource", "sip_num_std").ToString())
                {
                    ChartType = SeriesChartType.Column,
                    BorderWidth = 1,
                    ShadowOffset = 1,
                    Color = Color.SpringGreen
                });

                columnChart_exam.Titles.Add(GetGlobalResourceObject("Resource", "sip_std_ach_seg").ToString());
                columnChart_exam.ChartAreas["ChartArea1"].BackColor = Color.Wheat;
                columnChart_exam.ChartAreas["ChartArea1"].AxisX.Maximum = 100;
                columnChart_exam.ChartAreas["ChartArea1"].AxisX.Minimum = 0;
                columnChart_exam.ChartAreas["ChartArea1"].AxisX.Interval = 10;
                columnChart_exam.ChartAreas["ChartArea1"].AxisY.Interval = 1;
                columnChart_exam.ChartAreas["ChartArea1"].AxisX.Title = GetGlobalResourceObject("Resource", "sip_std_score").ToString();
                columnChart_exam.ChartAreas["ChartArea1"].AxisY.Title = GetGlobalResourceObject("Resource", "sip_num_std").ToString();


                if (d.Length > 0)
                {
                    int iCount = 0;
                    int iPut = 0;
                    string[] value = new string[d.Length];

                    for (int i = 0; i < d.Length; i++)
                    {
                        value[i] = d[i].ToString();
                    }

                    var source = value.GroupBy(t => t.Trim()).Select(t => new { count = t.Count(), key = t.Key }).ToArray();
                    foreach (var s in source)
                    {
                        columnChart_exam.Series[GetGlobalResourceObject("Resource", "sip_num_std").ToString()].Points.AddXY(double.Parse(s.key), s.count);
                        iCount++;
                    }

                    if (iCount < 1)
                    {
                        return;
                    }
                    else
                    {
                        double[] doubleArray = new double[iCount];
                        foreach (var s in source)
                            doubleArray[iPut++] = double.Parse(s.key);
                        DesStatistics dss = new DesStatistics(doubleArray);
                        examLowestWork.Text = dss.strLoweset;
                        examQ1Work.Text = dss.strQ1;
                        examMedianWork.Text = dss.strMedian;
                        examQ3Work.Text = dss.strQ3;
                        examHighestWork.Text = dss.strHighest;
                    }
                }
            }
        }
    }

    protected void loadLineChart_finalScore()
    {
        
        double[] d;
        List<String> scorelist = new List<String>();

        if (Session["School_code"] != null)
        {
            try
            {
                conn.Open();


                StringBuilder sql = new StringBuilder();
                SqlCommand cmd = null;


                if (classNameList.SelectedValue == "")
                {
					/*
                    sql.Append("select * ");
                    sql.Append("from ep_class_grade a inner join academic_result_info c ");
                    sql.Append("on c.ALUN_NUMERO = a.NUMERO and c.ALUN_NUMERO_SEQ =a.NUMERO_SEQ inner join teacher_course_info d ");
                    sql.Append("on c.SECTION_CODE = d.SECTION_CODE and c.SECTION_YEAR = d.SECTION_YEAR  inner join student_academic_info b ");
                    sql.Append("on a.NUMERO = b.ALUN_NUMERO and a.NUMERO_SEQ = b.ALUN_NUMERO_SEQ ");
                    sql.Append("where a.CLASS_CODE=@class_code and a.year=@yrs and a.SCHOOL=@school and a.SIMPLIFY_CODE =@scode ");
                    sql.Append("and  b.SCHOOL_CODE=@school_code ");
                    sql.Append("and c.ACADEMIC_YEAR=@yrs and c.STUDENT_STATUS_EN='Active' and c.SCHOOL_CODE=@school_code and c.SUBJECT_CODE =@class_code  ");
                    sql.Append("and d.SECTION_YEAR=@yrs  and d.SCHOOL_CODE=@school_code ");
                    sql.Append("order by FINAL_SCORE;");
					*/
					
					sql.Append("select * from ");
					sql.Append("(SELECT distinct c.ALUN_NUMERO, c.ALUN_NUMERO_SEQ FROM academic_result_info c ");
					sql.Append("inner join teacher_course_info d  ");
					sql.Append("on c.SECTION_CODE = d.SECTION_CODE and c.SECTION_YEAR = d.SECTION_YEAR  ");
					sql.Append("where c.ACADEMIC_YEAR = @yrs and c.SCHOOL_CODE=@school_code and c.SUBJECT_CODE =@class_code and c.STUDENT_STATUS_EN='Active' ");
					sql.Append("and d.SECTION_YEAR=@yrs  and d.SCHOOL_CODE=@school_code ) temp1  ");
					sql.Append("inner join ( ");
					sql.Append("select distinct a.NUMERO, a.NUMERO_SEQ, a.FINAL_SCORE from ep_class_grade a   ");
					sql.Append("inner join student_academic_info b on a.NUMERO = b.ALUN_NUMERO and a.NUMERO_SEQ = b.ALUN_NUMERO_SEQ  ");
                    sql.Append("where a.CLASS_CODE=@class_code and a.year=@yrs and a.SCHOOL=@school and  b.SCHOOL_CODE=@school_code and b.PROGRAM_COMPOSITE_CODE=@scode  ");
					sql.Append(") temp2 ");
					sql.Append("on temp1.ALUN_NUMERO = temp2.NUMERO and temp1.ALUN_NUMERO_SEQ = temp2.NUMERO_SEQ ");
					sql.Append("order by temp2.FINAL_SCORE ");


                    cmd = new SqlCommand(sql.ToString(), conn);

                    cmd.Parameters.AddWithValue("@class_code", subjectCodeList.SelectedValue);
                    cmd.Parameters.AddWithValue("@yrs", yearList.SelectedValue);
                    cmd.Parameters.AddWithValue("@school_code", Session["School_code"].ToString().Trim());
                    cmd.Parameters.AddWithValue("@school", EpDao.getSchoolNameEN(Session["School_code"].ToString()));
					cmd.Parameters.AddWithValue("@scode", programList.SelectedValue);
                }
                else
                {
					/*
                    sql.Append("select * ");
                    sql.Append("from ep_class_grade a inner join academic_result_info c ");
                    sql.Append("on c.ALUN_NUMERO = a.NUMERO and c.ALUN_NUMERO_SEQ =a.NUMERO_SEQ inner join teacher_course_info d ");
                    sql.Append("on c.SECTION_CODE = d.SECTION_CODE and c.SECTION_YEAR = d.SECTION_YEAR  inner join student_academic_info b ");
                    sql.Append("on a.NUMERO = b.ALUN_NUMERO and a.NUMERO_SEQ = b.ALUN_NUMERO_SEQ ");
                    sql.Append("where a.CLASS_CODE=@class_code and a.year=@yrs and a.SCHOOL=@school and a.SIMPLIFY_CODE =@scode ");
                    sql.Append("and  b.SCHOOL_CODE=@school_code ");
                    sql.Append("and c.ACADEMIC_YEAR=@yrs and c.STUDENT_STATUS_EN='Active' and c.SCHOOL_CODE=@school_code and c.SUBJECT_CODE =@class_code and c.SECTION_NAME=@class_name ");
                    sql.Append("and d.SECTION_YEAR=@yrs  and d.SCHOOL_CODE=@school_code ");
                    sql.Append("order by FINAL_SCORE;");
*/

						sql.Append("select * from ");
						sql.Append("(SELECT distinct c.ALUN_NUMERO, c.ALUN_NUMERO_SEQ FROM academic_result_info c ");
						sql.Append("inner join teacher_course_info d  ");
						sql.Append("on c.SECTION_CODE = d.SECTION_CODE and c.SECTION_YEAR = d.SECTION_YEAR  ");
						sql.Append("where c.ACADEMIC_YEAR = @yrs and c.SCHOOL_CODE=@school_code and c.SUBJECT_CODE =@class_code and c.STUDENT_STATUS_EN='Active' and c.SECTION_NAME=@class_name ");
						sql.Append("and d.SECTION_YEAR=@yrs  and d.SCHOOL_CODE=@school_code ) temp1  ");
						sql.Append("inner join ( ");
						sql.Append("select distinct a.NUMERO, a.NUMERO_SEQ, a.FINAL_SCORE from ep_class_grade a   ");
						sql.Append("inner join student_academic_info b on a.NUMERO = b.ALUN_NUMERO and a.NUMERO_SEQ = b.ALUN_NUMERO_SEQ  ");
                        sql.Append("where a.CLASS_CODE=@class_code and a.year=@yrs and a.SCHOOL=@school and  b.SCHOOL_CODE=@school_code and b.PROGRAM_COMPOSITE_CODE=@scode   ");
						sql.Append(") temp2 ");
						sql.Append("on temp1.ALUN_NUMERO = temp2.NUMERO and temp1.ALUN_NUMERO_SEQ = temp2.NUMERO_SEQ ");
						sql.Append("order by temp2.FINAL_SCORE ");

                    cmd = new SqlCommand(sql.ToString(), conn);

                    cmd.Parameters.AddWithValue("@class_code", subjectCodeList.SelectedValue);
                    cmd.Parameters.AddWithValue("@yrs", yearList.SelectedValue);
                    cmd.Parameters.AddWithValue("@school_code", Session["School_code"].ToString().Trim());
                    cmd.Parameters.AddWithValue("@school", EpDao.getSchoolNameEN(Session["School_code"].ToString()));
                    cmd.Parameters.AddWithValue("@class_name", classNameList.SelectedValue);
					cmd.Parameters.AddWithValue("@scode", programList.SelectedValue);
                }

                SqlDataReader rdr = null;
                rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    scorelist.Add(rdr["FINAL_SCORE"].ToString());
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conn.Close();
            }

            lineChart_finalScore.Series.Add(new Series(GetGlobalResourceObject("Resource", "sip_avg_line").ToString())
            {
                ChartType = SeriesChartType.Line,
                BorderWidth = 1,
                ShadowOffset = 1,
                Color = Color.Tomato//PaleVioletRed
            });

            lineChart_finalScore.Series.Add(new Series(GetGlobalResourceObject("Resource", "sip_pass_line").ToString())
            {
                ChartType = SeriesChartType.Line,
                BorderWidth = 1,
                ShadowOffset = 1,
                Color = Color.Turquoise//PaleVioletRed
            });

            lineChart_finalScore.Series.Add(new Series(GetGlobalResourceObject("Resource", "sip_score_prob_line").ToString())
            {
                ChartType = SeriesChartType.Line,
                BorderWidth = 1,
                ShadowOffset = 1,
                Color = Color.SpringGreen//PaleVioletRed
            });
            /////////////////Testing Data Start////////////////////////////////


            List<Double> dResult = new List<Double>();
            AverageStdevp averageStdevp;


            if (scorelist.Count > 0)
            {
                d = strArrToDoubleArr(scorelist);
                averageStdevp = ComputingAvSt(strArrToDoubleArr(scorelist));

                if (averageStdevp.Average != 0 || averageStdevp.Stdevp != 0)
                {

                    ComputingResult(d, averageStdevp, dResult);
                }
                else
                { return; }

                lineChart_finalScore.Series[GetGlobalResourceObject("Resource", "sip_score_prob_line").ToString()].Points.DataBindY(dResult);
                //lineChart.Series["SplineSeries"].Points.DataBindY(dResult);
                lineChart_finalScore.Series[GetGlobalResourceObject("Resource", "sip_score_prob_line").ToString()].Points.DataBindXY(d, dResult);


                StripLine sLAverage = new StripLine();
                sLAverage.BorderWidth = 2;
                sLAverage.IntervalOffset = averageStdevp.Average;
                sLAverage.BorderColor = Color.Tomato;
                sLAverage.BorderDashStyle = ChartDashStyle.Solid;
                StripLine sLMiddle = new StripLine();
                sLMiddle.BorderWidth = 2;
                sLMiddle.IntervalOffset = 50;
                sLMiddle.BorderColor = Color.Turquoise;
                sLMiddle.BorderDashStyle = ChartDashStyle.Solid;
                lineChart_finalScore.ChartAreas["ChartArea1"].AxisX.StripLines.Add(sLAverage);
                lineChart_finalScore.ChartAreas["ChartArea1"].AxisX.StripLines.Add(sLMiddle);

                columnChart_finalScore.Series.Add(new Series(GetGlobalResourceObject("Resource", "sip_num_std").ToString())
                {
                    ChartType = SeriesChartType.Column,
                    BorderWidth = 1,
                    ShadowOffset = 1,
                    Color = Color.SpringGreen
                });

                columnChart_finalScore.Titles.Add(GetGlobalResourceObject("Resource", "sip_std_ach_seg").ToString());
                columnChart_finalScore.ChartAreas["ChartArea1"].BackColor = Color.Wheat;
                columnChart_finalScore.ChartAreas["ChartArea1"].AxisX.Maximum = 100;
                columnChart_finalScore.ChartAreas["ChartArea1"].AxisX.Minimum = 0;
                columnChart_finalScore.ChartAreas["ChartArea1"].AxisX.Interval = 10;
                columnChart_finalScore.ChartAreas["ChartArea1"].AxisY.Interval = 1;
                columnChart_finalScore.ChartAreas["ChartArea1"].AxisX.Title = GetGlobalResourceObject("Resource", "sip_std_score").ToString();
                columnChart_finalScore.ChartAreas["ChartArea1"].AxisY.Title = GetGlobalResourceObject("Resource", "sip_num_std").ToString();


                if (d.Length > 0)
                {
                    int iCount = 0;
                    int iPut = 0;
                    string[] value = new string[d.Length];
                    for (int i = 0; i < d.Length; i++)
                    {
                        value[i] = d[i].ToString();
                    }

                    var source = value.GroupBy(t => t.Trim()).Select(t => new { count = t.Count(), key = t.Key }).ToArray();
                    foreach (var s in source)
                    {
                        columnChart_finalScore.Series[GetGlobalResourceObject("Resource", "sip_num_std").ToString()].Points.AddXY(double.Parse(s.key), s.count);
                        iCount++;
                    }
                    if (iCount < 1)
                    {
                        return;
                    }
                    else
                    {
                        double[] doubleArray = new double[iCount];
                        foreach (var s in source)
                            doubleArray[iPut++] = double.Parse(s.key);
                        DesStatistics dss = new DesStatistics(doubleArray);
                        finalLowestWork.Text = dss.strLoweset;
                        finalQ1Work.Text = dss.strQ1;
                        finalMedianWork.Text = dss.strMedian;
                        finalQ3Work.Text = dss.strQ3;
                        finalHighestWork.Text = dss.strHighest;
                    }
                }
            }

        }
    }
    //protected void btn_home_Click(object sender, EventArgs e)
    //{
    //    if (Session["CODE"] != null) 
    //        Response.Redirect("~/Instructor/home.aspx");
    //    else
    //        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please login!'); window.location='../staff.aspx';", true);
        
    //}

    protected void ImageButton2_Click(object sender, EventArgs e)
    {
        if (Session["CODE"] != null)
            Response.Redirect("~/Academic/home.aspx");
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please login!'); window.location='../staff.aspx';", true);
        }
    }


    protected void adviseButton_Click(object sender, EventArgs e)
    {
        if (id_txt.Text != ""  && Session["CODE"]!=null)
        {
            Session["studentID"] = id_txt.Text;
            Session["class_code"] = subjectCodeList.SelectedValue;
            Session["year"] = yearList.SelectedValue;
            Session["teacher_code"] = Session["CODE"].ToString();
            Session["page"] = "ProgramSubjects.aspx";
			
            Response.Redirect("../Advice/GiveAdvice.aspx");
        }

        else
            return;
    }
    protected void btn_search_Click(object sender, EventArgs e)
    {
        loadDataTable();
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