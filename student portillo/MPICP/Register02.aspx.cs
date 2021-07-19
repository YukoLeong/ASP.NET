using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MPICP_Register02 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            String tempType = "";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ConnectionString);
            conn.Open();
            //查此人是否已存在
            String checkuser = "select count(*) from CareerCompanyRegist where AccountName='" + TextBoxID.Text + "'";
            SqlCommand com = new SqlCommand(checkuser, conn);
            int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
            if (temp > 0)
            {
                Response.Write("<script>alert(' User already Exists! ')</script>");
                conn.Close();
            }
            else
            {
                if (CheckBox1.Checked == false)
                {
                    Response.Write("<script>alert(' You have to accept the privacy policy! ')</script>");
                    conn.Close();
                }
                //else if ((Session["ValidNums"].ToString() != this.entervalid.Text.Trim()))
                //{
                //    Response.Write("<script>alert(' You have to input correct valid number! ')</script>");
                //    conn.Close();
                //}
                else
                {

                    // FileUpload part
                    if (FileUpload1.HasFile)
                    {
                        string fileExtension = System.IO.Path.GetExtension(FileUpload1.FileName);

                        if (fileExtension.ToLower() != ".pdf" && fileExtension.ToLower() != ".jpg")
                        {
                            RecruitLabel.Text = "Only files with .jpg .pdf extension are allowed";
                            RecruitLabel.ForeColor = System.Drawing.Color.Red;

                        }
                        else
                        {
                            //get the file type
                            if (fileExtension.ToLower() == ".doc")
                            {
                                tempType = "doc";
                            }
                            else if (fileExtension.ToLower() == ".docx")
                            {
                                tempType = "docx";
                            }
                            else if (fileExtension.ToLower() == ".pdf")
                            {
                                tempType = "pdf";
                            }
                            else if (fileExtension.ToLower() == ".jpg")
                            {
                                tempType = "jpg";
                            }
                            else
                            {
                                tempType = "Unknown";
                            }

                            int fileSize = FileUpload1.PostedFile.ContentLength;
                            if (fileSize > 52428800)
                            {
                                RecruitLabel.Text = "Maximum file size exceeded";
                                RecruitLabel.ForeColor = System.Drawing.Color.Red;
                            }
                            else
                            {
                                //MPI server location
                                //FileUpload1.SaveAs(Server.MapPath("~/images/upload/" + FileUpload1.FileName));
                                //local test location
                                FileUpload1.SaveAs(Server.MapPath("fileuploadtest/" + FileUpload1.FileName));


                                Stream fs = FileUpload1.PostedFile.InputStream;
                                BinaryReader br = new BinaryReader(fs);
                                Byte[] bytes = br.ReadBytes((Int32)fs.Length);
                                //query = "insert into PDFFiles (Name,type,data)" + " values (@Name, @type, @Data)"; 

                                String filePath = FileUpload1.PostedFile.FileName;
                                String fileName = Path.GetFileName(filePath);


                                string insertQuery = "insert into CareerCompanyRegist(UpFileName,UpFile,UpFileType,AccountName,Password,Email,Organize,Organize_en,Address,Companyppl,Department,Phone,Allow,ts) values (@UpFileName,@UpFile,@UpFileType,@AccountName,@Password,@Email,@Organize,@Organize_en,@Address,@Companyppl,@Department,@Phone,@Allow,GETDATE())";
                                SqlCommand com2 = new SqlCommand(insertQuery, conn);
                                com2.Parameters.AddWithValue("@AccountName", TextBoxID.Text);
                                com2.Parameters.AddWithValue("@Password", EncryptPassword(TextBoxPassword1.Text));
                                com2.Parameters.AddWithValue("@Email", TextBoxEmail1.Text);
                                com2.Parameters.AddWithValue("@Organize", TextBox1.Text);
                                com2.Parameters.AddWithValue("@Organize_en", TextBox1en.Text);
                                com2.Parameters.AddWithValue("@Address", TextBox2.Text);
                                //com2.Parameters.AddWithValue("@CompanyNum", TextBox3.Text);
                                com2.Parameters.AddWithValue("@Companyppl", TextBox4.Text);
                                com2.Parameters.AddWithValue("@Department", TextBox5.Text);
                                com2.Parameters.AddWithValue("@Phone", TextBox6.Text);
                                com2.Parameters.AddWithValue("@Allow", "0");
                                com2.Parameters.AddWithValue("@UpFileName", fileName);
                                com2.Parameters.AddWithValue("@UpFile", bytes);
                                com2.Parameters.AddWithValue("@UpFileType", tempType);


                                //手動修改上傳檔案
                                //string insertQuery = "update CareerCompanyRegist SET UpFile=@UpFile,UpFileName=@UpFileName,UpFileType=@UpFileType WHERE CompanyID='1'";
                                //SqlCommand com2 = new SqlCommand(insertQuery, conn);
                                //com2.Parameters.AddWithValue("@UpFileName", fileName);
                                //com2.Parameters.AddWithValue("@UpFile", bytes);
                                //com2.Parameters.AddWithValue("@UpFileType", tempType);


                                com2.ExecuteNonQuery();
                                // 成功之後跳去另一個版面

                                Response.Write("<script>alert(' Regist Success! ')</script>");
                                //Response.Redirect("layout01pp.aspx");
                                conn.Close();

                                TextBoxID.Text = "";
                                TextBoxPassword1.Text = "";
                                TextBoxPassword2.Text = "";
                                TextBoxEmail1.Text = "";
                                TextBoxEmail2.Text = "";
                                TextBox1.Text = "";
                                TextBox2.Text = "";
                                //TextBox3.Text = "";
                                TextBox4.Text = "";
                                TextBox5.Text = "";
                                TextBox6.Text = "";
                                //entervalid.Text = "";



                            }

                        }

                    }
                    else
                    {


                        string insertQuery = "insert into CareerCompanyRegist(AccountName,Password,Email,Organize,Organize_en,Address,Companyppl,Department,Phone,Allow,ts) values (@AccountName,@Password,@Email,@Organize,@Organize_en,@Address,@Companyppl,@Department,@Phone,@Allow,GETDATE())";
                        SqlCommand com2 = new SqlCommand(insertQuery, conn);
                        com2.Parameters.AddWithValue("@AccountName", TextBoxID.Text);
                        com2.Parameters.AddWithValue("@Password", EncryptPassword(TextBoxPassword1.Text));
                        com2.Parameters.AddWithValue("@Email", TextBoxEmail1.Text);
                        com2.Parameters.AddWithValue("@Organize", TextBox1.Text);
                        com2.Parameters.AddWithValue("@Organize_en", TextBox1en.Text);
                        com2.Parameters.AddWithValue("@Address", TextBox2.Text);
                        //com2.Parameters.AddWithValue("@CompanyNum", TextBox3.Text);
                        com2.Parameters.AddWithValue("@Companyppl", TextBox4.Text);
                        com2.Parameters.AddWithValue("@Department", TextBox5.Text);
                        com2.Parameters.AddWithValue("@Phone", TextBox6.Text);
                        com2.Parameters.AddWithValue("@Allow", "0");

                        com2.ExecuteNonQuery();
                        // 成功之後跳去另一個版面

                        Response.Write("<script>alert(' Regist Success! ')</script>");
                        //Response.Redirect("layout01pp.aspx");
                        conn.Close();

                        TextBoxID.Text = "";
                        TextBoxPassword1.Text = "";
                        TextBoxPassword2.Text = "";
                        TextBoxEmail1.Text = "";
                        TextBoxEmail2.Text = "";
                        TextBox1.Text = "";
                        TextBox2.Text = "";
                        //TextBox3.Text = "";
                        TextBox4.Text = "";
                        TextBox5.Text = "";
                        TextBox6.Text = "";
                        //entervalid.Text = "";


                    }
                }
            }
        }
        catch (Exception ex)
        {
            Response.Write("Error:" + ex.ToString());
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("RegisterMenu.aspx");

    }

    //protected void ValidButton_Click(object sender, EventArgs e)
    //{
    //    if (Session["ValidNums"].ToString() != this.entervalid.Text.Trim())
    //    {
    //        Response.Write("fail");
    //    }
    //    else
    //    {
    //        //Response.Write("<script> alert('Verification code input errors!');window.location.href='#bbox'; </script>");
    //        Response.Write("success");
    //    }
    //}
    protected void LogoImageButton_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("home.aspx");
    }

    private string EncryptPassword(string password)
    {
        System.Security.Cryptography.SHA1 sha = System.Security.Cryptography.SHA1.Create();
        string hashed = System.Convert.ToBase64String(sha.ComputeHash(System.Text.UnicodeEncoding.Unicode.GetBytes(password)));
        return hashed.Length > 49 ? hashed.Substring(0, 49) : hashed;
    }


}