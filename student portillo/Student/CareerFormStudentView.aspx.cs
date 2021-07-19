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
using System.Net;

public partial class Student_CareerFormStudentView : System.Web.UI.Page
{

    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = Session["IDTemp"].ToString();
        Panel1.Visible = false;
        Panel2.Visible = false;
       

        //load view count with plus 1
        SqlCommand cmd = new SqlCommand("select * from CareerForm where CareerFormID=@CareerFormID and IsApproval='1'", conn);
        conn.Open();
        cmd.Parameters.AddWithValue("@CareerFormID", Label1.Text);
        SqlDataReader sdr = cmd.ExecuteReader();
        while (sdr.Read())
        {
            if (sdr["Views"].ToString() != null)
            {
                ViewTemp.Text = (Int32.Parse(sdr["Views"].ToString()) + 1).ToString();
            }
            if (sdr["UpFileName"].ToString() != null)
            {
                FilenameTemp.Text = (sdr["UpFileName"].ToString()).ToString();
            }			
        }
        conn.Close();

        SqlCommand updateviewcmd = new SqlCommand("update CareerForm set Views=@Views where CareerFormID=@CareerFormID", conn);
        conn.Open();
        updateviewcmd.Parameters.AddWithValue("@CareerFormID", Label1.Text);
        updateviewcmd.Parameters.AddWithValue("@Views", ViewTemp.Text);
        updateviewcmd.ExecuteNonQuery();
        conn.Close();
		LoadFormInfo();
    }

    protected void LoadFormInfo()
    {
        //load GridView informaion
        conn.Open();
        SqlCommand loadwayfrom = new SqlCommand("select CareerFormID,UpFileName,UpFileType from CareerForm where CareerFormID=@CareerFormID", conn);
        loadwayfrom.Parameters.AddWithValue("@CareerFormID", Label1.Text);
        SqlDataAdapter da = new SqlDataAdapter(loadwayfrom);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
        conn.Close();



        //load from information
        SqlCommand cmd = new SqlCommand("select * from CareerForm where CareerFormID=@CareerFormID and IsApproval='1'", conn);
        conn.Open();
        cmd.Parameters.AddWithValue("@CareerFormID", Label1.Text);
        SqlDataReader sdr = cmd.ExecuteReader();
        while (sdr.Read())
        {
            if (sdr["UpFile"].ToString() == "")
            {
                Panel1.Visible = true;
                if (sdr["OrganiztionName1"].ToString() != null)
                {
                    OragInfo.Text = "<br/>" + sdr["OrganiztionName1"].ToString() + "<br/><br/>";
                }
                OfferInfo.Text = "招聘職位: " + sdr["career"].ToString();
                if (sdr["VacancyNumber"].ToString() != null)
                {
                    VacancyInfo.Text = "<br/><br/>招聘人數: " + sdr["VacancyNumber"].ToString();
                }
                if (sdr["Salary"].ToString() != null)
                {
                    SalaryInfo.Text = "<br/><br/>薪金: " + sdr["Salary"].ToString();
                }
                if (sdr["SalaryHour"].ToString() == "True")
                {
                    HourInfo.Text = "(小時)";
                }
                if (sdr["SalaryDay"].ToString() == "True")
                {
                    DayInfo.Text = "(天)";
                }
                if (sdr["SalaryMonth"].ToString() == "True")
                {
                    MonthInfo.Text = "(月)";
                }

                if (sdr["JobDescription"] != null)
                {
                    JobDescriptionInfo.Text = "<br/><br/><br/><br/>工作內容: " + sdr["JobDescription"].ToString();
                }
                if (sdr["Requirements"] != null)
                {
                    RequirementsInfo.Text = "<br/><br/><br/><br/>要求: " + sdr["Requirements"].ToString();
                }
                if (sdr["ApplicationEndDate"] != "" || sdr["ApplicationStartDate"] != "")
                {
                    DayStartInfo.Text = "<br/><br/><br/><br/>招聘日期: " + sdr["ApplicationEndDate"].ToString();
                    DayEndInfo.Text = "-" + sdr["ApplicationStartDate"].ToString();
                }
                if (sdr["ApplicationLetter"].ToString() != "False" || sdr["IDCopy"].ToString() == "True" || sdr["Resume"].ToString() == "True" || sdr["Transcript"].ToString() == "True" || sdr["DrivingLicense"].ToString() == "True")
                {
                    if (sdr["ApplicationLetter"].ToString() == "True")
                    {
                        SubmitInfo.Text = "<br/><br/><br/><br/>須遞交文件: 應徵信";
                    }
                    else
                    {
                        SubmitInfo.Text = "<br/><br/><br/><br/>須遞交文件: ";
                    }
                    if (sdr["Resume"].ToString() == "True")
                    {
                        Submit1.Text = " 履歷表";
                    }
                    if (sdr["IDCopy"].ToString() == "True")
                    {
                        Submit2.Text = " 身份證副本";
                    }
                    if (sdr["Transcript"].ToString() == "True")
                    {
                        Submit3.Text = " 成績單";
                    }
                    if (sdr["DrivingLicense"].ToString() == "True")
                    {
                        Submit4.Text = " 駕駛執照副本";
                    }
                }
                if (sdr["ContactPersonName"] != "" || sdr["ContactPersonPhone"] != "" || sdr["ContactPersonEmail"] != "")
                {
                    if (sdr["ContactPersonName"].ToString() != "")
                    {
                        Contact1.Text = "<br/><br/><br/><br/>聯絡方法: <br/>聯絡人 " + sdr["ContactPersonName"].ToString();
                    }
                    else
                    {
                        Contact1.Text = "<br/><br/><br/><br/>聯絡方法:";
                    }
                    Contact2.Text = "<br/>聯絡電話: " + sdr["ContactPersonPhone"].ToString();
                    Contact3.Text = "<br/>電郵: " + sdr["ContactPersonEmail"].ToString() + "<br/><br/><br/><br/><br/>";
                }
                else
                {
                    Contact1.Text = "<br/><br/><br/><br/><br/>";
                }
            }
            else
            {
                //Panel2.Visible = true;
				
				string FilePath = Server.MapPath("~\\images\\upload\\" + FilenameTemp.Text);
                //WebClient User = new WebClient();
               // Byte[] FileBuffer = System.IO.File.ReadAllBytes(FilePath);
               // if (FileBuffer != null)
                //{
                //    Response.ContentType = "application/pdf";
               //     Response.AddHeader("content-length", FileBuffer.Length.ToString());
                //    Response.BinaryWrite(FileBuffer);
               // }
				
				
				
				Response.Clear();
			    Response.ContentType = "application/pdf";
				Response.AddHeader("Content-disposition", "inline;filename="+ FilenameTemp.Text);
				Response.WriteFile(FilePath);
				Response.End();
				
                //if (sdr["OrganiztionName1"].ToString() != null)
                //{
                //    OragInfo2.Text = "<br/>" + sdr["OrganiztionName1"].ToString() + "<br/><br/>";
                //}
            }
        }
        sdr.Close();
        conn.Close();
        //FormIdTemp.Text = "";
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        conn.Open();
        SqlCommand cmd = new SqlCommand("select * from CareerForm where CareerFormID=@CareerFormID", conn);
        cmd.Parameters.AddWithValue("@CareerFormID", Label1.Text);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            Response.Clear();
            Response.Buffer = true;
            Response.ContentType = dr["UpFileType"].ToString();
            Response.AddHeader("content-disposition", "attachment;filename=" + dr["UpFileName"].ToString());     // to open file prompt Box open or Save file         
            Response.Charset = "";
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.BinaryWrite((byte[])dr["UpFile"]);
            Response.End();
        }
    }
}