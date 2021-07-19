using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MPICP_StudentView : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        //must be use !ispostback or can't not update because of save again
        if (!IsPostBack)
        {
            FromIDTemp.Text = Session["CompanyFormID"].ToString();
            Panel1.Visible = false;
            Panel2.Visible = false;
            //UpdateButton.Visible = false;
            //UpdateButton2.Visible = false;
            ViewPDFButton.Visible = false;
            ViewTemp.Visible = false;



            //load from information
            SqlCommand cmd = new SqlCommand("select * from CareerForm where CareerFormID=@CareerFormID", conn);
            //SqlCommand cmd = new SqlCommand("select b.Organize,b.Organize_en, * from CareerForm a inner join CareerCompanyRegist b on a.CompanyID=b.CompanyID where a.CompanyID is not null and a.canpost=1", conn);
            conn.Open();
            cmd.Parameters.AddWithValue("@CareerFormID", FromIDTemp.Text);
            SqlDataReader sdr = cmd.ExecuteReader();
            while (sdr.Read())
            {
                //panel1 context
                if (sdr["UpFile"].ToString() == "")
                {
                    Panel1.Visible = true;
                    //UpdateButton.Visible = true;

                    if (Session["Organize_en"].ToString() != null)
                    {
                        OragInfo.Text = "<br/>" + Session["Organize"].ToString() + " " + Session["Organize_en"].ToString() + "<br/><br/>";
                    }
                    else
                    {
                        OragInfo.Text = "<br/>" + Session["Organize"].ToString() + "<br/><br/>";
                    }
                    

                    OfferInfo.Text = "招聘職位: " + sdr["career"].ToString();

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
                        JobDescriptionInfo.Text = "<br/><br/><br/><br/>工作內容:<br/> " + sdr["JobDescription"].ToString(); 
                    }
                    if (sdr["Requirements"] != null)
                    {
                        RequirementsInfo.Text = "<br/><br/><br/><br/>要求:<br/> " + sdr["Requirements"].ToString(); 
                    }
                    if (sdr["ApplicationEndDate"] != "" || sdr["ApplicationStartDate"] != "")
                    {
                        DayStartInfo.Text = "<br/><br/>招聘日期: " + sdr["ApplicationEndDate"].ToString();
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
                            Contact1.Text = "<br/><br/><br/><br/>聯絡方法: <br/>聯絡人: " + sdr["ContactPersonName"].ToString();
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

                    //load view count with plus 1
                    if (sdr["Views"].ToString() != null)
                    {
                        Session["ViewCount"] = (Int32.Parse(sdr["Views"].ToString()) + 1).ToString();
                        SqlCommand updateviewcmd2 = new SqlCommand("update CareerForm set Views=@Views where CareerFormID=@CareerFormID", conn);
                        //conn.Open();
                        updateviewcmd2.Parameters.AddWithValue("@CareerFormID", FromIDTemp.Text);
                        updateviewcmd2.Parameters.AddWithValue("@Views", Session["ViewCount"].ToString());
                        updateviewcmd2.ExecuteNonQuery();
                        //conn.Close();
                    }

                }
                else
                {
                    Panel2.Visible = true;
                    //UpdateButton2.Visible = true;
                    ViewPDFButton.Visible = true;


                    Label2.Text = Session["CompanyFormID"].ToString();
                    SqlConnection pdfconn = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ToString());
                    SqlCommand pdfcmd = new SqlCommand("select * from CareerForm where CareerFormID=@CareerFormID", pdfconn);
                    pdfconn.Open();
                    pdfcmd.Parameters.AddWithValue("@CareerFormID", Label2.Text);
                    SqlDataReader sdr2 = pdfcmd.ExecuteReader();
                    while (sdr2.Read())
                    {
                        if (sdr2["UpFileName"] != null)
                        {
                            FilenameTemp.Text = sdr2["UpFileName"].ToString();
                        }
                        //load view count with plus 1
                        if (sdr2["Views"].ToString() != null)
                        {
                            Session["ViewCount"] = (Int32.Parse(sdr["Views"].ToString()) + 1).ToString();
                            SqlCommand updateviewcmd2 = new SqlCommand("update CareerForm set Views=@Views where CareerFormID=@CareerFormID", conn);
                            //conn.Open();
                            updateviewcmd2.Parameters.AddWithValue("@CareerFormID", Label2.Text);
                            updateviewcmd2.Parameters.AddWithValue("@Views", Session["ViewCount"].ToString());
                            updateviewcmd2.ExecuteNonQuery();
                            //conn.Close();
                        }
                    }

                    //MPI server location
                    //string FilePath = Server.MapPath("~\\images\\upload\\" + FilenameTemp.Text);
                    //local test location
                    string FilePath = Server.MapPath("fileuploadtest\\" + FilenameTemp.Text);


                    Response.Clear();
                    Response.ContentType = "application/pdf";
                    Response.AddHeader("Content-disposition", "inline;filename=" + FilenameTemp.Text);
                    Response.WriteFile(FilePath);
                    Response.End();

                    //SqlCommand updateviewcmd3 = new SqlCommand("update CareerForm set Views=@Views where CareerFormID=@CareerFormID", conn);
                    //conn.Open();
                    //updateviewcmd3.Parameters.AddWithValue("@CareerFormID", Label2.Text);
                    //updateviewcmd3.Parameters.AddWithValue("@Views", Session["ViewCount"].ToString() + 1);
                    //updateviewcmd3.ExecuteNonQuery();
                    //conn.Close();


                }
            }
            sdr.Close();
            conn.Close();

            //SqlCommand updateviewcmd = new SqlCommand("update CareerForm set Views=@Views where CareerFormID=@CareerFormID", conn);
            //conn.Open();
            //updateviewcmd.Parameters.AddWithValue("@CareerFormID", FromIDTemp.Text);
            //updateviewcmd.Parameters.AddWithValue("@Views", Session["ViewCount"].ToString());
            //updateviewcmd.ExecuteNonQuery();
            //conn.Close();


        }
    }


    protected void LogoImageButton_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Student.aspx");
    }


    protected void BackButton_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Student.aspx");
    }


    protected void ViewFileButton_Click(object sender, EventArgs e)
    {

        //MPI server location
        //FileUpload1.SaveAs(Server.MapPath("~/images/Upload/" + FileUpload1.FileName));
        //local test location
        //FileUpload1.SaveAs(Server.MapPath("fileuploadtest/" + FileUpload1.FileName));

        //MPI server location
        //string FilePath = Server.MapPath("~\\images\\upload\\" + FilenameTemp.Text);
        //local test location
        //string FilePath = Server.MapPath("fileuploadtest\\" + FilenameTemp.Text);


        //Response.Clear();
        //Response.ContentType = "application/pdf";
        //Response.AddHeader("Content-disposition", "inline;filename=" + FilenameTemp.Text);
        //Response.WriteFile(FilePath);
        //Response.End();
    }
}