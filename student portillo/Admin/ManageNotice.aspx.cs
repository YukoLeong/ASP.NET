using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ManageNotice : System.Web.UI.Page
{

    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            if (Session["Role_Type"] != null)
            {
                loadData();

                if (Session["pre_text"] != null)
                    editor1.Text = Session["pre_text"].ToString();
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please login!'); window.location='../staff.aspx';", true);
            }
        }

    }

    private void loadData()
    {
        try
        {
            con.Open();

            SqlCommand cmd = new SqlCommand("select * from Notice order by post_date desc", con);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);

            GridView1.DataSource = ds;
            GridView1.DataBind();


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
        Response.Redirect("home.aspx");
    }
    protected void btn_post_Click(object sender, EventArgs e)
    {
        try
        {
          
            SqlCommand cmd = null;
            
            con.Open();
            cmd = new SqlCommand("INSERT INTO Notice (notice, user_name, post_date, ispost) " +
                "VALUES (@txt, @username, @postdate, @ispost)", con);

            cmd.Parameters.AddWithValue("@txt", editor1.Text);
            cmd.Parameters.AddWithValue("@username", Session["ID"].ToString());
            cmd.Parameters.AddWithValue("@postdate", DateTime.Now);
            cmd.Parameters.AddWithValue("@ispost", false);          
           

            cmd.ExecuteNonQuery();
			
			editor1.Text="";
        }
        catch(Exception ex){
            throw ex;
        }
        finally
        {
            con.Close();
            loadData();
        }
    }


    protected void lnkEdit_Click(object sender, EventArgs e)
    {

        LinkButton lnk = sender as LinkButton;
        GridViewRow gr = (GridViewRow)lnk.NamingContainer;
        string tempID = GridView1.DataKeys[gr.RowIndex].Value.ToString();
        
        try
        {
           
            con.Open();

            SqlCommand cmd = new SqlCommand("select * from Notice where id = @id", con);

            cmd.Parameters.AddWithValue("@id", tempID);

            SqlDataReader rdr1 = null;
            rdr1 = cmd.ExecuteReader();

            while (rdr1.Read())
                if (rdr1["id"] != null)
                {
                    txt_id.Text = rdr1["id"].ToString();
                    txt_content.Text = rdr1["notice"].ToString();
                    txt_postUser.Text=rdr1["user_name"].ToString();
                    txt_postDate.Text = rdr1["post_date"].ToString();

                    string s = rdr1["ispost"].ToString();

                    if (rdr1["ispost"].ToString()=="True")
                        chkPost.Checked = true;
                    else
                        chkPost.Checked = false;
                } 


            rdr1.Close();
           // ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "document.getElementById('add_link').style.display = 'none';", true);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "document.getElementById('lb_add_link').style.display = 'none';", true);

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
        }

        //GridView1.Visible = false;
        editPanel.Visible = true;
        postPanel.Visible = false;
    }


    protected void cleanPost(Object sender, EventArgs e)
    {
        try {
            con.Open();
            SqlCommand cmd = null;

            
            cmd = new SqlCommand("UPDATE Notice set ispost=@ispost ", con);    

            cmd.Parameters.AddWithValue("@ispost", false);

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
    protected void btn_canel_Click(object sender, EventArgs e)
    {
        editPanel.Visible = false;
        postPanel.Visible = true;
    }


    protected bool chkExistPost()
    {
        try
        {
            con.Open();

            SqlCommand cmd = new SqlCommand("select count(*) from Notice", con);


            // cmd.Parameters.AddWithValue("@teacher_code","" );
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

    protected void btn_save_Click(object sender, EventArgs e)
    {
        try
        {
            if (Session["ID"] != null)
            {
                
                con.Open();

                SqlCommand cmd = new SqlCommand("UPDATE Notice SET notice=@notice, user_name=@user_name, post_date=@p_date, ispost=@ispost " +

                     "where id=@id; ", con);

                cmd.Parameters.AddWithValue("@id", txt_id.Text);
                cmd.Parameters.AddWithValue("@notice", txt_content.Text);
                cmd.Parameters.AddWithValue("@user_name", Session["ID"].ToString());
                cmd.Parameters.AddWithValue("@p_date", DateTime.Now);

                if (chkPost.Checked)

                    cmd.Parameters.AddWithValue("@ispost", true);

                else
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
            editPanel.Visible = false;
            postPanel.Visible = true;
            loadData();
        }
    }
    protected void btn_preview_Click(object sender, EventArgs e)
    {
        Session["pre_text"] = editor1.Text;
        Response.Redirect("Preview.aspx");
    }

    protected void btn_preview2_Click(object sender, EventArgs e)
    {

        Session["pre_text_edit"] = txt_content.Text;
        Session["pre_text"] = null;
        Response.Redirect("Preview.aspx");
    }

    [System.Web.Services.WebMethod]
    public static void btn_delete_Click(string id)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ToString());
        try
        {
            con.Open();

            SqlCommand cmd = new SqlCommand("DELETE FROM Notice WHERE id=@id; ", con);

            cmd.Parameters.AddWithValue("@id", id);
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
}