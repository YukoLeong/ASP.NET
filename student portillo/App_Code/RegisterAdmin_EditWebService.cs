using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;

/// <summary>
/// Summary description for RegisterAdmin_EditWebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
[System.ComponentModel.ToolboxItem(false)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class RegisterAdmin_EditWebService : System.Web.Services.WebService {



    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ToString());
    [WebMethod]

    public void SyncData(string data, string careerformid)
    {
        if (data != "" && careerformid != "")
        {
            con.Open();
            StringBuilder sb = new StringBuilder();
            //sb.Append("UPDATE testjs SET jscontroller=@data WHERE ID='1'");
            if (data == "1")
            {
                sb.Append("UPDATE CareerCompanyRegist SET Allow=@data,permitdate=GETDATE() where CompanyID=@CompanyID");
                //sb.Append("UPDATE CareerForm SET canpost=@data,permitdate=GETDATE() where CareerFormID=@CareerFormID");
                SqlCommand cmd = new SqlCommand(sb.ToString(), con);
                cmd.Parameters.AddWithValue("@data", data);
                //cmd.Parameters.AddWithValue("@CareerFormID", 114);

                cmd.Parameters.AddWithValue("@CompanyID", careerformid);
                cmd.ExecuteNonQuery();
            }
            else
            {
                sb.Append("UPDATE CareerCompanyRegist SET Allow=@data,permitdate=null where CompanyID=@CompanyID");
                SqlCommand cmd = new SqlCommand(sb.ToString(), con);
                cmd.Parameters.AddWithValue("@data", data);
                //cmd.Parameters.AddWithValue("@CareerFormID", 114);

                cmd.Parameters.AddWithValue("@CompanyID", careerformid);
                cmd.ExecuteNonQuery();
            }
            con.Close();
        }
    }
    
}
