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
using System.Threading;
using System.Globalization;

public partial class Instructor_AdviserAssistant : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ToString());
   
   
    protected void Page_Load(object sender, EventArgs e)
    {   
        if (!IsPostBack)
        {
           // Session["Role_Type"] = "coordinator";
           // Session["CODE"] = "hxdai";
           // Session["School_code"] = "ESS";
           // Session["Programme"] = "4LEGDCI";
           if ( Session["CODE"] != null && Session["Role_Type"].ToString() == "coordinator" &&
               Session["School_code"] != null && Session["Programme"] != null)
            {
                 ViewState["str_code"]= Session["CODE"].ToString();
			     ViewState["str_name"]= EpDao.getSchoolNameEN(Session["School_code"].ToString());
				 tbProgram.Text=getSchoolName(Session["School_code"].ToString());
				 ViewState["program"] = Session["Programme"].ToString();
              //tbCourse.Text = Session["Programme"].ToString();
			    getInitial();
			    
                
            }

            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please login!'); window.location='../staff.aspx';", true);
            }
        }

    }
	
	 private string getSchoolName(string schoolCode)
    {
        string name = "";

        try
        {
            conn.Open();
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT  school_en, school_ch ");
            sb.Append("FROM school_info ");
            sb.Append("where SCHOOL_CODE=@scode");

            SqlCommand cmd = new SqlCommand(sb.ToString(), conn);

            cmd.Parameters.AddWithValue("@scode", schoolCode);


            SqlDataReader rdr = null;
            rdr = cmd.ExecuteReader();

            while (rdr.Read())
            {
                if (rdr["school_en"] != null)
                {
                    name = rdr["school_en"].ToString() + " - " + rdr["school_ch"].ToString(); ;

                }
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
        return name;

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
	private void  getInitial()
	{
		 bindProgramNameEN(getProgram(Session["Programme"].ToString()));
		 if(programList.Items.Count>0 && yearListBox.Items.Count>0)
		 {
			 programList.SelectedIndex=1;
		     getAcadYear();
		     yearListBox.SelectedIndex=1;
		     fillDataTable();
             dataPanel.Visible = true;  
		 }		 
		
	}
	 public void bindProgramNameEN(string programString)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ToString());
     
        try
        {
            con.Open();
            StringBuilder sb = new StringBuilder();
           

             SqlCommand cmd = new SqlCommand( "SELECT DISTINCT  " +
            "CODE,SIMPLIFY_CODE, NAME, PROGRAM_COMPOSITE_EN " +
            "FROM program_info " +
            "WHERE SIMPLIFY_CODE in (" + programString + ")" , con);

           
            SqlDataReader rdr = null;
            rdr = cmd.ExecuteReader();

            while (rdr.Read())
            {
                if (rdr["CODE"] != null)
                {
                  programList.Items.Add(new ListItem(rdr["CODE"].ToString() + " "+ rdr["NAME"].ToString()+" "+
					rdr["PROGRAM_COMPOSITE_EN"].ToString(), rdr["SIMPLIFY_CODE"].ToString()));

                }
            }
            programList.DataBind();
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
	protected void cursoList_SelectedIndexChanged(object sender, System.EventArgs e)
    {
                   getAcadYear();
         dataPanel.Visible = false; 
    }
    private void getAcadYear()
    {
             yearListBox.Items.Clear();
             yearListBox.Items.Insert(0, new ListItem("--Please Select--", ""));
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT distinct YEAR " +
                                            "FROM ep_class_grade " +
                                            "WHERE SCHOOL=@school and SIMPLIFY_CODE=@curso order by year desc ", conn);
            cmd.Parameters.AddWithValue("@school", ViewState["str_name"].ToString());
            cmd.Parameters.AddWithValue("@curso", programList.SelectedValue);

            SqlDataReader sqr = cmd.ExecuteReader();
            while (sqr.Read())
            {
                if (sqr["YEAR"] != null)
                    yearListBox.Items.Add(new ListItem(sqr["YEAR"].ToString()));

            }
            yearListBox.DataBind();
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

    protected void btn_home_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Academic/home.aspx");
    }
    protected void btn_Search_Click(object sender, System.EventArgs e)
    {
        if (yearListBox.SelectedValue == null)
        {
            Response.Write("<script language='javascript' >alert('Sorry no data!')</script>");
            return;
         }
       
        fillDataTable();
        dataPanel.Visible = true;       
    }

    private void fillDataTable()
    {
        try
        {            
            conn.Open();
            StringBuilder sql = new StringBuilder();
            sql.Append(" SELECT DISTINCT e.SCHOOL AS [SCHOOL],e.CURSO  AS [CURSO],sa.ACADEMIC_YEAR  AS [ACADEMIC_YEAR],sa.A_Y  AS GPA_YEAR, ");
            sql.Append(" e.NAME  AS [FULL_NAME], sa.NAME_CH  AS NAME_CH,	sa.NAME_PT  AS  NAME_PT, ");
            sql.Append(" sa.STUDENT_ID  AS [studentID],sa.GPA  AS [GPA],sa.FAIL  AS[FAIL],sa.ALUN_NUMERO,sa.ALUN_NUMERO_SEQ, sa.PESS_COD,sa.ACADEMIC_SEMESTER ");
            sql.Append(" FROM ep_class_grade e RIGHT JOIN (select gpa_group.STUDENT_ID,gpa_group.NAME_CH,gpa_group.NAME_PT,gpa_group.ACADEMIC_YEAR, ");
            sql.Append(" gpa_group.A_Y,gpa_group.GPA,gpa_group.ALUN_NUMERO,gpa_group.ALUN_NUMERO_SEQ,gpa_group.PESS_COD,failed_group.FAIL,failed_group.ACADEMIC_SEMESTER ");
            sql.Append(" FROM( SELECT aa.STUDENT_ID, s.NAME_CH,s.NAME_PT,aa.ACADEMIC_YEAR,aa.A_Y,s.GPA,aa.FAIL,aa.ALUN_NUMERO,aa.ALUN_NUMERO_SEQ , s.PESS_COD ");
            sql.Append(" FROM student_academic_info s RIGHT JOIN ( SELECT  A_Y = row_number () OVER (partition BY a.ALUN_NUMERO,a.ALUN_NUMERO_SEQ "); 
            sql.Append(" ORDER BY a.ACADEMIC_YEAR),a.ALUN_NUMERO,a.ALUN_NUMERO_SEQ, a.STUDENT_ID,a.ACADEMIC_YEAR,a.FAIL ");
            sql.Append(" FROM(SELECT	ALUN_NUMERO,ALUN_NUMERO_SEQ,ACADEMIC_YEAR,  STUDENT_ID, COUNT (SUBJECT_STATUS) FAIL  ");
            sql.Append(" FROM academic_result_info WHERE	SUBJECT_STATUS = 'F' AND ACADEMIC_YEAR=@year "); //AND SCHOOL_CODE=@SC AND PROGRAM_CODE=@PC "); 
            sql.Append(" GROUP BY ALUN_NUMERO,ALUN_NUMERO_SEQ,SUBJECT_STATUS,ACADEMIC_YEAR,STUDENT_ID)a)aa "); 
            sql.Append(" ON aa.ALUN_NUMERO = s.ALUN_NUMERO AND aa.ALUN_NUMERO_SEQ=s.ALUN_NUMERO_SEQ	AND aa.A_Y = s.QUALIFIED_YEAR)gpa_group ");
            sql.Append(" INNER JOIN(SELECT	ALUN_NUMERO,ALUN_NUMERO_SEQ,ACADEMIC_YEAR,  STUDENT_ID,ACADEMIC_SEMESTER, COUNT (SUBJECT_STATUS) FAIL "); 
            sql.Append(" FROM academic_result_info WHERE	SUBJECT_STATUS = 'F' AND ACADEMIC_YEAR=@year  "); //AND SCHOOL_CODE=@SC AND PROGRAM_CODE=@PC "); 
            sql.Append(" GROUP BY ALUN_NUMERO,ALUN_NUMERO_SEQ,SUBJECT_STATUS,ACADEMIC_YEAR,ACADEMIC_SEMESTER,STUDENT_ID ) failed_group ");
            sql.Append(" ON gpa_group.ACADEMIC_YEAR=failed_group.ACADEMIC_YEAR AND  gpa_group.ALUN_NUMERO=failed_group.ALUN_NUMERO "); 
            sql.Append(" AND gpa_group.ALUN_NUMERO_SEQ=failed_group.ALUN_NUMERO_SEQ )sa "); 
            sql.Append(" ON sa.ALUN_NUMERO= e.NUMERO AND sa.ALUN_NUMERO_SEQ=e.NUMERO_SEQ AND sa.ACADEMIC_YEAR = e.[YEAR] ");
            //////////////Start Option Switch///////////////////////////////////////////////////
            /////////////First Semester/////////////////////////////////////////////////////////
            /////////GPA Below 1.5//////////////////////////////////////////////////////////////
                if (rb_Gpa_Default.Checked == true && rb_Fail_Default.Checked == true)
                {
                    sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and (CONVERT(decimal(18,4),sa.GPA)<=1.5)    ");
                    sql.Append(" group by sa.STUDENT_ID ,[SCHOOL], [CURSO], [ACADEMIC_YEAR], sa.A_Y,e.NAME, sa.NAME_CH, sa.NAME_PT , sa.GPA , sa.FAIL,sa.ALUN_NUMERO,sa.ALUN_NUMERO_SEQ, sa.PESS_COD,sa.ACADEMIC_SEMESTER  ");
                    sql.Append(" having sum(DISTINCT sa.FAIL) >=3 ");
                 }
                else if(rb_Gpa_Default.Checked == true && rb_Fail_Below.Checked==true)
                        {
                           if(tb_Fail_Below.Text!=string.Empty)
                           {
                               sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and (CONVERT(decimal(18,4),sa.GPA)<=1.5)    ");
                               sql.Append(" group by sa.STUDENT_ID ,[SCHOOL], [CURSO], [ACADEMIC_YEAR], sa.A_Y,e.NAME, sa.NAME_CH, sa.NAME_PT , sa.GPA , sa.FAIL,sa.ALUN_NUMERO,sa.ALUN_NUMERO_SEQ, sa.PESS_COD,sa.ACADEMIC_SEMESTER ");
                               sql.Append(" having sum(DISTINCT sa.FAIL) <=@failBelow ");
                           }
                           else
                           {
                               sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and (CONVERT(decimal(18,4),sa.GPA)<=1.5)    ");
                           }
                        }
                else if (rb_Gpa_Default.Checked==true && rb_Fail_Above.Checked==true)
                {
                    if (tb_Fail_Above.Text != string.Empty)
                    {
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and (CONVERT(decimal(18,4),sa.GPA)<=1.5)    ");
                        sql.Append(" group by sa.STUDENT_ID ,[SCHOOL], [CURSO], [ACADEMIC_YEAR], sa.A_Y,e.NAME, sa.NAME_CH, sa.NAME_PT , sa.GPA , sa.FAIL,sa.ALUN_NUMERO,sa.ALUN_NUMERO_SEQ, sa.PESS_COD,sa.ACADEMIC_SEMESTER ");
                        sql.Append(" having sum(DISTINCT sa.FAIL) >=@failAbove ");
                    }
                    else
                    {
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and (CONVERT(decimal(18,4),sa.GPA)<=1.5)    ");
                    }
                }
                else if (rb_Gpa_Default.Checked == true && rb_Fail_Range.Checked == true)
                {
                    if (tb_Fail_From.Text != string.Empty && tb_Fail_To.Text != string.Empty)
                    {
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester  and (CONVERT(decimal(18,4),sa.GPA)<=1.5)    ");
                        sql.Append(" group by sa.STUDENT_ID ,[SCHOOL], [CURSO], [ACADEMIC_YEAR], sa.A_Y,e.NAME, sa.NAME_CH, sa.NAME_PT , sa.GPA , sa.FAIL,sa.ALUN_NUMERO,sa.ALUN_NUMERO_SEQ, sa.PESS_COD,sa.ACADEMIC_SEMESTER ");
                        if(int.Parse(tb_Fail_From.Text)>int.Parse(tb_Fail_To.Text))
						sql.Append(" having sum(DISTINCT sa.FAIL) BETWEEN @failTo AND @failFrom");
					    else 
                        sql.Append(" having sum(DISTINCT sa.FAIL) BETWEEN @failFrom AND @failTo");
                    }
                    else if(tb_Fail_From.Text!=string.Empty && tb_Fail_To.Text==string.Empty)
                    {
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and (CONVERT(decimal(18,4),sa.GPA)<=1.5)    ");
                        sql.Append(" group by sa.STUDENT_ID ,[SCHOOL], [CURSO], [ACADEMIC_YEAR], sa.A_Y,e.NAME, sa.NAME_CH, sa.NAME_PT , sa.GPA , sa.FAIL,sa.ALUN_NUMERO,sa.ALUN_NUMERO_SEQ, sa.PESS_COD,sa.ACADEMIC_SEMESTER ");
                        sql.Append(" having sum(DISTINCT sa.FAIL) BETWEEN '0' AND @failFrom ");

                    }
                    else if (tb_Fail_From.Text == string.Empty && tb_Fail_To.Text != string.Empty)
                    {
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and (CONVERT(decimal(18,4),sa.GPA)<=1.5)    ");
                        sql.Append(" group by sa.STUDENT_ID ,[SCHOOL], [CURSO], [ACADEMIC_YEAR], sa.A_Y,e.NAME, sa.NAME_CH, sa.NAME_PT , sa.GPA , sa.FAIL,sa.ALUN_NUMERO,sa.ALUN_NUMERO_SEQ, sa.PESS_COD,sa.ACADEMIC_SEMESTER ");
                        sql.Append(" having sum(DISTINCT sa.FAIL) BETWEEN '0' AND @failTo ");
                    }
                    else
                    {
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and (CONVERT(decimal(18,4),sa.GPA)<=1.5)    ");
                    }
                }
                /////GPA Below Option//////////////////////////
                else if (rb_Gpa_Below.Checked == true && rb_Fail_Default.Checked == true)
                {
                    if (tb_Gpa_Below.Text != string.Empty)
                    {
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and (CONVERT(decimal(18,4),sa.GPA)<=@gpaBelow)    ");
                        sql.Append(" group by sa.STUDENT_ID ,[SCHOOL], [CURSO], [ACADEMIC_YEAR], sa.A_Y,e.NAME, sa.NAME_CH, sa.NAME_PT , sa.GPA , sa.FAIL,sa.ALUN_NUMERO,sa.ALUN_NUMERO_SEQ, sa.PESS_COD,sa.ACADEMIC_SEMESTER ");
                        sql.Append(" having sum(DISTINCT sa.FAIL) >=3 ");
                    }
                    else
                    {
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester ");
                        sql.Append(" group by sa.STUDENT_ID ,[SCHOOL], [CURSO], [ACADEMIC_YEAR], sa.A_Y,e.NAME, sa.NAME_CH, sa.NAME_PT , sa.GPA , sa.FAIL,sa.ALUN_NUMERO,sa.ALUN_NUMERO_SEQ, sa.PESS_COD,sa.ACADEMIC_SEMESTER ");
                        sql.Append(" having sum(DISTINCT sa.FAIL) >=3 ");
                    }
                }
                else if (rb_Gpa_Below.Checked == true && rb_Fail_Below.Checked == true)
                {
                    if (tb_Gpa_Below.Text != string.Empty && tb_Fail_Below.Text != string.Empty)
                    {
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and (CONVERT(decimal(18,4),sa.GPA)<=@gpaBelow)    ");
                        sql.Append(" group by sa.STUDENT_ID ,[SCHOOL], [CURSO], [ACADEMIC_YEAR], sa.A_Y,e.NAME, sa.NAME_CH, sa.NAME_PT , sa.GPA , sa.FAIL,sa.ALUN_NUMERO,sa.ALUN_NUMERO_SEQ, sa.PESS_COD,sa.ACADEMIC_SEMESTER ");
                        sql.Append(" having sum(DISTINCT sa.FAIL) <=@failBelow ");
                    }
                    else if (tb_Gpa_Below.Text != string.Empty && tb_Fail_Below.Text == string.Empty)
                    {
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and (CONVERT(decimal(18,4),sa.GPA)<=@gpaBelow)    ");
                    }
                    else if (tb_Gpa_Below.Text == string.Empty && tb_Fail_Below.Text != string.Empty)
                    {
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester ");
                        sql.Append(" group by sa.STUDENT_ID ,[SCHOOL], [CURSO], [ACADEMIC_YEAR], sa.A_Y,e.NAME, sa.NAME_CH, sa.NAME_PT , sa.GPA , sa.FAIL,sa.ALUN_NUMERO,sa.ALUN_NUMERO_SEQ, sa.PESS_COD,sa.ACADEMIC_SEMESTER ");
                        sql.Append(" having sum(DISTINCT sa.FAIL) <=@failBelow ");
                    }
                    else
                    { sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester "); }
                }
				else if(rb_Gpa_Below.Checked == true && rb_Fail_Above.Checked == true)
				{
					if(tb_Gpa_Below.Text!=string.Empty && tb_Fail_Above.Text != string.Empty)
					{ 
				        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and (CONVERT(decimal(18,4),sa.GPA)<=@gpaBelow)    ");
                        sql.Append(" group by sa.STUDENT_ID ,[SCHOOL], [CURSO], [ACADEMIC_YEAR], sa.A_Y,e.NAME, sa.NAME_CH, sa.NAME_PT , sa.GPA , sa.FAIL,sa.ALUN_NUMERO,sa.ALUN_NUMERO_SEQ, sa.PESS_COD,sa.ACADEMIC_SEMESTER ");
                        sql.Append(" having sum(DISTINCT sa.FAIL) >=@failAbove ");
						
					}
					else if(tb_Gpa_Below.Text!=string.Empty && tb_Fail_Above.Text == string.Empty)
					{ 
				        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and (CONVERT(decimal(18,4),sa.GPA)<=@gpaBelow)    ");
                     }
					else if(tb_Gpa_Below.Text==string.Empty && tb_Fail_Above.Text != string.Empty)
					{ 
				        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester  ");
                        sql.Append(" group by sa.STUDENT_ID ,[SCHOOL], [CURSO], [ACADEMIC_YEAR], sa.A_Y,e.NAME, sa.NAME_CH, sa.NAME_PT , sa.GPA , sa.FAIL,sa.ALUN_NUMERO,sa.ALUN_NUMERO_SEQ, sa.PESS_COD,sa.ACADEMIC_SEMESTER ");
                        sql.Append(" having sum(DISTINCT sa.FAIL) >=@failAbove ");
						
					}
					else
					{
						sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester  ");
					}
				}
				else if(rb_Gpa_Below.Checked == true && rb_Fail_Range.Checked == true)
				{
					if(tb_Gpa_Below.Text!=string.Empty && tb_Fail_From.Text != string.Empty && tb_Fail_To.Text != string.Empty )
					{ 
				        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and (CONVERT(decimal(18,4),sa.GPA)<=@gpaBelow)    ");
                        sql.Append(" group by sa.STUDENT_ID ,[SCHOOL], [CURSO], [ACADEMIC_YEAR], sa.A_Y,e.NAME, sa.NAME_CH, sa.NAME_PT , sa.GPA , sa.FAIL,sa.ALUN_NUMERO,sa.ALUN_NUMERO_SEQ, sa.PESS_COD,sa.ACADEMIC_SEMESTER ");
                        if(int.Parse(tb_Fail_From.Text)>int.Parse(tb_Fail_To.Text))
						sql.Append(" having sum(DISTINCT sa.FAIL) BETWEEN @failTo AND @failFrom");
					    else
					    sql.Append(" having sum(DISTINCT sa.FAIL) BETWEEN @failFrom AND @failTo");
					}
					else if(tb_Gpa_Below.Text!=string.Empty && tb_Fail_From.Text == string.Empty && tb_Fail_To.Text == string.Empty )
					{
						sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and (CONVERT(decimal(18,4),sa.GPA)<=@gpaBelow)    ");
					}
					else if(tb_Gpa_Below.Text!=string.Empty && tb_Fail_From.Text != string.Empty && tb_Fail_To.Text == string.Empty )
					{
						sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and (CONVERT(decimal(18,4),sa.GPA)<=@gpaBelow)    ");
                        sql.Append(" group by sa.STUDENT_ID ,[SCHOOL], [CURSO], [ACADEMIC_YEAR], sa.A_Y,e.NAME, sa.NAME_CH, sa.NAME_PT , sa.GPA , sa.FAIL,sa.ALUN_NUMERO,sa.ALUN_NUMERO_SEQ, sa.PESS_COD,sa.ACADEMIC_SEMESTER ");
                        sql.Append(" having sum(DISTINCT sa.FAIL) >=@failFrom ");
					}
					else if(tb_Gpa_Below.Text!=string.Empty && tb_Fail_From.Text == string.Empty && tb_Fail_To.Text != string.Empty )
					{
						sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and (CONVERT(decimal(18,4),sa.GPA)<=@gpaBelow)    ");
                        sql.Append(" group by sa.STUDENT_ID ,[SCHOOL], [CURSO], [ACADEMIC_YEAR], sa.A_Y,e.NAME, sa.NAME_CH, sa.NAME_PT , sa.GPA , sa.FAIL,sa.ALUN_NUMERO,sa.ALUN_NUMERO_SEQ, sa.PESS_COD,sa.ACADEMIC_SEMESTER ");
                        sql.Append(" having sum(DISTINCT sa.FAIL) <=@failTo ");
					}
					else if(tb_Gpa_Below.Text==string.Empty && tb_Fail_From.Text == string.Empty && tb_Fail_To.Text == string.Empty )
					{
						sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester ");
					}
					else if(tb_Gpa_Below.Text==string.Empty && tb_Fail_From.Text != string.Empty && tb_Fail_To.Text != string.Empty )
					{
						sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester  ");
                        sql.Append(" group by sa.STUDENT_ID ,[SCHOOL], [CURSO], [ACADEMIC_YEAR], sa.A_Y,e.NAME, sa.NAME_CH, sa.NAME_PT , sa.GPA , sa.FAIL,sa.ALUN_NUMERO,sa.ALUN_NUMERO_SEQ, sa.PESS_COD,sa.ACADEMIC_SEMESTER ");
                        if(int.Parse(tb_Fail_From.Text)>int.Parse(tb_Fail_To.Text))
						sql.Append(" having sum(DISTINCT sa.FAIL) BETWEEN @failTo AND @failFrom");
					    else
					    sql.Append(" having sum(DISTINCT sa.FAIL) BETWEEN @failFrom AND @failTo");
					}
					else if(tb_Gpa_Below.Text==string.Empty && tb_Fail_From.Text != string.Empty && tb_Fail_To.Text == string.Empty )
					{
						sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester ");
                        sql.Append(" group by sa.STUDENT_ID ,[SCHOOL], [CURSO], [ACADEMIC_YEAR], sa.A_Y,e.NAME, sa.NAME_CH, sa.NAME_PT , sa.GPA , sa.FAIL,sa.ALUN_NUMERO,sa.ALUN_NUMERO_SEQ, sa.PESS_COD,sa.ACADEMIC_SEMESTER ");
                        sql.Append(" having sum(DISTINCT sa.FAIL) >=@failFrom ");
					}
					else if(tb_Gpa_Below.Text==string.Empty && tb_Fail_From.Text == string.Empty && tb_Fail_To.Text != string.Empty )
					{
						sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester ");
                        sql.Append(" group by sa.STUDENT_ID ,[SCHOOL], [CURSO], [ACADEMIC_YEAR], sa.A_Y,e.NAME, sa.NAME_CH, sa.NAME_PT , sa.GPA , sa.FAIL,sa.ALUN_NUMERO,sa.ALUN_NUMERO_SEQ, sa.PESS_COD,sa.ACADEMIC_SEMESTER ");
                        sql.Append(" having sum(DISTINCT sa.FAIL) <=@failTo ");
					}
					
						
				}
                /////GPA Above Option//////////////////////////
                else if (rb_Gpa_Above.Checked == true && rb_Fail_Default.Checked == true)
                {
                    if (tb_Gpa_Above.Text != string.Empty)
                    {
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and (CONVERT(decimal(18,4),sa.GPA)>=@gpaAbove)    ");
                        sql.Append(" group by sa.STUDENT_ID ,[SCHOOL], [CURSO], [ACADEMIC_YEAR], sa.A_Y,e.NAME, sa.NAME_CH, sa.NAME_PT , sa.GPA , sa.FAIL,sa.ALUN_NUMERO,sa.ALUN_NUMERO_SEQ, sa.PESS_COD,sa.ACADEMIC_SEMESTER ");
                        sql.Append(" having sum(DISTINCT sa.FAIL) >=3 ");
                    }
                    else
                    {
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester ");
                        sql.Append(" group by sa.STUDENT_ID ,[SCHOOL], [CURSO], [ACADEMIC_YEAR], sa.A_Y,e.NAME, sa.NAME_CH, sa.NAME_PT , sa.GPA , sa.FAIL,sa.ALUN_NUMERO,sa.ALUN_NUMERO_SEQ, sa.PESS_COD,sa.ACADEMIC_SEMESTER ");
                        sql.Append(" having sum(DISTINCT sa.FAIL) >=3 ");
                    }
                }
                else if (rb_Gpa_Above.Checked == true && rb_Fail_Below.Checked == true)
                {
                    if (tb_Gpa_Above.Text != string.Empty && tb_Fail_Below.Text != string.Empty)
                    {
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and (CONVERT(decimal(18,4),sa.GPA)>=@gpaAbove) ");
                        sql.Append(" group by sa.STUDENT_ID ,[SCHOOL], [CURSO], [ACADEMIC_YEAR], sa.A_Y,e.NAME, sa.NAME_CH, sa.NAME_PT , sa.GPA , sa.FAIL,sa.ALUN_NUMERO,sa.ALUN_NUMERO_SEQ, sa.PESS_COD,sa.ACADEMIC_SEMESTER ");
                        sql.Append(" having sum(DISTINCT sa.FAIL) <=@failBelow ");

                    }
                    else if (tb_Gpa_Above.Text != string.Empty && tb_Fail_Below.Text == string.Empty)
                    {
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and (CONVERT(decimal(18,4),sa.GPA)>=@gpaAbove) ");

                    }
                    else if(tb_Gpa_Above.Text==string.Empty && tb_Fail_Below.Text!=string.Empty)
                    {
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester ");
                        sql.Append(" group by sa.STUDENT_ID ,[SCHOOL], [CURSO], [ACADEMIC_YEAR], sa.A_Y,e.NAME, sa.NAME_CH, sa.NAME_PT , sa.GPA , sa.FAIL,sa.ALUN_NUMERO,sa.ALUN_NUMERO_SEQ, sa.PESS_COD,sa.ACADEMIC_SEMESTER ");
                        sql.Append(" having sum(DISTINCT sa.FAIL) <=@failBelow ");
                    }
                    else
                    {
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester "); 
                    }
                }
                else if (rb_Gpa_Above.Checked == true && rb_Fail_Above.Checked ==true)
                {
                    if (tb_Gpa_Above.Text != string.Empty && tb_Fail_Above.Text != string.Empty)
                    {
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and (CONVERT(decimal(18,4),sa.GPA)>=@gpaAbove) ");
                        sql.Append(" group by sa.STUDENT_ID ,[SCHOOL], [CURSO], [ACADEMIC_YEAR], sa.A_Y,e.NAME, sa.NAME_CH, sa.NAME_PT , sa.GPA , sa.FAIL,sa.ALUN_NUMERO,sa.ALUN_NUMERO_SEQ, sa.PESS_COD,sa.ACADEMIC_SEMESTER ");
                        sql.Append(" having sum(DISTINCT sa.FAIL) >=@failAbove ");
                    }
                    else if (tb_Gpa_Above.Text != string.Empty && tb_Fail_Above.Text == string.Empty)
                    {
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and (CONVERT(decimal(18,4),sa.GPA)>=@gpaAbove) ");
                    }
                    else if (tb_Gpa_Above.Text == string.Empty && tb_Fail_Above.Text != string.Empty)
                    {
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester ");
                        sql.Append(" group by sa.STUDENT_ID ,[SCHOOL], [CURSO], [ACADEMIC_YEAR], sa.A_Y,e.NAME, sa.NAME_CH, sa.NAME_PT , sa.GPA , sa.FAIL,sa.ALUN_NUMERO,sa.ALUN_NUMERO_SEQ, sa.PESS_COD,sa.ACADEMIC_SEMESTER ");
                        sql.Append(" having sum(DISTINCT sa.FAIL) >=@failAbove ");

                    }
                    else
                    {
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester "); 
                    }
                }
                else if (rb_Gpa_Above.Checked == true && rb_Fail_Range.Checked == true)
                {
                    if (tb_Gpa_Above.Text != string.Empty && tb_Fail_From.Text != string.Empty && tb_Fail_To.Text != string.Empty)
                    {
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and (CONVERT(decimal(18,4),sa.GPA)>=@gpaAbove)    ");
                        sql.Append(" group by sa.STUDENT_ID ,[SCHOOL], [CURSO], [ACADEMIC_YEAR], sa.A_Y,e.NAME, sa.NAME_CH, sa.NAME_PT , sa.GPA , sa.FAIL,sa.ALUN_NUMERO,sa.ALUN_NUMERO_SEQ, sa.PESS_COD,sa.ACADEMIC_SEMESTER ");
                        if(int.Parse(tb_Fail_From.Text)>int.Parse(tb_Fail_To.Text))
						sql.Append(" having sum(DISTINCT sa.FAIL) BETWEEN @failTo AND @failFrom");
					    else
					    sql.Append(" having sum(DISTINCT sa.FAIL) BETWEEN @failFrom AND @failTo");
                    }
                    else if (tb_Gpa_Above.Text != string.Empty && tb_Fail_From.Text != string.Empty && tb_Fail_To.Text == string.Empty)
                    {
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and (CONVERT(decimal(18,4),sa.GPA)>=@gpaAbove)    ");
                        sql.Append(" group by sa.STUDENT_ID ,[SCHOOL], [CURSO], [ACADEMIC_YEAR], sa.A_Y,e.NAME, sa.NAME_CH, sa.NAME_PT , sa.GPA , sa.FAIL,sa.ALUN_NUMERO,sa.ALUN_NUMERO_SEQ, sa.PESS_COD,sa.ACADEMIC_SEMESTER ");
                        sql.Append(" having sum(DISTINCT sa.FAIL)  <=@failFrom ");
                    }
                    else if (tb_Gpa_Above.Text != string.Empty && tb_Fail_From.Text == string.Empty && tb_Fail_To.Text != string.Empty)
                    {
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and (CONVERT(decimal(18,4),sa.GPA)>=@gpaAbove)    ");
                        sql.Append(" group by sa.STUDENT_ID ,[SCHOOL], [CURSO], [ACADEMIC_YEAR], sa.A_Y,e.NAME, sa.NAME_CH, sa.NAME_PT , sa.GPA , sa.FAIL,sa.ALUN_NUMERO,sa.ALUN_NUMERO_SEQ, sa.PESS_COD,sa.ACADEMIC_SEMESTER ");
                        sql.Append(" having sum(DISTINCT sa.FAIL)  <=@failTo ");
                    }
                    else if (tb_Gpa_Above.Text == string.Empty && tb_Fail_From.Text != string.Empty && tb_Fail_To.Text != string.Empty)
                    {
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester  ");
                        sql.Append(" group by sa.STUDENT_ID ,[SCHOOL], [CURSO], [ACADEMIC_YEAR], sa.A_Y,e.NAME, sa.NAME_CH, sa.NAME_PT , sa.GPA , sa.FAIL,sa.ALUN_NUMERO,sa.ALUN_NUMERO_SEQ, sa.PESS_COD,sa.ACADEMIC_SEMESTER ");
                         if(int.Parse(tb_Fail_From.Text)>int.Parse(tb_Fail_To.Text))
						sql.Append(" having sum(DISTINCT sa.FAIL) BETWEEN @failTo AND @failFrom");
					    else
					    sql.Append(" having sum(DISTINCT sa.FAIL) BETWEEN @failFrom AND @failTo");
						
                    }
                    else if (tb_Gpa_Above.Text == string.Empty && tb_Fail_From.Text == string.Empty && tb_Fail_To.Text != string.Empty)
                    {
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester  ");
                        sql.Append(" group by sa.STUDENT_ID ,[SCHOOL], [CURSO], [ACADEMIC_YEAR], sa.A_Y,e.NAME, sa.NAME_CH, sa.NAME_PT , sa.GPA , sa.FAIL,sa.ALUN_NUMERO,sa.ALUN_NUMERO_SEQ, sa.PESS_COD,sa.ACADEMIC_SEMESTER ");
                        sql.Append(" having sum(DISTINCT sa.FAIL)  <=@failTo ");

                    }
                    else if (tb_Gpa_Above.Text == string.Empty && tb_Fail_From.Text != string.Empty && tb_Fail_To.Text == string.Empty)
                    {
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester  ");
                        sql.Append(" group by sa.STUDENT_ID ,[SCHOOL], [CURSO], [ACADEMIC_YEAR], sa.A_Y,e.NAME, sa.NAME_CH, sa.NAME_PT , sa.GPA , sa.FAIL,sa.ALUN_NUMERO,sa.ALUN_NUMERO_SEQ, sa.PESS_COD,sa.ACADEMIC_SEMESTER ");
                        sql.Append(" having sum(DISTINCT sa.FAIL)  <=@failFrom ");
                    }
                    else if (tb_Gpa_Above.Text != string.Empty && tb_Fail_From.Text == string.Empty && tb_Fail_To.Text == string.Empty)
                    {
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and (CONVERT(decimal(18,4),sa.GPA)>=@gpaAbove)    ");
                    }
                    else
                    {
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester "); 

                    }

                }
                //////////GPA Range Option////////////////////////////////////////////////////////
				   else if (rb_Gpa_Range.Checked == true && rb_Fail_Default.Checked == true) 
                {
                    if (tb_Gpa_From.Text != string.Empty && tb_Gpa_To.Text != string.Empty)
                    {
                        if(double.Parse(tb_Gpa_From.Text)>double.Parse(tb_Gpa_To.Text))
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and ( (CONVERT(decimal(18,4),sa.GPA) BETWEEN @gpaTo AND @gpaFrom ) )   ");
					    else
					    sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and ( (CONVERT(decimal(18,4),sa.GPA) BETWEEN @gpaFrom AND @gpaTo ) )   ");
                        sql.Append(" group by sa.STUDENT_ID ,[SCHOOL], [CURSO], [ACADEMIC_YEAR], sa.A_Y,e.NAME, sa.NAME_CH, sa.NAME_PT , sa.GPA , sa.FAIL,sa.ALUN_NUMERO,sa.ALUN_NUMERO_SEQ, sa.PESS_COD,sa.ACADEMIC_SEMESTER ");
                        sql.Append(" having sum(DISTINCT sa.FAIL)  >=3 ");

                    }
                    else if(tb_Gpa_From.Text != string.Empty && tb_Gpa_To.Text == string.Empty)
                    {
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and ( (CONVERT(decimal(18,4),sa.GPA) <= @gpaFrom  ) )   ");
                        sql.Append(" group by sa.STUDENT_ID ,[SCHOOL], [CURSO], [ACADEMIC_YEAR], sa.A_Y,e.NAME, sa.NAME_CH, sa.NAME_PT , sa.GPA , sa.FAIL,sa.ALUN_NUMERO,sa.ALUN_NUMERO_SEQ, sa.PESS_COD,sa.ACADEMIC_SEMESTER ");
                        sql.Append(" having sum(DISTINCT sa.FAIL)  >=3 ");

                    }
                    else
                        if (tb_Gpa_From.Text == string.Empty && tb_Gpa_To.Text != string.Empty)
                        {
                            sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and ( (CONVERT(decimal(18,4),sa.GPA) <= @gpaTo  ))    ");
                            sql.Append(" group by sa.STUDENT_ID ,[SCHOOL], [CURSO], [ACADEMIC_YEAR], sa.A_Y,e.NAME, sa.NAME_CH, sa.NAME_PT , sa.GPA , sa.FAIL,sa.ALUN_NUMERO,sa.ALUN_NUMERO_SEQ, sa.PESS_COD,sa.ACADEMIC_SEMESTER ");
                            sql.Append(" having sum(DISTINCT sa.FAIL)  >=3 ");

                        }
                        else
                        {
                            sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester   ");
                            sql.Append(" group by sa.STUDENT_ID ,[SCHOOL], [CURSO], [ACADEMIC_YEAR], sa.A_Y,e.NAME, sa.NAME_CH, sa.NAME_PT , sa.GPA , sa.FAIL,sa.ALUN_NUMERO,sa.ALUN_NUMERO_SEQ, sa.PESS_COD,sa.ACADEMIC_SEMESTER ");
                            sql.Append(" having sum(DISTINCT sa.FAIL)  >=3 ");
                        }
                }
                else if (rb_Gpa_Range.Checked == true && rb_Fail_Below.Checked == true)
                {
                    if (tb_Gpa_From.Text != string.Empty && tb_Gpa_To.Text != string.Empty&& tb_Fail_Below.Text!=string.Empty)
                    {
                       if(double.Parse(tb_Gpa_From.Text)>double.Parse(tb_Gpa_To.Text))
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and ( (CONVERT(decimal(18,4),sa.GPA) BETWEEN @gpaTo AND @gpaFrom ) )   ");
					    else
					    sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and ( (CONVERT(decimal(18,4),sa.GPA) BETWEEN @gpaFrom AND @gpaTo ) )   ");
                        sql.Append(" group by sa.STUDENT_ID ,[SCHOOL], [CURSO], [ACADEMIC_YEAR], sa.A_Y,e.NAME, sa.NAME_CH, sa.NAME_PT , sa.GPA , sa.FAIL,sa.ALUN_NUMERO,sa.ALUN_NUMERO_SEQ, sa.PESS_COD,sa.ACADEMIC_SEMESTER ");
                        sql.Append(" having sum(DISTINCT sa.FAIL)  <=@failBelow ");

                    }
                    else if (tb_Gpa_From.Text != string.Empty && tb_Gpa_To.Text != string.Empty && tb_Fail_Below.Text == string.Empty)
                    {
                        if(double.Parse(tb_Gpa_From.Text)>double.Parse(tb_Gpa_To.Text))
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and ( (CONVERT(decimal(18,4),sa.GPA) BETWEEN @gpaTo AND @gpaFrom ) )   ");
					    else
					    sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and ( (CONVERT(decimal(18,4),sa.GPA) BETWEEN @gpaFrom AND @gpaTo ) )   ");
                    }
                    else if (tb_Gpa_From.Text != string.Empty && tb_Gpa_To.Text == string.Empty && tb_Fail_Below.Text != string.Empty)
                    {
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and ( (CONVERT(decimal(18,4),sa.GPA) <= @gpaFrom )) ");
                        sql.Append(" group by sa.STUDENT_ID ,[SCHOOL], [CURSO], [ACADEMIC_YEAR], sa.A_Y,e.NAME, sa.NAME_CH, sa.NAME_PT , sa.GPA , sa.FAIL,sa.ALUN_NUMERO,sa.ALUN_NUMERO_SEQ, sa.PESS_COD,sa.ACADEMIC_SEMESTER ");
                        sql.Append(" having sum(DISTINCT sa.FAIL)  <=@failBelow ");

                    }
                    else if (tb_Gpa_From.Text == string.Empty && tb_Gpa_To.Text != string.Empty && tb_Fail_Below.Text != string.Empty)
                    {
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and ( (CONVERT(decimal(18,4),sa.GPA) <= @gpaTo )) ");
                        sql.Append(" group by sa.STUDENT_ID ,[SCHOOL], [CURSO], [ACADEMIC_YEAR], sa.A_Y,e.NAME, sa.NAME_CH, sa.NAME_PT , sa.GPA , sa.FAIL,sa.ALUN_NUMERO,sa.ALUN_NUMERO_SEQ, sa.PESS_COD,sa.ACADEMIC_SEMESTER ");
                        sql.Append(" having sum(DISTINCT sa.FAIL)  <=@failBelow ");

                    }
                    else if (tb_Gpa_From.Text == string.Empty && tb_Gpa_To.Text == string.Empty && tb_Fail_Below.Text != string.Empty)
                    {
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester ");
                        sql.Append(" group by sa.STUDENT_ID ,[SCHOOL], [CURSO], [ACADEMIC_YEAR], sa.A_Y,e.NAME, sa.NAME_CH, sa.NAME_PT , sa.GPA , sa.FAIL,sa.ALUN_NUMERO,sa.ALUN_NUMERO_SEQ, sa.PESS_COD,sa.ACADEMIC_SEMESTER ");
                        sql.Append(" having sum(DISTINCT sa.FAIL)  <=@failBelow ");

                    }
                   else if (tb_Gpa_From.Text != string.Empty && tb_Gpa_To.Text == string.Empty && tb_Fail_Below.Text == string.Empty)
                    {
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and ( (CONVERT(decimal(18,4),sa.GPA) <= @gpaFrom )) ");

                    }
                    else if (tb_Gpa_From.Text == string.Empty && tb_Gpa_To.Text != string.Empty && tb_Fail_Below.Text == string.Empty)
                    {
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and ( (CONVERT(decimal(18,4),sa.GPA) <= @gpaTo )) ");

                    }
                    else
                    {
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester ");

                    }

                }
               ///////////////////////////////////////////////////////////////////////////////
                else if (rb_Gpa_Range.Checked == true && rb_Fail_Above.Checked == true)
                {
                    if (tb_Gpa_From.Text != string.Empty && tb_Gpa_To.Text != string.Empty && tb_Fail_Above.Text != string.Empty)
                    {
                        if(double.Parse(tb_Gpa_From.Text)>double.Parse(tb_Gpa_To.Text))
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and ( (CONVERT(decimal(18,4),sa.GPA) BETWEEN @gpaTo AND @gpaFrom ) )   ");
					    else
					    sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and ( (CONVERT(decimal(18,4),sa.GPA) BETWEEN @gpaFrom AND @gpaTo ) )   ");
                        sql.Append(" group by sa.STUDENT_ID ,[SCHOOL], [CURSO], [ACADEMIC_YEAR], sa.A_Y,e.NAME, sa.NAME_CH, sa.NAME_PT , sa.GPA , sa.FAIL,sa.ALUN_NUMERO,sa.ALUN_NUMERO_SEQ, sa.PESS_COD,sa.ACADEMIC_SEMESTER ");
                        sql.Append(" having sum(DISTINCT sa.FAIL)  >=@failAbove ");

                    }
                    else if (tb_Gpa_From.Text != string.Empty && tb_Gpa_To.Text != string.Empty && tb_Fail_Above.Text == string.Empty)
                    {
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and ( (CONVERT(decimal(18,4),sa.GPA) BETWEEN @gpaFrom AND @gpaTo ) )   ");
                    }
                    else if (tb_Gpa_From.Text != string.Empty && tb_Gpa_To.Text == string.Empty && tb_Fail_Above.Text != string.Empty)
                    {
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and ( (CONVERT(decimal(18,4),sa.GPA) <= @gpaFrom )) ");
                        sql.Append(" group by sa.STUDENT_ID ,[SCHOOL], [CURSO], [ACADEMIC_YEAR], sa.A_Y,e.NAME, sa.NAME_CH, sa.NAME_PT , sa.GPA , sa.FAIL,sa.ALUN_NUMERO,sa.ALUN_NUMERO_SEQ, sa.PESS_COD,sa.ACADEMIC_SEMESTER ");
                        sql.Append(" having sum(DISTINCT sa.FAIL)  >=@failAbove ");

                    }
                    else if (tb_Gpa_From.Text == string.Empty && tb_Gpa_To.Text != string.Empty && tb_Fail_Above.Text != string.Empty)
                    {
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and ( (CONVERT(decimal(18,4),sa.GPA) <= @gpaTo )) ");
                        sql.Append(" group by sa.STUDENT_ID ,[SCHOOL], [CURSO], [ACADEMIC_YEAR], sa.A_Y,e.NAME, sa.NAME_CH, sa.NAME_PT , sa.GPA , sa.FAIL,sa.ALUN_NUMERO,sa.ALUN_NUMERO_SEQ, sa.PESS_COD,sa.ACADEMIC_SEMESTER ");
                        sql.Append(" having sum(DISTINCT sa.FAIL)  >=@failAbove ");

                    }
                    else if (tb_Gpa_From.Text == string.Empty && tb_Gpa_To.Text == string.Empty && tb_Fail_Above.Text != string.Empty)
                    {
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester ");
                        sql.Append(" group by sa.STUDENT_ID ,[SCHOOL], [CURSO], [ACADEMIC_YEAR], sa.A_Y,e.NAME, sa.NAME_CH, sa.NAME_PT , sa.GPA , sa.FAIL,sa.ALUN_NUMERO,sa.ALUN_NUMERO_SEQ, sa.PESS_COD,sa.ACADEMIC_SEMESTER ");
                        sql.Append(" having sum(DISTINCT sa.FAIL)  >=@failAbove ");

                    }
                    else if (tb_Gpa_From.Text != string.Empty && tb_Gpa_To.Text == string.Empty && tb_Fail_Above.Text == string.Empty)
                    {
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and ( (CONVERT(decimal(18,4),sa.GPA) <= @gpaFrom )) ");

                    }
                    else if (tb_Gpa_From.Text == string.Empty && tb_Gpa_To.Text != string.Empty && tb_Fail_Above.Text == string.Empty)
                    {
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and ( (CONVERT(decimal(18,4),sa.GPA) <= @gpaTo )) ");

                    }
                    else
                    {
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester ");

                    }

                }
              /////////////////////Gpa and Fail Switch Range//////////////////////////////////////////
                else if (rb_Gpa_Range.Checked == true && rb_Fail_Range.Checked == true)
                {
                    if (tb_Gpa_From.Text != string.Empty && tb_Gpa_To.Text != string.Empty && tb_Fail_From.Text != string.Empty && tb_Fail_To.Text != string.Empty)
                    {   if(double.Parse(tb_Gpa_From.Text)>double.Parse(tb_Gpa_To.Text))
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and ( (CONVERT(decimal(18,4),sa.GPA) BETWEEN @gpaTo AND @gpaFrom ) )   ");
					    else
					    sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and ( (CONVERT(decimal(18,4),sa.GPA) BETWEEN @gpaFrom AND @gpaTo ) )   ");
                        sql.Append(" group by sa.STUDENT_ID ,[SCHOOL], [CURSO], [ACADEMIC_YEAR], sa.A_Y,e.NAME, sa.NAME_CH, sa.NAME_PT , sa.GPA , sa.FAIL,sa.ALUN_NUMERO,sa.ALUN_NUMERO_SEQ, sa.PESS_COD,sa.ACADEMIC_SEMESTER ");
                       	if(int.Parse(tb_Fail_From.Text)>int.Parse(tb_Fail_To.Text))
						sql.Append(" having sum(DISTINCT sa.FAIL) BETWEEN @failTo AND @failFrom");
					    else 
                        sql.Append(" having sum(DISTINCT sa.FAIL) BETWEEN @failFrom AND @failTo");
                    }
                    else if (tb_Gpa_From.Text != string.Empty && tb_Gpa_To.Text != string.Empty && tb_Fail_From.Text != string.Empty && tb_Fail_To.Text == string.Empty)
                    {
                        if(double.Parse(tb_Gpa_From.Text)>double.Parse(tb_Gpa_To.Text))
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and ( (CONVERT(decimal(18,4),sa.GPA) BETWEEN @gpaTo AND @gpaFrom ) )   ");
					    else
					    sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and ( (CONVERT(decimal(18,4),sa.GPA) BETWEEN @gpaFrom AND @gpaTo ) )   ");
                        sql.Append(" group by sa.STUDENT_ID ,[SCHOOL], [CURSO], [ACADEMIC_YEAR], sa.A_Y,e.NAME, sa.NAME_CH, sa.NAME_PT , sa.GPA , sa.FAIL,sa.ALUN_NUMERO,sa.ALUN_NUMERO_SEQ, sa.PESS_COD,sa.ACADEMIC_SEMESTER ");
                        sql.Append(" having sum(DISTINCT sa.FAIL)  <= @failFrom ");
                    }
                    else if (tb_Gpa_From.Text != string.Empty && tb_Gpa_To.Text != string.Empty && tb_Fail_From.Text == string.Empty && tb_Fail_To.Text != string.Empty)
                    {
                        if(double.Parse(tb_Gpa_From.Text)>double.Parse(tb_Gpa_To.Text))
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and ( (CONVERT(decimal(18,4),sa.GPA) BETWEEN @gpaTo AND @gpaFrom ) )   ");
					    else
					    sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and ( (CONVERT(decimal(18,4),sa.GPA) BETWEEN @gpaFrom AND @gpaTo ) )   ");
                        sql.Append(" group by sa.STUDENT_ID ,[SCHOOL], [CURSO], [ACADEMIC_YEAR], sa.A_Y,e.NAME, sa.NAME_CH, sa.NAME_PT , sa.GPA , sa.FAIL,sa.ALUN_NUMERO,sa.ALUN_NUMERO_SEQ, sa.PESS_COD,sa.ACADEMIC_SEMESTER ");
                        sql.Append(" having sum(DISTINCT sa.FAIL)  <= @failTo ");
                    }
                    else if (tb_Gpa_From.Text != string.Empty && tb_Gpa_To.Text != string.Empty && tb_Fail_From.Text == string.Empty && tb_Fail_To.Text == string.Empty)
                    {
                        if(double.Parse(tb_Gpa_From.Text)>double.Parse(tb_Gpa_To.Text))
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and ( (CONVERT(decimal(18,4),sa.GPA) BETWEEN @gpaTo AND @gpaFrom ) )   ");
					    else
					    sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and ( (CONVERT(decimal(18,4),sa.GPA) BETWEEN @gpaFrom AND @gpaTo ) )   ");
                    }
                    else if (tb_Gpa_From.Text != string.Empty && tb_Gpa_To.Text == string.Empty && tb_Fail_From.Text != string.Empty && tb_Fail_To.Text != string.Empty)
                    {
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and ( (CONVERT(decimal(18,4),sa.GPA)  <=@gpaFrom  ) )   ");
                        sql.Append(" group by sa.STUDENT_ID ,[SCHOOL], [CURSO], [ACADEMIC_YEAR], sa.A_Y,e.NAME, sa.NAME_CH, sa.NAME_PT , sa.GPA , sa.FAIL,sa.ALUN_NUMERO,sa.ALUN_NUMERO_SEQ, sa.PESS_COD,sa.ACADEMIC_SEMESTER ");
                        sql.Append(" having sum(DISTINCT sa.FAIL)  BETWEEN @failFrom AND @failTo ");
                    }
                    else if (tb_Gpa_From.Text == string.Empty && tb_Gpa_To.Text != string.Empty && tb_Fail_From.Text != string.Empty && tb_Fail_To.Text != string.Empty)
                    {
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and ( (CONVERT(decimal(18,4),sa.GPA)  <=@gpaTo  ))    ");
                        sql.Append(" group by sa.STUDENT_ID ,[SCHOOL], [CURSO], [ACADEMIC_YEAR], sa.A_Y,e.NAME, sa.NAME_CH, sa.NAME_PT , sa.GPA , sa.FAIL,sa.ALUN_NUMERO,sa.ALUN_NUMERO_SEQ, sa.PESS_COD,sa.ACADEMIC_SEMESTER ");
                        if(int.Parse(tb_Fail_From.Text)>int.Parse(tb_Fail_To.Text))
						sql.Append(" having sum(DISTINCT sa.FAIL) BETWEEN @failTo AND @failFrom");
					    else 
                        sql.Append(" having sum(DISTINCT sa.FAIL) BETWEEN @failFrom AND @failTo");
                    }
                    else if (tb_Gpa_From.Text == string.Empty && tb_Gpa_To.Text == string.Empty && tb_Fail_From.Text != string.Empty && tb_Fail_To.Text != string.Empty)
                    {
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester ");
                        sql.Append(" group by sa.STUDENT_ID ,[SCHOOL], [CURSO], [ACADEMIC_YEAR], sa.A_Y,e.NAME, sa.NAME_CH, sa.NAME_PT , sa.GPA , sa.FAIL,sa.ALUN_NUMERO,sa.ALUN_NUMERO_SEQ, sa.PESS_COD,sa.ACADEMIC_SEMESTER ");
                        if(int.Parse(tb_Fail_From.Text)>int.Parse(tb_Fail_To.Text))
						sql.Append(" having sum(DISTINCT sa.FAIL) BETWEEN @failTo AND @failFrom");
					    else 
                        sql.Append(" having sum(DISTINCT sa.FAIL) BETWEEN @failFrom AND @failTo");
                    }
                    else if (tb_Gpa_From.Text != string.Empty && tb_Gpa_To.Text == string.Empty && tb_Fail_From.Text == string.Empty && tb_Fail_To.Text != string.Empty)
                    {
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and ( (CONVERT(decimal(18,4),sa.GPA)  <=@gpaFrom  ))    ");
                        sql.Append(" group by sa.STUDENT_ID ,[SCHOOL], [CURSO], [ACADEMIC_YEAR], sa.A_Y,e.NAME, sa.NAME_CH, sa.NAME_PT , sa.GPA , sa.FAIL,sa.ALUN_NUMERO,sa.ALUN_NUMERO_SEQ, sa.PESS_COD,sa.ACADEMIC_SEMESTER ");
                        sql.Append(" having sum(DISTINCT sa.FAIL)  <= @failTo ");
                    }
                    else if (tb_Gpa_From.Text != string.Empty && tb_Gpa_To.Text == string.Empty && tb_Fail_From.Text != string.Empty && tb_Fail_To.Text == string.Empty)
                    {
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and ( (CONVERT(decimal(18,4),sa.GPA)  <=@gpaFrom  ) )   ");
                        sql.Append(" group by sa.STUDENT_ID ,[SCHOOL], [CURSO], [ACADEMIC_YEAR], sa.A_Y,e.NAME, sa.NAME_CH, sa.NAME_PT , sa.GPA , sa.FAIL,sa.ALUN_NUMERO,sa.ALUN_NUMERO_SEQ, sa.PESS_COD,sa.ACADEMIC_SEMESTER ");
                        sql.Append(" having sum(DISTINCT sa.FAIL)  <= @failFrom ");
                    }
                    else if (tb_Gpa_From.Text == string.Empty && tb_Gpa_To.Text != string.Empty && tb_Fail_From.Text != string.Empty && tb_Fail_To.Text == string.Empty)
                    {
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and ( (CONVERT(decimal(18,4),sa.GPA)  <=@gpaTo  ) )   ");
                        sql.Append(" group by sa.STUDENT_ID ,[SCHOOL], [CURSO], [ACADEMIC_YEAR], sa.A_Y,e.NAME, sa.NAME_CH, sa.NAME_PT , sa.GPA , sa.FAIL,sa.ALUN_NUMERO,sa.ALUN_NUMERO_SEQ, sa.PESS_COD,sa.ACADEMIC_SEMESTER ");
                        sql.Append(" having sum(DISTINCT sa.FAIL)  <= @failFrom ");
                    }
                    else if (tb_Gpa_From.Text == string.Empty && tb_Gpa_To.Text != string.Empty && tb_Fail_From.Text == string.Empty && tb_Fail_To.Text != string.Empty)
                    {
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and ( (CONVERT(decimal(18,4),sa.GPA)  <=@gpaTo  ))    ");
                        sql.Append(" group by sa.STUDENT_ID ,[SCHOOL], [CURSO], [ACADEMIC_YEAR], sa.A_Y,e.NAME, sa.NAME_CH, sa.NAME_PT , sa.GPA , sa.FAIL,sa.ALUN_NUMERO,sa.ALUN_NUMERO_SEQ, sa.PESS_COD,sa.ACADEMIC_SEMESTER ");
                        sql.Append(" having sum(DISTINCT sa.FAIL)  <= @failTo ");
                    }
                    else if (tb_Gpa_From.Text != string.Empty && tb_Gpa_To.Text == string.Empty && tb_Fail_From.Text == string.Empty && tb_Fail_To.Text == string.Empty)
                    {
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and ( (CONVERT(decimal(18,4),sa.GPA)  <=@gpaFrom  ))    ");
                     }
                    else if (tb_Gpa_From.Text == string.Empty && tb_Gpa_To.Text != string.Empty && tb_Fail_From.Text == string.Empty && tb_Fail_To.Text == string.Empty)
                    {
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester and ( (CONVERT(decimal(18,4),sa.GPA)  <=@gpaTo  ))    ");
                     }
                    else if (tb_Gpa_From.Text == string.Empty && tb_Gpa_To.Text == string.Empty && tb_Fail_From.Text != string.Empty && tb_Fail_To.Text == string.Empty)
                    {
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester  ");
                        sql.Append(" group by sa.STUDENT_ID ,[SCHOOL], [CURSO], [ACADEMIC_YEAR], sa.A_Y,e.NAME, sa.NAME_CH, sa.NAME_PT , sa.GPA , sa.FAIL,sa.ALUN_NUMERO,sa.ALUN_NUMERO_SEQ, sa.PESS_COD,sa.ACADEMIC_SEMESTER ");
                        sql.Append(" having sum(DISTINCT sa.FAIL)  <= @failFrom ");
                    }
                    else if (tb_Gpa_From.Text == string.Empty && tb_Gpa_To.Text == string.Empty && tb_Fail_From.Text == string.Empty && tb_Fail_To.Text != string.Empty)
                    {
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester      ");
                        sql.Append(" group by sa.STUDENT_ID ,[SCHOOL], [CURSO], [ACADEMIC_YEAR], sa.A_Y,e.NAME, sa.NAME_CH, sa.NAME_PT , sa.GPA , sa.FAIL,sa.ALUN_NUMERO,sa.ALUN_NUMERO_SEQ, sa.PESS_COD,sa.ACADEMIC_SEMESTER ");
                        sql.Append(" having sum(DISTINCT sa.FAIL)  <= @failTo ");
                    }
                    else
                    {
                        sql.Append(" WHERE sa.ACADEMIC_SEMESTER=@semester  ");
                    }
                }
            
           /////////////Second Semester//////////////////////////////////////////////////////////
          //////////////.............../////////////////////////////////////////////////////////
         //////////////Complete Option Switch//////////////////////////////////////////////////                       
            if (yearListBox.SelectedIndex != 0)
            {
                sql.Append(" AND sa.ACADEMIC_YEAR=@year ");
            }



            SqlCommand cmd = new SqlCommand(sql.ToString(), conn);
            cmd.Parameters.AddWithValue("@year", yearListBox.SelectedValue);
		  //cmd.Parameters.AddWithValue("@SC",  ViewState["str_name"].ToString());
		  //cmd.Parameters.AddWithValue("@PC", ViewState["program"].ToString()); 
			
			
            if (tb_Fail_Below.Text != string.Empty)
                cmd.Parameters.AddWithValue("@failBelow", tb_Fail_Below.Text);
            if (tb_Fail_Above.Text != string.Empty)
                cmd.Parameters.AddWithValue("@failAbove", tb_Fail_Above.Text);
            if (tb_Fail_From.Text != string.Empty)
                cmd.Parameters.AddWithValue("@failFrom", tb_Fail_From.Text);
            if (tb_Fail_To.Text != string.Empty)
                cmd.Parameters.AddWithValue("@failTo", tb_Fail_To.Text);
            if (tb_Gpa_Below.Text != string.Empty)
                cmd.Parameters.AddWithValue("@gpaBelow", tb_Gpa_Below.Text);
            if (tb_Gpa_Above.Text != string.Empty)
                cmd.Parameters.AddWithValue("@gpaAbove", tb_Gpa_Above.Text);
            if (tb_Gpa_From.Text != string.Empty)
                cmd.Parameters.AddWithValue("@gpaFrom", tb_Gpa_From.Text);
            if (tb_Gpa_To.Text != string.Empty)
                cmd.Parameters.AddWithValue("@gpaTo", tb_Gpa_To.Text);
            if (OneRadioBtn.Checked == true)
                cmd.Parameters.AddWithValue("@semester", "1");
            else
                cmd.Parameters.AddWithValue("@semester", "2");
            SqlDataReader sdr = null;

            StringBuilder sb = new StringBuilder();
            sdr = cmd.ExecuteReader();

            while (sdr.Read())
            {
                sb.Append("<tr>");
                sb.Append("<td>");
                sb.Append(sdr["studentID"].ToString());
                sb.Append("</td>");
                sb.Append("<td>");
                sb.Append(sdr["FULL_NAME"].ToString());
                sb.Append("</td>");
                sb.Append("<td>");
                if (sdr["GPA"].ToString() != string.Empty )
                    sb.Append(string.Format("{0:f}", double.Parse(sdr["GPA"].ToString())));
                else
                    sb.Append(sdr["GPA"].ToString());
                sb.Append("</td>");
                sb.Append("<td>");
				sb.Append(sdr["FAIL"].ToString());
                sb.Append("</td>");
				sb.Append("<td style='display:none;'>");
                sb.Append(sdr["ALUN_NUMERO"].ToString());
                sb.Append("</td>");
                sb.Append("<td style='display:none;'>");
                sb.Append(sdr["ALUN_NUMERO_SEQ"].ToString());
                sb.Append("</td>");
				sb.Append("<td style='display:none;'>");
                sb.Append(sdr["PESS_COD"].ToString());
                sb.Append("</td>");
                sb.Append("</tr>");   
				
            }
            ltData.Text = sb.ToString();
          }
        catch (Exception e)
        {

            throw e;
        }
        finally
        {
            conn.Close();
        }
    }
    protected void view_Button_Click(object sender, EventArgs e)
    {    showMes.Text ="";
        showMes.Visible = false;
        if (id_txt.Text != "")
        {
            Session["student_id"] = id_txt.Text;
            ArrayList result = new ArrayList();
            result = EpDao.getALUN_NUMERO(id_txt.Text);
            Session["ALUN_NUMERO"] = result[0].ToString();
            Session["ALUN_NUMERO_SEQ"] = result[1].ToString();
         }
        else
        {
           // Response.Write("<script language='javascript' >alert('Please select one student!')</script>");
            showMes.Text = "Please select one student!";
            showMes.Visible = true;
            return;
        }
    }
    protected void advise_Button_Click(object sender, EventArgs e)
    {      showMes.Text ="";
           showMes.Visible = false;
        if ((id_txt.Text != "") && (yearListBox.SelectedValue!=null))
        {
            Session["studentID"] = id_txt.Text;
            Session["class_code"] = "CoordinatorAdvice";
            Session["year"] = yearListBox.SelectedValue.ToString(); 
            Session["teacher_code"] =ViewState["str_code"].ToString();
            Session["page"] = "TeacherSubjects.aspx";
            Response.Redirect("../Advice/GiveAdvice.aspx");
			
        }

        else
        {
           // Response.Write("<script language='javascript' >alert('Please select one student!')</script>");
            showMes.Text = "Please select one student!";
            showMes.Visible = true;
            return;
        }
    }

   [System.Web.Services.WebMethod]
    public static void SetSessionValue(string key, string value)
    {
        HttpContext.Current.Session[key] = value;
    }

   protected void rb_Gpa_Default_CheckedChanged(object sender, EventArgs e)
   {  if(rb_Gpa_Default.Checked == true)
       {
       tb_Gpa_Below.Enabled = false;
       tb_Gpa_Below.Text = "";
       tb_Gpa_Above.Enabled = false;
       tb_Gpa_Above.Text = "";
       tb_Gpa_From.Enabled = false;
       tb_Gpa_From.Text = "";
       tb_Gpa_To.Enabled = false;
       tb_Gpa_To.Text = "";
      }
       

   }
   protected void rb_Gpa_Below_CheckedChanged(object sender, EventArgs e)
   {
       if (rb_Gpa_Below.Checked == true)
       {
           tb_Gpa_Below.Enabled = true;
           tb_Gpa_Above.Enabled = false;
           tb_Gpa_Above.Text = "";
           tb_Gpa_From.Enabled = false;
           tb_Gpa_From.Text = "";
           tb_Gpa_To.Enabled = false;
           tb_Gpa_To.Text = "";
       }
   }
   protected void rb_Gpa_Above_CheckedChanged(object sender, EventArgs e)
   {
       if (rb_Gpa_Above.Checked == true)
       {
           tb_Gpa_Above.Enabled = true;
           tb_Gpa_Below.Enabled = false;
           tb_Gpa_Below.Text = "";
           tb_Gpa_From.Enabled = false;
           tb_Gpa_From.Text = "";
           tb_Gpa_To.Enabled = false;
           tb_Gpa_To.Text = "";
       }

   }
   protected void rb_Gpa_Range_CheckedChanged(object sender, EventArgs e)
   {
       if (rb_Gpa_Range.Checked == true)
           { 
              tb_Gpa_From.Enabled = true;
              tb_Gpa_To.Enabled = true;
              tb_Gpa_Below.Enabled = false;
              tb_Gpa_Below.Text = "";
              tb_Gpa_Above.Enabled = false;
              tb_Gpa_Above.Text = "";
          }
   }
  protected void rb_Fail_Default_CheckedChanged(object sender, EventArgs e)
   {
       if (rb_Fail_Default.Checked == true)
       {
           tb_Fail_Below.Enabled = false;
           tb_Fail_Below.Text = "";
           tb_Fail_Above.Enabled = false;
           tb_Fail_Above.Text = "";
           tb_Fail_From.Enabled = false;
           tb_Fail_From.Text = "";
           tb_Fail_To.Enabled = false;
           tb_Fail_To.Text = "";
       }
   }
   protected void rb_Fail_Below_CheckedChanged(object sender, EventArgs e)
   {
       if (rb_Fail_Below.Checked == true)
       {
           tb_Fail_Below.Enabled = true;
           tb_Fail_Above.Enabled = false;
           tb_Fail_Above.Text = "";
           tb_Fail_From.Enabled = false;
           tb_Fail_From.Text = "";
           tb_Fail_To.Enabled = false;
           tb_Fail_To.Text = "";
       }
   }
   protected void rb_Fail_Above_CheckedChanged(object sender, EventArgs e)
   {
       if (rb_Fail_Above.Checked == true)
       {
           tb_Fail_Above.Enabled = true;
           tb_Fail_Below.Enabled = false;
           tb_Fail_Below.Text = "";
           tb_Fail_From.Enabled = false;
           tb_Fail_From.Text = "";
           tb_Fail_To.Enabled = false;
           tb_Fail_To.Text = "";
       }
   }
   protected void rb_Fail_Range_CheckedChanged(object sender, EventArgs e)
   {
       if (rb_Fail_Range.Checked == true)
       {
           tb_Fail_From.Enabled = true;
           tb_Fail_To.Enabled = true;
           tb_Fail_Below.Enabled = false;
           tb_Fail_Below.Text = "";
           tb_Fail_Above.Enabled = false;
           tb_Fail_Above.Text = "";
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