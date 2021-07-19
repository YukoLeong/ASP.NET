using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Student_EditComments : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
         if (!IsPostBack) {
             if (Session["std_id"] != null)
             {
                 txt_StdID.Text = Session["std_id"].ToString();

                 getStdNameByID(Session["std_id"].ToString());
                 txt_comments.Text = Session["rmessage"].ToString();

                 Session["commentsID"].ToString();


                 //txt_ClassCode.Text=  Session["rlbClassCode"].ToString(); 
                 Session["rlblSender"].ToString();
                 Session["rlblPostDate"].ToString();
             }
          }
    }
    protected void btn_home_Click(object sender, EventArgs e)
    {
        Response.Redirect("home.aspx");
    }

    private void getStdNameByID(string id)
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * FROM ep_class_grade where STUDENT_ID=@sID", con);

            cmd.Parameters.AddWithValue("@sID", id);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);



            SqlDataReader rdr1 = null;
            rdr1 = cmd.ExecuteReader();

            while (rdr1.Read())
                if (rdr1["NAME"] != null)
                {
                    txt_StdName.Text = rdr1["NAME"].ToString();

                }


            rdr1.Close();
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
                "set message=@message, postDate=@postDate "+
                "where id =@id", con);

            cmd.Parameters.AddWithValue("@id", Session["commentsID"].ToString());
            cmd.Parameters.AddWithValue("@message", txt_comments.Text);
            cmd.Parameters.AddWithValue("@postDate", DateTime.Now);
          
         

            cmd.ExecuteNonQuery();
            btn_update.Enabled = false;

         
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            
        }
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