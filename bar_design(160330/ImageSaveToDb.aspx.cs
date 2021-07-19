using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//add
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;

//其實pdf doc之類的都可以儲存進db
public partial class ImageSaveToDb : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        String tempType = "";

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString2"].ToString());

        if (FileUpload1.HasFile)
        {
            string fileExtension = System.IO.Path.GetExtension(FileUpload1.FileName);

            //&& fileExtension.ToLower() != ".doc" && fileExtension.ToLower() != ".docx"
            if (fileExtension.ToLower() != ".jpg" && fileExtension.ToLower() != ".bmp" && fileExtension.ToLower() != ".png" )
            {
                Label1.Text = "Only files with .jpg or .bmp or .png extension are allowed";
                Label1.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                //get the file type
                if (fileExtension.ToLower() == ".jpg")
                {
                    tempType = "jpg";
                }
                else if (fileExtension.ToLower() == ".bmp")
                {
                    tempType = "bmp";
                }
                else if (fileExtension.ToLower() == ".png")
                {
                    tempType = "png";
                }
                else
                {
                    tempType = "Unknown";
                }

                int fileSize = FileUpload1.PostedFile.ContentLength;
                if (fileSize > 52428800)
                {
                    Label1.Text = "Maximum file size exceeded";
                    Label1.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    //把圖片存入database方法
                    conn.Open();

                    Stream fs = FileUpload1.PostedFile.InputStream;
                    BinaryReader br = new BinaryReader(fs);
                    Byte[] bytes = br.ReadBytes((Int32)fs.Length);
                    //query = "insert into PDFFiles (Name,type,data)" + " values (@Name, @type, @Data)"; 
                    String filePath = FileUpload1.PostedFile.FileName;
                    String fileName = Path.GetFileName(filePath);

                    SqlCommand cmd = new SqlCommand("insert into testimage(Name,Size,Type,ImageData)" + " values (@Name,@Size,@Type,@ImageData)", conn);

                    cmd.Parameters.AddWithValue("@Name", fileName);
                    cmd.Parameters.AddWithValue("@Size", fileSize);
                    cmd.Parameters.AddWithValue("@Type", tempType);
                    cmd.Parameters.AddWithValue("@ImageData", bytes);

                    cmd.ExecuteNonQuery();

                    Label1.Text = "File Uploaded";
                    Label1.ForeColor = System.Drawing.Color.Green;
                    conn.Close();

                    //把圖片存入路徑方法 和顯示圖片(可能要研究怎樣刪除路徑上的圖片)
                    Image1.Visible = true;
                    FileUpload1.SaveAs(MapPath("~/ImageTest/" + FileUpload1.FileName)); //把圖片存入路徑
                    Image1.ImageUrl = "~/ImageTest/" + FileUpload1.FileName;

                    //把路徑圖片刪除的方法 但即時刪除圖片image1會不能預覧圖片
                    //string FileToDelete;
                    //FileToDelete = Server.MapPath("~/ImageTest/" + FileUpload1.FileName);
                    //File.Delete(FileToDelete);

                }
            }
        }
        else
        {
            Label1.Text = "Please select a file to upload";
            Label1.ForeColor = System.Drawing.Color.Red;
            conn.Close();
        }
    }
}