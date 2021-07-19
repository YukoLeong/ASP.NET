using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login01 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ConnectionString);
            conn.Open();
            //查此人是否已存在
            String checkuser = "select count(*) from CareerCompanyRegist where AccountName='" + TextBoxID.Text + "'";
            SqlCommand com = new SqlCommand(checkuser, conn);
            int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
            if (temp > 0)
            {
                Response.Write("<script>alert(' User already Exists! ')</script>");
                conn.Close();
            }
            else
            {
                if (CheckBox1.Checked == false)
                {
                    Response.Write("<script>alert(' You have to accept the privacy policy! ')</script>");
                    conn.Close();
                }
                else if ((Session["ValidNums"].ToString() != this.entervalid.Text.Trim()))
                {
                    Response.Write("<script>alert(' You have to input correct valid number! ')</script>");
                    conn.Close();
                }
                else
                {
                    string insertQuery = "insert into CareerCompanyRegist(AccountName,PD,Email,Organize,Address,CompanyNum,Companyppl,Department,Phone,Allow) values (@AccountName,@PD,@Email,@Organize,@Address,@CompanyNum,@Companyppl,@Department,@Phone,@Allow)";
                    SqlCommand com2 = new SqlCommand(insertQuery, conn);
                    com2.Parameters.AddWithValue("@AccountName", TextBoxID.Text);
                    com2.Parameters.AddWithValue("@PD", TextBoxPassword1.Text);
                    com2.Parameters.AddWithValue("@Email", TextBoxEmail1.Text);
                    com2.Parameters.AddWithValue("@Organize", TextBox1.Text);
                    com2.Parameters.AddWithValue("@Address", TextBox2.Text);
                    com2.Parameters.AddWithValue("@CompanyNum", TextBox3.Text);
                    com2.Parameters.AddWithValue("@Companyppl", TextBox4.Text);
                    com2.Parameters.AddWithValue("@Department", TextBox5.Text);
                    com2.Parameters.AddWithValue("@Phone", TextBox6.Text);
                    com2.Parameters.AddWithValue("@Allow", "0");

                    com2.ExecuteNonQuery();
                    // 成功之後跳去另一個版面

                    Response.Write("<script>alert(' Regist Success! ')</script>");
                    //Response.Redirect("layout01pp.aspx");
                    conn.Close();

                    TextBoxID.Text="";
                    TextBoxPassword1.Text = "";
                    TextBoxPassword2.Text = "";
                    TextBoxEmail1.Text = "";
                    TextBoxEmail2.Text = "";
                    TextBox1.Text = "";
                    TextBox2.Text = "";
                    TextBox3.Text = "";
                    TextBox4.Text = "";
                    TextBox5.Text = "";
                    TextBox6.Text = "";
                    entervalid.Text = "";
                }
            }
        }
        catch (Exception ex)
        {
            Response.Write("Error:" + ex.ToString());
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("layout01pp.aspx");

    }

    //protected void ValidButton_Click(object sender, EventArgs e)
    //{
    //    if (Session["ValidNums"].ToString() != this.entervalid.Text.Trim())
    //    {
    //        Response.Write("fail");
    //    }
    //    else
    //    {
    //        //Response.Write("<script> alert('Verification code input errors!');window.location.href='#bbox'; </script>");
    //        Response.Write("success");
    //    }
    //}
    protected void LogoImageButton_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("layout01pp.aspx");
    }


}