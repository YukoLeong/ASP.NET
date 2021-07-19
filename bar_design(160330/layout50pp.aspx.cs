using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class layout50pp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //try
        //{
        //    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        //    conn.Open();
        //    //查此人是否已存在
        //    String checkuser = "select count(*) from test01 where UserName='" + TextBox1.Text + "'";
        //    SqlCommand com = new SqlCommand(checkuser, conn);
        //    int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
        //    if (temp > 0)
        //    {
        //        Response.Write("User already Exists");
        //        conn.Close();
        //    }
        //    else
        //    {
        //        string insertQuery = "insert into test01(UserName,Email,Password,Country) values (@Uname,@email,@password,@country)";
        //        SqlCommand com2 = new SqlCommand(insertQuery, conn);
        //        com2.Parameters.AddWithValue("@Uname", TextBox1.Text);
        //        com2.Parameters.AddWithValue("@email", TextBox2.Text);
        //        com2.Parameters.AddWithValue("@password", TextBox3.Text);
        //        com2.Parameters.AddWithValue("@country", DropDownList1.SelectedItem.ToString());
        //        com2.ExecuteNonQuery();
        //        // 成功之後跳去另一個版面
        //        Response.Redirect("Manager.aspx");
        //        conn.Close();
        //    }
        //}
        //catch (Exception ex)
        //{
        //    Response.Write("Error:" + ex.ToString());
        //}
 
       

    }
}