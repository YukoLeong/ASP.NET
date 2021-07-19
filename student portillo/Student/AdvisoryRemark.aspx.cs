using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using AjaxControlToolkit;
using System.Text;
using System.Threading;
using System.Globalization;

public partial class Student_AdvisoryRemark : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ToString());
    private static string stu_id = "";
    private static DataTable table = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            if (Session["Role_Type"] != null 
                && Session["ALUN_NUMERO"] != null && Session["ALUN_NUMERO_SEQ"]!=null)
            {
                if (Session["CurrentUI"] != null && Session["CurrentUI"].ToString().Equals("zh-TW"))
                {
                    ImageButton2.ImageUrl = "../images/homebluec.png";
                    ImageButton2.Attributes.Add("onmouseover", "this.src='../images/homebluec_hover.png'");
                    ImageButton2.Attributes.Add("onmouseout", "this.src='../images/homebluec.png'");
                }

                loadTopicByAlunNum(Session["ALUN_NUMERO"].ToString(), Session["ALUN_NUMERO_SEQ"].ToString());

                getStdNameByID(Session["ALUN_NUMERO"].ToString(), Session["ALUN_NUMERO_SEQ"].ToString());
				
				countNewMsg(Session["ALUN_NUMERO"].ToString(), Session["ALUN_NUMERO_SEQ"].ToString());
            }
            else
            if (Session["Role_Type"] == null && Session["student_id"] != null)
            {
                stu_id = Session["student_id"].ToString();
                
                loadTopic();

                getStdNameByID(stu_id);
				
				countNewMsg(Session["student_id"].ToString());
            }
            else
            {                
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please login!'); window.location='http://172.26.122.66/siweb/logout.asp';", true);
            }

        
        }

    }

    private void getStdNameByID(string alun_num, string alun_seq)
    {
        try
        {
            con.Open();

            SqlCommand cmd = new SqlCommand("SELECT TOP 1 NAME_PT, NAME_CH " +
            "FROM student_academic_info " +
            "where ALUN_NUMERO  = @alunNum and ALUN_NUMERO_SEQ =@alunSeq ", con);

            cmd.Parameters.AddWithValue("@alunNum", alun_num);
            cmd.Parameters.AddWithValue("@alunSeq", alun_seq);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);

            SqlDataReader rdr1 = null;
            rdr1 = cmd.ExecuteReader();

            while (rdr1.Read())
                if (rdr1["NAME_PT"] != null)
                {
                    lbStdName.Text = rdr1["NAME_CH"].ToString() + " " + rdr1["NAME_PT"].ToString(); 

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


    private void getStdNameByID(string id)
    {
        try
        {
            con.Open();

            SqlCommand cmd = new SqlCommand("SELECT NAME_PT, NAME_CH " +
            "FROM student_academic_info "+
            "where STUDENT_ID = @sID", con);

            cmd.Parameters.AddWithValue("@sID", id);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);



            SqlDataReader rdr1 = null;
            rdr1 = cmd.ExecuteReader();

            while (rdr1.Read())
                if (rdr1["NAME_PT"] != null)
                {
                    lbStdName.Text = rdr1["NAME_PT"].ToString() + " " + rdr1["NAME_CH"].ToString();

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

   

    private void countNewMsg(string std_ID)
    {

        int totalUnreadMsg = 0;

        try
        {
            con.Open();
            StringBuilder sb = new StringBuilder();

            sb.Append("SELECT COUNT(*)  as 'UnreadMsg' ");
            sb.Append("FROM AdvisoryRemark ");
            sb.Append("WHERE status = 'Unread' and std_id=@sid ");

            SqlCommand cmd = new SqlCommand(sb.ToString(), con);

            cmd.Parameters.AddWithValue("@sid", std_ID);
           

            SqlDataReader rdr = null;
            rdr = cmd.ExecuteReader();

            while (rdr.Read())
            {
                totalUnreadMsg = Int32.Parse(rdr["UnreadMsg"].ToString());
            }

            if (totalUnreadMsg == 1)
            {
                txt_total.Text = totalUnreadMsg + " " + GetGlobalResourceObject("Resource", "sip_advice_msg3");
                resulPanel.Visible = true;
            }
            else
                if (totalUnreadMsg > 1)
                {
                    txt_total.Text = totalUnreadMsg + " "+GetGlobalResourceObject("Resource", "sip_advice_msg4");
                    resulPanel.Visible = true;
                }
                else
                    if (totalUnreadMsg == 0 && Int32.Parse(txt_total.Text) > 0)
                    {
                        txt_total.Text = totalUnreadMsg + " "+GetGlobalResourceObject("Resource", "sip_advice_msg3");
                        resulPanel.Visible = true;
                    }
                    else
                        if (totalUnreadMsg == 0 && Int32.Parse(txt_total.Text) == 0)
                        {
                            txt_total.Text = totalUnreadMsg + " "+GetGlobalResourceObject("Resource", "sip_advice_msg3");
                            resulPanel.Visible = false;
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


    private void countNewMsg(string num, string seq)
    {

        int totalUnreadMsg = 0;

        try
        {
            con.Open();
            StringBuilder sb = new StringBuilder();

            sb.Append("SELECT COUNT(*)  as 'UnreadMsg' ");
            sb.Append("FROM AdvisoryRemark ");
            sb.Append("WHERE status = 'Unread' and ALUN_NUMERO = @num and ALUN_NUMERO_SEQ=@seq ");

            SqlCommand cmd = new SqlCommand(sb.ToString(), con);

            cmd.Parameters.AddWithValue("@num", num);
            cmd.Parameters.AddWithValue("@seq", seq);

            SqlDataReader rdr = null;
            rdr = cmd.ExecuteReader();

            while (rdr.Read())
            {
                totalUnreadMsg = Int32.Parse(rdr["UnreadMsg"].ToString());
            }

            if (totalUnreadMsg == 1)
            {
                txt_total.Text = totalUnreadMsg + " " + GetGlobalResourceObject("Resource", "sip_advice_msg3");
                resulPanel.Visible = true;
            }
            else
                if (totalUnreadMsg > 1)
                {
                    txt_total.Text = totalUnreadMsg + " " +  GetGlobalResourceObject("Resource", "sip_advice_msg4");
                    resulPanel.Visible = true;
                }
                else
                    if (totalUnreadMsg == 0 && Int32.Parse(txt_total.Text) >0)
                    {
                        txt_total.Text = totalUnreadMsg + " " + GetGlobalResourceObject("Resource", "sip_advice_msg3");
                        resulPanel.Visible = true;
                    }
                    else
                        if (totalUnreadMsg == 0 && Int32.Parse(txt_total.Text) == 0)
                        {
                            txt_total.Text = totalUnreadMsg + " " + GetGlobalResourceObject("Resource", "sip_advice_msg3");
                            resulPanel.Visible = false;
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


    private void loadTopicByAlunNum(string alun_num, string alun_num_seq)
    {
        try
        {

            con.Open();
            SqlCommand cmd = new SqlCommand("select  * from AdvisoryRemark a "+
                "inner join academic_result_info b on a.class_code=b.SUBJECT_CODE and a.year =b.ACADEMIC_YEAR "+
                "where a.ALUN_NUMERO  = @alunNum and a.ALUN_NUMERO_SEQ =@alunSeq  and b.ALUN_NUMERO=@alunNum and b.ALUN_NUMERO_SEQ=@alunSeq " +
                "order by a.postDate desc", con);

            cmd.Parameters.AddWithValue("@alunNum", alun_num);
            cmd.Parameters.AddWithValue("@alunSeq", alun_num_seq);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);

            table = ds.Tables[0];


            GridView1.DataSource = ds;
            GridView1.DataBind();

            txt_total.Text = ds.Tables[0].Rows.Count.ToString();

         
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



    private void loadTopic()
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select *  "+
                "FROM AdvisoryRemark a  "+
                "inner join academic_result_info b "+
                "on a.std_id = b.STUDENT_ID and a.class_code = b.SUBJECT_CODE "+
                "where std_id=@sid order by a.postDate desc", con);

            cmd.Parameters.AddWithValue("@sid", stu_id);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);

            table = ds.Tables[0];


            GridView1.DataSource = ds;
            GridView1.DataBind();

            txt_total.Text = ds.Tables[0].Rows.Count.ToString();
         
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

    private bool existLikes(string id)
    {
        bool result = false;

        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT * from Remark_likes " +

              "where remarkID=@remarkID ", con);

            cmd.Parameters.AddWithValue("@remarkID", id);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
                result = true;


        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
           
        }
        return result;
    }

    protected void btn_like_Click(object sender, GridViewUpdateEventArgs e)
    {
                
        string remarkID = (GridView1.Rows[e.RowIndex].FindControl("lblID") as Label).Text;
        string std_id = (GridView1.Rows[e.RowIndex].FindControl("lblStdID") as Label).Text;
        string classCode = (GridView1.Rows[e.RowIndex].FindControl("lblclass_code") as Label).Text;
        string teacherCode = (GridView1.Rows[e.RowIndex].FindControl("lblTeacherCode") as Label).Text;
        string teacherName = (GridView1.Rows[e.RowIndex].FindControl("lblAuthor") as Label).Text;
        

        try
        {

            if (!existLikes(remarkID))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("INSERT into Remark_likes  (remarkID, likes, name) " +
                     "VALUES  ( @remarkID, 1 , @tName )", con);

                cmd.Parameters.AddWithValue("@remarkID", remarkID);
                cmd.Parameters.AddWithValue("@tName", teacherName);

                cmd.ExecuteNonQuery();
            }
            else
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE Remark_likes SET likes=likes+1 " +

                  "where remarkID=@remarkID ", con);

                cmd.Parameters.AddWithValue("@remarkID", remarkID);
                cmd.Parameters.AddWithValue("@tName", teacherName);

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
            loadTopic();
        }
        

    }

    protected void stdList_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        loadTopic();
    }

  

    protected void OnSelectedIndexChanged(object sender, EventArgs e)
    {
        //Accessing BoundField Column
      //  string name = GridView1.SelectedRow.Cells[2].Text;
      
            //Accessing TemplateField Column controls
            string id = (GridView1.SelectedRow.FindControl("lblID") as Label).Text;
            string std_id = (GridView1.SelectedRow.FindControl("lblStdID") as Label).Text;
            string classCode = (GridView1.SelectedRow.FindControl("lblclass_code") as Label).Text;
            string teacherCode = (GridView1.SelectedRow.FindControl("lblTeacherCode") as Label).Text;
                
            Session["id"] = id;
            Session["std_id"] = std_id;
            Session["class_Code"] = classCode;
            Session["role"] = "student";
            Session["TCode"] = teacherCode;
            

            updateStatusToRead();

            Response.Redirect("AdvisoryDetails.aspx");
        
    }


    private void updateStatusToRead()
    {
    
	try {

            con.Open();
            SqlCommand cmd = new SqlCommand("UPDATE AdvisoryRemark  SET status='Read' " +
                "where id=@topicID ", con);

            cmd.Parameters.AddWithValue("@topicID", Session["id"].ToString());
          

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

  
    

    protected void btn_home_Click(object sender, EventArgs e)
    {

        if (Session["Role_Type"] != null && Session["Role_Type"].ToString() == "student")
        
            Response.Redirect("home.aspx");
       
        else
            if (Session["position"] != null && Session["position"].ToString() == "studentview")
            {
                if (Session["Role_Type"].ToString() == "teacher" || Session["Role_Type"].ToString() == "tutor" || Session["Role_Type"].ToString() == "coordinator" || Session["Role_Type"].ToString() == "director")
                {
                    Session["Role_Type"] = "teacher";
                    Response.Redirect("schoolStaff.aspx");
                }
            }

        Response.Write("<script>alert('Please Log In !'); window.location.href='../home.aspx'; </script>");


    }


    public SortDirection GridViewSortDirection
    {
        get
        {
            if (ViewState["sortDirection"] == null)
                ViewState["sortDirection"] = SortDirection.Descending;

            return (SortDirection)ViewState["sortDirection"];
        }
        set { ViewState["sortDirection"] = value; }
    }

    protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
    {
        if (table != null)
        {
            string sortExpression = e.SortExpression;
            Image sortImage = new Image();

            ViewState["sortExpression"] = e.SortExpression;

            if (GridViewSortDirection == SortDirection.Ascending)
            {
                GridViewSortDirection = SortDirection.Descending;
                SortGridView(sortExpression, " desc");
                sortImage.ImageUrl = "../images/descending.png";
            }
            else
            {
                GridViewSortDirection = SortDirection.Ascending;
                SortGridView(sortExpression, " asc");
                sortImage.ImageUrl = "../images/ascending.png";
            }

            int columnIndex = 0;
            foreach (DataControlFieldHeaderCell headerCell in GridView1.HeaderRow.Cells)
            {
                if (headerCell.ContainingField.SortExpression == e.SortExpression)
                {
                    columnIndex = GridView1.HeaderRow.Cells.GetCellIndex(headerCell);
                }
            }

            GridView1.HeaderRow.Cells[columnIndex].Controls.Add(sortImage); 
        }
    }


    private void SortGridView(string sortExpression, string direction)
    {
        //  You can cache the DataTable for improving performance
        try
        {
            if (table != null)
            {
                DataTable dt = table;

                DataView dv = new DataView(dt);
                dv.Sort = sortExpression + direction;



                GridView1.DataSource = dv;
                GridView1.DataBind();
            }

        }
        catch (Exception e) { throw e; }

    }



    private DataSet GetViewState()
    {
        //Gets the ViewState
        return (DataSet)ViewState["TopicDataSet"];
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

        if (ViewState["sortDirection"] != null
            && ViewState["sortExpression"] != null
            && ViewState["TopicDataSet"] != null)
        {
            DataSet myDataSet = GetViewState();
            DataTable myDataTable = myDataSet.Tables[0];

            DataView dv = new DataView(myDataTable);

            if (GridViewSortDirection == SortDirection.Ascending)
                dv.Sort = ViewState["sortExpression"].ToString() + " desc";
            else
                dv.Sort = ViewState["sortExpression"].ToString() + " asc";

            GridView1.DataSource = dv;

            GridView1.PageIndex = e.NewPageIndex;

            GridView1.DataBind();
        }
        else
        {
            GridView1.DataSource = table;
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }
    }

    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        if (Session["Role_Type"] != null && Session["Role_Type"].ToString() == "student")

            Response.Redirect("home.aspx");

        else
            if (Session["position"] != null && Session["position"].ToString() == "studentview")
            {
                if (Session["Role_Type"].ToString() == "teacher" || Session["Role_Type"].ToString() == "tutor" || Session["Role_Type"].ToString() == "coordinator" || Session["Role_Type"].ToString() == "director")
                {
                    Session["Role_Type"] = "teacher";
                    Response.Redirect("schoolStaff.aspx");
                }
            }

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
}