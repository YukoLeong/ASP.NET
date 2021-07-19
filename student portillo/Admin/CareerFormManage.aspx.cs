using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Text;
using System.Configuration;


public partial class Operator_CFM : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ToString());
        if (!IsPostBack)
        {
            StringBuilder sb = new StringBuilder();
            conn.Open();
            SqlCommand cmd = new SqlCommand("select * from CareerForm" , conn);
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
                    //get the dropdownlist value to temp
                    //sb.Append("<td><select size='1' name='row" + sqr["CareerFormID"].ToString() + "'>");
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


    [System.Web.Services.WebMethod]
    public static void SetSessionValue(string key, string value)
    {
        HttpContext.Current.Session[key] = value;
    }


    protected void UpdateButton_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ToString());
        if (DropdownTemp.Text != "")
        {
            string[] tempArr, tempArr2;
            tempArr = DropdownTemp.Text.Split('&');
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
        Response.Redirect("CareerFormManage.aspx");
    }

    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("home.aspx");
    }
    //protected void HomeButton_Click(object sender, EventArgs e)
    //{
    //    Response.Redirect("home.aspx");
    //}
}