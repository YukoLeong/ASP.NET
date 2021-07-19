using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class schoolStaff : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
          if (!IsPostBack)
        {
         
        if (Session["Role_Type"] == "teacher" || Session["Role_Type"] == "coordinator" || Session["Role_Type"] == "tutor" || Session["Role_Type"] == "director"||Session["Position"] != "")
        {
          
            Session["position"] = "studentview";

            DataView view = (DataView)SqlDataSource1.Select(new DataSourceSelectArguments());
               Literal2.Text = @"<div class='monthebox'><a href='../Student/AcademicResult.aspx'><div id='item15' class='icon'></div><div class='text'>Academic Results</div></a></div>";

               if (view[0]["ia"].ToString() == "True")
               {
                   Literal1.Text = @"<div class='monthebox'><a href='../Student/AdvisoryRemark.aspx'><div id='item12' class='icon'></div><div class='text'>Instructors' Advices</div></a></div>";
               }
               if (view[0]["sp"].ToString() == "True")
               {
                  // Literal2.Text = @"<div class='monthebox'><a href='../Student/studentProfile.aspx'><div id='item1' class='icon'></div><div class='text'>Student Profile</div></a></div>";

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
            MultiView1.ActiveViewIndex = Convert.ToInt32(Session["index"]);
          
        }
     
        else
        {
            Response.Write("<script>alert('Please Log In !'); window.location.href='../staff.aspx'; </script>");
            return;
        }


        if (MultiView1.ActiveViewIndex == 0)
        {
            ePortfolio.ForeColor = System.Drawing.Color.White;
            AcademicNavigator.ForeColor = System.Drawing.Color.Gray;
        }
        else if (MultiView1.ActiveViewIndex == 1)
        {
            AcademicNavigator.ForeColor = System.Drawing.Color.White;
            ePortfolio.ForeColor = System.Drawing.Color.Gray;
        }


       }
        
    }
    protected void Close_Click(object sender, EventArgs e)
    {   
        Session.Add("Index", "0");
        Session.Remove("position");
        Response.Write("<script language='javascript'> { window.close(); }</script>");
    }
    protected void ePortfolio_Click(object sender, EventArgs e)
    {
        Session.Add("Index", "0");
        ePortfolio.ForeColor = System.Drawing.Color.White;
        AcademicNavigator.ForeColor = System.Drawing.Color.Gray;
        MultiView1.ActiveViewIndex = 0;

    }
    protected void AcademicNavigator_Click(object sender, EventArgs e)
    {
        Session.Add("Index", "1");
        AcademicNavigator.ForeColor = System.Drawing.Color.White;
        ePortfolio.ForeColor = System.Drawing.Color.Gray;
        MultiView1.ActiveViewIndex = 1;
   
    }
}
