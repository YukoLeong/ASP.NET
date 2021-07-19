using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

//測試NC SELECT TOP 50 [id],[photo] FROM [V63MPI0115].[dbo].[bd_psndoc] where photo is not null
public partial class ImageLoadToDb2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            DropDownList1.DataSource = GetData("SELECT pk_psndoc, name FROM bd_psndoc where photo is not null");
            DropDownList1.DataTextField = "name";
            DropDownList1.DataValueField = "pk_psndoc";
            DropDownList1.DataBind();
        }
    }

    private DataTable GetData(string query)
    {
        DataTable dt = new DataTable();
        string constr = ConfigurationManager.ConnectionStrings["NCConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand(query))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    sda.Fill(dt);
                }
            }
            return dt;
        }
    }

    protected void FetchImage(object sender, EventArgs e)
    {
        string id = DropDownList1.SelectedItem.Value;
        Image1.Visible = id != "0";
        if (id != "0")
        {
            byte[] bytes = (byte[])GetData("SELECT photo FROM bd_psndoc WHERE pk_psndoc ='" + id + "'").Rows[0]["photo"];
            string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
            Image1.ImageUrl = "data:image/png;base64," + base64String;
        }
    }
}