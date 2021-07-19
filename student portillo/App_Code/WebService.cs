using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;

/// <summary>
/// Summary description for WebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class WebService : System.Web.Services.WebService
{

    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ToString());

    public WebService()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }


    [WebMethod]
    [ScriptMethod(UseHttpGet = true, ResponseFormat = ResponseFormat.Json)]
    public void saveCustomSettings(string data)
    {
        JavaScriptSerializer json = new JavaScriptSerializer();

        List<ImgName> mystring = json.Deserialize<List<ImgName>>(data);

        int size = mystring.Count();
       
        
        try
        {
            foreach (var item in mystring)
            {
                string img = item.imgName.ToString();

                if (img != "" && item.pess_cod != "")
                {
                    if (!existImgName(img, item.pess_cod))
                    {
                        con.Open();

                        StringBuilder sb = new StringBuilder();
                        sb.Append("insert into CustomSettings (pess_cod, imgName, imgID) ");
                        //sb.Append("VALUES (@std_id, @imgName ); ");
                        sb.Append("select @pess_cod, imgName, id from ImageInfo ");
                        sb.Append("where imgName=@imgName; ");

                        SqlCommand cmd = new SqlCommand(sb.ToString(), con);
                        cmd.Parameters.AddWithValue("@pess_cod", item.pess_cod);
                        cmd.Parameters.AddWithValue("@imgName", img);


                        cmd.ExecuteNonQuery();
                    }
                    //else
                    //{
                    //    con.Open();
                    //    StringBuilder sb = new StringBuilder();
                    //    sb.Append("update CustomSettings ");
                    //    sb.Append("set  tabID=@tabID ");
                    //    sb.Append("where stdID=@stdID and imgName = @imgName; ");

                    //    SqlCommand cmd = new SqlCommand(sb.ToString(), con);
                    //    cmd.Parameters.AddWithValue("@stdID", stdID);
                    //    cmd.Parameters.AddWithValue("@imgName", imgName);


                    //    cmd.ExecuteNonQuery();
                    //}
                }
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
        }
       
    }

    [WebMethod]
    [ScriptMethod(UseHttpGet = true, ResponseFormat = ResponseFormat.Json)]
    public void cleanSettings(string pess_cod)
    {
        try
        {
            con.Open();
            StringBuilder sb = new StringBuilder();
            sb.Append("delete from CustomSettings ");
            sb.Append("where pess_cod =@pess_cod");

            SqlCommand cmd = new SqlCommand(sb.ToString(), con);
            cmd.Parameters.AddWithValue("@pess_cod", pess_cod);

            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
        }
    }


    private Boolean existImgName(string imgName, string pess_cod)
    {
        try
        {
          
            StringBuilder sb = new StringBuilder();
            sb.Append("select * from CustomSettings ");
            sb.Append("where imgName =@imgName  and pess_cod=@pess_cod");

            SqlCommand cmd = new SqlCommand(sb.ToString(), con);

            cmd.Parameters.AddWithValue("@pess_cod", pess_cod);
            cmd.Parameters.AddWithValue("@imgName", imgName);


            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
                return true;            

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
        }
        return false;
    }

    [WebMethod]
    [ScriptMethod(UseHttpGet = true, ResponseFormat = ResponseFormat.Json)]
    public void saveFavIconSize(string pess_cod, string size)
    {
        try
        {
            con.Open();

            StringBuilder sb = new StringBuilder();
            sb.Append("update  DefaultFavourite ");

            sb.Append("set icon_size =@size ");
            sb.Append("where pess_cod=@code; ");

            SqlCommand cmd = new SqlCommand(sb.ToString(), con);
            cmd.Parameters.AddWithValue("@code", pess_cod);
            cmd.Parameters.AddWithValue("@size", size);


            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
        }
    }





    public class ImgName
    {
        public string imgName { get; set; }
        public string pess_cod { get; set; }
    }
}
