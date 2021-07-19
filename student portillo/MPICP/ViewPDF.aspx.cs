using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MPICP_ViewPDF : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = Session["CompanyFormID"].ToString();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ToString());
        SqlCommand cmd = new SqlCommand("select * from CareerForm where CareerFormID=@CareerFormID", conn);
        conn.Open();
        cmd.Parameters.AddWithValue("@CareerFormID", Label1.Text);
        SqlDataReader sdr = cmd.ExecuteReader();
        while (sdr.Read())
        {
            if (sdr["UpFileName"] != null)
            {
                FilenameTemp.Text = sdr["UpFileName"].ToString();
            }
            if (sdr["UpFileType"].ToString() == "pdf")
            {
                //MPI server location
                //string FilePath = Server.MapPath("~\\images\\upload\\" + FilenameTemp.Text);
                //local test location
                string FilePath = Server.MapPath("fileuploadtest\\" + FilenameTemp.Text);
                Response.Clear();
                Response.ContentType = "application/pdf";
                Response.AddHeader("Content-disposition", "inline;filename=" + FilenameTemp.Text);
                Response.WriteFile(FilePath);
                Response.End();
            }
            else if (sdr["UpFileType"].ToString() == "jpg")
            {
                string FilePath = Server.MapPath("fileuploadtest\\" + FilenameTemp.Text);
                Response.Clear();
                Response.ContentType = "application/jpg";
                Response.AddHeader("Content-disposition", "inline;filename=" + FilenameTemp.Text);
                Response.WriteFile(FilePath);
                Response.End();
            }

        }

        //MPI server location
        //string FilePath = Server.MapPath("~\\images\\upload\\" + FilenameTemp.Text);
        //local test location

        //string FilePath = Server.MapPath("fileuploadtest\\" + FilenameTemp.Text);


        //Response.Clear();
        //Response.ContentType = "application/pdf";
        //Response.AddHeader("Content-disposition", "inline;filename=" + FilenameTemp.Text);
        //Response.WriteFile(FilePath);
        //Response.End();
    }
}