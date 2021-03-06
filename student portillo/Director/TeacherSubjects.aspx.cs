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

public struct AverageStdevp
{
    public Double Average { get; set; }
    public Double Stdevp { get; set; }
}

public partial class Director_TeacherSubjects : System.Web.UI.Page
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
                teacher_code = Session["CODE"].ToString();
                loadSubjectCode();
                id_txt.Text = "";
                totalPAX.Text = "";
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please login!'); window.location='../login.aspx';", true);
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


    protected void teacherList_SelectedIndexChanged(object sender,
    System.EventArgs e)
    {
        subjectList.Items.Clear();
        // subjectList.Items.Insert(0, new ListItem("--Select--", ""));


    }

    protected void subjectList_SelectedIndexChanged(object sender,
    System.EventArgs e)
    {
        if (subjectList.SelectedValue.ToString() != "")
            setYearAndClassCode(subjectList.SelectedValue);

        bindDatatable();

        loadLineChart_classWork();
        loadLineChart_Exam();
        loadLineChart_finalScore();


        DataTable objdt = new DataTable();
        objdt = loadPieData();
        BindDataToChartcontrol(objdt);


        piePanel.Visible = true;
        linePanel.Visible = true;

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

            sql.Append("SELECT distinct a.STUDENT_ID as s_id, a.name as stu_name, c.SUBJECT_EN, a.class_code as class_code, a.CLASS_WORK_SCORE as class_work_score, ");
            sql.Append("a.EXAM_SCORE as exam_score,a.final_score as final_score, a.grade as grade, isnull(b.gpa, '-') as gpa ");
            sql.Append("FROM   ep_class_grade a full join  student_academic_info b ");
            sql.Append("on a.STUDENT_ID = b.STUDENT_ID inner join academic_result_info c ");
            sql.Append("on c.STUDENT_ID = a.STUDENT_ID inner join teacher_course_info d ");
            sql.Append("on c.SECTION_CODE = d.SECTION_CODE and c.SECTION_YEAR = d.SECTION_YEAR ");
            sql.Append("where d.CODE=@tc and a.class_code=@class_code and a.year=@yrs  and c.STUDENT_STATUS_EN='Active' ");
            sql.Append("and d.SECTION_YEAR=@yrs and c.SUBJECT_CODE =@class_code ");
            sql.Append("order by s_id;");


            SqlCommand cmd = new SqlCommand(sql.ToString(), con);

            cmd.Parameters.AddWithValue("@tc", teacher_code);
            cmd.Parameters.AddWithValue("@sc", subjectList.SelectedValue);
            cmd.Parameters.AddWithValue("@class_code", class_code);
            cmd.Parameters.AddWithValue("@yrs", year);

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
                sb.Append("</tr>");

                txt_subjectName.Text = rdr["SUBJECT_EN"].ToString();
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


    protected void viewButtonClick(object sender, EventArgs e)
    {
        if (id_txt.Text != "")
        {
            Session["student_id"] = id_txt.Text;
            Session["pess_cod"] = getPessCodeByStdID(id_txt.Text);

            // Response.Write("<script>window.open('../Student/schoolStaff.aspx','_blank');</script>");



            //Response.Redirect("~/Student/schoolStaff.aspx?studentid=" + id_txt.Text);
        }
        else
            return;
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

            sql.Append("select Count(*) as TotalRecords, ");
            sql.Append("Sum(case when  a.GRADE <>'F'  then 1 else 0 end) as PassRecords, ");
            sql.Append("Sum(case when  a.GRADE ='F' then 1 else 0 end) as FaileRecords ");
            sql.Append("from ep_class_grade a right outer  join academic_result_info c ");
            sql.Append("on c.STUDENT_ID = a.STUDENT_ID left outer  join teacher_course_info d ");
            sql.Append("on c.SECTION_CODE = d.SECTION_CODE and c.SECTION_YEAR = d.SECTION_YEAR ");
            sql.Append("where a.YEAR=@yrs and a.CLASS_CODE=@class_code and d.CODE =@tc and c.STUDENT_STATUS_EN='Active' ");
            sql.Append("and c.SUBJECT_CODE=@class_code and  d.SECTION_YEAR=@yrs");

            // if (year== "")
            // {
            cmd = new SqlCommand(sql.ToString(), con);

            cmd.Parameters.AddWithValue("@yrs", year);
            cmd.Parameters.AddWithValue("@class_code", class_code);
            cmd.Parameters.AddWithValue("@tc", teacher_code);


            // }
            /*
        else
        {
            cmd = new SqlCommand("select class,total as total_pass,count(a.class_code) as total_pax from ep_class_grade a " +
                                           "inner join " +
                                           "(select  CLASS_CODE as class, COUNT (CLASS_CODE) as total " +
                                           "from ep_class_grade " +
                                           "where year=@yrs and CLASS_CODE=@CLASS_CODE and CLASS_NAME=@class  " +
                                           "and GRADE <>'F' " +
                                           "group by CLASS_CODE) doc " +
                                           "on doc.class=a.CLASS_CODE and a.year=@yrs and a.CLASS_CODE=@CLASS_CODE and a.CLASS_NAME=@class " +
                                           "group by class,total ", con);

            cmd.Parameters.AddWithValue("@yrs", year);
            cmd.Parameters.AddWithValue("@CLASS_CODE", class_code);
            cmd.Parameters.AddWithValue("@class", "");
        }*/

            SqlDataReader rdr1 = null;
            rdr1 = cmd.ExecuteReader();

            while (rdr1.Read())
                if (Int32.Parse(rdr1["TotalRecords"].ToString()) > 0)
                {

                    var objrow = objdt.NewRow();
                    objrow["Status"] = "Total Pass (" + rdr1["PassRecords"].ToString() + ")";

                    double tmp1 = Math.Round((double)Int32.Parse(rdr1["PassRecords"].ToString()) / Int32.Parse(rdr1["TotalRecords"].ToString()), 2);

                    objrow["Percentage"] = tmp1;

                    objdt.Rows.Add(objrow);

                    objrow = objdt.NewRow();



                    objrow["Status"] = "Total Fail (" + rdr1["FaileRecords"].ToString() + ")";

                    double tmp2 = (double)(Int32.Parse(rdr1["FaileRecords"].ToString())) / Int32.Parse(rdr1["TotalRecords"].ToString());

                    double tmp3 = Math.Round(tmp2, 2);

                    objrow["Percentage"] = tmp3;

                    objdt.Rows.Add(objrow);

                    totalPAX.Text = rdr1["TotalRecords"].ToString();
                    total_Stu = Int32.Parse(rdr1["PassRecords"].ToString());
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

            StringBuilder sql = new StringBuilder();

            sql.Append("select distinct FINAL_SCORE, a.STUDENT_ID, CLASS_CODE ");
            sql.Append("from ep_class_grade a inner join academic_result_info c ");
            sql.Append("on c.STUDENT_ID = a.STUDENT_ID inner join teacher_course_info d ");
            sql.Append("on c.SECTION_CODE = d.SECTION_CODE and c.SECTION_YEAR = d.SECTION_YEAR ");
            sql.Append("where a.CLASS_CODE=@class_code and a.YEAR=@yrs ");
            sql.Append("and  c.STUDENT_STATUS_EN='Active'and d.CODE=@tc ");
            sql.Append("and c.SECTION_YEAR=@yrs and d.SECTION_YEAR=@yrs ");
            sql.Append("order by FINAL_SCORE");


            SqlCommand cmd = new SqlCommand(sql.ToString(), con);

            cmd.Parameters.AddWithValue("@class_code", class_code);
            cmd.Parameters.AddWithValue("@yrs", year);
            cmd.Parameters.AddWithValue("@tc", teacher_code);


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

        lineChart_finalScore.Series.Add(new Series("Score Probability Line")
        {
            ChartType = SeriesChartType.Spline,
            BorderWidth = 1,
            ShadowOffset = 1,
            Color = Color.SpringGreen//PaleVioletRed
        }
                );
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

            lineChart_finalScore.Series["Score Probability Line"].Points.DataBindY(dResult);
            //lineChart.Series["SplineSeries"].Points.DataBindY(dResult);
            lineChart_finalScore.Series["Score Probability Line"].Points.DataBindXY(d, dResult);

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

            columnChart_finalScore.Series.Add(new Series("Number of students")
            {
                ChartType = SeriesChartType.Column,
                BorderWidth = 1,
                ShadowOffset = 1,
                Color = Color.SpringGreen
            });

            columnChart_finalScore.Titles.Add("Student achievement scores and the number of distribution segment");
            columnChart_finalScore.ChartAreas["ChartArea1"].BackColor = Color.Wheat;
            columnChart_finalScore.ChartAreas["ChartArea1"].AxisX.Maximum = 100;
            columnChart_finalScore.ChartAreas["ChartArea1"].AxisX.Minimum = 0;
            columnChart_finalScore.ChartAreas["ChartArea1"].AxisX.Interval = 10;
            columnChart_finalScore.ChartAreas["ChartArea1"].AxisY.Interval = 1;
            columnChart_finalScore.ChartAreas["ChartArea1"].AxisX.Title = "Student Score";
            columnChart_finalScore.ChartAreas["ChartArea1"].AxisY.Title = "Number of students";


            if (d.Length > 0)
            {
                string[] value = new string[d.Length];
                for (int i = 0; i < d.Length; i++)
                {
                    value[i] = d[i].ToString();
                }

                var source = value.GroupBy(t => t.Trim()).Select(t => new { count = t.Count(), key = t.Key }).ToArray();
                foreach (var s in source)
                    columnChart_finalScore.Series["Number of students"].Points.AddXY(double.Parse(s.key), s.count);
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

            sql.Append("select distinct CLASS_WORK_SCORE, a.STUDENT_ID, a.CLASS_CODE ");
            sql.Append("from ep_class_grade a inner join academic_result_info c ");
            sql.Append("on c.STUDENT_ID = a.STUDENT_ID inner join teacher_course_info d ");
            sql.Append("on c.SECTION_CODE = d.SECTION_CODE and c.SECTION_YEAR = d.SECTION_YEAR ");
            sql.Append("where a.CLASS_CODE=@class_code and a.YEAR=@yrs ");
            sql.Append("and c.STUDENT_STATUS_EN='Active'and d.CODE=@tc ");
            sql.Append("and c.SECTION_YEAR=@yrs and d.SECTION_YEAR=@yrs ");
            sql.Append("order by CLASS_WORK_SCORE;");


            SqlCommand cmd = new SqlCommand(sql.ToString(), con);

            cmd.Parameters.AddWithValue("@class_code", class_code);
            cmd.Parameters.AddWithValue("@yrs", year);
            cmd.Parameters.AddWithValue("@tc", teacher_code);
            cmd.Parameters.AddWithValue("@sc", subjectList.SelectedValue);

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

        lineChart_classWork.Series.Add(new Series("Score Probability Line")
        {
            ChartType = SeriesChartType.Spline,
            BorderWidth = 1,
            ShadowOffset = 1,
            Color = Color.SpringGreen//PaleVioletRed
        }
                );
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

            lineChart_classWork.Series["Score Probability Line"].Points.DataBindY(dResult);
            //lineChart.Series["SplineSeries"].Points.DataBindY(dResult);
            lineChart_classWork.Series["Score Probability Line"].Points.DataBindXY(d, dResult);

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

            columnChart_classWork.Series.Add(new Series("Number of students")
            {
                ChartType = SeriesChartType.Column,
                BorderWidth = 1,
                ShadowOffset = 1,
                Color = Color.SpringGreen
            });

            columnChart_classWork.Titles.Add("Student achievement scores and the number of distribution segment");
            columnChart_classWork.ChartAreas["ChartArea1"].BackColor = Color.Wheat;
            columnChart_classWork.ChartAreas["ChartArea1"].AxisX.Maximum = 100;
            columnChart_classWork.ChartAreas["ChartArea1"].AxisX.Minimum = 0;
            columnChart_classWork.ChartAreas["ChartArea1"].AxisX.Interval = 10;
            columnChart_classWork.ChartAreas["ChartArea1"].AxisY.Interval = 1;
            columnChart_classWork.ChartAreas["ChartArea1"].AxisX.Title = "Student Score";
            columnChart_classWork.ChartAreas["ChartArea1"].AxisY.Title = "Number of students";


            if (d.Length > 0)
            {
                string[] value = new string[d.Length];
                for (int i = 0; i < d.Length; i++)
                {
                    value[i] = d[i].ToString();
                }

                var source = value.GroupBy(t => t.Trim()).Select(t => new { count = t.Count(), key = t.Key }).ToArray();
                foreach (var s in source)
                    columnChart_classWork.Series["Number of students"].Points.AddXY(double.Parse(s.key), s.count);
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

            sql.Append("select distinct a.STUDENT_ID, a.CLASS_CODE, a.EXAM_SCORE ");
            sql.Append("from ep_class_grade a inner join academic_result_info c ");
            sql.Append("on c.STUDENT_ID = a.STUDENT_ID inner join teacher_course_info d ");
            sql.Append("on c.SECTION_CODE = d.SECTION_CODE and c.SECTION_YEAR = d.SECTION_YEAR ");
            sql.Append("where a.CLASS_CODE=@class_code and a.YEAR=@yrs ");
            sql.Append("and d.code =@tc and c.STUDENT_STATUS_EN='Active' ");
            sql.Append("and c.SECTION_YEAR=@yrs and d.SECTION_YEAR=@yrs ");
            sql.Append("order by EXAM_SCORE;");


            SqlCommand cmd = new SqlCommand(sql.ToString(), con);

            cmd.Parameters.AddWithValue("@class_code", class_code);
            cmd.Parameters.AddWithValue("@yrs", year);
            cmd.Parameters.AddWithValue("@tc", teacher_code);


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

        lineChart_exam.Series.Add(new Series("Score Probability Line")
        {
            ChartType = SeriesChartType.Spline,
            BorderWidth = 1,
            ShadowOffset = 1,
            Color = Color.SpringGreen//PaleVioletRed
        }
                );
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

            lineChart_exam.Series["Score Probability Line"].Points.DataBindY(dResult);
            //lineChart.Series["SplineSeries"].Points.DataBindY(dResult);
            lineChart_exam.Series["Score Probability Line"].Points.DataBindXY(d, dResult);


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

            columnChart_exam.Series.Add(new Series("Number of students")
            {
                ChartType = SeriesChartType.Column,
                BorderWidth = 1,
                ShadowOffset = 1,
                Color = Color.SpringGreen
            });

            columnChart_exam.Titles.Add("Student achievement scores and the number of distribution segment");
            columnChart_exam.ChartAreas["ChartArea1"].BackColor = Color.Wheat;
            columnChart_exam.ChartAreas["ChartArea1"].AxisX.Maximum = 100;
            columnChart_exam.ChartAreas["ChartArea1"].AxisX.Minimum = 0;
            columnChart_exam.ChartAreas["ChartArea1"].AxisX.Interval = 10;
            columnChart_exam.ChartAreas["ChartArea1"].AxisY.Interval = 1;
            columnChart_exam.ChartAreas["ChartArea1"].AxisX.Title = "Student Score";
            columnChart_exam.ChartAreas["ChartArea1"].AxisY.Title = "Number of students";


            if (d.Length > 0)
            {
                string[] value = new string[d.Length];
                for (int i = 0; i < d.Length; i++)
                {
                    value[i] = d[i].ToString();
                }

                var source = value.GroupBy(t => t.Trim()).Select(t => new { count = t.Count(), key = t.Key }).ToArray();
                foreach (var s in source)
                    columnChart_exam.Series["Number of students"].Points.AddXY(double.Parse(s.key), s.count);
            }

        }
    }


    protected void lineChart_finalScore_Init(object sender, EventArgs e)
    {

        lineChart_finalScore.Titles.Add("Student Final Score Probability Distribution Chart");
        lineChart_finalScore.ChartAreas["ChartArea1"].BackColor = Color.Wheat;
        lineChart_finalScore.ChartAreas["ChartArea1"].AxisX.Title = "Student Score";
        lineChart_finalScore.ChartAreas["ChartArea1"].AxisY.Title = "Score Probability";
        lineChart_finalScore.ChartAreas["ChartArea1"].AxisX.Maximum = 100;
        lineChart_finalScore.ChartAreas["ChartArea1"].AxisX.Interval = 10;
        lineChart_finalScore.ChartAreas["ChartArea1"].AxisX.Minimum = 0;
        lineChart_finalScore.ChartAreas["ChartArea1"].RecalculateAxesScale();

    }


    protected void lineChart_classwork_Init(object sender, EventArgs e)
    {
        lineChart_classWork.Titles.Add("Student Class Work Score Probability Distribution Chart");
        lineChart_classWork.ChartAreas["ChartArea1"].BackColor = Color.Wheat;
        lineChart_classWork.ChartAreas["ChartArea1"].AxisX.Title = "Student Score";
        lineChart_classWork.ChartAreas["ChartArea1"].AxisY.Title = "Score Probability";
        lineChart_classWork.ChartAreas["ChartArea1"].AxisX.Maximum = 100;
        lineChart_classWork.ChartAreas["ChartArea1"].AxisX.Interval = 10;
        lineChart_classWork.ChartAreas["ChartArea1"].AxisX.Minimum = 0;
        lineChart_classWork.ChartAreas["ChartArea1"].RecalculateAxesScale();

    }

    protected void lineChart_exam_Init(object sender, EventArgs e)
    {
        lineChart_exam.Titles.Add("Student Exam Score Probability Distribution Chart");
        lineChart_exam.ChartAreas["ChartArea1"].BackColor = Color.Wheat;
        lineChart_exam.ChartAreas["ChartArea1"].AxisX.Title = "Student Score";
        lineChart_exam.ChartAreas["ChartArea1"].AxisY.Title = "Score Probability";
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

        Response.Redirect("home.aspx");
    }
}