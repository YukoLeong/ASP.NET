using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class encryption01 : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString3"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("insert testencry values(@Name,@Password)", conn);
        conn.Open();
        cmd.Parameters.AddWithValue("Name", TextBox1.Text);
        //cmd.Parameters.AddWithValue("@Encrypt", TextBox2.Text);
        cmd.Parameters.AddWithValue("@Password", EncryptPassword(TextBox2.Text));
        cmd.ExecuteNonQuery();
        Response.Write("<script>alert(' You are sumbit the page! ')</script>");
    }

    private string EncryptPassword(string password)
    {
        System.Security.Cryptography.SHA1 sha = System.Security.Cryptography.SHA1.Create();
        string hashed = System.Convert.ToBase64String(sha.ComputeHash(System.Text.UnicodeEncoding.Unicode.GetBytes(password)));
        return hashed.Length > 49 ? hashed.Substring(0, 49) : hashed;
    }

}