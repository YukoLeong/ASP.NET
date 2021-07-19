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
using System.Drawing;
using System.Web.UI.DataVisualization.Charting;
using System.Text.RegularExpressions;
using System.Collections;
using System.Web.Services;
using System.Threading;
using System.Globalization;

public struct AverageStdevp
{
    public Double Average { get; set; }
    public Double Stdevp { get; set; }
}


public partial class Teacher_TeacherSubjects : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ToString());
    public static int total_Stu = 0;
    public static string year = "";
    public static string class_code = "";
    public static string teacher_code = "";

    protected void Page_Load(object sender, EventArgs e)
    {
       

        if (!Page.IsPostBack)
        {
            if (Session["CODE"] != null)
            {
                if (Session["CurrentUI"] != null && Session["CurrentUI"].ToString().Equals("zh-TW"))
                {
                    ImageButton2.ImageUrl = "../images/homebluec.png";
                    ImageButton2.Attributes.Add("onmouseover", "this.src='../images/homebluec_hover.png'");
                    ImageButton2.Attributes.Add("onmouseout", "this.src='../images/homebluec.png'");

                    viewButton.ImageUrl = "../images/detailc1.png";
                    viewButton.Attributes.Add("onmouseover", "this.src='../images/detailc2.png'");
                    viewButton.Attributes.Add("onmouseout", "this.src='../images/detailc1.png'");


                    displayButton.ImageUrl = "../images/searchc1.png";
                    displayButton.Attributes.Add("onmouseover", "this.src='../images/searchc2.png'");
                    displayButton.Attributes.Add("onmouseout", "this.src='../images/searchc1.png'");


                    adviseButton.ImageUrl = "../images/advicec1.png";
                    adviseButton.Attributes.Add("onmouseover", "this.src='../images/advicec1.png'");
                    adviseButton.Attributes.Add("onmouseout", "this.src='../images/advicec1.png'");

                        
                    helpButton.ImageUrl = "../images/helpc1.png";
                    helpButton.Attributes.Add("onmouseover", "this.src='../images/helpc2.png'");
                    helpButton.Attributes.Add("onmouseout", "this.src='../images/helpc1.png'");
                }

                teacher_code = Session["CODE"].ToString();
                loadSubjectCode();
                id_txt.Text = "";
                totalPAX.Text = "";
                txt_subjectName.Text = "";
                ltData.Text = "";
                piePanel.Visible = false;
                linePanel.Visible = false;
                noDataMsg.Visible = false;
                dataPanel.Visible = false;
                classNameList.Items.Clear();
                classNameList.Items.Insert(0, new ListItem("All", ""));
                
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please login!'); window.location='../staff.aspx';", true);
            }
	  


           
          }

    }
	protected void ImageButton2_Click(object sender, EventArgs e)
    {
        if (Session["CODE"] != null)
            Response.Redirect("~/Academic/home.aspx");
        else
        {    
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please login!'); window.location='../staff.aspx';", true);
        }
    }

    protected void subjectList_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        id_txt.Text = "";
        totalPAX.Text = "";
        txt_subjectName.Text = "";
        ltData.Text = "";
        piePanel.Visible = false;
        linePanel.Visible = false;
        noDataMsg.Visible = false;
        dataPanel.Visible = false;
        classNameList.Items.Clear();
        classNameList.Items.Insert(0, new ListItem("All", ""));

       if (subjectList.SelectedValue!="")
			setYearAndClassCode(subjectList.SelectedValue);
		
        try
        {

            con.Open();

            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT distinct SUBJECT_EN, SUBJECT_CH ");
            sb.Append("FROM academic_result_info ");
            sb.Append("where SUBJECT_CODE =@subject_code ");

            SqlCommand cmd = new SqlCommand(sb.ToString(), con);
            SqlDataReader rdr = null;
            cmd.Parameters.AddWithValue("@subject_code", class_code);

            rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {
                txt_subjectName.Text = rdr["SUBJECT_EN"].ToString() + " - " + rdr["SUBJECT_CH"].ToString();
            }
        }
        catch (Exception ex)
        {            
            throw ex; 
        }
        finally
        {
            con.Close();
            if (semsList.SelectedValue != "" && Session["CODE"] != null)
                loadClassName(Session["CODE"].ToString());
        }
    }

    protected void semsList_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        if (semsList.SelectedValue!=""&& Session["CODE"]!=null)
            loadClassName(Session["CODE"].ToString());
    }

    private void loadClassName(string code){
        classNameList.Items.Clear();
        //classNameList.Items.Insert(0, new ListItem("--Please Select--", ""));
        classNameList.Items.Insert(0, new ListItem("All", ""));

        piePanel.Visible = false;
        linePanel.Visible = false;
        noDataMsg.Visible = false;
        dataPanel.Visible = false;
        //txt_subjectName.Text = "";

        ltData.Text = "";
		
		if (subjectList.SelectedValue!="")
			setYearAndClassCode(subjectList.SelectedValue);

        try
        {
            con.Open();
            StringBuilder sb = new StringBuilder();

            sb.Append("SELECT distinct SECTION_NAME ");
            sb.Append("FROM teacher_course_info a ");
            sb.Append("inner join academic_result_info b ");
            sb.Append("on a.SECTION_CODE = b.SECTION_CODE and a.SECTION_YEAR = b.ACADEMIC_YEAR and b.ACADEMIC_SEMESTER=@sems and  a.SECTION_YEAR = @yrs ");
            sb.Append("where b.SUBJECT_CODE = @subjectCode and a.code=@code;");

            SqlCommand cmd = new SqlCommand(sb.ToString(), con);

            cmd.Parameters.AddWithValue("@subjectCode", class_code);
            cmd.Parameters.AddWithValue("@sems", Int32.Parse(semsList.SelectedValue));
            cmd.Parameters.AddWithValue("@yrs", year);
            cmd.Parameters.AddWithValue("@code", code);

            SqlDataReader rdr = null;
            rdr = cmd.ExecuteReader();

            while (rdr.Read())
            {
                string item = rdr["SECTION_NAME"].ToString();
                classNameList.Items.Add(new ListItem(item, item));
            }
            classNameList.DataBind();

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

   
    private void loadSubjectCode()
    {
        subjectList.Items.Clear();
        try
        {
            con.Open();


            subjectList.Items.Clear();

            StringBuilder sb = new StringBuilder();

            sb.Append("SELECT distinct b.SECTION_YEAR, b.SUBJECT_CODE ");
            sb.Append("FROM teacher_course_info a ");
            sb.Append("inner join academic_result_info b on ");
            sb.Append("a.SECTION_CODE = b.SECTION_CODE and a.SECTION_YEAR = b.SECTION_YEAR ");
            sb.Append("where b.STUDENT_STATUS_EN='Active'and CODE=@tc ");
            sb.Append("order by b.SECTION_YEAR desc;");

            SqlCommand cmd = new SqlCommand(sb.ToString(), con);

            cmd.Parameters.AddWithValue("@tc", teacher_code);
            

            SqlDataReader rdr = null;
            rdr = cmd.ExecuteReader();

            while (rdr.Read())
            {
                string item = rdr["SECTION_YEAR"].ToString() + "  " + rdr["SUBJECT_CODE"].ToString();
                subjectList.Items.Add(new ListItem(item, item));
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

    protected void displayButtonClick(object sender, System.EventArgs e)
    {
        if (subjectList.SelectedValue.ToString() != "")
            setYearAndClassCode(subjectList.SelectedValue);

        bindDatatable();

        loadLineChart_classWork();
        loadLineChart_Exam();
        loadLineChart_finalScore();


        DataTable objdt = new DataTable();
        objdt = loadPieData();

        if (objdt.Rows.Count > 0)
        {
            BindDataToChartcontrol(objdt);

            dataPanel.Visible = true;
            piePanel.Visible = true;
            linePanel.Visible = true;
            noDataMsg.Visible = false;
        }
        else
        {
            dataPanel.Visible = false;
            noDataMsg.Visible = true;
            piePanel.Visible = false;
            linePanel.Visible = false;
        }

    }


    public void BindDataToChartcontrol(DataTable objdt)
    {
        pieChart.DataSource = objdt;
        pieChart.DataBind();

    }

    protected void setYearAndClassCode(string courseSubject)
    {

        // Regex r = new Regex(" +");
        string[] words = Regex.Split(courseSubject, " +");


        year = words[0];

        class_code = words[1];
    }

    protected void bindDatatable()
    {
        try
        {
            con.Open();
            StringBuilder sql = new StringBuilder();
            SqlCommand cmd = null;

            if (classNameList.SelectedValue == "")
            {
                sql.Append("SELECT distinct a.STUDENT_ID as s_id, a.name as stu_name,c.SUBJECT_EN ,a.COURSE_CH, a.class_code as class_code, a.CLASS_WORK_SCORE as class_work_score, ");
                sql.Append("a.EXAM_SCORE as exam_score,a.final_score as final_score, a.grade as grade, isnull(b.gpa, '-') as gpa, b.ALUN_NUMERO , b.ALUN_NUMERO_SEQ, b.PESS_COD ");
                sql.Append("FROM   ep_class_grade a full join  student_academic_info b ");
                sql.Append("on b.ALUN_NUMERO = a.NUMERO and b.ALUN_NUMERO_SEQ =a.NUMERO_SEQ inner join academic_result_info c ");
                sql.Append("on c.ALUN_NUMERO = a.NUMERO and c.ALUN_NUMERO_SEQ =a.NUMERO_SEQ inner join teacher_course_info d ");
                sql.Append("on c.SECTION_CODE = d.SECTION_CODE and c.SECTION_YEAR = d.SECTION_YEAR ");
                sql.Append("where d.CODE=@tc and a.class_code=@class_code and a.year=@yrs  and c.STUDENT_STATUS_EN='Active' ");
                sql.Append("and d.SECTION_YEAR=@yrs and c.SUBJECT_CODE =@class_code and  a.SEMESTRE=@sems ");
                sql.Append("order by s_id;");

                cmd = new SqlCommand(sql.ToString(), con);

                cmd.Parameters.AddWithValue("@tc", teacher_code);
                cmd.Parameters.AddWithValue("@sc", subjectList.SelectedValue);
                cmd.Parameters.AddWithValue("@class_code", class_code);
                cmd.Parameters.AddWithValue("@yrs", year);
                cmd.Parameters.AddWithValue("@sems", semsList.SelectedValue);
            }
            else
            {
                sql.Append("SELECT distinct a.STUDENT_ID as s_id, a.name as stu_name,c.SUBJECT_EN, a.COURSE_CH ,a.class_code as class_code, a.CLASS_WORK_SCORE as class_work_score, ");
                sql.Append("a.EXAM_SCORE as exam_score,a.final_score as final_score, a.grade as grade, isnull(b.gpa, '-') as gpa, b.ALUN_NUMERO , b.ALUN_NUMERO_SEQ, b.PESS_COD ");
                sql.Append("FROM   ep_class_grade a full join  student_academic_info b ");
                sql.Append("on b.ALUN_NUMERO = a.NUMERO and b.ALUN_NUMERO_SEQ =a.NUMERO_SEQ inner join academic_result_info c ");
                sql.Append("on c.ALUN_NUMERO = a.NUMERO and c.ALUN_NUMERO_SEQ =a.NUMERO_SEQ inner join teacher_course_info d ");
                sql.Append("on c.SECTION_CODE = d.SECTION_CODE and c.SECTION_YEAR = d.SECTION_YEAR ");
                sql.Append("where d.CODE=@tc and a.class_code=@class_code and a.year=@yrs  and c.STUDENT_STATUS_EN='Active' and a.CLASS_NAME =@class_name ");
                sql.Append("and d.SECTION_YEAR=@yrs and c.SUBJECT_CODE =@class_code and  a.SEMESTRE=@sems ");
                sql.Append("order by s_id;");

                cmd = new SqlCommand(sql.ToString(), con);

                cmd.Parameters.AddWithValue("@tc", teacher_code);
                cmd.Parameters.AddWithValue("@sc", subjectList.SelectedValue);
                cmd.Parameters.AddWithValue("@class_code", class_code);
                cmd.Parameters.AddWithValue("@yrs", year);
                cmd.Parameters.AddWithValue("@sems", semsList.SelectedValue);
                cmd.Parameters.AddWithValue("@class_name", classNameList.SelectedValue);
            }
        

            SqlDataReader rdr = null;

            StringBuilder sb = new StringBuilder();
            rdr = cmd.ExecuteReader();

            while (rdr.Read())
            {
                sb.Append("<tr>");
                sb.Append("<td>");
                sb.Append(rdr["s_id"].ToString());
                sb.Append("</td>");
                sb.Append("<td>");
                sb.Append(rdr["stu_name"].ToString());
                sb.Append("</td>");
                sb.Append("<td>");
                sb.Append(rdr["class_code"].ToString());
                sb.Append("</td>");
                sb.Append("<td>");
                sb.Append(rdr["class_work_score"].ToString());
                sb.Append("</td>");
                sb.Append("<td>");
                sb.Append(rdr["exam_score"].ToString());
                sb.Append("</td>");
                sb.Append("<td>");
                sb.Append(rdr["final_score"].ToString());
                sb.Append("</td>");
                sb.Append("<td>");
                sb.Append(rdr["grade"].ToString());
                sb.Append("</td>");
                sb.Append("<td>");
                sb.Append(rdr["gpa"].ToString());
                sb.Append("</td>");
                sb.Append("<td style='display:none;'>");
                sb.Append(rdr["ALUN_NUMERO"].ToString());
                sb.Append("</td>");
                sb.Append("<td style='display:none;'>");
                sb.Append(rdr["ALUN_NUMERO_SEQ"].ToString());
                sb.Append("</td>");
				 sb.Append("<td style='display:none;'>");
                sb.Append(rdr["PESS_COD"].ToString());
                sb.Append("</td>");
				
				
                sb.Append("</tr>");

                //txt_subjectName.Text = rdr["SUBJECT_EN"].ToString() + " - " + rdr["COURSE_CH"].ToString();

            }
            ltData.Text = sb.ToString();
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

  
    /*
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

    public string getALUN_NUMERO(string sid)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ToString());
        StringBuilder sb = new StringBuilder();
        StringBuilder data = new StringBuilder();

        try
        {
            con.Open();


            sb.Append("SELECT  ALUN_NUMERO, ");
            sb.Append("ALUN_NUMERO_SEQ ");
            sb.Append("FROM student_academic_info ");
            sb.Append("where STUDENT_ID=@std_id");

            SqlCommand cmd = new SqlCommand(sb.ToString(), con);

            cmd.Parameters.AddWithValue("@std_id", sid);

            SqlDataReader rdr = null;
            rdr = cmd.ExecuteReader();

            while (rdr.Read())
            {
                if (rdr["ALUN_NUMERO"] != null && rdr["ALUN_NUMERO_SEQ"] != null)
                {
                    data.Append(rdr["ALUN_NUMERO"].ToString() + " , ");
                    data.Append(rdr["ALUN_NUMERO_SEQ"].ToString());
                }
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



        return data.ToString();
    }
    */

    [System.Web.Services.WebMethod]
    public static void SetSessionValue(string key, string value)
    {
        HttpContext.Current.Session[key] = value;
    }

    
    public DataTable loadPieData()
    {
        DataTable objdt = new DataTable();

        try
        {
            objdt.Columns.Add("Status", typeof(string));
            objdt.Columns.Add("Percentage", typeof(double));

            con.Open();

            SqlCommand cmd = null;
            StringBuilder sql = new StringBuilder();

            if (classNameList.SelectedValue == "")
            {
                sql.Append("select ");
                sql.Append("Count(*) as TotalRecords, ");
                sql.Append("Sum(case when  temp1.GRADE <>'F'  then 1 else 0 end) as PassRecords, ");
                sql.Append("Sum(case when  temp1.GRADE ='F' then 1 else 0 end) as FaileRecords ");
                sql.Append("from  (select distinct a.NUMERO, a.NUMERO_SEQ , a.GRADE ");
                sql.Append("from ep_class_grade a inner join academic_result_info c ");
                sql.Append("on c.ALUN_NUMERO = a.NUMERO and c.ALUN_NUMERO_SEQ =a.NUMERO_SEQ  ");
                sql.Append("where a.YEAR=@yrs and a.CLASS_CODE=@class_code  and c.STUDENT_STATUS_EN='Active' and a.SEMESTRE=@sems ");
                sql.Append("and c.SUBJECT_CODE=@class_code  )  temp1  ");
                sql.Append("inner join  (select distinct ar.ALUN_NUMERO, ar.ALUN_NUMERO_SEQ from  teacher_course_info d ");
                sql.Append("inner join academic_result_info ar  on ar.SECTION_CODE = d.SECTION_CODE and ar.SECTION_YEAR = d.SECTION_YEAR) temp2   ");
                sql.Append("on temp1.NUMERO = temp2.ALUN_NUMERO and temp1.NUMERO_SEQ = temp2.ALUN_NUMERO_SEQ  ");

                cmd = new SqlCommand(sql.ToString(), con);

                cmd.Parameters.AddWithValue("@yrs", year);
                cmd.Parameters.AddWithValue("@class_code", class_code);
                cmd.Parameters.AddWithValue("@tc", teacher_code);
                cmd.Parameters.AddWithValue("@sems", semsList.SelectedValue);
            }
            else
            {
                sql.Append("select ");
                sql.Append("Count(*) as TotalRecords, ");
                sql.Append("Sum(case when  temp1.GRADE <>'F'  then 1 else 0 end) as PassRecords, ");
                sql.Append("Sum(case when  temp1.GRADE ='F' then 1 else 0 end) as FaileRecords ");
                sql.Append("from  (select distinct a.NUMERO, a.NUMERO_SEQ , a.GRADE ");
                sql.Append("from ep_class_grade a inner join academic_result_info c ");
                sql.Append("on c.ALUN_NUMERO = a.NUMERO and c.ALUN_NUMERO_SEQ =a.NUMERO_SEQ  ");
                sql.Append("where a.YEAR=@yrs and a.CLASS_CODE=@class_code and c.STUDENT_STATUS_EN='Active' and c.ACADEMIC_SEMESTER=@sems and c.SECTION_NAME =@class_name ");
                sql.Append("and c.SUBJECT_CODE=@class_code )  temp1  ");
                sql.Append("inner join  (select distinct ar.ALUN_NUMERO, ar.ALUN_NUMERO_SEQ from  teacher_course_info d ");
                sql.Append("inner join academic_result_info ar  on ar.SECTION_CODE = d.SECTION_CODE and ar.SECTION_YEAR = d.SECTION_YEAR) temp2   ");
                sql.Append("on temp1.NUMERO = temp2.ALUN_NUMERO and temp1.NUMERO_SEQ = temp2.ALUN_NUMERO_SEQ  ");

                cmd = new SqlCommand(sql.ToString(), con);

                cmd.Parameters.AddWithValue("@yrs", year);
                cmd.Parameters.AddWithValue("@class_code", class_code);
                cmd.Parameters.AddWithValue("@tc", teacher_code);
                cmd.Parameters.AddWithValue("@sems", semsList.SelectedValue);
                cmd.Parameters.AddWithValue("@class_name", classNameList.SelectedValue);
            }          

            SqlDataReader rdr1 = null;
            rdr1 = cmd.ExecuteReader();

            while (rdr1.Read())
                if (Int32.Parse(rdr1["TotalRecords"].ToString()) > 0)
                {

                    var objrow = objdt.NewRow();
                    objrow["Status"] = GetGlobalResourceObject("Resource", "sip_total_pass").ToString()+" ("+ rdr1["PassRecords"].ToString() + ")";

                    double tmp1 = Math.Round((double)Int32.Parse(rdr1["PassRecords"].ToString()) / Int32.Parse(rdr1["TotalRecords"].ToString()), 2);

                    objrow["Percentage"] = tmp1;

                    objdt.Rows.Add(objrow);

                    objrow = objdt.NewRow();



                    objrow["Status"] = GetGlobalResourceObject("Resource", "sip_total_fail").ToString()+" (" + rdr1["FaileRecords"].ToString() +")";

                    double tmp2 = (double)(Int32.Parse(rdr1["FaileRecords"].ToString())) / Int32.Parse(rdr1["TotalRecords"].ToString());

                    double tmp3 = Math.Round(tmp2, 2);

                    objrow["Percentage"] = tmp3;

                    objdt.Rows.Add(objrow);

                    totalPAX.Text = rdr1["TotalRecords"].ToString();
                    total_Stu = Int32.Parse(rdr1["PassRecords"].ToString());
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

        return objdt;
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

    protected void loadLineChart_finalScore()
    {
       

        double[] d;
        List<String> scorelist = new List<String>();

        try
        {
            con.Open();

            StringBuilder sql =new  StringBuilder();
            SqlCommand cmd = null;

            if (classNameList.SelectedValue == "")
            {
                sql.Append("select distinct FINAL_SCORE, a.STUDENT_ID, CLASS_CODE ");
                sql.Append("from ep_class_grade a inner join academic_result_info c ");
                sql.Append("on c.ALUN_NUMERO = a.NUMERO and c.ALUN_NUMERO_SEQ =a.NUMERO_SEQ inner join teacher_course_info d ");
                sql.Append("on c.SECTION_CODE = d.SECTION_CODE and c.SECTION_YEAR = d.SECTION_YEAR ");
                sql.Append("where a.CLASS_CODE=@class_code and a.YEAR=@yrs ");
                sql.Append("and  c.STUDENT_STATUS_EN='Active'and d.CODE=@tc ");
                sql.Append("and c.SECTION_YEAR=@yrs and d.SECTION_YEAR=@yrs and a.SEMESTRE=@sems ");
                sql.Append("order by FINAL_SCORE");


                cmd = new SqlCommand(sql.ToString(), con);

                cmd.Parameters.AddWithValue("@class_code", class_code);
                cmd.Parameters.AddWithValue("@yrs", year);
                cmd.Parameters.AddWithValue("@tc", teacher_code);
                cmd.Parameters.AddWithValue("@sems", semsList.SelectedValue);
            }
            else
            {
                sql.Append("select distinct FINAL_SCORE, a.STUDENT_ID, CLASS_CODE ");
                sql.Append("from ep_class_grade a inner join academic_result_info c ");
                sql.Append("on c.ALUN_NUMERO = a.NUMERO and c.ALUN_NUMERO_SEQ =a.NUMERO_SEQ inner join teacher_course_info d ");
                sql.Append("on c.SECTION_CODE = d.SECTION_CODE and c.SECTION_YEAR = d.SECTION_YEAR ");
                sql.Append("where a.CLASS_CODE=@class_code and a.YEAR=@yrs ");
                sql.Append("and  c.STUDENT_STATUS_EN='Active'and d.CODE=@tc ");
                sql.Append("and c.SECTION_YEAR=@yrs and d.SECTION_YEAR=@yrs and a.SEMESTRE=@sems and c.SECTION_NAME=@class_name ");
                sql.Append("order by FINAL_SCORE");


                cmd = new SqlCommand(sql.ToString(), con);

                cmd.Parameters.AddWithValue("@class_code", class_code);
                cmd.Parameters.AddWithValue("@yrs", year);
                cmd.Parameters.AddWithValue("@tc", teacher_code);
                cmd.Parameters.AddWithValue("@sems", semsList.SelectedValue);
                cmd.Parameters.AddWithValue("@class_name", classNameList.SelectedValue);
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
            con.Close();
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
            ShadowOffset =1,
            Color = Color.SpringGreen//PaleVioletRed
        });
        /////////////////Testing Data Start////////////////////////////////

        //  double[] tData = new double[] { 0, 20, 25, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95 };
        // double[] tData = new double[] { 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95 };
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
            {   int iCount=0;
		        int iPut=0;	
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
				if(iCount<1){
					return;
				}
				else{
				    double[] doubleArray = new double[iCount];
				    foreach(var s in source)
				    doubleArray[iPut++]=double.Parse(s.key);
				    DesStatistics dss = new DesStatistics(doubleArray);
				    LowestScore.Text = dss.strLoweset;
                    Q1Score.Text = dss.strQ1;
                    MedianScore.Text = dss.strMedian;
                    Q3Score.Text = dss.strQ3;
                    HighestScore.Text = dss.strHighest;
				}
										
            }




        }


    }

    protected void loadLineChart_classWork()
    {

        double[] d;
        List<String> scorelist = new List<String>();

        try
        {
            con.Open();
            StringBuilder sql = new StringBuilder();
            SqlCommand cmd = null;
            if (classNameList.SelectedValue == "")
            {

                sql.Append("select distinct CLASS_WORK_SCORE, a.STUDENT_ID, a.CLASS_CODE ");
                sql.Append("from ep_class_grade a inner join academic_result_info c ");
                sql.Append("on c.ALUN_NUMERO = a.NUMERO and c.ALUN_NUMERO_SEQ =a.NUMERO_SEQ inner join teacher_course_info d ");
                sql.Append("on c.SECTION_CODE = d.SECTION_CODE and c.SECTION_YEAR = d.SECTION_YEAR ");
                sql.Append("where a.CLASS_CODE=@class_code and a.YEAR=@yrs ");
                sql.Append("and c.STUDENT_STATUS_EN='Active'and d.CODE=@tc ");
                sql.Append("and c.SECTION_YEAR=@yrs and d.SECTION_YEAR=@yrs and a.SEMESTRE=@sems ");
                sql.Append("order by CLASS_WORK_SCORE;");


                cmd = new SqlCommand(sql.ToString(), con);

                cmd.Parameters.AddWithValue("@class_code", class_code);
                cmd.Parameters.AddWithValue("@yrs", year);
                cmd.Parameters.AddWithValue("@tc", teacher_code);
                cmd.Parameters.AddWithValue("@sc", subjectList.SelectedValue);
                cmd.Parameters.AddWithValue("@sems", semsList.SelectedValue);

            }
            else
            {
                sql.Append("select distinct CLASS_WORK_SCORE, a.STUDENT_ID, a.CLASS_CODE ");
                sql.Append("from ep_class_grade a inner join academic_result_info c ");
                sql.Append("on c.ALUN_NUMERO = a.NUMERO and c.ALUN_NUMERO_SEQ =a.NUMERO_SEQ inner join teacher_course_info d ");
                sql.Append("on c.SECTION_CODE = d.SECTION_CODE and c.SECTION_YEAR = d.SECTION_YEAR ");
                sql.Append("where a.CLASS_CODE=@class_code and a.YEAR=@yrs ");
                sql.Append("and c.STUDENT_STATUS_EN='Active'and d.CODE=@tc ");
                sql.Append("and c.SECTION_YEAR=@yrs and d.SECTION_YEAR=@yrs and a.SEMESTRE=@sems and c.SECTION_NAME =@class_name ");
                sql.Append("order by CLASS_WORK_SCORE;");

                cmd = new SqlCommand(sql.ToString(), con);

                cmd.Parameters.AddWithValue("@class_code", class_code);
                cmd.Parameters.AddWithValue("@yrs", year);
                cmd.Parameters.AddWithValue("@tc", teacher_code);
                cmd.Parameters.AddWithValue("@sc", subjectList.SelectedValue);
                cmd.Parameters.AddWithValue("@sems", semsList.SelectedValue);
                cmd.Parameters.AddWithValue("@class_name", classNameList.SelectedValue);
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
            con.Close();
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

        //  double[] tData = new double[] { 0, 20, 25, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95 };
        // double[] tData = new double[] { 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95 };
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
				int iCount=0;
		        int iPut=0;
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
				  if(iCount<1){
					return;
			     	}
					else{
						double[] doubleArray = new double[iCount];
						
						foreach(var s in source) 
							doubleArray[iPut++]=double.Parse(s.key);
							
						DesStatistics dss = new DesStatistics(doubleArray);
						LowestWork.Text = dss.strLoweset;
						Q1Work.Text = dss.strQ1;
						MedianWork.Text = dss.strMedian;
						Q3Work.Text = dss.strQ3;
						HighestWork.Text = dss.strHighest;
					}
				
					
            }
           
        }
       
    }


    protected void loadLineChart_Exam()
    {

        double[] d;
        List<String> scorelist = new List<String>();

        try
        {
            con.Open();
            StringBuilder sql = new StringBuilder();
            SqlCommand cmd = null;

            if (classNameList.SelectedValue == "")
            {

                sql.Append("select distinct a.STUDENT_ID, a.CLASS_CODE, a.EXAM_SCORE ");
                sql.Append("from ep_class_grade a inner join academic_result_info c ");
                sql.Append("on c.ALUN_NUMERO = a.NUMERO and c.ALUN_NUMERO_SEQ =a.NUMERO_SEQ inner join teacher_course_info d ");
                sql.Append("on c.SECTION_CODE = d.SECTION_CODE and c.SECTION_YEAR = d.SECTION_YEAR ");
                sql.Append("where a.CLASS_CODE=@class_code and a.YEAR=@yrs ");
                sql.Append("and d.code =@tc and c.STUDENT_STATUS_EN='Active' ");
                sql.Append("and c.SECTION_YEAR=@yrs and d.SECTION_YEAR=@yrs and a.SEMESTRE=@sems ");
                sql.Append("order by EXAM_SCORE;");


                cmd = new SqlCommand(sql.ToString(), con);

                cmd.Parameters.AddWithValue("@class_code", class_code);
                cmd.Parameters.AddWithValue("@yrs", year);
                cmd.Parameters.AddWithValue("@tc", teacher_code);
                cmd.Parameters.AddWithValue("@sems", semsList.SelectedValue);
            }
            else
            {
                sql.Append("select distinct a.STUDENT_ID, a.CLASS_CODE, a.EXAM_SCORE ");
                sql.Append("from ep_class_grade a inner join academic_result_info c ");
                sql.Append("on c.ALUN_NUMERO = a.NUMERO and c.ALUN_NUMERO_SEQ =a.NUMERO_SEQ inner join teacher_course_info d ");
                sql.Append("on c.SECTION_CODE = d.SECTION_CODE and c.SECTION_YEAR = d.SECTION_YEAR ");
                sql.Append("where a.CLASS_CODE=@class_code and a.YEAR=@yrs ");
                sql.Append("and d.code =@tc and c.STUDENT_STATUS_EN='Active' ");
                sql.Append("and c.SECTION_YEAR=@yrs and d.SECTION_YEAR=@yrs and a.SEMESTRE=@sems and c.SECTION_NAME=@class_name ");
                sql.Append("order by EXAM_SCORE;");


                cmd = new SqlCommand(sql.ToString(), con);

                cmd.Parameters.AddWithValue("@class_code", class_code);
                cmd.Parameters.AddWithValue("@yrs", year);
                cmd.Parameters.AddWithValue("@tc", teacher_code);
                cmd.Parameters.AddWithValue("@sems", semsList.SelectedValue);
                cmd.Parameters.AddWithValue("@class_name", classNameList.SelectedValue);
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
            con.Close();
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

        //  double[] tData = new double[] { 0, 20, 25, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95 };
        // double[] tData = new double[] { 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95 };
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
            {   int iCount=0;
		        int iPut=0;
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
				if(iCount<1){
					return;
				}else{
					double[] doubleArray = new double[iCount];
					foreach(var s in source)
					doubleArray[iPut++]=double.Parse(s.key);
					DesStatistics dss = new DesStatistics(doubleArray);
					LowestExam.Text = dss.strLoweset;
					Q1Exam.Text = dss.strQ1;
					MedianExam.Text = dss.strMedian;
					Q3Exam.Text = dss.strQ3;
					HighestExam.Text = dss.strHighest;
				}
            }

        }
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

    protected void adviseButton_Click(object sender, EventArgs e)
    {
        if (id_txt.Text != "")
        {
            Session["studentID"] = id_txt.Text;
            Session["class_code"] = class_code;
            Session["year"] = year;
            Session["teacher_code"] = teacher_code;
            Session["page"] = "TeacherSubjects.aspx";
			
            Response.Redirect("../Advice/GiveAdvice.aspx");
        }

        else
            return;
    }

    protected void homeButton_Click(object sender, EventArgs e)
    {
          if (Session["Role_Type"] != null)
          {
             Response.Redirect("../Academic/home.aspx");
          }
          else
              ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please login!'); window.location='../staff.aspx';", true);
    }
	protected void helpButton_Click(object sender, EventArgs e)
	{
	    Response.Redirect("ChartDescription.aspx");
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