using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MPICP_Student_View : System.Web.UI.Page
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
            UpdateButton.Visible = false;
            //UpdateButton2.Visible = false;
            ViewPDFButton.Visible = false;
            ViewTemp.Visible = false;

            // load Catalog ddl info
            conn.Open();
            SqlCommand cmd2 = new SqlCommand("select Industry_EN+' '+Industry_ZH as name,id,Industry_EN from CareerIndustry", conn);
            CatalogDll.DataSource = cmd2.ExecuteReader();
            CatalogDll.DataTextField = "name";
            CatalogDll.DataValueField = "Industry_EN";
            CatalogDll.DataBind();
            conn.Close();

            //load naturedll data
            conn.Open();
            SqlCommand cmd3 = new SqlCommand("select JobNatureEN,JobNatureEN+' '+JobNatureZH as name from CareerJobNature where Industry_ID=(select id from CareerIndustry where Industry_EN=(select Industry from CareerForm where CareerFormID=@CareerFormID))", conn);
            cmd3.Parameters.AddWithValue("@CareerFormID", FromIDTemp.Text);
            NatureDll.DataSource = cmd3.ExecuteReader();
            NatureDll.DataTextField = "name";
            NatureDll.DataValueField = "JobNatureEN";
            NatureDll.DataBind();
            NatureDll.Items.Insert(0, "-");
            conn.Close();



            //load from information
            SqlCommand cmd = new SqlCommand("select * from CareerForm where CareerFormID=@CareerFormID", conn);
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

                    if (sdr["career"] != null)
                    {
                        TextBox1.Text = sdr["career"].ToString();
                    }
                    if (sdr["career_en"] != null)
                    {
                        TextBox2.Text = sdr["career_en"].ToString();
                    }
                    //load view count with plus 1
                    if (sdr["Views"].ToString() != null)
                    {
                        Session["ViewCount"] = (Int32.Parse(sdr["Views"].ToString()) + 1).ToString();
                        ViewTemp.Text = Session["ViewCount"].ToString();
                    }
                    //Catalog ddl info
                    if (sdr["Industry"] != null)
                    {
                        CatalogDll.SelectedValue = sdr["Industry"].ToString();
                    }
                    //if (sdr["OrganiztionName1"] != null)
                    //{
                    //    TextBox3.Text = sdr["OrganiztionName1"].ToString();
                    //}
                    //NatureDll info
                    if (sdr["BusinessNature"] != null)
                    {
                        NatureDll.SelectedValue = sdr["BusinessNature"].ToString();
                    }

                    if (sdr["JobDescription"] != null)
                    {
                        TextBox5.Text = sdr["JobDescription"].ToString().Replace("<br/>", "");
                    }
                    if (sdr["Salary"] != null)
                    {
                        TextBox26.Text = sdr["Salary"].ToString();
                    }
                    if (sdr["SalaryHour"] != null)
                    {
                        string str = sdr["SalaryHour"].ToString();
                        if (sdr["SalaryHour"].ToString() == "True")
                        {
                            CheckBox3.Checked = true;
                        }
                        else
                        {
                            CheckBox3.Checked = false;
                        }
                    }
                    if (sdr["SalaryDay"] != null)
                    {
                        string str = sdr["SalaryDay"].ToString();
                        if (sdr["SalaryDay"].ToString() == "True")
                        {
                            CheckBox4.Checked = true;
                        }
                        else
                        {
                            CheckBox4.Checked = false;
                        }
                    }
                    if (sdr["SalaryMonth"] != null)
                    {
                        string str = sdr["SalaryMonth"].ToString();
                        if (sdr["SalaryMonth"].ToString() == "True")
                        {
                            CheckBox5.Checked = true;
                        }
                        else
                        {
                            CheckBox5.Checked = false;
                        }
                    }
                    if (sdr["Requirements"] != null)
                    {
                        TextBox6.Text = sdr["Requirements"].ToString().Replace("<br/>", "");
                    }
                    //datepicker date
                    if (sdr["ApplicationEndDate"] != null)
                    {
                        datepicker1.Text = sdr["ApplicationEndDate"].ToString();
                    }
                    if (sdr["ApplicationStartDate"] != null)
                    {
                        datepicker2.Text = sdr["ApplicationStartDate"].ToString();
                    }
                    if (sdr["ApplicationLetter"] != null)
                    {
                        string str = sdr["ApplicationLetter"].ToString();
                        if (sdr["ApplicationLetter"].ToString() == "True")
                        {
                            CheckBox7.Checked = true;
                        }
                        else
                        {
                            CheckBox7.Checked = false;

                        }
                    }
                    if (sdr["Resume"] != null)
                    {
                        string str = sdr["Resume"].ToString();
                        if (sdr["Resume"].ToString() == "True")
                        {
                            CheckBox8.Checked = true;
                        }
                        else
                        {
                            CheckBox8.Checked = false;
                        }
                    }
                    if (sdr["IDCopy"] != null)
                    {
                        string str = sdr["IDCopy"].ToString();
                        if (sdr["IDCopy"].ToString() == "True")
                        {
                            CheckBox9.Checked = true;
                        }
                        else
                        {
                            CheckBox9.Checked = false;
                        }
                    }
                    if (sdr["Transcript"] != null)
                    {
                        string str = sdr["Transcript"].ToString();
                        if (sdr["Transcript"].ToString() == "True")
                        {
                            CheckBox10.Checked = true;
                        }
                        else
                        {
                            CheckBox10.Checked = false;
                        }
                    }
                    if (sdr["DrivingLicense"] != null)
                    {
                        string str = sdr["DrivingLicense"].ToString();
                        if (sdr["DrivingLicense"].ToString() == "True")
                        {
                            CheckBox11.Checked = true;
                        }
                        else
                        {
                            CheckBox11.Checked = false;
                        }
                    }
                    if (sdr["DocsOthers"] != null)
                    {
                        string str = sdr["DocsOthers"].ToString();
                        if (sdr["DocsOthers"].ToString() == "True")
                        {
                            CheckBox13.Checked = true;
                        }
                        else
                        {
                            CheckBox13.Checked = false;
                        }
                    }
                    if (sdr["ApplicationPostTo"] != null)
                    {
                        TextBox9.Text = sdr["ApplicationPostTo"].ToString();
                    }
                    if (sdr["ApplicationEmail"] != null)
                    {
                        TextBox10.Text = sdr["ApplicationEmail"].ToString();
                    }
                    if (sdr["ApplicationPhone"] != null)
                    {
                        TextBox11.Text = sdr["ApplicationPhone"].ToString();
                    }
                    if (sdr["ApplicationOthers"] != null)
                    {
                        TextBox12.Text = sdr["ApplicationOthers"].ToString();
                    }
                    if (sdr["ContactPersonName"] != null)
                    {
                        TextBox13.Text = sdr["ContactPersonName"].ToString();
                    }
                    if (sdr["ContactPersonType1"] != null)
                    {
                        string str = sdr["ContactPersonType1"].ToString();
                        if (sdr["ContactPersonType1"].ToString() == "True")
                        {
                            CheckBox18.Checked = true;
                        }
                        else
                        {
                            CheckBox18.Checked = false;
                        }
                    }
                    if (sdr["ContactPersonType2"] != null)
                    {
                        string str = sdr["ContactPersonType2"].ToString();
                        if (sdr["ContactPersonType2"].ToString() == "True")
                        {
                            CheckBox19.Checked = true;
                        }
                        else
                        {
                            CheckBox19.Checked = false;
                        }
                    }
                    if (sdr["ContactPersonPhone"] != null)
                    {
                        TextBox14.Text = sdr["ContactPersonPhone"].ToString();
                    }
                    if (sdr["ContactPersonEmail"] != null)
                    {
                        TextBox15.Text = sdr["ContactPersonEmail"].ToString();
                    }
                    //sdr.Close();
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

                    //SqlCommand updateviewcmd2 = new SqlCommand("update CareerForm set Views=@Views where CareerFormID=@CareerFormID", conn);
                    //conn.Open();
                    //updateviewcmd2.Parameters.AddWithValue("@CareerFormID", Label2.Text);
                    //updateviewcmd2.Parameters.AddWithValue("@Views", Session["ViewCount"].ToString() + 1);
                    //updateviewcmd2.ExecuteNonQuery();
                    //conn.Close();


                }
            }
            sdr.Close();
            conn.Close();

            SqlCommand updateviewcmd = new SqlCommand("update CareerForm set Views=@Views where CareerFormID=@CareerFormID", conn);
            conn.Open();
            updateviewcmd.Parameters.AddWithValue("@CareerFormID", FromIDTemp.Text);
            updateviewcmd.Parameters.AddWithValue("@Views", ViewTemp.Text);
            updateviewcmd.ExecuteNonQuery();
            conn.Close();


        }
    }


    protected void CatalogDll_SelectedIndexChanged(object sender, EventArgs e)
    {
        //change naturedll context when catalogdll change
        NatureDll.Items.Clear();
        conn.Open();
        SqlCommand cmd4 = new SqlCommand("select id,JobNatureEN, JobNatureEN+' '+ JobNatureZH as name from CareerJobNature where Industry_ID=@Industry_ID", conn);
        cmd4.Parameters.AddWithValue("@Industry_ID", CatalogDll.SelectedIndex + 1);
        NatureDll.DataSource = cmd4.ExecuteReader();
        NatureDll.DataTextField = "name";
        NatureDll.DataValueField = "JobNatureEN";
        NatureDll.DataBind();
        NatureDll.Items.Insert(0, "-");
        conn.Close();
    }


    protected void LogoImageButton_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Student.aspx");
    }


    protected void BackButton_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Student.aspx");
    }

    protected void UpdateButton_Click(object sender, ImageClickEventArgs e)
    {

        //SqlCommand cmd5 = new SqlCommand("update CareerForm set career=@career,Industry=@Industry where CareerFormID=@CareerFormID", conn);
        //conn.Open();
        //cmd5.Parameters.AddWithValue("@CareerFormID", FromIDTemp.Text);
        //cmd5.Parameters.AddWithValue("@career", TextBox2.Text);
        //cmd5.Parameters.AddWithValue("@Industry", CatalogDll.SelectedValue);
        //cmd5.ExecuteNonQuery();

        SqlCommand cmd5 = new SqlCommand("update CareerForm set career=@career,career_en=@career_en,Industry=@Industry,BusinessNature=@BusinessNature,JobDescription=@JobDescription,Salary=@Salary,SalaryHour=@SalaryHour,SalaryDay=@SalaryDay,SalaryMonth=@SalaryMonth,Requirements=@Requirements,ApplicationEndDate=@ApplicationEndDate,ApplicationStartDate=@ApplicationStartDate,ApplicationLetter=@ApplicationLetter,Resume=@Resume,IDCopy=@IDCopy,Transcript=@Transcript,DrivingLicense=@DrivingLicense,DocsOthers=@DocsOthers,ApplicationPostTo=@ApplicationPostTo,ApplicationEmail=@ApplicationEmail,ApplicationPhone=@ApplicationPhone,ApplicationOthers=@ApplicationOthers,ContactPersonName=@ContactPersonName,ContactPersonType1=@ContactPersonType1,ContactPersonType2=@ContactPersonType2,ContactPersonPhone=@ContactPersonPhone,ContactPersonEmail=@ContactPersonEmail where CareerFormID=@CareerFormID", conn);

        conn.Open();
        cmd5.Parameters.AddWithValue("@CareerFormID", FromIDTemp.Text);
        cmd5.Parameters.AddWithValue("@career", TextBox1.Text);
        cmd5.Parameters.AddWithValue("@career_en", TextBox2.Text);
        cmd5.Parameters.AddWithValue("@Industry", CatalogDll.SelectedValue);
        //cmd5.Parameters.AddWithValue("@OrganiztionName1", TextBox3.Text);
        cmd5.Parameters.AddWithValue("@BusinessNature", NatureDll.SelectedValue);
        cmd5.Parameters.AddWithValue("@JobDescription", TextBox5.Text);
        cmd5.Parameters.AddWithValue("@Salary", TextBox26.Text);
        cmd5.Parameters.AddWithValue("@SalaryHour", CheckBox3.Checked);
        cmd5.Parameters.AddWithValue("@SalaryDay", CheckBox4.Checked);
        cmd5.Parameters.AddWithValue("@SalaryMonth", CheckBox5.Checked);
        cmd5.Parameters.AddWithValue("@Requirements", TextBox6.Text);
        cmd5.Parameters.AddWithValue("@ApplicationEndDate", datepicker1.Text);
        cmd5.Parameters.AddWithValue("@ApplicationStartDate", datepicker2.Text);
        cmd5.Parameters.AddWithValue("@ApplicationLetter", CheckBox7.Checked);
        cmd5.Parameters.AddWithValue("@Resume", CheckBox8.Checked);
        cmd5.Parameters.AddWithValue("@IDCopy", CheckBox9.Checked);
        cmd5.Parameters.AddWithValue("@Transcript", CheckBox10.Checked);
        cmd5.Parameters.AddWithValue("@DrivingLicense", CheckBox11.Checked);
        cmd5.Parameters.AddWithValue("@DocsOthers", CheckBox13.Checked);
        cmd5.Parameters.AddWithValue("@ApplicationPostTo", TextBox9.Text);
        cmd5.Parameters.AddWithValue("@ApplicationEmail", TextBox10.Text);
        cmd5.Parameters.AddWithValue("@ApplicationPhone", TextBox11.Text);
        cmd5.Parameters.AddWithValue("@ApplicationOthers", TextBox12.Text);
        cmd5.Parameters.AddWithValue("@ContactPersonName", TextBox13.Text);
        cmd5.Parameters.AddWithValue("@ContactPersonType1", CheckBox18.Checked);
        cmd5.Parameters.AddWithValue("@ContactPersonType2", CheckBox19.Checked);
        cmd5.Parameters.AddWithValue("@ContactPersonPhone", TextBox14.Text);
        cmd5.Parameters.AddWithValue("@ContactPersonEmail", TextBox15.Text);

        //cmd.Parameters.AddWithValue("@Professional_Competence_level", DropDownList1.SelectedValue.ToString());
        //cmd.Parameters.AddWithValue("@Leadership_level", DropDownList2.SelectedValue.ToString());
        //cmd.Parameters.AddWithValue("@Communication_level", DropDownList3.SelectedValue.ToString());
        //cmd.Parameters.AddWithValue("@Creativity_level", DropDownList4.SelectedValue.ToString());
        //cmd.Parameters.AddWithValue("@Initiative_level", DropDownList5.SelectedValue.ToString());
        //cmd.Parameters.AddWithValue("@Self_Development_level", DropDownList6.SelectedValue.ToString());
        //cmd.Parameters.AddWithValue("@Social_Responsibility_level", DropDownList7.SelectedValue.ToString());
        //cmd.Parameters.AddWithValue("@Language_level", DropDownList8.SelectedValue.ToString());
        //cmd.Parameters.AddWithValue("@IT_Application_level", DropDownList9.SelectedValue.ToString());

        //cmd.Parameters.AddWithValue("@OrgaName", TextBox16.Text);
        //cmd.Parameters.AddWithValue("@OrgaAddress", TextBox17.Text);
        //cmd.Parameters.AddWithValue("@OrgaComNum", TextBox18.Text);
        //cmd.Parameters.AddWithValue("@OrgaContactPerson", TextBox19.Text);
        //cmd.Parameters.AddWithValue("@OrgaPosition", TextBox20.Text);
        //cmd.Parameters.AddWithValue("@OrgaTele", TextBox21.Text);
        //cmd.Parameters.AddWithValue("@OrgaFax", TextBox22.Text);
        //cmd.Parameters.AddWithValue("@OrgaEmail", TextBox23.Text);
        //cmd.Parameters.AddWithValue("@OrgaDateFrom", datepicker3.Text);
        //cmd.Parameters.AddWithValue("@OrgaDateTo", datepicker4.Text);

        cmd5.ExecuteNonQuery();
        Response.Write("<script>alert('Update success !'); window.location.href='layout01pppage04.aspx'; </script>");
        //Response.Redirect("layout01pppage04.aspx");
        conn.Close();
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