using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MPICP_Management2 : System.Web.UI.Page
{

    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            //load from information
            SqlCommand cmd = new SqlCommand("select * from CareerCompanyRegist where CompanyID=@CompanyID", conn);
            conn.Open();
            cmd.Parameters.AddWithValue("@CompanyID", Session["CompanyID"]);
            SqlDataReader sdr = cmd.ExecuteReader();
            while (sdr.Read())
            {
                if (Session["CompanyID"].ToString() != null)
                {
                    if (sdr["Email"] != null)
                    {
                        TextBoxEmail1.Text = sdr["Email"].ToString();
                    }
                    if (sdr["Organize"] != null)
                    {
                        TextBox1.Text = sdr["Organize"].ToString();
                    }
                    if (sdr["Organize_en"] != null)
                    {
                        TextBox1en.Text = sdr["Organize_en"].ToString();
                    }
                    if (sdr["Address"] != null)
                    {
                        TextBox2.Text = sdr["Address"].ToString();
                    }
                    if (sdr["Companyppl"] != null)
                    {
                        TextBox4.Text = sdr["Companyppl"].ToString();
                    }
                    if (sdr["Department"] != null)
                    {
                        TextBox5.Text = sdr["Department"].ToString();
                    }
                    if (sdr["Phone"] != null)
                    {
                        TextBox6.Text = sdr["Phone"].ToString();
                    }
                    if (sdr["Allow"].ToString() == "1")
                    {
                        UpdateButton.Visible = false;
                    }
                }
                else
                {
                    

                }
            }
            sdr.Close();
            conn.Close();


        }

    }


  



    protected void BackButton_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("RecruitmentMenu.aspx");
    }


    protected void LogoImageButton_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("home.aspx");
    }

    protected void UpdateButton_Click(object sender, ImageClickEventArgs e)
    {

        //SqlCommand cmd5 = new SqlCommand("update CareerForm set career=@career,Industry=@Industry where CareerFormID=@CareerFormID", conn);
        //conn.Open();
        //cmd5.Parameters.AddWithValue("@CareerFormID", FromIDTemp.Text);
        //cmd5.Parameters.AddWithValue("@career", TextBox2.Text);
        //cmd5.Parameters.AddWithValue("@Industry", CatalogDll.SelectedValue);
        //cmd5.ExecuteNonQuery();

        SqlCommand cmd5 = new SqlCommand("update CareerCompanyRegist set Email=@Email,Organize=@Organize,Organize_en=@Organize_en,Address=@Address,Companyppl=@Companyppl,Department=@Department,Phone=@Phone where CompanyID=@CompanyID", conn);

        conn.Open();
        cmd5.Parameters.AddWithValue("@CompanyID", Session["CompanyID"]);
        cmd5.Parameters.AddWithValue("@Email", TextBoxEmail1.Text);
        cmd5.Parameters.AddWithValue("@Organize", TextBox1.Text);
        cmd5.Parameters.AddWithValue("@Organize_en", TextBox1en.Text);
        cmd5.Parameters.AddWithValue("@Address", TextBox2.Text);
        cmd5.Parameters.AddWithValue("@Companyppl", TextBox4.Text);
        cmd5.Parameters.AddWithValue("@Department", TextBox5.Text);
        cmd5.Parameters.AddWithValue("@Phone", TextBox6.Text);



        cmd5.ExecuteNonQuery();

        //string message = "Update success !";
        //System.Text.StringBuilder sb = new System.Text.StringBuilder();
        //sb.Append("<script type = 'text/javascript'>window.onload=function(){alert('");
        //sb.Append(message);
        //sb.Append("')};window.location.href='/MPICP/Management2.aspx';</script>");
        //ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());


        Response.Write("<script>alert('Update success !'); window.location.href='Management2.aspx'; </script>");
        //Response.Redirect("layout01pppage04.aspx");
        conn.Close();
    }
}