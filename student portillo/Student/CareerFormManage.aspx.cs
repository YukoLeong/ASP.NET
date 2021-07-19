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

public partial class Student_CareerForm2 : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //DropDownList11.Items.Insert(0, "--Select Form ID--");
            //DropDownList11.Enabled = false;
            //CheckBox1.Checked = true;
            //RadioButtonList1.Visible = false;
            Panel1.Visible = false;
            UpdateButton.Visible = false;
            conn.Open();
            SqlCommand cmd2 = new SqlCommand("select Industry_EN+' '+Industry_ZH as name,id,Industry_EN from CareerIndustry", conn);
            CatalogDll.DataSource = cmd2.ExecuteReader();
            CatalogDll.DataTextField = "name";
            CatalogDll.DataValueField = "Industry_EN";
            CatalogDll.DataBind();
            conn.Close();
            showForm();
        }
    }

    public void showForm() {

        if (Panel1.Visible == false)
        {
            StringBuilder sb = new StringBuilder();
            conn.Open();
            //select CareerFormID,ts,IsApproval,Industry,career from CareerForm
            SqlCommand cmd = new SqlCommand("select CareerFormID,ts,IsApproval,OrganiztionName1,Industry,career,Salary from CareerForm", conn);

            SqlDataReader sqr = cmd.ExecuteReader();

            while (sqr.Read())
            {
                sb.Append("<tr>");
                sb.Append("<td>");
                sb.Append(sqr["CareerFormID"].ToString());
                sb.Append("</td>");
                sb.Append("<td>");
                sb.Append(sqr["ts"].ToString());
                sb.Append("</td>");
                sb.Append("<td>");
                sb.Append(sqr["OrganiztionName1"].ToString());
                sb.Append("</td>");
                sb.Append("<td>");
                sb.Append(sqr["career"].ToString());
                sb.Append("</td>");

                sb.Append("<td>");
                if (sqr["IsApproval"].ToString() == "0")
                {
                    sb.Append("不合格");
                }
                else if (sqr["IsApproval"].ToString() == "1")
                {
                    sb.Append("合格");
                }
                else if (sqr["IsApproval"].ToString() == "2")
                {
                    sb.Append("未審批");
                }
                else
                {
                    sb.Append("");
                }
                sb.Append("</td>");
                sb.Append("</tr>");
            }
            kanonData.Text = sb.ToString();
            sqr.Close();
            conn.Close();

        }
        else
        {
            StringBuilder sb = new StringBuilder();
            conn.Open();
            //select CareerFormID,ts,IsApproval,Industry,career from CareerForm
            SqlCommand cmd = new SqlCommand("select CareerFormID,ts,IsApproval,OrganiztionName1,Industry,career,Salary from CareerForm", conn);

            SqlDataReader sqr = cmd.ExecuteReader();

            while (sqr.Read())
            {
                sb.Append("<tr>");
                sb.Append("<td>");
                sb.Append(sqr["CareerFormID"].ToString());
                sb.Append("</td>");
                sb.Append("<td>");
                sb.Append(sqr["ts"].ToString());
                sb.Append("</td>");
                sb.Append("<td>");
                sb.Append(sqr["OrganiztionName1"].ToString());
                sb.Append("</td>");
                sb.Append("<td>");
                sb.Append(sqr["career"].ToString());
                sb.Append("</td>");


                if (sqr["IsApproval"].ToString() == "0")
                {
                    sb.Append("<td><select size='1' name='" + sqr["CareerFormID"].ToString() + "'>");
                    sb.Append("<option value='0'");
                    sb.Append(" selected='selected'  selected='selected'>");
                    sb.Append("不合格");
                    sb.Append("</option>");
                    sb.Append("<option value='1'>");
                    sb.Append("合格");
                    sb.Append("</option>");
                    sb.Append("<option value='2'>");
                    sb.Append("未審批");
                    sb.Append("</option>");
                    sb.Append("</td></select>");
                    sb.Append("</tr>");
                }
                else if (sqr["IsApproval"].ToString() == "1")
                {
                    sb.Append("<td><select size='1'  name='" + sqr["CareerFormID"].ToString() + "'>");
                    sb.Append("<option value='0'>");
                    sb.Append("不合格");
                    sb.Append("</option>");
                    sb.Append("<option value='1' selected='selected'>");
                    sb.Append("合格");
                    sb.Append("</option>");
                    sb.Append("<option value='2'>");
                    sb.Append("未審批");
                    sb.Append("</option>");
                    sb.Append("</td></select>");
                    sb.Append("</tr>");
                }
                else
                {
                    sb.Append("<td><select size='1' name='" + sqr["CareerFormID"].ToString() + "'>");
                    sb.Append("<option value='0'>");
                    sb.Append("不合格");
                    sb.Append("</option>");
                    sb.Append("<option value='1'>");
                    sb.Append("合格");
                    sb.Append("</option>");
                    sb.Append("<option value='2' selected='selected'>");
                    sb.Append("未審批");
                    sb.Append("</option>");
                    sb.Append("</td></select>");
                    sb.Append("</tr>");
                }
            }
            kanonData.Text = sb.ToString();
            sqr.Close();
            conn.Close();
        }
    }


    protected void ViewButton_Click(object sender, EventArgs e)
    {
        if (TextboxTemp.Text != "") {
            LabelTemp.Text = TextboxTemp.Text;
            Panel1.Visible = true;
            showForm();
            UpdateButton.Visible = true;
        }
        
        //load naturedll data
        conn.Open();
        SqlCommand cmd3 = new SqlCommand("select JobNatureEN,JobNatureEN+' '+JobNatureZH as name from CareerJobNature where Industry_ID=(select id from CareerIndustry where Industry_EN=(select Industry from CareerForm where CareerFormID=@CareerFormID))", conn);
        cmd3.Parameters.AddWithValue("@CareerFormID", LabelTemp.Text);
        NatureDll.DataSource = cmd3.ExecuteReader();
        NatureDll.DataTextField = "name";
        NatureDll.DataValueField = "JobNatureEN";
        NatureDll.DataBind();
        NatureDll.Items.Insert(0, "-");
        conn.Close();

        //load from data
        SqlCommand cmd = new SqlCommand("select * from CareerForm where CareerFormID=@ddl2", conn);
        conn.Open();
        cmd.Parameters.AddWithValue("@ddl2", LabelTemp.Text);
        SqlDataReader sdr = cmd.ExecuteReader();
        while (sdr.Read())
        {
            if (sdr["career"] != null)
            {
                TextBox1.Text = sdr["career"].ToString();
            }
            if (sdr["Industry"] != null)
            {
                CatalogDll.SelectedValue = sdr["Industry"].ToString();
            }
            if (sdr["VacancyNumber"] != null)
            {
                TextBox2.Text = sdr["VacancyNumber"].ToString();
            }
            if (sdr["Fulltime"] != null)
            {
                string str = sdr["Fulltime"].ToString();
                if (sdr["Fulltime"].ToString() == "True")
                {
                    CheckBox1.Checked = true;
                }
                else
                {
                    CheckBox1.Checked = false;
                }
            }
            if (sdr["Parttime"] != null)
            {
                string str = sdr["Parttime"].ToString();
                if (sdr["Parttime"].ToString() == "True")
                {
                    CheckBox2.Checked = true;
                }
                else
                {
                    CheckBox2.Checked = false;
                }
            }
            if (sdr["OrganiztionName1"] != null)
            {
                TextBox3.Text = sdr["OrganiztionName1"].ToString();
            }
            if (sdr["BusinessNature"] != null)
            {
                NatureDll.SelectedValue = sdr["BusinessNature"].ToString();
            }
            if (sdr["JobDescription"] != null)
            {
                TextBox5.Text = sdr["JobDescription"].ToString();
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
                TextBox6.Text = sdr["Requirements"].ToString();
            }
            if (sdr["ApplicationEndDate"] != null)
            {
                TextBox27.Text = sdr["ApplicationEndDate"].ToString();
            }
            if (sdr["ApplicationStartDate"] != null)
            {
                TextBox28.Text = sdr["ApplicationStartDate"].ToString();
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
            if (sdr["Professional_Competence_level"] != null)
            {
                DropDownList1.SelectedValue = sdr["Professional_Competence_level"].ToString();
            }
            if (sdr["Leadership_level"] != null)
            {
                DropDownList2.SelectedValue = sdr["Leadership_level"].ToString();
            }
            if (sdr["Communication_level"] != null)
            {
                DropDownList3.SelectedValue = sdr["Communication_level"].ToString();
            }
            if (sdr["Creativity_level"] != null)
            {
                DropDownList4.SelectedValue = sdr["Creativity_level"].ToString();
            }
            if (sdr["Initiative_level"] != null)
            {
                DropDownList5.SelectedValue = sdr["Initiative_level"].ToString();
            }
            if (sdr["Self_Development_level"] != null)
            {
                DropDownList6.SelectedValue = sdr["Self_Development_level"].ToString();
            }
            if (sdr["Social_Responsibility_level"] != null)
            {
                DropDownList7.SelectedValue = sdr["Social_Responsibility_level"].ToString();
            }
            if (sdr["Language_level"] != null)
            {
                DropDownList8.SelectedValue = sdr["Language_level"].ToString();
            }
            if (sdr["IT_Application_level"] != null)
            {
                DropDownList9.SelectedValue = sdr["IT_Application_level"].ToString();
            }
            if (sdr["OrgaName"] != null)
            {
                TextBox16.Text = sdr["OrgaName"].ToString();
            }
            if (sdr["OrgaAddress"] != null)
            {
                TextBox17.Text = sdr["OrgaAddress"].ToString();
            }
            if (sdr["OrgaComNum"] != null)
            {
                TextBox18.Text = sdr["OrgaComNum"].ToString();
            }
            if (sdr["OrgaContactPerson"] != null)
            {
                TextBox19.Text = sdr["OrgaContactPerson"].ToString();
            }
            if (sdr["OrgaPosition"] != null)
            {
                TextBox20.Text = sdr["OrgaPosition"].ToString();
            }
            if (sdr["OrgaTele"] != null)
            {
                TextBox21.Text = sdr["OrgaTele"].ToString();
            }
            if (sdr["OrgaFax"] != null)
            {
                TextBox22.Text = sdr["OrgaFax"].ToString();
            }
            if (sdr["OrgaEmail"] != null)
            {
                TextBox23.Text = sdr["OrgaEmail"].ToString();
            }
            if (sdr["OrgaDateFrom"] != null)
            {
                TextBox29.Text = sdr["OrgaDateFrom"].ToString();
            }
            if (sdr["OrgaDateTo"] != null)
            {
                TextBox30.Text = sdr["OrgaDateTo"].ToString();
            }
        }
        sdr.Close();
    }
    protected void HomeButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("home.aspx");
    }

    protected void UpdateButton_Click(object sender, EventArgs e)
    {
        if (TextboxTemp2.Text != "")
        {
            string[] tempArr, tempArr2;
            tempArr = TextboxTemp2.Text.Split('&');
            conn.Open();
            foreach (string li in tempArr)
            {
                SqlCommand droplistcmd = new SqlCommand("update CareerForm set IsApproval=@IsApproval where CareerFormID=@CareerFormID", conn);
                tempArr2 = li.Split('=');
                droplistcmd.Parameters.AddWithValue("@CareerFormID", tempArr2[0]);
                droplistcmd.Parameters.AddWithValue("@IsApproval", tempArr2[1]);
                droplistcmd.ExecuteNonQuery();
            }
        }
        conn.Close();

        SqlCommand cmd = new SqlCommand("update CareerForm set career=@career,Industry=@Industry,VacancyNumber=@VacancyNumber,Fulltime=@Fulltime,Parttime=@Parttime,OrganiztionName1=@OrganiztionName1,BusinessNature=@BusinessNature,JobDescription=@JobDescription,Salary=@Salary,SalaryHour=@SalaryHour,SalaryDay=@SalaryDay,SalaryMonth=@SalaryMonth,Requirements=@Requirements,ApplicationEndDate=@ApplicationEndDate,ApplicationStartDate=@ApplicationStartDate,ApplicationLetter=@ApplicationLetter,Resume=@Resume,IDCopy=@IDCopy,Transcript=@Transcript,DrivingLicense=@DrivingLicense,DocsOthers=@DocsOthers,ApplicationPostTo=@ApplicationPostTo,ApplicationEmail=@ApplicationEmail,ApplicationPhone=@ApplicationPhone,ApplicationOthers=@ApplicationOthers,ContactPersonName=@ContactPersonName,Professional_Competence_level=@Professional_Competence_level,Leadership_level=@Leadership_level,Communication_level=@Communication_level,Creativity_level=@Creativity_level,Initiative_level=@Initiative_level,Self_Development_level=@Self_Development_level,Social_Responsibility_level=@Social_Responsibility_level,Language_level=@Language_level,IT_Application_level=@IT_Application_level,OrgaName=@OrgaName,OrgaAddress=@OrgaAddress,OrgaComNum=@OrgaComNum,OrgaContactPerson=@OrgaContactPerson,OrgaPosition=@OrgaPosition,OrgaTele=@OrgaTele,OrgaFax=@OrgaFax,OrgaEmail=@OrgaEmail where CareerFormID=@CareerFormID", conn);
        
        conn.Open();
        cmd.Parameters.AddWithValue("@CareerFormID", LabelTemp.Text);
        cmd.Parameters.AddWithValue("@career", TextBox1.Text);
        cmd.Parameters.AddWithValue("@Industry", CatalogDll.SelectedValue);
        cmd.Parameters.AddWithValue("@VacancyNumber", TextBox2.Text);
        cmd.Parameters.AddWithValue("@Fulltime", CheckBox1.Checked);
        cmd.Parameters.AddWithValue("@Parttime", CheckBox2.Checked);

        cmd.Parameters.AddWithValue("@OrganiztionName1", TextBox3.Text);
        cmd.Parameters.AddWithValue("@BusinessNature", NatureDll.SelectedValue);
        cmd.Parameters.AddWithValue("@JobDescription", TextBox5.Text);
        cmd.Parameters.AddWithValue("@Salary", TextBox26.Text);
        cmd.Parameters.AddWithValue("@SalaryHour", CheckBox3.Checked);
        cmd.Parameters.AddWithValue("@SalaryDay", CheckBox4.Checked);
        cmd.Parameters.AddWithValue("@SalaryMonth", CheckBox5.Checked);

        cmd.Parameters.AddWithValue("@Requirements", TextBox6.Text);
        cmd.Parameters.AddWithValue("@ApplicationEndDate", TextBox27.Text);  
        cmd.Parameters.AddWithValue("@ApplicationStartDate", TextBox28.Text); 
        cmd.Parameters.AddWithValue("@ApplicationLetter", CheckBox7.Checked);
        cmd.Parameters.AddWithValue("@Resume", CheckBox8.Checked);
        cmd.Parameters.AddWithValue("@IDCopy", CheckBox9.Checked);
        cmd.Parameters.AddWithValue("@Transcript", CheckBox10.Checked);
        cmd.Parameters.AddWithValue("@DrivingLicense", CheckBox11.Checked);
        cmd.Parameters.AddWithValue("@DocsOthers", CheckBox13.Checked);

        cmd.Parameters.AddWithValue("@ApplicationPostTo", TextBox9.Text);
        cmd.Parameters.AddWithValue("@ApplicationEmail", TextBox10.Text);
        cmd.Parameters.AddWithValue("@ApplicationPhone", TextBox11.Text);
        cmd.Parameters.AddWithValue("@ApplicationOthers", TextBox12.Text);
        cmd.Parameters.AddWithValue("@ContactPersonName", TextBox13.Text);
        cmd.Parameters.AddWithValue("@ContactPersonType1", CheckBox18.Checked);
        cmd.Parameters.AddWithValue("@ContactPersonType2", CheckBox19.Checked);
        cmd.Parameters.AddWithValue("@ContactPersonPhone", TextBox14.Text);
        cmd.Parameters.AddWithValue("@ContactPersonEmail", TextBox15.Text);

        cmd.Parameters.AddWithValue("@Professional_Competence_level", DropDownList1.SelectedValue.ToString());
        cmd.Parameters.AddWithValue("@Leadership_level", DropDownList2.SelectedValue.ToString());
        cmd.Parameters.AddWithValue("@Communication_level", DropDownList3.SelectedValue.ToString());
        cmd.Parameters.AddWithValue("@Creativity_level", DropDownList4.SelectedValue.ToString());
        cmd.Parameters.AddWithValue("@Initiative_level", DropDownList5.SelectedValue.ToString());
        cmd.Parameters.AddWithValue("@Self_Development_level", DropDownList6.SelectedValue.ToString());
        cmd.Parameters.AddWithValue("@Social_Responsibility_level", DropDownList7.SelectedValue.ToString());
        cmd.Parameters.AddWithValue("@Language_level", DropDownList8.SelectedValue.ToString());
        cmd.Parameters.AddWithValue("@IT_Application_level", DropDownList9.SelectedValue.ToString());

        cmd.Parameters.AddWithValue("@OrgaName", TextBox16.Text);
        cmd.Parameters.AddWithValue("@OrgaAddress", TextBox17.Text);
        cmd.Parameters.AddWithValue("@OrgaComNum", TextBox18.Text);
        cmd.Parameters.AddWithValue("@OrgaContactPerson", TextBox19.Text);
        cmd.Parameters.AddWithValue("@OrgaPosition", TextBox20.Text);
        cmd.Parameters.AddWithValue("@OrgaTele", TextBox21.Text);
        cmd.Parameters.AddWithValue("@OrgaFax", TextBox22.Text);
        cmd.Parameters.AddWithValue("@OrgaEmail", TextBox23.Text);

        cmd.ExecuteNonQuery();
        Response.Redirect("CareerFormManage.aspx");
    }

    protected void CatalogDll_SelectedIndexChanged(object sender, EventArgs e)
    {
        NatureDll.Items.Clear();
        conn.Open();
        SqlCommand cmd3 = new SqlCommand("select id,JobNatureEN, JobNatureEN+' '+ JobNatureZH as name from CareerJobNature where Industry_ID=@Industry_ID", conn);
        cmd3.Parameters.AddWithValue("@Industry_ID", CatalogDll.SelectedIndex + 1);
        NatureDll.DataSource = cmd3.ExecuteReader();
        NatureDll.DataTextField = "name";
        NatureDll.DataValueField = "JobNatureEN";
        NatureDll.DataBind();
        NatureDll.Items.Insert(0, "-");
        conn.Close();
    }
    protected void TextboxTemp_TextChanged(object sender, EventArgs e)
    {
        CareerTitle.Text = "<br /><br />Form " + TextboxTemp.Text + ": " + TextboxTemp3.Text + "- " + TextboxTemp4.Text + "<br />";
    }
}