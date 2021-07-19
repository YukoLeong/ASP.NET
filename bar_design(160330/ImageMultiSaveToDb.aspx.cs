using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//add
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

//多重upload進db
public partial class ImageMultiSaveToDb : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.BindGrid();
        }
    }
    private void BindGrid()
    {
        string constr = ConfigurationManager.ConnectionStrings["EPConnectionString2"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT ID, Name FROM testimage";
                cmd.Connection = con;
                con.Open();
                GridView1.DataSource = cmd.ExecuteReader();
                GridView1.DataBind();
                con.Close();
            }
        }
    }
    protected void Upload(object sender, EventArgs e)
    {
        foreach (HttpPostedFile postedFile in FileUpload1.PostedFiles)
        {
            string filename = Path.GetFileName(postedFile.FileName);
            string contentType = postedFile.ContentType;
            int fileSize = postedFile.ContentLength;

            using (Stream fs = postedFile.InputStream)
            {
                using (BinaryReader br = new BinaryReader(fs))
                {
                    byte[] bytes = br.ReadBytes((Int32)fs.Length);
                    string constr = ConfigurationManager.ConnectionStrings["EPConnectionString2"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(constr))
                    {
                        string query = "insert into testimage values (@Name, @Size, @Type, @ImageData)";
                        using (SqlCommand cmd = new SqlCommand(query))
                        {
                            cmd.Connection = con;
                            cmd.Parameters.AddWithValue("@Name", filename);
                            cmd.Parameters.AddWithValue("@Size", fileSize);
                            cmd.Parameters.AddWithValue("@Type", contentType);
                            cmd.Parameters.AddWithValue("@ImageData", bytes);
                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();
                        }
                    }
                }
            }
            //把檔案存進路徑的code
            string fileName = Path.GetFileName(postedFile.FileName);
            postedFile.SaveAs(Server.MapPath("~/ImageTest/") + fileName);
            lblSuccess.Text = string.Format("{0} files have been uploaded successfully.", FileUpload1.PostedFiles.Count);
        }
        BindGrid();
        //Response.Redirect(Request.Url.AbsoluteUri);
    }
}