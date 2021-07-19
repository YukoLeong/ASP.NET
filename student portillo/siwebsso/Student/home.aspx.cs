using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Student_home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
         if (Session["ChineseName"] != null)
        {
            Label2.Text = Session["ChineseName"].ToString();
           
           
        }
           if (Session["student_id"] != null &&  Session["Name_pt"]!=null)
        {
           // Label1.Text=  Session["student_id"].ToString();
            Label3.Text = Session["Name_pt"].ToString();
          
        }
           if (!IsPostBack)
             {

               if (Session["Role_Type"] == null)
               {
                   Response.Write("<script>alert('Please Log In !'); window.location.href='../home.aspx'; </script>");
                   return;
               }

               DataView view = (DataView)SqlDataSource1.Select(new DataSourceSelectArguments());

               DataView view1 = (DataView)SqlDataSource2.Select(new DataSourceSelectArguments());

               if (view[0]["ia"].ToString() == "True")
               {
                   if (view1[0]["new"].ToString() == "0")
                   {
                       Literal1.Text = @"<div class='monthebox'><a href='../Student/AdvisoryRemark.aspx'><div id='item6' class='icon'></div><div class='text'>Instructors' Advices</div></a></div>";
                   }
                   else
                   {
                       Literal1.Text = @"<div class='monthebox'><a href='../Student/AdvisoryRemark.aspx'><div id='item12' class='icon'></div><div class='text'>Instructors' Advices</div></a></div>";
                   }
               }
               if (view[0]["sp"].ToString() == "True")
               {
                   Literal2.Text = @"<div class='monthebox'><a href='../Student/studentProfile.aspx'><div id='item1' class='icon'></div><div class='text'>Student Profile</div></a></div>";

               }

               if (view[0]["ea"].ToString() == "True")
               {
                   Literal3.Text = @"<div class='monthebox'><a href='../Student/Community.aspx'><div id='item4' class='icon'></div><div class='text'>Extracurricular Activities</div></a></div>";

               }

               if (view[0]["ap"].ToString() == "True")
               {

                   Literal4.Text = @"<div class='monthebox'><a href='../Student/Attribute.aspx'><div id='item35' class='icon'></div><div class='text'>Attribute Planning</div></a></div>";


               }
               if (view[0]["lr"].ToString() == "True")
               {

                   Literal5.Text = @"<div class='monthebox'><a href='../Student/Learning.aspx'><div id='item3' class='icon'></div><div class='text'>Learning Record</div></a></div>";


               }

               if (view[0]["ys"].ToString() == "True")
               {

                   Literal6.Text = @"<div class='monthebox'><a href='../YearTutor/TutorSubjects.aspx'><div id='item4' class='icon'></div><div class='text'>Year Tutor Subjects</div></a></div>";


               }

               if (view[0]["ts"].ToString() == "True")
               {

                   Literal7.Text = @"<div class='monthebox'><a href='../Teacher/TeacherSubjects.aspx'><div id='item37' class='icon'></div><div class='text'>Teacher Subjects</div></a></div>";

               }



               if (view[0]["ps"].ToString() == "True")
               {

                   Literal8.Text = @"<div class='monthebox'><a href='../ProgrammeCoordinator/ProgramSubjects.aspx'><div id='item6' class='icon'></div><div class='text'>Program Subjects</div></a></div>";


               }

               if (view[0]["cv"].ToString() == "True")
               {

                   Literal9.Text = @"<div class='monthebox'><a href='../Student/CurriculumVitae.aspx'><div id='item31' class='icon'></div><div class='text'>Curriculum Vitae</div></a></div>";


               }



               if (view[0]["jms"].ToString() == "True")
               {

                   Literal10.Text = @"<div class='monthebox'><a href='../Student/JobMatchingSimulation.aspx'><div id='item36' class='icon'></div><div class='text'>Job Matching Simulation</div></a></div>";


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
               if (view[0]["aa"].ToString() == "True")
               {

                   Literal17.Text = @"<div class='monthebox'><a href='../Teacher/AdviserAnalysis.aspx'><div id='item7' class='icon'></div><div class='text'>Advisory Assistant</div></a></div>";


               }
               if (view[0]["ra"].ToString() == "True")
               {

                   Literal18.Text = @"<div class='monthebox'><a href='../Student/StudentResultAnalysis.aspx'><div id='item8' class='icon'></div><div class='text'>Result Analysis</div></a></div>";


               }
               if (view[0]["str"].ToString() == "True")
               {

                   Literal19.Text = @"<div class='monthebox'><a href='../Student/CareerFormStudent.aspx'><div id='item29' class='icon'></div><div class='text'>Student Recruitment</div></a></div>";


               }
               Literal20.Text = @"<div class='monthebox'><a href='http://172.26.122.66/siw/mainFrame.htm'><div id='item13' class='icon'></div><div class='text'>News</div></a></div>";
               Literal41.Text = @"<div class='monthebox'><a href='http://172.26.122.66/siw/stud_info.asp'><div id='item47' class='icon'></div><div class='text'>Student Profile</div></a></div>";
			   Literal21.Text = @"<div class='monthebox'><a href='http://172.26.122.66/siw/enroll_form.asp'><div id='item14' class='icon'></div><div class='text'>Enrollment Form</div></a></div>";
               Literal22.Text = @"<div class='monthebox'><a href='http://172.26.122.66/siw/grade.asp'><div id='item15' class='icon'></div><div class='text'>Grade & Absence</div></a></div>";
               Literal23.Text = @"<div class='monthebox'><a href='http://172.26.122.66/siw/time_stud.asp'><div id='item16' class='icon'></div><div class='text'>Class Time</div></a></div>";
               Literal24.Text = @"<div class='monthebox'><a href='http://172.26.122.66/siw/examtime_stud.asp'><div id='item17' class='icon'></div><div class='text'>Examination Time</div></a></div>";
               Literal25.Text = @"<div class='monthebox'><a href='http://172.26.122.66/siw/supplexamtime_stud.asp'><div id='item18' class='icon'></div><div class='text'>Re-sit Examination Time</div></a></div>";
               Literal26.Text = @"<div class='monthebox'><a href='https://csc.ipm.edu.mo/srms/eng/others/cms/reports/cmnotice.asp' target='_blank'><div id='item19' class='icon'></div><div class='text'>Class Cancellation</div></a></div>";
               Literal27.Text = @"<div class='monthebox'><a href='http://172.26.122.66/siw/payment.asp'><div id='item20' class='icon'></div><div class='text'>Payment & receipt</div></a></div>";
               Literal28.Text = @"<div class='monthebox'><a href='http://172.26.122.66/siw/dn_check.asp'><div id='item21' class='icon'></div><div class='text'>Debit Note</div></a></div>";
               Literal29.Text = @"<div class='monthebox'><a href='http://172.26.122.66/siw/epay_start.asp' target='_blank'><div id='item22' class='icon'></div><div class='text'>ePayment</div></a></div>";
               Literal30.Text = @"<div class='monthebox'><a href='http://172.26.122.66/siw/surveytest.asp?la=en'><div id='item23' class='icon'></div><div class='text'>Online Survey</div></a></div>";
               Literal31.Text = @"<div class='monthebox'><a href='http://172.26.122.66/siw/locker_check.asp' target='_blank'><div id='item24' class='icon'></div><div class='text'>Locker Application</div></a></div>";
               Literal32.Text = @"<div class='monthebox'><a href='http://172.26.122.66/siw/student_card_regulation.asp'><div id='item25' class='icon'></div><div class='text'>Smart Card</div></a></div>";
               Literal33.Text = @"<div class='monthebox'><a href='http://172.26.122.66/siw/cidp_form.asp'><div id='item26' class='icon'></div><div class='text'>CIDP Agreement</div></a></div>";
               Literal34.Text = @"<div class='monthebox'><a href='http://172.26.122.66/siw/venue_timetable.asp'><div id='item27' class='icon'></div><div class='text'>Venue Timetable</div></a></div>";
               Literal38.Text = @"<div class='monthebox'><a href='https://wapps.ipm.edu.mo/rvdweb/pd_apply.asp?netid=" + Session["netid"] + "&studid=" + Session["studid"] + "&auth=Y' target='_blank'><div id='item33' class='icon'></div><div class='text'>Application For Certificate</div></a></div>";
               Literal39.Text = @"<div class='monthebox'><a href='http://www.ipm.edu.mo/student_corner/en/typhoons_and_heavy_rain.php' target='_blank'><div id='item32' class='icon'></div><div class='text'>Typhoons and Heavy Rain</div></a></div>";
               Literal40.Text = @"<div class='monthebox'><a href='http://172.26.122.66/siw/contactus.asp'><div id='item34' class='icon'></div><div class='text'>Contact Us</div></a></div>";
              // Literal36.Text = @"<div class='monthebox'><a href='../Student/CareerFormStudent.aspx'><div id='item29' class='icon'></div><div class='text'>Student Recruitment</div></a></div>";
              
               




               if (MultiView1.ActiveViewIndex == 4)
               {
                   
                  
                   LinkButton8.CssClass = "change1";
                   LinkButton2.CssClass = "change";
                   LinkButton4.CssClass = "change";
                   LinkButton3.CssClass = "change";
                   LinkButton6.CssClass = "change";
                   LinkButton7.CssClass = "change";


               }
                 if (Session["dex"] == "0")
        {
            MultiView1.ActiveViewIndex = 0; 
            LinkButton5.CssClass = "change";
            LinkButton2.CssClass = "change1";
            LinkButton3.CssClass = "change";
            LinkButton4.CssClass = "change";
            LinkButton6.CssClass = "change";
            LinkButton7.CssClass = "change";
            LinkButton8.CssClass = "change";
        }
        if (Session["dex"] == "1")
        { 
            MultiView1.ActiveViewIndex = 1;
            LinkButton5.CssClass = "change";
            LinkButton3.CssClass = "change1";
            LinkButton2.CssClass = "change";
            LinkButton4.CssClass = "change";
            LinkButton6.CssClass = "change";
            LinkButton7.CssClass = "change";
            LinkButton8.CssClass = "change";
      
        }
        if (Session["dex"] == "2")
        { 
            MultiView1.ActiveViewIndex = 2;
           LinkButton5.CssClass = "change";
           LinkButton4.CssClass = "change1";
           LinkButton2.CssClass = "change";
           LinkButton3.CssClass = "change";
           LinkButton6.CssClass = "change";
           LinkButton7.CssClass = "change";
           LinkButton8.CssClass = "change";
        }
        if (Session["dex"] == "3")
        {
            MultiView1.ActiveViewIndex = 3;
            LinkButton5.CssClass = "change1";
            LinkButton7.CssClass = "change";
            LinkButton2.CssClass = "change";
            LinkButton3.CssClass = "change";
            LinkButton4.CssClass = "change";
            LinkButton6.CssClass = "change";
            LinkButton8.CssClass = "change";
        }
        if (Session["dex"] == "4")
        {
            MultiView1.ActiveViewIndex = 4;
           LinkButton5.CssClass = "change1";
           LinkButton8.CssClass = "change";
           LinkButton2.CssClass = "change";
           LinkButton3.CssClass = "change";
           LinkButton4.CssClass = "change";
           LinkButton6.CssClass = "change";
           LinkButton7.CssClass = "change";
      
        }

           if (Session["dex"] == "5")
        {
            MultiView1.ActiveViewIndex = 5;
            LinkButton5.CssClass = "change1";
            LinkButton6.CssClass = "change";
            LinkButton2.CssClass = "change";
            LinkButton3.CssClass = "change";
            LinkButton4.CssClass = "change";
            LinkButton7.CssClass = "change";
            LinkButton8.CssClass = "change";

        }

          if (Session["dex"] == "6")
           {
               MultiView1.ActiveViewIndex = 5;
            LinkButton5.CssClass = "change1";
            LinkButton6.CssClass = "change";
            LinkButton2.CssClass = "change";
            LinkButton3.CssClass = "change";
            LinkButton4.CssClass = "change";
            LinkButton7.CssClass = "change";
            LinkButton8.CssClass = "change";
           }

           }
      
      
    }



   



    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("http://172.26.122.66/siw/logout.asp");
     // Response.Redirect("https://wire.ipm.edu.mo/cas/logout?url=http://172.25.2.163/ep/home.aspx");
   
     
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {

        Session.Add("dex", "0");
        LinkButton5.CssClass = "change";
        LinkButton2.CssClass = "change1";
        LinkButton3.CssClass = "change";
        LinkButton4.CssClass = "change";
        LinkButton6.CssClass = "change";
        LinkButton7.CssClass = "change";
        LinkButton8.CssClass = "change";
      
       
        MultiView1.ActiveViewIndex = 0;       
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Session.Add("dex", "1");
        LinkButton5.CssClass = "change";
        LinkButton3.CssClass = "change1";
        LinkButton2.CssClass = "change";
        LinkButton4.CssClass = "change";
        LinkButton6.CssClass = "change";
        LinkButton7.CssClass = "change";
        LinkButton8.CssClass = "change";
      
      
        MultiView1.ActiveViewIndex = 1;
   
    }
    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        Session.Add("dex", "2");
        LinkButton5.CssClass = "change";
        LinkButton4.CssClass = "change1";
        LinkButton2.CssClass = "change";
        LinkButton3.CssClass = "change";
        LinkButton6.CssClass = "change";
        LinkButton7.CssClass = "change";
        LinkButton8.CssClass = "change";
      
       
        MultiView1.ActiveViewIndex = 2;
    }
    protected void LinkButton8_Click(object sender, EventArgs e)
    {
        Session.Add("dex", "4");
        LinkButton5.CssClass = "change1";
        LinkButton8.CssClass = "change";
        LinkButton2.CssClass = "change";
        LinkButton3.CssClass = "change";
        LinkButton4.CssClass = "change";
        LinkButton6.CssClass = "change";
        LinkButton7.CssClass = "change";
      
      
       
        MultiView1.ActiveViewIndex = 4;
    }
    protected void LinkButton7_Click(object sender, EventArgs e)
    {
        Session.Add("dex", "3");

        LinkButton5.CssClass = "change1";
        LinkButton7.CssClass = "change";
        LinkButton2.CssClass = "change";
        LinkButton3.CssClass = "change";
        LinkButton4.CssClass = "change";
        LinkButton6.CssClass = "change";
        LinkButton8.CssClass = "change";
      

        MultiView1.ActiveViewIndex = 3;
    }
    protected void LinkButton6_Click(object sender, EventArgs e)
    {
        Session.Add("dex", "5");

        LinkButton5.CssClass = "change1";
        LinkButton6.CssClass = "change";
        LinkButton2.CssClass = "change";
        LinkButton3.CssClass = "change";
        LinkButton4.CssClass = "change";
        LinkButton7.CssClass = "change";
        LinkButton8.CssClass = "change";

      

        MultiView1.ActiveViewIndex = 5;
    }


    protected void LinkButton5_Click(object sender, EventArgs e)
    {
       Session.Add("dex", "4");
        LinkButton5.CssClass = "change1";
        LinkButton8.CssClass = "change";
        LinkButton2.CssClass = "change";
        LinkButton3.CssClass = "change";
        LinkButton4.CssClass = "change";
        LinkButton6.CssClass = "change";
        LinkButton7.CssClass = "change";

      

        MultiView1.ActiveViewIndex = 4;
    }
	
	 protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("http://www.ipm.edu.mo/en/index.php");
    }
}
