using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Text.RegularExpressions;
using System.Text;
using AjaxControlToolkit;
using System.Threading;
using System.Globalization;

public partial class Advice_AdvisoryRemark : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ToString());

    public static string year = "";
    public static string class_code = "";

    public static DataTable table = new DataTable();

    public static DataTable rtable = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["CODE"] != null && Session["Role_Type"]!=null && Session["School_code"] !=null)
            {
                if (Session["CurrentUI"] != null && Session["CurrentUI"].ToString().Equals("zh-TW"))
                {
                    ImageButton2.ImageUrl = "../images/homebluec.png";
                    ImageButton2.Attributes.Add("onmouseover", "this.src='../images/homebluec_hover.png'");
                    ImageButton2.Attributes.Add("onmouseout", "this.src='../images/homebluec.png'");

                    btn_search.ImageUrl = "../images/searchc1.png";
                    btn_search.Attributes.Add("onmouseover", "this.src='../images/searchc2.png'");
                    btn_search.Attributes.Add("onmouseout", "this.src='../images/searchc1.png'");
                }

                txt_teacherCode.Text = Session["CODE"].ToString();

				string schoolNameEN = EpDao.getSchoolNameEN(Session["School_code"].ToString());
				
                loadTopic();

                if (Session["rTopicDataSet"] != null)
                {

                    rGridView.DataSource = (DataSet)Session["rTopicDataSet"];
                    rGridView.DataBind();
                }

                if (Session["Role_Type"].ToString() == "director" && Session["School_code"] != null)
                    bindDirectorSubjectList(schoolNameEN);
                else
                if (Session["Role_Type"].ToString() == "coordinator" && Session["School_code"] != null && Session["Programme"] != null)
                    bindProgramSubjectList(schoolNameEN, Session["Programme"].ToString());
                else
                if (Session["Role_Type"].ToString() == "tutor" && Session["School_code"]!=null && Session["Tutor_Year"]!=null)
                    bindYrSubjects(schoolNameEN, Session["Tutor_Year"].ToString());
                else
                    bindSubjectList();
            }
            else
            {               
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please login!'); window.location='../staff.aspx';", true);
            }

        }

    }

    private void bindDirectorSubjectList(string school) { 
     try
        {
            
            con.Open();

            StringBuilder sb = new StringBuilder();

            sb.Append("SELECT distinct b.SUBJECT_CODE ");
            sb.Append("FROM teacher_course_info a ");
            sb.Append("inner join academic_result_info b on ");
            sb.Append("a.SECTION_CODE = b.SECTION_CODE and a.SECTION_YEAR = b.SECTION_YEAR ");
            sb.Append("where b.STUDENT_STATUS_EN='Active'and CODE=@tc ");
            sb.Append("union ");
            sb.Append("SELECT  distinct d.SUBJECT_CODE ");
            sb.Append("FROM school_info a inner join program_info b ");
            sb.Append("on a.SCHOOL_CODE = b.SCHOOL_CODE   ");
            sb.Append("inner join student_academic_info c ");
            sb.Append("on c.school_code = b.SCHOOL_CODE ");
            sb.Append("inner join academic_result_info d ");
            sb.Append("on d.STUDENT_ID = c.STUDENT_ID ");
            sb.Append("where  a.school_en=@school ");
            sb.Append("order by SUBJECT_CODE");

            SqlCommand cmd = new SqlCommand(sb.ToString(), con);

            cmd.Parameters.AddWithValue("@school", school);
            cmd.Parameters.AddWithValue("@tc", txt_teacherCode.Text);

            SqlDataReader sqr = null;
            sqr = cmd.ExecuteReader();

            while (sqr.Read())
            {
                string item =  sqr["SUBJECT_CODE"].ToString();
                subjectlist.Items.Add(new ListItem(item, item));
            }
            subjectlist.DataBind();
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

    private void bindProgramSubjectList(string school, string program)
    {
     try
        {
            
            con.Open();

            StringBuilder sb = new StringBuilder();

            sb.Append("SELECT distinct b.SUBJECT_CODE ");
            sb.Append("FROM teacher_course_info a ");
            sb.Append("inner join academic_result_info b on ");
            sb.Append("a.SECTION_CODE = b.SECTION_CODE and a.SECTION_YEAR = b.SECTION_YEAR ");
            sb.Append("where b.STUDENT_STATUS_EN='Active' and CODE=@tc ");
            sb.Append("union ");
            sb.Append("SELECT  distinct d.SUBJECT_CODE ");
            sb.Append("FROM school_info a inner join program_info b ");
            sb.Append("on a.SCHOOL_CODE = b.SCHOOL_CODE   ");
            sb.Append("inner join student_academic_info c ");
            sb.Append("on c.school_code = b.SCHOOL_CODE ");
            sb.Append("inner join academic_result_info d ");
            sb.Append("on d.ALUN_NUMERO = c.ALUN_NUMERO and d.ALUN_NUMERO_SEQ  = d.ALUN_NUMERO_SEQ ");
            sb.Append("where  a.school_en=@school and c.PROGRAM_EN =@program  ");
            sb.Append("order by SUBJECT_CODE");

            SqlCommand cmd = new SqlCommand(sb.ToString(), con);

            cmd.Parameters.AddWithValue("@school", school);
            cmd.Parameters.AddWithValue("@program", program);
            cmd.Parameters.AddWithValue("@tc", txt_teacherCode.Text);

            SqlDataReader sqr = null;
            sqr = cmd.ExecuteReader();

            while (sqr.Read())
            {
                string item =  sqr["SUBJECT_CODE"].ToString();
                subjectlist.Items.Add(new ListItem(item, item));
            }
            subjectlist.DataBind();
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
   

    private void bindSubjectList()
    {

        try
        {
            subjectlist.Items.Clear();
            con.Open();


            StringBuilder sb = new StringBuilder();

            sb.Append("SELECT distinct b.SUBJECT_CODE ");
            sb.Append("FROM teacher_course_info a ");
            sb.Append("inner join academic_result_info b on ");
            sb.Append("a.SECTION_CODE = b.SECTION_CODE and a.SECTION_YEAR = b.SECTION_YEAR ");
            sb.Append("where b.STUDENT_STATUS_EN='Active' and CODE=@tc ");
            sb.Append("order by b.SUBJECT_CODE;");

            SqlCommand cmd = new SqlCommand(sb.ToString(), con);

            cmd.Parameters.AddWithValue("@tc", txt_teacherCode.Text);

            SqlDataReader rdr = null;
            rdr = cmd.ExecuteReader();

            //courseDropDownList.Items.Insert(0, New ListItem("--Select--", ""))
            while (rdr.Read())
            {
                string item =  rdr["SUBJECT_CODE"].ToString();
                subjectlist.Items.Add(new ListItem(item, item));
            }
            subjectlist.DataBind();

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

    private void bindYrSubjects(string school, string qYrs)
    {
        try
        {
            
            con.Open();

            StringBuilder sb = new StringBuilder();

            sb.Append("SELECT distinct b.SUBJECT_CODE ");
            sb.Append("FROM teacher_course_info a  ");
            sb.Append("inner join academic_result_info b on ");
            sb.Append("a.SECTION_CODE = b.SECTION_CODE and a.SECTION_YEAR = b.SECTION_YEAR ");
            sb.Append("where b.STUDENT_STATUS_EN='Active'and CODE=@tc ");
            sb.Append("union ");
            sb.Append("SELECT  distinct d.SUBJECT_CODE ");
            sb.Append("FROM school_info a inner join program_info b ");
            sb.Append("on a.SCHOOL_CODE = b.SCHOOL_CODE   ");
            sb.Append("inner join student_academic_info c ");
            sb.Append("on c.school_code = b.SCHOOL_CODE ");
            sb.Append("inner join academic_result_info d ");
            sb.Append("on d.STUDENT_ID = c.STUDENT_ID ");
            sb.Append("where  a.school_en=@school and c.QUALIFIED_YEAR=@yrs ");
            sb.Append("order by SUBJECT_CODE;");
       

            SqlCommand cmd = new SqlCommand(sb.ToString(), con);

            cmd.Parameters.AddWithValue("@school", school);
            cmd.Parameters.AddWithValue("@yrs", qYrs);
            cmd.Parameters.AddWithValue("@tc", txt_teacherCode.Text);

            SqlDataReader sqr = null;
            sqr = cmd.ExecuteReader();

            while (sqr.Read())
            {
                string item =  sqr["SUBJECT_CODE"].ToString();
                subjectlist.Items.Add(new ListItem(item, item));
            }
            subjectlist.DataBind();
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
    

    public string getTeacherNameByCode(string code)
    {
        string teacherName = "";

        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT distinct isnull(NAME_CH  , Name_pt) as name  " +
                 "FROM teacher_course_info where CODE =@teacherCode", con);

            cmd.Parameters.AddWithValue("@teacherCode", code);

            SqlDataReader rdr1 = null;
            rdr1 = cmd.ExecuteReader();

            while (rdr1.Read())
            {
                if (rdr1["name"] != null)
                    teacherName = rdr1["name"].ToString();

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


        return teacherName;
    }

    private void bindRelatedList()
    {
        try
        {
            con.Open();
            msg.Visible = false;


            SqlCommand cmd = new SqlCommand("SELECT distinct a.id, a.std_id, isnull(stdinfo.NAME_CH ,stdinfo.NAME_PT) as name,  a.year, a.class_code, a.author,a.teacher_code, a.title, a.postDate, a.status, " +
                   // "ISNULL((SELECT AVG(Rating) FROM Remark_Ratings WHERE remarkID = a.id), 0) Rating, " +
                    "ISNULL((SELECT likes FROM Remark_likes WHERE remarkID = a.id), 0) as Likes, " +
                    "ISNULL((SELECT CASE WHEN EXISTS ( " +
                    "SELECT 1 FROM Remark_like_details det inner join Remark_likes r " +
                    "on det.likeID = r.id  " +
                    "where a.id  = r.remarkID  and det.teacherCode=@teacher_code " +
                    ")THEN CAST(0 AS BIT) " +
                    "ELSE CAST(1 AS BIT) END), 0) as BIT  " +
                    "FROM AdvisoryRemark a inner join AdvisoryRemark b " +
                    "on a.class_code = b.class_code inner join student_academic_info stdinfo " +
                    "on a.ALUN_NUMERO = stdinfo.ALUN_NUMERO  and a.ALUN_NUMERO_SEQ = stdinfo.ALUN_NUMERO_SEQ " +
                    "where  a.class_code =@class_code and b.class_code=@class_code "+
                    "order by postDate desc", con);

            cmd.Parameters.AddWithValue("@class_code", class_code);
            cmd.Parameters.AddWithValue("@teacher_code", txt_teacherCode.Text);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {

                rGridView.DataSource = ds;
                rGridView.DataBind();

                Session["rTopicDataSet"] = ds;

                rtable = ds.Tables[0];

            }
            else
            {
                msg.Visible = true;
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "", "window.scrollTo(0,900);", true);
        }
    }

    private bool existRating(string id)
    {
        bool result = false;

        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT * from Remark_Ratings " +

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

    protected void OnRatingChanged(object sender, RatingEventArgs e)
    {
        int rowIndex = ((sender as Rating).NamingContainer as GridViewRow).RowIndex;
        int ratingId = Convert.ToInt32(GridView1.DataKeys[rowIndex].Value);

        if (!existRating(ratingId.ToString()))
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO Remark_Ratings VALUES(@remarkID, @rating)", con);

                SqlDataAdapter sda = new SqlDataAdapter();

                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@remarkID", ratingId);
                cmd.Parameters.AddWithValue("@rating", e.Value);
                cmd.Connection = con;

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
        else
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE Remark_Ratings SET rating =@rating " +
                "where remarkID=@remarkID", con);

                SqlDataAdapter sda = new SqlDataAdapter();

                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@remarkID", ratingId);
                cmd.Parameters.AddWithValue("@rating", e.Value);
                cmd.Connection = con;

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


        Response.Redirect(Request.Url.AbsoluteUri);
    }

    private bool existLikes(string id, string code)
    {
        bool result = false;

        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT *  from Remark_like_details a " +
                 "inner join Remark_likes b " +
                 "on a.likeID = b.id " +
               "where b.remarkID=@remarkID ", con);

            cmd.Parameters.AddWithValue("@remarkID", id);
           // cmd.Parameters.AddWithValue("@code", code);

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

    private bool chkZeroLike(string id)
    {
        bool result = false;

        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT *  from Remark_likes a " +

               "where a.remarkID=@remarkID and a.likes-1=0", con);

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

    protected void btnUnlike_click(object sender, GridViewDeleteEventArgs e)
    {
        string remarkID = (GridView1.Rows[e.RowIndex].FindControl("lblID") as Label).Text;
        string std_id = (GridView1.Rows[e.RowIndex].FindControl("lblStdID") as Label).Text;
        string classCode = (GridView1.Rows[e.RowIndex].FindControl("lblclass_code") as Label).Text;
        string tName = getTeacherNameByCode(txt_teacherCode.Text);
        Decimal likeID = new Decimal();

        try
        {


            if (!chkZeroLike(remarkID))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE Remark_likes SET likes=likes-1 OUTPUT Inserted.id " +

                      "where remarkID=@remarkID; ", con);

                cmd.Parameters.AddWithValue("@remarkID", remarkID);


                //   cmd.ExecuteNonQuery();
                likeID = (Int32)cmd.ExecuteScalar();
            }
            else
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("delete from Remark_likes " +
                     "where remarkID=@remarkID; ", con);

                cmd.Parameters.AddWithValue("@remarkID", remarkID);


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
            if (likeID > 0)
                delLikesDetails(likeID);
            loadTopic();
        }
    }

    protected void btn_like_Click(object sender, GridViewUpdateEventArgs e)
    {
        string remarkID = (GridView1.Rows[e.RowIndex].FindControl("lblID") as Label).Text;
        string std_id = (GridView1.Rows[e.RowIndex].FindControl("lblStdID") as Label).Text;
        string classCode = (GridView1.Rows[e.RowIndex].FindControl("lblclass_code") as Label).Text;


        string tName = getTeacherNameByCode(txt_teacherCode.Text);
        Decimal likeID = new Decimal();

        try
        {

            if (!existLikes(remarkID, txt_teacherCode.Text))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("INSERT into Remark_likes  (remarkID, likes) " +
                     "VALUES  ( @remarkID, 1) ; SELECT @@Identity", con);



                cmd.Parameters.AddWithValue("@remarkID", remarkID);


                // cmd.ExecuteNonQuery();
                likeID = (Decimal)cmd.ExecuteScalar();
            }
            else
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE Remark_likes SET likes=likes+1 OUTPUT Inserted.id " +

                  "where remarkID=@remarkID; ", con);

                cmd.Parameters.AddWithValue("@remarkID", remarkID);
                cmd.Parameters.AddWithValue("@tName", tName);

                //   cmd.ExecuteNonQuery();
                likeID = (Int32)cmd.ExecuteScalar();
            }

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            insertLikesDetails(likeID);
            loadTopic();

        }


    }

    private void delLikesDetails(Decimal id)
    {
        try
        {

            con.Open();

            SqlCommand cmd = new SqlCommand("delete from Remark_like_details   " +
                     "where  likeID=@likeID and teacherCode =@code ", con);


            cmd.Parameters.AddWithValue("@likeID", id);

            cmd.Parameters.AddWithValue("@code", txt_teacherCode.Text);

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

    private void insertLikesDetails(Decimal id)
    {

        try
        {
            string tName = getTeacherNameByCode(txt_teacherCode.Text);
            //ImageButton btnlike = GridView1.Rows[e.RowIndex].FindControl("btn_like") as ImageButton;

            // btnlike.Enabled = false;
            // btnlike.Visible = false;
            con.Open();

            SqlCommand cmd = new SqlCommand("INSERT into Remark_like_details  (likeID, teacherName, teacherCode) " +
                     "VALUES  ( @likeID, @tName , @code)", con);


            cmd.Parameters.AddWithValue("@likeID", id);
            cmd.Parameters.AddWithValue("@tName", tName);
            cmd.Parameters.AddWithValue("@code", txt_teacherCode.Text);

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

    protected void rbtnUnlike_click(object sender, GridViewDeleteEventArgs e)
    {
        string remarkID = (rGridView.Rows[e.RowIndex].FindControl("lblID") as Label).Text;
        string std_id = (rGridView.Rows[e.RowIndex].FindControl("lblStdID") as Label).Text;
        string classCode = (rGridView.Rows[e.RowIndex].FindControl("lblclass_code") as Label).Text;

        Decimal likeID = new Decimal();

        try
        {


            if (!chkZeroLike(remarkID))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE Remark_likes SET likes=likes-1 OUTPUT Inserted.id " +

                      "where remarkID=@remarkID; ", con);

                cmd.Parameters.AddWithValue("@remarkID", remarkID);


                //   cmd.ExecuteNonQuery();
                likeID = (Int32)cmd.ExecuteScalar();
            }
            else
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("delete from Remark_likes " +
                     "where remarkID=@remarkID; ", con);

                cmd.Parameters.AddWithValue("@remarkID", remarkID);


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
            if (likeID > 0)
                delLikesDetails(likeID);
            bindRelatedList();
        }
    }

    protected void rbtn_like_Click(object sender, GridViewUpdateEventArgs e)
    {


        string remarkID = (rGridView.Rows[e.RowIndex].FindControl("lblID") as Label).Text;
        string std_id = (rGridView.Rows[e.RowIndex].FindControl("lblStdID") as Label).Text;
        string classCode = (rGridView.Rows[e.RowIndex].FindControl("lblclass_code") as Label).Text;


        string tName = getTeacherNameByCode(txt_teacherCode.Text);
        Decimal likeID = new Decimal();
        try
        {

            if (!existLikes(remarkID, txt_teacherCode.Text))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("INSERT into Remark_likes  (remarkID, likes) " +
                    "VALUES  ( @remarkID, 1 ); SELECT @@Identity", con);



                cmd.Parameters.AddWithValue("@remarkID", remarkID);


                //cmd.ExecuteNonQuery();
                likeID = (Decimal)cmd.ExecuteScalar();
            }
            else
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE Remark_likes SET likes=likes+1  OUTPUT Inserted.id " +

                  "where remarkID=@remarkID; ", con);

                cmd.Parameters.AddWithValue("@remarkID", remarkID);
                cmd.Parameters.AddWithValue("@tName", tName);

                // cmd.ExecuteNonQuery();
                likeID = (Int32)cmd.ExecuteScalar();
            }


        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            insertLikesDetails(likeID);
            bindRelatedList();

            ScriptManager.RegisterStartupScript(this, this.GetType(), "", "window.scrollTo(0,900);", true);
        }


    }


    protected void rOnRatingChanged(object sender, RatingEventArgs e)
    {
        int rowIndex = ((sender as Rating).NamingContainer as GridViewRow).RowIndex;
        int ratingId = Convert.ToInt32(rGridView.DataKeys[rowIndex].Value);


        string constr = ConfigurationManager.ConnectionStrings["EPConnectionString"].ConnectionString;

        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("INSERT INTO Remark_Ratings VALUES(@remarkID, @rating)"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@remarkID", ratingId);
                    cmd.Parameters.AddWithValue("@rating", e.Value);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }



        searchPanel.Visible = true;
        ScriptManager.RegisterStartupScript(this, this.GetType(), "", "window.scrollTo(0,900);", true);
        // Response.Redirect(Request.Url.AbsoluteUri);
    }

    private void loadTopic()
    {
        try
        {

            con.Open();
            SqlCommand cmd = new SqlCommand("Select *, isnull(stdinfo.NAME_CH ,stdinfo.NAME_PT) as name, " +
              //  "ISNULL((SELECT Rating FROM Remark_Ratings WHERE remarkID = a.id), 0) Rating, " +
                    "ISNULL((SELECT likes FROM Remark_likes WHERE remarkID = a.id), 0) as Likes,  " +
                    "ISNULL((SELECT CASE WHEN EXISTS ( " +
                    "SELECT 1 FROM Remark_like_details b inner join Remark_likes c " +
                    "on b.likeID = c.id  " +
                    "where  a.id  = c.remarkID and b.teacherCode=@teacher_code " +
                    ")THEN CAST(0 AS BIT) " +
                    "ELSE CAST(1 AS BIT) END), 0) as BIT  " +
                    "FROM AdvisoryRemark  a  inner join student_academic_info stdinfo " +
                    "on a.ALUN_NUMERO = stdinfo.ALUN_NUMERO  and a.ALUN_NUMERO_SEQ = stdinfo.ALUN_NUMERO_SEQ " +
                    "WHERE a.teacher_code=@teacher_code order by a.postDate desc", con);

            cmd.Parameters.AddWithValue("@teacher_code", txt_teacherCode.Text );
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            ViewState["TopicDataSet"] = ds;


            table = ds.Tables[0];

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
                     dv.Sort = ViewState["sortExpression"].ToString() + " asc";
            else          
                dv.Sort = ViewState["sortExpression"].ToString() + " desc";
          
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

    protected void OnSelectedIndexChanged(object sender, EventArgs e)
    {
        //Accessing BoundField Column
        //  string name = GridView1.SelectedRow.Cells[2].Text;

        //Accessing TemplateField Column controls
        string id = (GridView1.SelectedRow.FindControl("lblID") as Label).Text;
        string std_id = (GridView1.SelectedRow.FindControl("lblStdID") as Label).Text;
        string classCode = (GridView1.SelectedRow.FindControl("lblclass_code") as Label).Text;
        string instructor = (GridView1.SelectedRow.FindControl("lblAuthor") as Label).Text;


        Session["id"] = id;
        Session["stdID"] = std_id;
        Session["class_Code"] = classCode;

        Session["role_teacher"] = "teacher";
        Session["teacherCode"] = txt_teacherCode.Text;
        Session["teacherName"] = instructor;

        Session["advisory_history"] = "false";

        Response.Redirect("AdvisoryDetails.aspx");
    }

    protected void rOnSelectedIndexChanged(object sender, EventArgs e)
    {
        //Accessing BoundField Column
        //  string name = GridView1.SelectedRow.Cells[2].Text;

        //Accessing TemplateField Column controls
        string id = (rGridView.SelectedRow.FindControl("lblID") as Label).Text;
        string std_id = (rGridView.SelectedRow.FindControl("lblStdID") as Label).Text;
        string classCode = (rGridView.SelectedRow.FindControl("lblclass_code") as Label).Text;
        string rTeacherCode = (rGridView.SelectedRow.FindControl("lblCODE") as Label).Text;

        string rTeacherName = getTeacherNameByCode(rTeacherCode);


        Session["id"] = id;
        Session["stdID"] = std_id;
        Session["class_Code"] = classCode;

        Session["role_teacher"] = "teacher";
        Session["teacherCode"] = rTeacherCode;
        Session["teacherName"] = rTeacherName;
        Session["advisory_history"] = "true";


        Response.Redirect("AdvisoryDetails.aspx");
    }

   

    protected void setYearAndClassCode(string courseSubject)
    {

        // Regex r = new Regex(" +");
        string[] words = Regex.Split(courseSubject, " +");


        year = words[0];

        class_code = words[1];
    }

    //protected void btn_home_Click(object sender, EventArgs e)
    //{


    //    //if (Session["Position"].ToString() == "student")
    //    //{
    //    //    Session["Role_Type"] = "student";
    //    //    Response.Redirect("home.aspx");
    //    //}

    //    if (Session["Role_Type"] != null)
    //    {
    //        Response.Redirect("~/Academic/home.aspx");
    //    }
    //    else
    //        Response.Redirect("~/staff.aspx");

    //}

    protected void ImageButton2_Click(object sender, EventArgs e)
    {
        //if (Session["Position"].ToString() == "student")
        //{
        //    Session["Role_Type"] = "student";
        //    Response.Redirect("home.aspx");
        //}

        if (Session["Role_Type"] != null)
        {
            Response.Redirect("~/Academic/home.aspx");
        }
        else
        {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please login!'); window.location='../staff.aspx';", true);
        }
    }




    protected void subjectList_SelectedIndexChanged(object sender,
    System.EventArgs e)
    {
        //setYearAndClassCode(subjectlist.SelectedValue);  
        class_code = subjectlist.SelectedValue; 
    }

    protected void btn_search_Click(object sender, EventArgs e)
    {
        if (subjectlist.SelectedValue != "")
        {
                   
            rGridView.DataSource = null;
            rGridView.DataBind();

            bindRelatedList();
        }
    }


    protected void rGridView_Sorting(object sender, GridViewSortEventArgs e)
    {
        if (table != null)
        {
            string sortExpression = e.SortExpression;
            Image sortImage = new Image();
            ViewState["rsortExpression"] = e.SortExpression;

            if (GridViewSortDirection == SortDirection.Ascending)
            {
                GridViewSortDirection = SortDirection.Descending;
                SortRGridView(sortExpression, " desc");
                sortImage.ImageUrl = "../images/descending.png";
            }
            else
            {
                GridViewSortDirection = SortDirection.Ascending;
                SortRGridView(sortExpression, " asc");
                sortImage.ImageUrl = "../images/ascending.png";
            }
            int columnIndex = 0;
            foreach (DataControlFieldHeaderCell headerCell in rGridView.HeaderRow.Cells)
            {
                if (headerCell.ContainingField.SortExpression == e.SortExpression)
                {
                    columnIndex = rGridView.HeaderRow.Cells.GetCellIndex(headerCell);
                }
            }
            rGridView.HeaderRow.Cells[columnIndex].Controls.Add(sortImage);

            ClientScript.RegisterStartupScript(GetType(), "hello", " window.scrollBy(0, 500);", true);
        }
    }


    private void SortRGridView(string sortExpression, string direction)
    {
        
        try
        {
            if (table != null)
            {
                DataTable dt = rtable;

                DataView dv = new DataView(dt);
                dv.Sort = sortExpression + direction;

                rGridView.DataSource = dv;
                rGridView.DataBind();
            }

        }
        catch (Exception e) { throw e; }

    }


    private DataSet GetrViewState()
    {
        //Gets the ViewState
        return (DataSet)Session["rTopicDataSet"];
    }

    protected void rGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

        if (ViewState["rsortDirection"] != null
            && ViewState["rsortExpression"] != null
            && Session["rTopicDataSet"] != null)
        {
            DataSet myDataSet = GetrViewState();
            DataTable myDataTable = myDataSet.Tables[0];

            DataView dv = new DataView(myDataTable);

            if (GridViewSortDirection == SortDirection.Ascending)
                dv.Sort = ViewState["rsortExpression"].ToString() + " asc";
            else
                dv.Sort = ViewState["rsortExpression"].ToString() + " desc";

            rGridView.DataSource = dv;

            rGridView.PageIndex = e.NewPageIndex;

            rGridView.DataBind();
        }
        else
        {
            rGridView.DataSource = rtable;
            rGridView.PageIndex = e.NewPageIndex;
            rGridView.DataBind();
        }
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