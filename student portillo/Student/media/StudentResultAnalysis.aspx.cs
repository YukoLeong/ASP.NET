using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.UI.DataVisualization.Charting;
using System.Drawing;
using System.Text;
using System.Collections;
using System.Threading;
using System.Globalization;

public partial class StudentResultAnalysis : System.Web.UI.Page
{
    public struct AverageStdevp
    {
        public Double Average { get; set; }
        public Double Stdevp { get; set; }
    }

    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ToString());
    public static int total_Stu = 0;
    public static int total_pass = 0;

    public static string stu = "";


    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["CurrentUI"] != null && Session["CurrentUI"].ToString().Equals("zh-TW"))
        {
            ImageButton2.ImageUrl = "../images/homebluec.png";
            ImageButton2.Attributes.Add("onmouseover", "src='../images/homebluec_hover.png'");
            ImageButton2.Attributes.Add("onmouseout", "src='../images/homebluec.png'");
        }
        if (!Page.IsPostBack)
        {
            if (Session["position"] != null && Session["position"].ToString() != "studentview")
            {

                if (Session["ALUN_NUMERO"] != null && Session["ALUN_NUMERO_SEQ"] != null && Session["student_id"] != null)
                {
                    stu_id_txt.Text = Session["student_id"].ToString();
                    std_name_txt.Text = Session["ChineseName"].ToString() + " " + Session["Name_PT"].ToString();
                    bindYearList(Session["ALUN_NUMERO"].ToString(), Session["ALUN_NUMERO_SEQ"].ToString());


                }
                else
                {
                    if (Session["CurrentUI"] != null && Session["CurrentUI"].ToString().Equals("en-US"))
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please login!'); window.location='../home.aspx';", true);
                    else if (Session["CurrentUI"] != null && Session["CurrentUI"].ToString().Equals("zh-TW"))
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('請從新登入!'); window.location='../home.aspx';", true);
                }
            }
            else if (Session["position"] != null && Session["position"].ToString() == "studentview")
            {

                if (Session["ALUN_NUMERO"] != null && Session["ALUN_NUMERO_SEQ"] != null && Session["student_id"] != null)
                {
                    stu_id_txt.Text = Session["student_id"].ToString();
                    std_name_txt.Text = Session["ChineseName"].ToString() + " " + Session["Name_PT"].ToString();
                    bindYearList(Session["ALUN_NUMERO"].ToString(), Session["ALUN_NUMERO_SEQ"].ToString());

                }
                else
                {
                    if (Session["CurrentUI"] != null && Session["CurrentUI"].ToString().Equals("en-US"))
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please login!'); window.location='../home.aspx';", true);
                    else if (Session["CurrentUI"] != null && Session["CurrentUI"].ToString().Equals("zh-TW"))
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('請從新登入!'); window.location='../home.aspx';", true);
                }
            }


        }
    }

    private void bindYearList(string num, string seq)
    {
        try
        {
            con.Open();
            StringBuilder sb = new StringBuilder();

            sb.Append("SELECT distinct YEAR ");
            sb.Append("FROM ep_class_grade ");
            sb.Append("where NUMERO=@num and NUMERO_SEQ=@seq order by year desc");

            SqlCommand cmd = new SqlCommand(sb.ToString(), con);

            cmd.Parameters.AddWithValue("@num", num);
            cmd.Parameters.AddWithValue("@seq", seq);


            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);

            yearDropDownList.Items.Insert(0, new ListItem("--" + GetGlobalResourceObject("Resource", "sip_pls_select") + "--", ""));

            foreach (DataTable table in ds.Tables)
            {
                foreach (DataRow row in table.Rows)
                {
                    foreach (DataColumn column in table.Columns)
                    {
                        yearDropDownList.Items.Add(new ListItem(row["YEAR"].ToString(), row[column].ToString()));
                    }
                }
            }
            yearDropDownList.DataBind();

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


    protected void search_Click(object sender, EventArgs e)
    {
        if (Session["ALUN_NUMERO"] != null && Session["ALUN_NUMERO_SEQ"] != null
            && yearDropDownList.SelectedValue != "")
        {
            try
            {
                con.Open();

                SqlCommand scmd = new SqlCommand("SELECT CLASS_CODE, NUMERO, NUMERO_SEQ, CLASS_NAME, COURSE_CH, COURSE, GRADE, CLASS_WORK_SCORE, EXAM_SCORE, FINAL_SCORE    " +
                                                "FROM ep_class_grade " +
                                                "WHERE year=@y and NUMERO=@num and NUMERO_SEQ=@seq ", con);

                scmd.Parameters.AddWithValue("@y", yearDropDownList.SelectedValue);
                scmd.Parameters.AddWithValue("@num", Session["ALUN_NUMERO"].ToString());
                scmd.Parameters.AddWithValue("@seq", Session["ALUN_NUMERO_SEQ"].ToString());

                SqlDataAdapter da = new SqlDataAdapter(scmd);
                DataTable rdt = new DataTable();

                da.Fill(rdt);

                // DataTable dt = ds.Tables[0];               


                SqlDataReader sqr = null;
                sqr = scmd.ExecuteReader();

                DataTable dt = new DataTable();

                //dt.Columns.Add("NUMERO", typeof(Int32));
                //dt.Columns.Add("NUMERO_SEQ", typeof(Int32));
                dt.Columns.Add("CLASS_NAME", typeof(string));
                dt.Columns.Add("COURSE_CH", typeof(string));
                dt.Columns.Add("COURSE", typeof(string));
                // dt.Columns.Add("GRADE", typeof(string));
                dt.Columns.Add("CLASS_WORK_SCORE", typeof(string));
                dt.Columns.Add("CLASS_WORK_SCORE_RANK", typeof(string));
                dt.Columns.Add("EXAM_SCORE", typeof(string));
                dt.Columns.Add("EXAM_SCORE_RANK", typeof(string));
                dt.Columns.Add("FINAL_SCORE", typeof(string));
                dt.Columns.Add("FINAL_SCORE_RANK", typeof(string));
                dt.Columns.Add("CLASS_NAME_TOTAL", typeof(string));

                foreach (DataRow row in rdt.Rows)
                {

                    DataRow dtrow = dt.NewRow();    // Create New Row
                    //dtrow["NUMERO"] = row["NUMERO"].ToString();
                    //dtrow["NUMERO_SEQ"] = row["NUMERO_SEQ"].ToString();
                    dtrow["CLASS_NAME"] = row["CLASS_NAME"].ToString();
                    dtrow["COURSE_CH"] = row["COURSE_CH"].ToString();
                    dtrow["COURSE"] = row["COURSE"].ToString();
                    //dtrow["GRADE"] = row["GRADE"].ToString();
                    dtrow["CLASS_WORK_SCORE"] = row["CLASS_WORK_SCORE"].ToString();
                    dtrow["CLASS_WORK_SCORE_RANK"] = getPlaces(row["CLASS_WORK_SCORE"].ToString(), "CLASS_WORK_SCORE", row["CLASS_NAME"].ToString());
                    dtrow["EXAM_SCORE"] = row["EXAM_SCORE"].ToString();
                    dtrow["EXAM_SCORE_RANK"] = getPlaces(row["EXAM_SCORE"].ToString(), "EXAM_SCORE", row["CLASS_NAME"].ToString());
                    dtrow["FINAL_SCORE"] = row["FINAL_SCORE"].ToString();
                    dtrow["FINAL_SCORE_RANK"] = getPlaces(row["FINAL_SCORE"].ToString(), "FINAL_SCORE", row["CLASS_NAME"].ToString());
                    dtrow["CLASS_NAME_TOTAL"] = getTotalStd(row["CLASS_NAME"].ToString());
                    dt.Rows.Add(dtrow);

                }

                GridView1.DataSource = dt;
                GridView1.DataBind();

                if (dt.Columns.Count > 0)
                {
                    GridView1.Visible = true;
                    noDataMsg.Visible = false;
                    lb_result.Visible = true;

                }
                else
                {
                    GridView1.Visible = false;
                    noDataMsg.Visible = true;
                    lb_result.Visible = true;
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


        }
        if (yearDropDownList.SelectedValue != "")
            bindGridView2(Session["ALUN_NUMERO"].ToString(), Session["ALUN_NUMERO_SEQ"].ToString());
        else
        {
            GridView1.Visible = false;
            GridView2.Visible = false;
            noDataMsg.Visible = true;
            lb_result.Visible = false;
        }
    }

    private void bindGridView2(string num, string seq)
    {
        if (num != null && seq != null)
        {
            try
            {
                con.Open();
                SqlCommand scmd = new SqlCommand("SELECT PROGRAM_COMPOSITE_EN, PROGRAM_COMPOSITE_CH, GPA " +
                                                "FROM STUDENT_ACADEMIC_INFO " +
                                                "WHERE ALUN_NUMERO=@num AND ALUN_NUMERO_SEQ=@seq", con);

                scmd.Parameters.AddWithValue("@num", num);
                scmd.Parameters.AddWithValue("@seq", seq);

                SqlDataAdapter da = new SqlDataAdapter(scmd);
                DataTable rdt = new DataTable();

                da.Fill(rdt);

                SqlDataReader sqr = null;
                sqr = scmd.ExecuteReader();

                DataTable dt = new DataTable();

                dt.Columns.Add("PROGRAM_COMPOSITE_EN", typeof(string));
                dt.Columns.Add("PROGRAM_COMPOSITE_CH", typeof(string));
                dt.Columns.Add("GPA", typeof(string));
                dt.Columns.Add("RANK", typeof(string));

                foreach (DataRow row in rdt.Rows)
                {
                    DataRow dtrow = dt.NewRow();

                    dtrow["PROGRAM_COMPOSITE_EN"] = row["PROGRAM_COMPOSITE_EN"].ToString();
                    dtrow["PROGRAM_COMPOSITE_CH"] = row["PROGRAM_COMPOSITE_CH"].ToString();
                    dtrow["GPA"] = row["GPA"].ToString();
                    dtrow["RANK"] = getGPAPlaces();
                    dt.Rows.Add(dtrow);
                }

                GridView2.DataSource = dt;
                GridView2.DataBind();

                if (dt.Columns.Count > 0)
                {
                    GridView2.Visible = true;
                    noGPAMsg.Visible = false;
                }
                else
                {
                    GridView2.Visible = false;
                    noGPAMsg.Visible = true;
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
        }
    }



    private string getPlaces(string mark, string score, string classCode)
    {
        SqlConnection con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ToString());
        if (mark != "")
        {
            string places = "";
            Dictionary<string, string> pList = new Dictionary<string, string>();

            pList.Clear();

            try
            {
                con1.Open();
                SqlCommand cmd = new SqlCommand("SELECT NUMERO, NUMERO_SEQ, name, @score ,ROW_NUMBER() over (order by " + score + " desc) as Places " +
                                                "FROM ep_class_grade " +
                                                "where  CLASS_NAME =@class_name and year=@yrs " +
                                                 "group by NUMERO, NUMERO_SEQ, name, " + score + " " +
                                                "order by " + score + " desc", con1);

                cmd.Parameters.AddWithValue("@score", score);
                cmd.Parameters.AddWithValue("@yrs", yearDropDownList.SelectedValue);
                cmd.Parameters.AddWithValue("@class_name", classCode);

                SqlDataReader rdr = null;
                rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    pList.Add(rdr["NUMERO"].ToString() + " " + rdr["NUMERO_SEQ"].ToString(), rdr["Places"].ToString());
                }

                rdr.Close();

                if (pList.ContainsKey(Session["ALUN_NUMERO"].ToString() + " " + Session["ALUN_NUMERO_SEQ"].ToString()))
                {
                    places = pList[Session["ALUN_NUMERO"].ToString() + " " + Session["ALUN_NUMERO_SEQ"].ToString()];


                    return places;
                }
                else
                    return " ";
            }
            catch (Exception ex)
            {
                throw ex;

            }
            finally
            {
                con1.Close();
            }
        }
        else
            return " ";
    }

    private string getGPAPlaces()
    {
        SqlConnection con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ToString());
        string places = "";
        if (Session["programme"] != null && Session["qualified_year"] != null)
        {
            try
            {
                con1.Open();


                Dictionary<string, string> pList = new Dictionary<string, string>();

                pList.Clear();

                SqlCommand cmd = new SqlCommand("SELECT ALUN_NUMERO, ALUN_NUMERO_SEQ, NAME_CH, gpa, ROW_NUMBER() over (order by gpa desc) as Places " +
                                                "From student_academic_info " +
                                                "where PROGRAM_CODE=@program_code and QUALIFIED_YEAR=@qyrs " +
                                                "group by ALUN_NUMERO, ALUN_NUMERO_SEQ, NAME_CH, gpa " +
                                                "order by gpa desc", con1);

                cmd.Parameters.AddWithValue("@program_code", Session["programme"].ToString());
                cmd.Parameters.AddWithValue("@qyrs", Session["qualified_year"].ToString());

                SqlDataReader rdr = null;
                rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    pList.Add(rdr["ALUN_NUMERO"].ToString() + " " + rdr["ALUN_NUMERO_SEQ"].ToString(), rdr["Places"].ToString());
                }

                rdr.Close();

                if (pList.ContainsKey(Session["ALUN_NUMERO"].ToString() + " " + Session["ALUN_NUMERO_SEQ"].ToString()))
                {
                    places = pList[Session["ALUN_NUMERO"].ToString() + " " + Session["ALUN_NUMERO_SEQ"].ToString()];


                    return places;
                }
                else
                    return " ";
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con1.Close();
            }
        }
        else
            return " ";
    }

    private string getTotalStd(string classCode)
    {
        string result = null;
        SqlConnection con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ToString());
        try
        {
            con1.Open();
            SqlCommand cmd = new SqlCommand("SELECT count(distinct NUMERO) as total " +
                                            "FROM ep_class_grade " +
                                            "where year=@yrs and CLASS_NAME=@class_name", con1);

            cmd.Parameters.AddWithValue("@yrs", yearDropDownList.SelectedValue);
            cmd.Parameters.AddWithValue("@class_name", classCode);

            SqlDataReader rdr = null;
            rdr = cmd.ExecuteReader();

            while (rdr.Read())
            {
                result = rdr["total"].ToString();
            }
            return result;
            //rdr.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con1.Close();
        }


    }



    private double[] strArrToDoubleArr(List<String> list)
    {

        double[] nums = new double[list.Count];

        int i = 0;

        foreach (string item in list)
        {
            nums[i] = Double.Parse(item.Trim());
            i++;
        }

        return nums;


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



    protected void btn_back_Click(object sender, EventArgs e)
    {
        Response.Redirect("home.aspx");

    }
    protected void btn_Des_Click(object sender, EventArgs e)
    {
        Response.Redirect("ChartDescription.aspx");
    }
    protected void btn_home_Click(object sender, EventArgs e)
    {
        if (Session["Role_Type"] != null)
        {
            if (Session["Role_Type"].ToString() == "student")
                Response.Redirect("home.aspx");
            else
                Response.Redirect("schoolStaff.aspx");
        }
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


            Thread.CurrentThread.CurrentCulture =
                CultureInfo.CreateSpecificCulture(selectedLanguage);
            Thread.CurrentThread.CurrentUICulture = new
                CultureInfo(selectedLanguage);
        }

        base.InitializeCulture();
    }


}
