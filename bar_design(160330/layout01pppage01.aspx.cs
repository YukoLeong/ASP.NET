using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class layout01pppage01 : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            DropDownList1.SelectedValue = "2";
            DropDownList2.SelectedValue = "2";
            DropDownList3.SelectedValue = "2";
            DropDownList4.SelectedValue = "2";
            DropDownList5.SelectedValue = "2";
            DropDownList6.SelectedValue = "2";
            DropDownList7.SelectedValue = "2";
            DropDownList8.SelectedValue = "2";
            DropDownList9.SelectedValue = "2";
            //AttributeDropDownList.Items.Insert(0, "－－Please Select Industry－－");
            TextBox9.Enabled = false;
            TextBox10.Enabled = false;
            TextBox11.Enabled = false;
            TextBox12.Enabled = false;
            Panel2.Visible = false;


            //Industry
            SqlCommand cmd = new SqlCommand("select id,Industry_EN, Industry_EN+' '+ Industry_ZH as name from CareerIndustry", con);
            con.Open();
            CatalogDll.DataSource = cmd.ExecuteReader();
            CatalogDll.DataTextField = "name";
            CatalogDll.DataValueField = "Industry_EN";

            CatalogDll.DataBind();
            CatalogDll.Items.Insert(0, "- - - Please select category - - -");
            con.Close();

            NatureDll.Items.Insert(0, "- - - Please select one - - -");


            //RecruitWay2Industry
            con.Open();
            RecruitWayDropDownList.DataSource = cmd.ExecuteReader();
            RecruitWayDropDownList.DataTextField = "name";
            RecruitWayDropDownList.DataValueField = "Industry_EN";

            RecruitWayDropDownList.DataBind();
            RecruitWayDropDownList.Items.Insert(0, "- - - Please select category - - -");
            con.Close();

        }
    }

    /*
    private void loadIndustry(){
         try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT distinct Industry_EN FROM CareerIndustry", con);

          
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            //AttributeDropDownList.Items.Insert(0, new ListItem("Please select one / 請選擇答案", "") );

            foreach (DataTable table in ds.Tables)
            {
                foreach (DataRow row in table.Rows)
                {
                    foreach (DataColumn column in table.Columns)
                    {
                        AttributeDropDownList.Items.Add(new ListItem(row["Industry_EN"].ToString(), row["Industry_EN"].ToString()));
                    }
                }
            }
            AttributeDropDownList.DataBind();
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
    */

    //protected void HomeButton_Click(object sender, EventArgs e)
    //{
    //    Response.Redirect("home.aspx");
    //}
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("layout01pp.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection conn2 = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ToString());
        conn2.Open();
        string insertQuery = "insert into CareerForm(IsApproval,career,Industry,VacancyNumber,Fulltime,Parttime,OrganiztionName1,BusinessNature,JobDescription,Salary,SalaryHour,SalaryDay,SalaryMonth,Requirements,ApplicationEndDate,ApplicationStartDate,ApplicationLetter,Resume,IDCopy,Transcript,DrivingLicense,DocsOthers,ApplicationPostTo,ApplicationEmail,ApplicationPhone,ApplicationOthers,ContactPersonName,ContactPersonType1,ContactPersonType2,ContactPersonPhone,ContactPersonEmail,Professional_Competence_level,Leadership_level,Communication_level,Creativity_level,Initiative_level,Self_Development_level,Social_Responsibility_level,Language_level,IT_Application_level,OrgaName,OrgaAddress,OrgaComNum,OrgaContactPerson,OrgaPosition,OrgaTele,OrgaFax,OrgaEmail,OrgaDateFrom,OrgaDateTo,Views) values (@IsApproval,@career,@Industry,@VacancyNumber,@Fulltime,@Parttime,@OrganiztionName1,@BusinessNature,@JobDescription,@Salary,@SalaryHour,@SalaryDay,@SalaryMonth,@Requirements,@ApplicationEndDate,@ApplicationStartDate,@ApplicationLetter,@Resume,@IDCopy,@Transcript,@DrivingLicense,@DocsOthers,@ApplicationPostTo,@ApplicationEmail,@ApplicationPhone,@ApplicationOthers,@ContactPersonName,@ContactPersonType1,@ContactPersonType2,@ContactPersonPhone,@ContactPersonEmail,@Professional_Competence_level,@Leadership_level,@Communication_level,@Creativity_level,@Initiative_level,@Self_Development_level,@Social_Responsibility_level,@Language_level,@IT_Application_level,@OrgaName,@OrgaAddress,@OrgaComNum,@OrgaContactPerson,@OrgaPosition,@OrgaTele,@OrgaFax,@OrgaEmail,@OrgaDateFrom,@OrgaDateTo,@Views)";
        SqlCommand com2 = new SqlCommand(insertQuery, conn2);
        com2.Parameters.AddWithValue("@career", TextBox1.Text);
        com2.Parameters.AddWithValue("@Industry", CatalogDll.SelectedValue.ToString());
        com2.Parameters.AddWithValue("@VacancyNumber", TextBox2.Text);
        com2.Parameters.AddWithValue("@Fulltime", CheckBox1.Checked);
        com2.Parameters.AddWithValue("@Parttime", CheckBox2.Checked);

        if (TextBox3.Text == "")
        {
            com2.Parameters.AddWithValue("@OrganiztionName1", "未輸入");
        }
        else
        {
            com2.Parameters.AddWithValue("@OrganiztionName1", TextBox3.Text);
        }

        if (NatureDll.SelectedIndex != 0)
        {
            com2.Parameters.AddWithValue("@BusinessNature", NatureDll.SelectedValue.ToString());
        }
        else
        {
            com2.Parameters.AddWithValue("@BusinessNature", "-");
        }

        string str = TextBox5.Text.Replace("\n", "<br/>");
        com2.Parameters.AddWithValue("@JobDescription", str);
        com2.Parameters.AddWithValue("@Salary", TextBox26.Text);
        com2.Parameters.AddWithValue("@SalaryHour", CheckBox3.Checked);
        com2.Parameters.AddWithValue("@SalaryDay", CheckBox4.Checked);
        com2.Parameters.AddWithValue("@SalaryMonth", CheckBox5.Checked);

        com2.Parameters.AddWithValue("@Requirements", TextBox6.Text);
        com2.Parameters.AddWithValue("@ApplicationEndDate", datepicker1.Text);
        com2.Parameters.AddWithValue("@ApplicationStartDate", datepicker2.Text);
        com2.Parameters.AddWithValue("@ApplicationLetter", CheckBox7.Checked);
        com2.Parameters.AddWithValue("@Resume", CheckBox8.Checked);
        com2.Parameters.AddWithValue("@IDCopy", CheckBox9.Checked);
        com2.Parameters.AddWithValue("@Transcript", CheckBox10.Checked);
        com2.Parameters.AddWithValue("@DrivingLicense", CheckBox11.Checked);
        com2.Parameters.AddWithValue("@DocsOthers", CheckBox13.Checked);

        com2.Parameters.AddWithValue("@ApplicationPostTo", TextBox9.Text);
        com2.Parameters.AddWithValue("@ApplicationEmail", TextBox10.Text);
        com2.Parameters.AddWithValue("@ApplicationPhone", TextBox11.Text);
        com2.Parameters.AddWithValue("@ApplicationOthers", TextBox12.Text);
        com2.Parameters.AddWithValue("@ContactPersonName", TextBox13.Text);
        com2.Parameters.AddWithValue("@ContactPersonType1", CheckBox18.Checked);
        com2.Parameters.AddWithValue("@ContactPersonType2", CheckBox19.Checked);
        com2.Parameters.AddWithValue("@ContactPersonPhone", TextBox14.Text);
        com2.Parameters.AddWithValue("@ContactPersonEmail", TextBox15.Text);

        com2.Parameters.AddWithValue("@Professional_Competence_level", DropDownList1.SelectedValue.ToString());
        com2.Parameters.AddWithValue("@Leadership_level", DropDownList2.SelectedValue.ToString());
        com2.Parameters.AddWithValue("@Communication_level", DropDownList3.SelectedValue.ToString());
        com2.Parameters.AddWithValue("@Creativity_level", DropDownList4.SelectedValue.ToString());
        com2.Parameters.AddWithValue("@Initiative_level", DropDownList5.SelectedValue.ToString());
        com2.Parameters.AddWithValue("@Self_Development_level", DropDownList6.SelectedValue.ToString());
        com2.Parameters.AddWithValue("@Social_Responsibility_level", DropDownList7.SelectedValue.ToString());
        com2.Parameters.AddWithValue("@Language_level", DropDownList8.SelectedValue.ToString());
        com2.Parameters.AddWithValue("@IT_Application_level", DropDownList9.SelectedValue.ToString());

        com2.Parameters.AddWithValue("@OrgaName", TextBox16.Text);
        com2.Parameters.AddWithValue("@OrgaAddress", TextBox17.Text);
        com2.Parameters.AddWithValue("@OrgaComNum", TextBox18.Text);
        com2.Parameters.AddWithValue("@OrgaContactPerson", TextBox19.Text);
        com2.Parameters.AddWithValue("@OrgaPosition", TextBox20.Text);
        com2.Parameters.AddWithValue("@OrgaTele", TextBox21.Text);
        com2.Parameters.AddWithValue("@OrgaFax", TextBox22.Text);
        com2.Parameters.AddWithValue("@OrgaEmail", TextBox23.Text);
        com2.Parameters.AddWithValue("@OrgaDateFrom", datepicker3.Text);
        com2.Parameters.AddWithValue("@OrgaDateTo", datepicker4.Text);
        com2.Parameters.AddWithValue("@IsApproval", "2");
        com2.Parameters.AddWithValue("@Views", 0);
        com2.ExecuteNonQuery();

        Response.Write("<script>alert(' You are sumbit the page !')</script>");

        //clear the form content
        TextBox1.Text = "";
        CatalogDll.SelectedIndex = 0;
        TextBox2.Text = "";
        CheckBox1.Checked = false;
        CheckBox2.Checked = false;
        TextBox3.Text = "";
        NatureDll.SelectedIndex = 0;
        TextBox5.Text = "";
        TextBox26.Text = "";
        CheckBox3.Checked = false;
        CheckBox4.Checked = false;
        CheckBox5.Checked = false;
        TextBox6.Text = "";
        datepicker1.Text = "";
        datepicker2.Text = "";
        CheckBox7.Checked = false;
        CheckBox8.Checked = false;
        CheckBox9.Checked = false;
        CheckBox10.Checked = false;
        CheckBox11.Checked = false;
        CheckBox13.Checked = false;
        TextBox9.Text = "";
        TextBox10.Text = "";
        TextBox11.Text = "";
        TextBox12.Text = "";
        TextBox13.Text = "";
        CheckBox18.Checked = false;
        CheckBox19.Checked = false;
        TextBox14.Text = "";
        TextBox15.Text = "";
        DropDownList1.SelectedIndex = 1;
        DropDownList2.SelectedIndex = 1;
        DropDownList3.SelectedIndex = 1;
        DropDownList4.SelectedIndex = 1;
        DropDownList5.SelectedIndex = 1;
        DropDownList6.SelectedIndex = 1;
        DropDownList7.SelectedIndex = 1;
        DropDownList8.SelectedIndex = 1;
        DropDownList9.SelectedIndex = 1;
        TextBox16.Text = "";
        TextBox17.Text = "";
        TextBox18.Text = "";
        TextBox19.Text = "";
        TextBox20.Text = "";
        TextBox21.Text = "";
        TextBox22.Text = "";
        TextBox23.Text = "";
        datepicker3.Text = "";
        datepicker4.Text = "";
    }
    protected void CheckBox14_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox14.Checked)
        {
            TextBox9.Enabled = true;
        }
        else
        {
            TextBox9.Enabled = false;
        }
    }
    protected void CheckBox15_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox15.Checked)
        {
            TextBox10.Enabled = true;
        }
        else
        {
            TextBox10.Enabled = false;
        }
    }
    protected void CheckBox16_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox16.Checked)
        {
            TextBox11.Enabled = true;
        }
        else
        {
            TextBox11.Enabled = false;
        }
    }
    protected void CheckBox17_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox17.Checked)
        {
            TextBox12.Enabled = true;
        }
        else
        {
            TextBox12.Enabled = false;
        }
    }
    protected void CatalogDll_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (CatalogDll.SelectedIndex != 0)
        {
            SqlCommand cmd2 = new SqlCommand("select id, JobNatureEN,JobNatureEN+' '+ JobNatureZH as name from CareerJobNature where Industry_ID=@Industry_ID", con);
            cmd2.Parameters.AddWithValue("@Industry_ID", CatalogDll.SelectedIndex);
            con.Open();

            NatureDll.DataSource = cmd2.ExecuteReader();
            NatureDll.DataTextField = "name";
            NatureDll.DataValueField = "JobNatureEN";
            NatureDll.DataBind();
            NatureDll.Items.Insert(0, "- - - Please select one - - -");
        }
        else
        {
            NatureDll.Items.Clear();
            NatureDll.Items.Insert(0, "- - - Please select one - - -");
        }
    }
    protected void RecruitWay1_CheckedChanged(object sender, EventArgs e)
    {
        Panel1.Visible = true;
        Panel2.Visible = false;
        Button1.Visible = true;
        //TopLabel1.Visible = true;
        //TopLabel2.Visible = true;
    }
    protected void RecruitWay2_CheckedChanged(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        Panel2.Visible = true;
        Button1.Visible = false;
        //TopLabel1.Visible = false;
        //TopLabel2.Visible = false;
    }
    protected void RecruitWayButton_Click(object sender, EventArgs e)
    {
        String tempType = "";
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ToString());

        if (FileUpload1.HasFile)
        {
            string fileExtension = System.IO.Path.GetExtension(FileUpload1.FileName);

            if (fileExtension.ToLower() != ".pdf")
            {
                RecruitLabel.Text = "Only files with .pdf extension are allowed";
                RecruitLabel.ForeColor = System.Drawing.Color.Red;

            }
            else
            {
                //get the file type
                if (fileExtension.ToLower() == ".doc")
                {
                    tempType = "doc";
                }
                else if (fileExtension.ToLower() == ".docx")
                {
                    tempType = "docx";
                }
                else if (fileExtension.ToLower() == ".pdf")
                {
                    tempType = "pdf";
                }
                else
                {
                    tempType = "Unknown";
                }

                int fileSize = FileUpload1.PostedFile.ContentLength;
                if (fileSize > 52428800)
                {
                    RecruitLabel.Text = "Maximum file size exceeded";
                    RecruitLabel.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    FileUpload1.SaveAs(Server.MapPath("~/images/upload/" + FileUpload1.FileName));

                    conn.Open();

                    Stream fs = FileUpload1.PostedFile.InputStream;
                    BinaryReader br = new BinaryReader(fs);
                    Byte[] bytes = br.ReadBytes((Int32)fs.Length);
                    //query = "insert into PDFFiles (Name,type,data)" + " values (@Name, @type, @Data)"; 

                    String filePath = FileUpload1.PostedFile.FileName;
                    String fileName = Path.GetFileName(filePath);


                    SqlCommand cmd = new SqlCommand("insert into CareerForm (UpFileName,UpFile,UpFileType,Industry,career,IsApproval,VacancyNumber,OrganiztionName1,BusinessNature,Salary,Professional_Competence,Leadership,Communication,Creativity,Initiative,Self_Development,Social_Responsibility,Language,IT_Application,Views,Professional_Competence_level,Leadership_level,Communication_level,Creativity_level,Initiative_level,Self_Development_level,Social_Responsibility_level,Language_level,IT_Application_level)" + " values (@UpFileName,@UpFile,@UpFileType,@Industry,@career,@IsApproval,@VacancyNumber,@OrganiztionName1,@BusinessNature,@Salary,@Professional_Competence,@Leadership,@Communication,@Creativity,@Initiative,@Self_Development,@Social_Responsibility,@Language,@IT_Application,@Views,@Professional_Competence_level,@Leadership_level,@Communication_level,@Creativity_level,@Initiative_level,@Self_Development_level,@Social_Responsibility_level,@Language_level,@IT_Application_level)", conn);

                    //cmd.Parameters.Add("@UpFileName", SqlDbType.VarChar).Value = fileName;
                    //cmd.Parameters.Add("@UpFileType", SqlDbType.VarChar).Value = fileType;
                    //cmd.Parameters.Add("@UpFile", SqlDbType.Binary).Value = bytes;
                    cmd.Parameters.AddWithValue("@UpFileName", fileName);
                    cmd.Parameters.AddWithValue("@UpFile", bytes);
                    cmd.Parameters.AddWithValue("@UpFileType", tempType);
                    cmd.Parameters.AddWithValue("@Industry", RecruitWayDropDownList.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@OrganiztionName1", RecruitWayText2.Text);
                    cmd.Parameters.AddWithValue("@career", RecruitWayText3.Text);
                    cmd.Parameters.AddWithValue("@IsApproval", "2");
                    cmd.Parameters.AddWithValue("@VacancyNumber", "1");
                    cmd.Parameters.AddWithValue("@BusinessNature", "-");
                    cmd.Parameters.AddWithValue("@Salary", "見附件");

                    cmd.Parameters.AddWithValue("@Professional_Competence", "2");
                    cmd.Parameters.AddWithValue("@Leadership", "2");
                    cmd.Parameters.AddWithValue("@Communication", "2");
                    cmd.Parameters.AddWithValue("@Creativity", "2");
                    cmd.Parameters.AddWithValue("@Initiative", "2");
                    cmd.Parameters.AddWithValue("@Self_Development", "2");
                    cmd.Parameters.AddWithValue("@Social_Responsibility", "2");
                    cmd.Parameters.AddWithValue("@Language", "2");
                    cmd.Parameters.AddWithValue("@IT_Application", "2");

                    cmd.Parameters.AddWithValue("@Views", 0);

                    cmd.Parameters.AddWithValue("@Professional_Competence_level", "2");
                    cmd.Parameters.AddWithValue("@Leadership_level", "2");
                    cmd.Parameters.AddWithValue("@Communication_level", "2");
                    cmd.Parameters.AddWithValue("@Creativity_level", "2");
                    cmd.Parameters.AddWithValue("@Initiative_level", "2");
                    cmd.Parameters.AddWithValue("@Self_Development_level", "2");
                    cmd.Parameters.AddWithValue("@Social_Responsibility_level", "2");
                    cmd.Parameters.AddWithValue("@Language_level", "2");
                    cmd.Parameters.AddWithValue("@IT_Application_level", "2");

                    cmd.ExecuteNonQuery();

                    RecruitLabel.Text = "File Uploaded";
                    RecruitLabel.ForeColor = System.Drawing.Color.Green;

                    Response.Write("<script>alert(' You are sumbit the page !')</script>");
                }
            }
        }
        else
        {
            RecruitLabel.Text = "Please select a file to upload";
            RecruitLabel.ForeColor = System.Drawing.Color.Red;
        }

    }
}