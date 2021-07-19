using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class encryption01p : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString3"].ToString());
        conn.Open();
        String checkuser = "select count(*) from testencry where Name='" + TextBox1.Text + "'";
        SqlCommand com = new SqlCommand(checkuser, conn);
        int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
        conn.Close();
        if (temp == 1) //用來確定是否有此人 而且資料庫中的名稱沒有重復
        {
            conn.Open();
            string checkPasswordQuery = "select Password from testencry where Name='" + TextBox1.Text + "'";
            SqlCommand passcomm = new SqlCommand(checkPasswordQuery, conn);
            string password = passcomm.ExecuteScalar().ToString().Replace(" ", "");
            if (password == EncryptPassword(TextBox2.Text))
            {
                //Session["New"] = TextBox1.Text;
                Response.Write("<script>alert(' Login Success! ')</script>");
                //Response.Redirect("User.aspx");
            }
            else
            {
                Response.Write("<script>alert(' Password is Not correct ')</script>");
            }
        }
        else
        {
            Response.Write("<script>alert(' UserName is Not correct ')</script>");
            //Response.Write("UserName is Not correct");
        }

    }

    private string EncryptPassword(string password)
    {
        System.Security.Cryptography.SHA1 sha = System.Security.Cryptography.SHA1.Create();
        string hashed = System.Convert.ToBase64String(sha.ComputeHash(System.Text.UnicodeEncoding.Unicode.GetBytes(password)));
        return hashed.Length > 49 ? hashed.Substring(0, 49) : hashed;

    }


}