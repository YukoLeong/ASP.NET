using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;


public partial class Teacher_EditComments : System.Web.UI.Page
{

    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["CODE"] != null)
            {
               
                txt_CODE.Text = Session["CODE"].ToString();

                txt_TechName.Text = Session["rlblSender"].ToString();
                txt_comments.Text = Session["rmessage"].ToString();
                Session["advisory_history"] = "false";
               // Session["commentsID"].ToString();


                //txt_ClassCode.Text=  Session["rlbClassCode"].ToString(); 
               
                //Session["rlblPostDate"].ToString();
            }
        }
    }
    protected void btn_home_Click(object sender, EventArgs e)
    {
        Response.Redirect("home.aspx");
    }

   
    protected void btn_back_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdvisoryDetails.aspx");
    }

    protected void btn_update_Click(object sender, EventArgs e)
    {
        try
        {

            con.Open();
            SqlCommand cmd = new SqlCommand("UPDATE AdvisoryDetails " +
                "set message=@message, postDate=@postDate " +
                "where id =@id", con);


            string id = Session["commentsID"].ToString();
            cmd.Parameters.AddWithValue("@id", id);
            cmd.Parameters.AddWithValue("@message", txt_comments.Text);
            cmd.Parameters.AddWithValue("@postDate", DateTime.Now);



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
        btn_update.Enabled = false;
        Response.Redirect("AdvisoryDetails.aspx");
    }



    protected void btn_delete_Click(object sender, EventArgs e)
    {
        try
        {

            con.Open();
            SqlCommand cmd = new SqlCommand("delete from  AdvisoryDetails " +
                "where id =@id", con);

            cmd.Parameters.AddWithValue("@id", Session["commentsID"].ToString());




            cmd.ExecuteNonQuery();
            btn_back.Enabled = false;

            Response.Redirect("AdvisoryDetails.aspx");
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            //getCommentsByID(Session["id"].ToString());
        }
    }
}