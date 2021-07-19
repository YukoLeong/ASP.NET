using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MPICP_home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

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

                    if (sdr["Allow"].ToString() != "1")
                    {
                        string message = "Yout account is being valided. Please wait Administrator permit.";
                        System.Text.StringBuilder sb = new System.Text.StringBuilder();
                        sb.Append("<script type = 'text/javascript'>window.onload=function(){alert('");
                        sb.Append(message);
                        sb.Append("')};</script>");
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());

                    }
                    else
                    {
                        if (sdr["CompanyID"] != null)
                        {
                            Session["CompanyID"] = sdr["CompanyID"].ToString();
                        }
                        if (sdr["AccountName"] != null)
                        {
                            Session["LoginName"] = sdr["AccountName"].ToString();
                        }

                        string message = "Login success!.";
                        System.Text.StringBuilder sb = new System.Text.StringBuilder();
                        sb.Append("<script type = 'text/javascript'>window.onload=function(){alert('");
                        sb.Append(message);
                        //server site
                        //sb.Append("')};window.location.href='/ep/MPICP/Recruitment.aspx';</script>");
                        //location site
                        sb.Append("')};window.location.href='/MPICP/RecruitmentMenu.aspx';</script>");
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
                    }


                }
                sdr.Close();
                //TextBox1.Text = (string)Session["CompanyID"];


                //Session["LoginName"] = AccountBox.Text;
                //Response.Write("<script>alert(' Login Success! ')</script>");

                //use this when server
                //Response.Write("<script>alert('Login Success!'); window.location.href='/ep/MPICP/Recruitment.aspx'; </script>");

                

                //Response.Write("<script>alert('Login Success!'); window.location.href='/MPICP/Recruitment.aspx'; </script>");
                //AccountBox.Visible = false;
                //PasswordBox.Visible = false;

            }
            else
            {
                string message = "Password is Not correct!";
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append("<script type = 'text/javascript'>window.onload=function(){alert('");
                sb.Append(message);
                sb.Append("')};</script>");
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());

                //Response.Write("<script>alert(' Password is Not correct! ')</script>");
            }
        }
        else
        {
            string message = "UserName is Not correct!";
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<script type = 'text/javascript'>window.onload=function(){alert('");
            sb.Append(message);
            sb.Append("')};</script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());


            //Response.Write("<script>alert(' UserName is Not correct! ')</script>");
        }
    }

    private string EncryptPassword(string password)
    {
        System.Security.Cryptography.SHA1 sha = System.Security.Cryptography.SHA1.Create();
        string hashed = System.Convert.ToBase64String(sha.ComputeHash(System.Text.UnicodeEncoding.Unicode.GetBytes(password)));
        return hashed.Length > 49 ? hashed.Substring(0, 49) : hashed;
    }

    protected void RegisterButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("RegisterMenu.aspx");
    }
}