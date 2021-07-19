using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Preview : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        //try
        //{
        //    con.Open();

        //    SqlCommand cmd = new SqlCommand("select * from Notice where isPost=1", con);
            
        //    SqlDataReader sdr = cmd.ExecuteReader();
        //    if (sdr.Read())
        //    {
        //        lit_notice.Text = sdr["notice"].ToString();
        //    }

        //}
        //catch(Exception ex){
        //    throw ex;
        //}
        //finally{
        //    con.Close();
        //}

        if (Session["pre_text"] != null)
        {
            lit_notice.Text = Session["pre_text"].ToString();
        }
        else if (Session["pre_text_edit"]!=null)
        {
            lit_notice.Text = Session["pre_text_edit"].ToString();
        }


    }
    protected void btn_back_Click(object sender, EventArgs e)
    {
        Response.Redirect("ManageNotice.aspx");
    }

    protected void btn_save_Click(object sender, EventArgs e)
    {
        try
        {
            if (Session["ID"] != null )
            {

                SqlCommand cmd = null;

                con.Open();
                cmd = new SqlCommand("INSERT INTO Notice (notice, user_name, post_date, ispost) " +
                    "VALUES (@txt, @username, @postdate, @ispost)", con);

                if (Session["pre_text_edit"]!=null)
                    cmd.Parameters.AddWithValue("@txt", Session["pre_text_edit"].ToString());
                else
                    if (Session["pre_text"]!=null)
                cmd.Parameters.AddWithValue("@txt", Session["pre_text"].ToString());


                cmd.Parameters.AddWithValue("@username", Session["ID"].ToString());
                cmd.Parameters.AddWithValue("@postdate", DateTime.Now);
                cmd.Parameters.AddWithValue("@ispost", false);

                cmd.ExecuteNonQuery();

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
        Response.Redirect("ManageNotice.aspx");
    }
}