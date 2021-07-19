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
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class ImageMultiSaveToDb2p : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    //建立upload method
    protected void uploadMethod(HttpPostedFile file)
    {
        string filename = Path.GetFileName(file.FileName);
        string contentType = file.ContentType;
        int fileSize = file.ContentLength;

        using (Stream fs = file.InputStream)
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
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        HttpFileCollection uploadFilCol = Request.Files;
        Response.Write("<script>alert(uploadFilCol); </script>");
        for (int i = 0; i < uploadFilCol.Count; i++)
        {
            HttpPostedFile file = uploadFilCol[i];
            string fileExt = Path.GetExtension(file.FileName).ToLower();
            string fileName = Path.GetFileName(file.FileName);
            if (fileName != string.Empty)
            {
                try
                {
                    if (fileExt == ".jpg" || fileExt == ".gif" || fileExt == ".bmp" || fileExt == ".jpeg" || fileExt == ".png")
                    {
                        file.SaveAs(Server.MapPath("~/ImageTest/") + fileName);
                        if (i == 0)
                        {
                            //Image1.Visible = true;
                            //Image1.ImageUrl = "~/ImageTest/" + fileName;

                            uploadMethod(FileUpload1.PostedFile);
                        }
                        if (i == 1)
                        {
                            //Image2.Visible = true;
                            //Image2.ImageUrl = "~/ImageTest/" + fileName;

                            uploadMethod(FileUpload2.PostedFile);
                        }
                        if (i == 2)
                        {
                            //Image3.Visible = true;
                            //Image3.ImageUrl = "~/ImageTest/" + fileName;

                            uploadMethod(FileUpload3.PostedFile);
                        }
                        if (i == 3)
                        {
                            //Image4.Visible = true;
                            //Image4.ImageUrl = "~/ImageTest/" + fileName;

                            uploadMethod(FileUpload4.PostedFile);
                        }
                        if (i == 4)
                        {
                            //Image5.Visible = true;
                            //Image5.ImageUrl = "~/ImageTest/" + fileName;

                            uploadMethod(FileUpload5.PostedFile);
                        }
                        if (i == 5)
                        {
                            //Image6.Visible = true;
                            //Image6.ImageUrl = "~/ImageTest/" + fileName;

                            uploadMethod(FileUpload6.PostedFile);
                        }
                    }
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
        }
    }
}