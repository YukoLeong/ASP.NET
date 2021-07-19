using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;
using System.Threading;
using System.Globalization;

public partial class Student_home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
       {
         
        if (Session["Role_Type"] == null)
        {
            Response.Write("<script>alert('Please Log In !'); window.location.href='../staff.aspx'; </script>");
            return;
        }
          if (Session["Role_Type"] == "coordinator")
        {
          // Literal100.Text = @"<div class='monthebox'><a href='../Academic/ProgramAbility.aspx'><div id='item5' class='icon'></div><div class='text'>Program Ability Management</div></a></div>";
           //Literal101.Text = @"<div class='monthebox'><a href='../Academic/ProgramCourse.aspx'><div id='item3' class='icon'></div><div class='text'>Subject Ability Management</div></a></div>";
        }
		
        if (Session["Role_Type"] == "coordinator" && Session["position_role"] == "tutor")
        {

            DataView view2 = (DataView)SqlDataSource3.Select(new DataSourceSelectArguments());
			DataView view1 = (DataView)SqlDataSource2.Select(new DataSourceSelectArguments());
			
            for (int i = 0; i < view2.Count; i++)
            {
                if (view2[i]["ia"].ToString() == "True")
                {
                 if (Int32.Parse(view1[0]["new"].ToString()) > 0)
                {
                   // Literal1.Text = @"<div class='monthebox'><a href='../Academic/AdvisoryRemark.aspx'><div id='item49' class='icon'></div><div class='text'>Instructors' Advices</div></a></div>";
						 
						
						StringBuilder str = new StringBuilder();
						string noti_num = "";
                        int msg_count = Int32.Parse(countNewMsg(Session["CODE"].ToString()));

                        string singleDigit_style = "top:0; right:0;color:#ffffff;margin: 6px 9px;float:right;";
                        string doubleDigit_style = "top:0; right:0;color:#ffffff;margin: 5px 5px;float:right;";

                        if (msg_count > 99)
                        {
                            noti_num = "<div style=' " + doubleDigit_style + " '> " + 99 + "</div>";
                        }
                        else
                        if (msg_count > 9)
                        {
                            noti_num = "<div style=' " + doubleDigit_style + " '> "
                        + Int32.Parse(countNewMsg(Session["CODE"].ToString())) + "</div>";
                        }
                        else
                        {
                            noti_num = "<div style=' " + singleDigit_style + " '> "
                          + Int32.Parse(countNewMsg(Session["CODE"].ToString())) + "</div>";
                        }

                        Literal1.Text = @"<div class='monthebox'><a href='../Academic/AdvisoryRemark.aspx'><div id='item49' class='icon hvr-buzz'>"+
                        noti_num + "</div><div class='text'>" + GetGlobalResourceObject("Resource", "sip_instrutor_comments") + "</div></a></div>";
				         
						 //留言板
                         Literal77.Text = @"<div class='monthebox'><a href='../Academic/InstructorComments.aspx'><div id='item58' class='icon'></div><div class='text'>" + GetGlobalResourceObject("Resource", "sip_lc_comments") + "</div></a></div>";
              
				   
                }
                else
                {
                    Literal1.Text = @"<div class='monthebox'><a href='../Academic/AdvisoryRemark.aspx'><div id='item12' class='icon'></div><div class='text'>" + GetGlobalResourceObject("Resource", "sip_instrutor_comments") + "</div></a></div>";
                }
                }
                if (view2[i]["sp"].ToString() == "True")
                {
                    Literal2.Text = @"<div class='monthebox'><a href='../Student/studentProfile.aspx'><div id='item1' class='icon'></div><div class='text'>Student Profile</div></a></div>";

                }

                if (view2[i]["ea"].ToString() == "True")
                {
                    Literal3.Text = @"<div class='monthebox'><a href='../Student/Community.aspx'><div id='item4' class='icon'></div><div class='text'>Extracurricular Activities</div></a></div>";

                }

                if (view2[i]["ap"].ToString() == "True")
                {

                    Literal4.Text = @"<div class='monthebox'><a href='../Student/Attribute.aspx'><div id='item5' class='icon'></div><div class='text'>Attribute Planning</div></a></div>";


                }
                if (view2[i]["lr"].ToString() == "True")
                {

                    Literal5.Text = @"<div class='monthebox'><a href='../Student/Learning.aspx'><div id='item3' class='icon'></div><div class='text'>Learning Record</div></a></div>";


                }

                if (view2[i]["ys"].ToString() == "True")
                {

                    Literal6.Text = @"<div class='monthebox'><a href='../Academic/TutorSubjects.aspx'><div id='item40' class='icon'></div><div class='text'>" + GetGlobalResourceObject("Resource", "sip_year_subject") + "</div></a></div>";


                }

                if (view2[i]["ts"].ToString() == "True")
                {

                    Literal7.Text = @"<div class='monthebox'><a href='../Academic/TeacherSubjects.aspx'><div id='item37' class='icon'></div><div class='text'>" + GetGlobalResourceObject("Resource", "sip_instructor_subject") + "</div></a></div>";
                    Literal218.Text = @"<div class='monthebox'><a href='../Academic/Attendance.aspx'><div id='item50' class='icon'></div><div class='text'>" + GetGlobalResourceObject("Resource", "sip_at_Title") + "</div></a></div>";
                   
                }



                if (view2[i]["ps"].ToString() == "True")
                {

                    Literal8.Text = @"<div class='monthebox'><a href='../Academic/ProgramSubjects.aspx'><div id='item38' class='icon'></div><div class='text'>" + GetGlobalResourceObject("Resource", "sip_program_subject") + "</div></a></div>";


                }

                if (view2[i]["cv"].ToString() == "True")
                {

                    Literal9.Text = @"<div class='monthebox'><a href='../Student/CurriculumVitae.aspx'><div id='item8' class='icon'></div><div class='text'>Curriculum Vitae</div></a></div>";


                }



                if (view2[i]["jms"].ToString() == "True")
                {

                    Literal10.Text = @"<div class='monthebox'><a href='../Student/JobMatchingSimulation.aspx'><div id='item2' class='icon'></div><div class='text'>Job Matching Simulation</div></a></div>";


                }


                if (view2[i]["lra"].ToString() == "True")
                {

                    Literal11.Text = @"<div class='monthebox'><a href='../Student/LearningRecordAttribute.aspx'><div id='item7' class='icon'></div><div class='text'>Learning Record Attribute</div></a></div>";


                }


                if (view2[i]["paa"].ToString() == "True")
                {

                   Literal12.Text = @"<div class='monthebox'><a href='../ProgramAttribute/CategoryWeight.aspx'><div id='item2' class='icon'></div><div class='text'>Program Attribute Analysis</div></a></div>";


                }

                if (view2[i]["sr"].ToString() == "True")
                {

                    Literal13.Text = @"<div class='monthebox'><a href='../Operator/SeminarAdding.aspx'><div id='item8' class='icon'></div><div class='text'>Seminar Registration</div></a></div>";


                }
                if (view2[i]["uam"].ToString() == "True")
                {

                    Literal14.Text = @"<div class='monthebox'><a href='../SystemAdmin/UserManagement.aspx'><div id='item10' class='icon'></div><div class='text'>User Account Management</div></a></div>";


                }
                if (view2[i]["ugm"].ToString() == "True")
                {

                    Literal15.Text = @"<div class='monthebox'><a href='../SystemAdmin/userGroup.aspx'><div id='item7' class='icon'></div><div class='text'>User Group Management</div></a></div>";


                }
                if (view2[i]["sm"].ToString() == "True")
                {

                    Literal16.Text = @"<div class='monthebox'><a href='../Operator/SeminarManagement.aspx'><div id='item7' class='icon'></div><div class='text'>Seminar Management</div></a></div>";


                }
                if (view2[i]["aa"].ToString() == "True")
                {

                    Literal17.Text = @"<div class='monthebox'><a href='../Academic/AdviserAssistantTutor.aspx'><div id='item41' class='icon'></div><div class='text'>" + GetGlobalResourceObject("Resource", "sip_advice_assist") + "</div></a></div>";
                   

                }
                if (view2[i]["str"].ToString() == "True")
                {

                    Literal18.Text = @"<div class='monthebox'><a href='cm.aspx'><div id='item7' class='icon'></div><div class='text'>Career Management</div></a></div>";


                }
                if (view2[i]["ds"].ToString() == "True")
                {

                    Literal19.Text = @"<div class='monthebox'><a href='../Director/DirectorSubjects.aspx'><div id='item7' class='icon'></div><div class='text'>Director Subjects</div></a></div>";


                }
                if (view2[i]["aiweb"].ToString() == "True")
                {

                    Literal20.Text = @"<div class='monthebox'><a href='http://172.26.122.66/aiweb/aiweb_sso.asp' target='_blank'><div id='item48' class='icon'></div><div class='text'>" + GetGlobalResourceObject("Resource", "sip_aiw") + "</div></a></div>";


                }
				
            }
        }

        else
        {
            DataView view = (DataView)SqlDataSource1.Select(new DataSourceSelectArguments());
            DataView view1 = (DataView)SqlDataSource2.Select(new DataSourceSelectArguments());

            if (view[0]["ia"].ToString() == "True")
            {
                if (view1[0]["new"]!=null && Int32.Parse(view1[0]["new"].ToString()) > 0)
                {
                   // Literal1.Text = @"<div class='monthebox'><a href='../Academic/AdvisoryRemark.aspx'><div id='item49' class='icon'></div><div class='text'>Instructors' Advices</div></a></div>";
						 
						
						StringBuilder str = new StringBuilder();
						string noti_num = "";
                        int msg_count = Int32.Parse(countNewMsg(Session["CODE"].ToString()));

                        string singleDigit_style = "top:0; right:0;color:#ffffff;margin: 6px 9px;float:right;";
                        string doubleDigit_style = "top:0; right:0;color:#ffffff;margin: 5px 5px;float:right;";

                        if (msg_count > 99)
                        {
                            noti_num = "<div style=' " + doubleDigit_style + " '> " + 99 + "</div>";
                        }
                        else
                        if (msg_count > 9)
                        {
                            noti_num = "<div style=' " + doubleDigit_style + " '> "
                        + Int32.Parse(countNewMsg(Session["CODE"].ToString())) + "</div>";
                        }
                        else
                        {
                            noti_num = "<div style=' " + singleDigit_style + " '> "
                          + Int32.Parse(countNewMsg(Session["CODE"].ToString())) + "</div>";
                        }

                        Literal1.Text = @"<div class='monthebox'><a href='../Academic/AdvisoryRemark.aspx'><div id='item49' class='icon hvr-buzz'>"+
                        noti_num + "</div><div class='text'>" + GetGlobalResourceObject("Resource", "sip_instrutor_comments") + "</div></a></div>";
				   
				   
                }
                else
                {
                    Literal1.Text = @"<div class='monthebox'><a href='../Academic/AdvisoryRemark.aspx'><div id='item12' class='icon'></div><div class='text'>" + GetGlobalResourceObject("Resource", "sip_instrutor_comments") + "</div></a></div>";
                }
            }
            if (view[0]["sp"].ToString() == "True")
            {
                Literal2.Text = @"<div class='monthebox'><a href='../Student/studentProfile.aspx'><div id='item1' class='icon'></div><div class='text'>" + GetGlobalResourceObject("Resource", "sip_std_profile") + "</div></a></div>";

            }

            if (view[0]["ea"].ToString() == "True")
            {
                Literal3.Text = @"<div class='monthebox'><a href='../Student/Community.aspx'><div id='item4' class='icon'></div><div class='text'>" + GetGlobalResourceObject("Resource", "sip_ex_active") + "</div></a></div>";

            }

            if (view[0]["ap"].ToString() == "True")
            {

                Literal4.Text = @"<div class='monthebox'><a href='../Student/Attribute.aspx'><div id='item5' class='icon'></div><div class='text'>Attribute Planning</div></a></div>";


            }
            if (view[0]["lr"].ToString() == "True")
            {

                Literal5.Text = @"<div class='monthebox'><a href='../Student/Learning.aspx'><div id='item3' class='icon'></div><div class='text'>Learning Record</div></a></div>";


            }

            if (view[0]["ys"].ToString() == "True")
            {

                Literal6.Text = @"<div class='monthebox'><a href='../Academic/TutorSubjects.aspx'><div id='item40' class='icon'></div><div class='text'>" + GetGlobalResourceObject("Resource", "sip_year_subject") + "</div></a></div>";


            }

            if (view[0]["ts"].ToString() == "True")
            {

                Literal7.Text = @"<div class='monthebox'><a href='../Academic/TeacherSubjects.aspx'><div id='item37' class='icon'></div><div class='text'>" + GetGlobalResourceObject("Resource", "sip_instructor_subject") + "</div></a></div>";
                //留言板
                Literal77.Text = @"<div class='monthebox'><a href='../Academic/InstructorComments.aspx'><div id='item58' class='icon'></div><div class='text'>" + GetGlobalResourceObject("Resource", "sip_lc_comments") + "</div></a></div>";
              	Literal218.Text = @"<div class='monthebox'><a href='../Academic/Attendance.aspx'><div id='item50' class='icon'></div><div class='text'>" + GetGlobalResourceObject("Resource", "sip_at_Title") + "</div></a></div>";
                   
            }



            if (view[0]["ps"].ToString() == "True")
            {

                Literal8.Text = @"<div class='monthebox'><a href='../Academic/ProgramSubjects.aspx'><div id='item38' class='icon'></div><div class='text'>" + GetGlobalResourceObject("Resource", "sip_program_subject") + "</div></a></div>";


            }

            if (view[0]["cv"].ToString() == "True")
            {

                Literal9.Text = @"<div class='monthebox'><a href='../Student/CurriculumVitae.aspx'><div id='item8' class='icon'></div><div class='text'>Curriculum Vitae</div></a></div>";


            }



            if (view[0]["jms"].ToString() == "True")
            {

                Literal10.Text = @"<div class='monthebox'><a href='../Student/JobMatchingSimulation.aspx'><div id='item2' class='icon'></div><div class='text'>Job Matching Simulation</div></a></div>";


            }


            if (view[0]["lra"].ToString() == "True")
            {

                Literal11.Text = @"<div class='monthebox'><a href='../Student/LearningRecordAttribute.aspx'><div id='item7' class='icon'></div><div class='text'>Learning Record Attribute</div></a></div>";


            }


            if (view[0]["paa"].ToString() == "True")
            {

                Literal12.Text = @"<div class='monthebox'><a href='../ProgramAttribute/CategoryWeight.aspx'><div id='item2' class='icon'></div><div class='text'>Program Attribute Analysis</div></a></div>";


            }

            if (view[0]["sr"].ToString() == "True")
            {

                Literal13.Text = @"<div class='monthebox'><a href='../Operator/SeminarAdding.aspx'><div id='item8' class='icon'></div><div class='text'>Seminar Registration</div></a></div>";


            }
            if (view[0]["uam"].ToString() == "True")
            {

                Literal14.Text = @"<div class='monthebox'><a href='../SystemAdmin/UserManagement.aspx'><div id='item10' class='icon'></div><div class='text'>User Account Management</div></a></div>";


            }
            if (view[0]["ugm"].ToString() == "True")
            {

                Literal15.Text = @"<div class='monthebox'><a href='../SystemAdmin/userGroup.aspx'><div id='item7' class='icon'></div><div class='text'>User Group Management</div></a></div>";


            }
            if (view[0]["sm"].ToString() == "True")
            {

                Literal16.Text = @"<div class='monthebox'><a href='../Operator/SeminarManagement.aspx'><div id='item7' class='icon'></div><div class='text'>Seminar Management</div></a></div>";


            }
             if (Session["Role_Type"] == "coordinator")
            {
                if (view[0]["aa"].ToString() == "True")
                {

                    Literal17.Text = @"<div class='monthebox'><a href='../Academic/AdviserAssistant.aspx'><div id='item41' class='icon'></div><div class='text'>" + GetGlobalResourceObject("Resource", "sip_advice_assist") + "</div></a></div>";

                }
            }
           if (Session["Role_Type"] == "tutor")
			     {
                if (view[0]["aa"].ToString() == "True")
                {

                    Literal17.Text = @"<div class='monthebox'><a href='../Academic/AdviserAssistantTutor.aspx'><div id='item41' class='icon'></div><div class='text'>" + GetGlobalResourceObject("Resource", "sip_advice_assist") + "</div></a></div>";

                }
            
            }
            /*if (view[0]["cm"].ToString() == "True")
            {

                Literal18.Text = @"<div class='monthebox'><a href='cm.aspx'><div id='item7' class='icon'></div><div class='text'>Career Management</div></a></div>";


            }*/
            if (view[0]["ds"].ToString() == "True")
            {

                Literal19.Text = @"<div class='monthebox'><a href='../Director/DirectorSubjects.aspx'><div id='item39' class='icon'></div><div class='text'>" + GetGlobalResourceObject("Resource", "sip_director_subject") + "</div></a></div>";


            }
            if (view[0]["aiweb"].ToString() == "True")
            {

                Literal20.Text = @"<div class='monthebox'><a href='http://172.26.122.66/aiweb/aiweb_sso.asp' target='_blank'><div id='item48' class='icon'></div><div class='text'>" + GetGlobalResourceObject("Resource", "sip_aiw") + "</div></a></div>";


            }
			 
        }
       }
     
    }
	
	private string countNewMsg(string code)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ToString());
        int totalUnreadMsg = 0;

        try
        {
            conn.Open();
            StringBuilder sb = new StringBuilder();

            sb.Append("SELECT COUNT(*)  as 'UnreadMsg' ");
            sb.Append("FROM AdvisoryRemark ");
            sb.Append("WHERE status = 'Unread' and teacher_code=@code ");

            SqlCommand cmd = new SqlCommand(sb.ToString(), conn);

            cmd.Parameters.AddWithValue("@code", code);
			


            SqlDataReader rdr = null;
            rdr = cmd.ExecuteReader();

            while (rdr.Read())
            {
                totalUnreadMsg = Int32.Parse(rdr["UnreadMsg"].ToString());
            }



        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }

        return totalUnreadMsg.ToString();
    }

    protected void LogOut_Click(object sender, EventArgs e)
    {
           Session.Clear();
		   //Response.Redirect("http://172.26.122.66/aiweb/logout.asp");
           Response.Redirect("~/staff.aspx");
    }
	 protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("http://www.ipm.edu.mo/en/index.php");
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
