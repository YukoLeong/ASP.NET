using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_settings : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
             if (Session["pess_cod"] != null)
            {
                if (Session["CurrentUI"] != null && Session["CurrentUI"].ToString().Equals("zh-TW"))
                {
                    btn_home.ImageUrl = "../images/homebluec.png";
                    btn_home.Attributes.Add("onmouseover", "this.src='../images/homebluec_hover.png'");
                    btn_home.Attributes.Add("onmouseout", "this.src='../images/homebluec.png'");
                }

                pess_cod.Text = Session["pess_cod"].ToString();
               // pess_cod.Text = "61140";
                loadDefaultIconSize(pess_cod.Text);
                con.Open();
                string favSQL = "Select COUNT(*) from DefaultFavourite where pess_cod=@pess_cod";
                SqlCommand sqlcmd = new SqlCommand(favSQL, con);
                sqlcmd.Parameters.AddWithValue("@pess_cod", pess_cod.Text);
                int favCount = (int) sqlcmd.ExecuteScalar();
                con.Close();


                    if ( existCustomSettings(pess_cod.Text))
                    {
                        items_panel_fav.Text = LoadSettings(pess_cod.Text);
                    }
                    else if (favCount == 0)
                    {
                        insertDefaultSettings(pess_cod.Text);
                        items_panel_fav.Text = LoadSettings(pess_cod.Text);
                    }

                    items_p1.Text = LoadSettings(pess_cod.Text, "timetable");
                    items_p2.Text = LoadSettings(pess_cod.Text, "studentRecord");
                    items_p3.Text = LoadSettings(pess_cod.Text, "finance");
                    items_p4.Text = LoadSettings(pess_cod.Text, "common");
                    items_p5.Text = LoadSettings(pess_cod.Text, "ep");
                    items_p6.Text = LoadSettings(pess_cod.Text, "an");
            }
             else
             {           
                   ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please login!'); window.location='http://172.26.122.66/siweb/logout.asp';", true);
             }
        }

    }

    private Boolean existCustomSettings(string pess_cod)
    {
        try
        {
            con.Open();

            StringBuilder sb = new StringBuilder();
            sb.Append("select * from CustomSettings ");
            sb.Append("where pess_cod =@pess_cod ");
            SqlCommand cmd = new SqlCommand(sb.ToString(), con);
            cmd.Parameters.AddWithValue("@pess_cod", pess_cod);
            

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

    private void insertDefaultSettings(string pess_cod)
    {
        try
        {
            con.Open();            

            StringBuilder sb = new StringBuilder();
            sb.Append("insert into CustomSettings ");
            sb.Append(" values( @pess_cod,'ar' , 34 ),");
            sb.Append("(  @pess_cod,'siw_classtime' , 1 ), ");
            sb.Append("(  @pess_cod,'siw_examtime' , 2), ");
            sb.Append("(  @pess_cod,'siw_epay' , 9 ),");
            sb.Append("(  @pess_cod,'lr' , 21 ), ");
            sb.Append("(  @pess_cod,'cv' , 23 ); ");

        
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
    private string LoadSettings(string pess_cod, string group)
    {
        try
        {
            con.Open();

            StringBuilder sb = new StringBuilder();
            sb.Append("select * ");
            sb.Append("from ImageInfo ");
            sb.Append("where groupName = @group and imgName not in ( ");
            sb.Append("select imgName from CustomSettings  where pess_cod = @pess_cod ");
            sb.Append(") ");

            SqlCommand cmd = new SqlCommand(sb.ToString(), con);
            cmd.Parameters.AddWithValue("@pess_cod", pess_cod);
            cmd.Parameters.AddWithValue("@group", group);

            SqlDataReader rdr = null;
            rdr = cmd.ExecuteReader();


            //<div class="monthebox object" id="siw_classtime">
            //  <img src="../images/classtime.png" />
            //<div class='text'>Class Time</div>
            //</div>

            StringBuilder itemText = new StringBuilder();


            while (rdr.Read())
            {
                if (!rdr["imgName"].ToString().StartsWith("siw"))
                {
                    if (chkUserGroup(rdr["imgName"].ToString()))
                    {
                        itemText.Append("<div class='monthebox object' id='" + rdr["imgName"].ToString() + "'>");
                        itemText.Append("<img src='" + rdr["imgPath"].ToString() + "'>");
                        //itemText.Append("<div class='text' style='padding-left: 12px;font-size: 11pt;'>" + rdr["appName"].ToString());
                        itemText.Append("<div class='text' style='padding-left: 12px;font-size: 11pt;'>" + GetGlobalResourceObject("Resource", rdr["appString"].ToString()));
                        itemText.Append("</div></div>");
                    }
                }
                else
                {
                    itemText.Append("<div class='monthebox object' id='" + rdr["imgName"].ToString() + "'>");
                    itemText.Append("<img src='" + rdr["imgPath"].ToString() + "'>");
                    //itemText.Append("<div class='text' style='padding-left: 12px;font-size: 11pt;'>" + rdr["appName"].ToString());
                    itemText.Append("<div class='text' style='padding-left: 12px;font-size: 11pt;'>" + GetGlobalResourceObject("Resource", rdr["appString"].ToString()));
                    itemText.Append("</div></div>");
                }
            }
            return itemText.ToString();
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


    private string LoadSettings(string pess_cod)
    {
        try
        {
            con.Open();

            StringBuilder sb = new StringBuilder();
            sb.Append("select  * ");
            sb.Append("from CustomSettings a inner join ImageInfo b ");
            sb.Append("on a.imgID = b.id ");
            sb.Append("where a.pess_cod =@pess_cod ");

            SqlCommand cmd = new SqlCommand(sb.ToString(), con);
            cmd.Parameters.AddWithValue("@pess_cod", pess_cod);

            SqlDataReader rdr = null;
            rdr = cmd.ExecuteReader();


            //<div class="monthebox object" id="siw_classtime">
            //  <img src="../images/classtime.png" />
            //<div class='text'>Class Time</div>
            //</div>

            StringBuilder itemText = new StringBuilder();


            while (rdr.Read())
            {

                if (!rdr["imgName"].ToString().StartsWith("siw"))
                {
                    if (chkUserGroup(rdr["imgName"].ToString()))
                    {
                        itemText.Append("<div class='monthebox object' id='" + rdr["imgName"].ToString() + "'>");
                        itemText.Append("<img src='" + rdr["imgPath"].ToString() + "'>");
                        //itemText.Append("<div class='text' style='padding-left: 12px;font-size: 11pt;'>" + rdr["appName"].ToString());
                        itemText.Append("<div class='text' style='padding-left: 12px;font-size: 11pt;'>" + GetGlobalResourceObject("Resource", rdr["appString"].ToString()));
                        itemText.Append("</div></div>");
                    }
                }
                else
                {
                    itemText.Append("<div class='monthebox object' id='" + rdr["imgName"].ToString() + "'>");
                    itemText.Append("<img src='" + rdr["imgPath"].ToString() + "'>");
                    //itemText.Append("<div class='text' style='padding-left: 12px;font-size: 11pt;'>" + rdr["appName"].ToString());
                    itemText.Append("<div class='text' style='padding-left: 12px;font-size: 11pt;'>" + GetGlobalResourceObject("Resource", rdr["appString"].ToString()));
                    itemText.Append("</div></div>");
                }
            }
            return itemText.ToString();
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

    private Boolean chkUserGroup(string appName)
    {
        SqlConnection con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ToString());
        try
        {
            con1.Open();
            StringBuilder sb = new StringBuilder();
            sb.Append("select * from  ");
            sb.Append("userGroup a ");
            sb.Append("where a." + appName + "=1 and id='student' ");
            SqlCommand cmd = new SqlCommand(sb.ToString(), con1);

            cmd.Parameters.AddWithValue("@appName", appName);


            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
                return true;
            else
                return false;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con1.Close();
        }
    }

    protected void loadDefaultIconSize(string pess_cod)
    {
        try
        {
            con.Open();

            StringBuilder sb = new StringBuilder();
            sb.Append("select  * ");
            sb.Append("from DefaultFavourite ");           
            sb.Append("where pess_cod =@pess_cod ");

            SqlCommand cmd = new SqlCommand(sb.ToString(), con);
            cmd.Parameters.AddWithValue("@pess_cod", pess_cod);

            SqlDataReader rdr = null;
            rdr = cmd.ExecuteReader();

            while (rdr.Read())
            {
                if (rdr["icon_size"].ToString()=="small")
                     RadioButtonList1.SelectedIndex = 0;
                else  if (rdr["icon_size"].ToString()=="medium")
                    RadioButtonList1.SelectedIndex =1;
                else if (rdr["icon_size"].ToString() == "big")
                    RadioButtonList1.SelectedIndex = 2;
                
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



    protected void btn_back_Click(object sender, EventArgs e)
    {
        Response.Redirect("home.aspx");
           
    }
	
	 protected void btn_home_Click(object sender, EventArgs e)
    {
        if (Session["Role_Type"] != null)
        {
            if (Session["Role_Type"].ToString() == "student")
                Response.Redirect("home.aspx");
            else
                Response.Redirect("schoolStaff.aspx");
        }
        else
            Response.Write("<script>alert('Please Log In !'); window.location.href='../home.aspx'; </script>");
    }

     protected override void InitializeCulture()
     {
         base.InitializeCulture();

         if (Session["CurrentUI"] != null)
         {
             String selectedLanguage = (string)Session["CurrentUI"];
             UICulture = selectedLanguage;
             Culture = selectedLanguage;

             Thread.CurrentThread.CurrentCulture =
                 CultureInfo.CreateSpecificCulture(selectedLanguage);
             Thread.CurrentThread.CurrentUICulture = new
                 CultureInfo(selectedLanguage);
         }

         base.InitializeCulture();
     }


     protected void lang_Click(object sender, EventArgs e)
     {
         LinkButton btn = (LinkButton)(sender);
         string selectedLanguage = btn.CommandArgument;

         Session["CurrentUI"] = selectedLanguage;

         base.InitializeCulture();
         Response.Redirect(Request.Url.OriginalString);
     }
}