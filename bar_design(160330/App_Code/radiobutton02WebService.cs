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
/// Summary description for radiobutton02WebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
[System.ComponentModel.ToolboxItem(false)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class radiobutton02WebService : System.Web.Services.WebService {

    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ToString());
    [WebMethod]

    public void SyncData(string data)
    {
        if (data != "")
        {
            con.Open();
            StringBuilder sb = new StringBuilder();
            sb.Append("UPDATE testjs SET jscontroller=@data WHERE ID='1'");
            SqlCommand cmd = new SqlCommand(sb.ToString(), con);
            cmd.Parameters.AddWithValue("@data", data);

            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
    
}
