using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MPICP_index : System.Web.UI.Page
{
    string loginname;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["LoginName"] != null)
        {
            AccountBox.Visible = false;
            PasswordBox.Visible = false;
            LoginLabel.Visible = false;
            RegisterLabel.Visible = false;
            NameLabel.Text = "Welcome back " + (string)Session["LoginName"];
            LogoutButton.Visible = true;
            LogoutButton.Text = "Log out";
        }
        else
        {
            AccountBox.Visible = true;
            PasswordBox.Visible = true;
            LoginLabel.Visible = true;
            RegisterLabel.Visible = true;
            NameLabel.Text = "";
            LogoutButton.Visible = false;
            LogoutButton.Text = "";
        }
    }


    protected void LoginButton_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ConnectionString);
        conn.Open();
        String checkuser = "select count(*) from CareerCompanyRegist where AccountName='" + AccountBox.Text + "'";
        SqlCommand com = new SqlCommand(checkuser, conn);
        int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
        conn.Close();
        if (temp == 1) //用來確定是否有此人 而且資料庫中的名稱沒有重復
        {
            conn.Open();
            string checkPasswordQuery = "select Password from CareerCompanyRegist where AccountName='" + AccountBox.Text + "'";
            SqlCommand passcomm = new SqlCommand(checkPasswordQuery, conn);
            string password = passcomm.ExecuteScalar().ToString().Replace(" ", "");
            if (password == EncryptPassword(PasswordBox.Text))
            {
                //get data form login name
                SqlCommand cmd = new SqlCommand("select * from CareerCompanyRegist where AccountName=@AccountName", conn);
                cmd.Parameters.AddWithValue("@AccountName", AccountBox.Text);
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    if (sdr["CompanyID"] != null)
                    {
                        Session["CompanyID"] = sdr["CompanyID"].ToString();
                    }
                    if (sdr["AccountName"] != null)
                    {
                        Session["LoginName"] = sdr["AccountName"].ToString();
                    }

                }
                sdr.Close();
                //TextBox1.Text = (string)Session["CompanyID"];


                //Session["LoginName"] = AccountBox.Text;
                Response.Write("<script>alert(' Login Success! ')</script>");
                AccountBox.Visible = false;
                PasswordBox.Visible = false;
                LoginLabel.Visible = false;
                RegisterLabel.Visible = false;
                NameLabel.Text = "Welcome back " + (string)Session["LoginName"];
                LogoutButton.Visible = true;
                LogoutButton.Text = "Log out";

            }
            else
            {
                Response.Write("<script>alert(' Password is Not correct! ')</script>");
            }
        }
        else
        {
            Response.Write("<script>alert(' UserName is Not correct! ')</script>");
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        if (Session["LoginName"] != null)
        {
            Response.Redirect("Recruitment.aspx");
        }
        else
        {
            Response.Write("<script>alert(' You need to login in! ')</script>");
        }
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        if (Session["LoginName"] != null)
        {
            Response.Redirect("Management.aspx");
        }
        else
        {
            Response.Write("<script>alert(' You need to login in! ')</script>");
        }
    }


    protected void LogoutButton_Click(object sender, EventArgs e)
    {
        Session["LoginName"] = null;
        Response.Redirect("index.aspx");
    }

    private string EncryptPassword(string password)
    {
        System.Security.Cryptography.SHA1 sha = System.Security.Cryptography.SHA1.Create();
        string hashed = System.Convert.ToBase64String(sha.ComputeHash(System.Text.UnicodeEncoding.Unicode.GetBytes(password)));
        return hashed.Length > 49 ? hashed.Substring(0, 49) : hashed;
    }

}