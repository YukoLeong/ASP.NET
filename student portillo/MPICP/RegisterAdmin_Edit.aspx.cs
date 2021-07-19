using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MPICP_RegisterAdmin_Edit : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FromIDTemp.Text = Session["EditCompanyID"].ToString();
            ViewPDFButton.Visible = false;

            //js radiobutton
            StringBuilder sb = new StringBuilder();
            conn.Open();
            SqlCommand radiocmd = new SqlCommand("select Allow from CareerCompanyRegist where CompanyID=@CompanyID", conn);
            radiocmd.Parameters.AddWithValue("@CompanyID", FromIDTemp.Text);
            SqlDataReader sqr = radiocmd.ExecuteReader();
            while (sqr.Read())
            {
                if (sqr["Allow"].ToString() == "1")
                {
                    sb.Append("<input type='radio' name='rdo' id='yes' checked />");
                    sb.Append("<input type='radio' name='rdo' id='no' />");
                    radioTextBox1.Text = "1";
                }
                else
                {
                    sb.Append("<input type='radio' name='rdo' id='yes' />");
                    sb.Append("<input type='radio' name='rdo' id='no' checked/>");
                    radioTextBox1.Text = "0";
                }
            }
            Literal1.Text = sb.ToString();
            sqr.Close();
            conn.Close();

            //load from information
            SqlCommand cmd = new SqlCommand("select * from CareerCompanyRegist where CompanyID=@CompanyID", conn);
            conn.Open();
            cmd.Parameters.AddWithValue("@CompanyID", FromIDTemp.Text);
            SqlDataReader sdr = cmd.ExecuteReader();
            while (sdr.Read())
            {
                //panel1 context
                if (sdr["CompanyID"].ToString() != "")
                {
                    Panel1.Visible = true;
                    //UpdateButton.Visible = false;  //close the update function in manage view temporarily
                    if (sdr["UpFile"].ToString() != "")
                    {
                        ViewPDFButton.Visible = true;
                    }
                    if (sdr["Email"] != null)
                    {
                        TextBoxEmail1.Text = sdr["Email"].ToString();
                    }
                    if (sdr["Organize"] != null)
                    {
                        TextBox1.Text = sdr["Organize"].ToString();
                    }
                    if (sdr["Address"] != null)
                    {
                        TextBox2.Text = sdr["Address"].ToString();
                    }
                    if (sdr["CompanyNum"] != null)
                    {
                        TextBox3.Text = sdr["CompanyNum"].ToString();
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

                    //sdr.Close();
                }
             
            }
            sdr.Close();
            conn.Close();

        }

    }

    protected void BackButton_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("RegisterAdmin.aspx");
    }


}