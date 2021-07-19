using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Student_home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
       {
         
        if (Session["Role_Type"] == null)
        {
            Response.Write("<script>alert('Please Log In !'); window.location.href='../login.aspx'; </script>");
            return;
        }
        if (Session["Role_Type"] == "coordinator" && Session["position"] == "tutor")
        {

            DataView view2 = (DataView)SqlDataSource3.Select(new DataSourceSelectArguments());
            DataView view3 = (DataView)SqlDataSource2.Select(new DataSourceSelectArguments());
            for (int i = 0; i < view2.Count; i++)
            {
                if (view2[i]["ia"].ToString() == "True")
                {
                    if (view3[0]["new"].ToString() == "0")
                    {
                        Literal1.Text = @"<div class='monthebox'><a href='../Advice/AdvisoryRemark.aspx'><div id='item6' class='icon'></div><div class='text'>Instructors' Advices</div></a></div>";
                    }
                    else
                    {
                        Literal1.Text = @"<div class='monthebox'><a href='../Advice/AdvisoryRemark.aspx'><div id='item12' class='icon'></div><div class='text'>Instructors' Advices</div></a></div>";
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

                    Literal6.Text = @"<div class='monthebox'><a href='../YearTutor/TutorSubjects.aspx'><div id='item40' class='icon'></div><div class='text'>Year Tutor Subjects</div></a></div>";


                }

                if (view2[i]["ts"].ToString() == "True")
                {

                    Literal7.Text = @"<div class='monthebox'><a href='../Instructor/TeacherSubjects.aspx'><div id='item37' class='icon'></div><div class='text'>Teacher Subjects</div></a></div>";

                }



                if (view2[i]["ps"].ToString() == "True")
                {

                    Literal8.Text = @"<div class='monthebox'><a href='../ProgrammeCoordinator/ProgramSubjects.aspx'><div id='item38' class='icon'></div><div class='text'>Program Subjects</div></a></div>";


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

                    Literal17.Text = @"<div class='monthebox'><a href='../Instructor/AdviserAssistant.aspx'><div id='item41' class='icon'></div><div class='text'>Advisory Assistant</div></a></div>";


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

                    Literal20.Text = @"<div class='monthebox'><a href='http://172.26.122.66/aiweb/aiweb_sso.asp' target='_blank'><div id='item48' class='icon'></div><div class='text'>Academic Information Web</div></a></div>";


                }
            }
        }

        else
        {
            DataView view = (DataView)SqlDataSource1.Select(new DataSourceSelectArguments());
            DataView view1 = (DataView)SqlDataSource2.Select(new DataSourceSelectArguments());

            if (view[0]["ia"].ToString() == "True")
            {
                if (view1[0]["new"].ToString() == "0")
                {
                    Literal1.Text = @"<div class='monthebox'><a href='../Advice/AdvisoryRemark.aspx'><div id='item6' class='icon'></div><div class='text'>Instructors' Advices</div></a></div>";
                }
                else
                {
                    Literal1.Text = @"<div class='monthebox'><a href='../Advice/AdvisoryRemark.aspx'><div id='item12' class='icon'></div><div class='text'>Instructors' Advices</div></a></div>";
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

                Literal4.Text = @"<div class='monthebox'><a href='../Student/Attribute.aspx'><div id='item5' class='icon'></div><div class='text'>Attribute Planning</div></a></div>";


            }
            if (view[0]["lr"].ToString() == "True")
            {

                Literal5.Text = @"<div class='monthebox'><a href='../Student/Learning.aspx'><div id='item3' class='icon'></div><div class='text'>Learning Record</div></a></div>";


            }

            if (view[0]["ys"].ToString() == "True")
            {

                Literal6.Text = @"<div class='monthebox'><a href='../YearTutor/TutorSubjects.aspx'><div id='item40' class='icon'></div><div class='text'>Year Tutor Subjects</div></a></div>";


            }

            if (view[0]["ts"].ToString() == "True")
            {

                Literal7.Text = @"<div class='monthebox'><a href='../Instructor/TeacherSubjects.aspx'><div id='item37' class='icon'></div><div class='text'>Teacher Subjects</div></a></div>";

            }



            if (view[0]["ps"].ToString() == "True")
            {

                Literal8.Text = @"<div class='monthebox'><a href='../ProgrammeCoordinator/ProgramSubjects.aspx'><div id='item38' class='icon'></div><div class='text'>Program Subjects</div></a></div>";


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

                    Literal17.Text = @"<div class='monthebox'><a href='../Instructor/AdviserAssistant.aspx'><div id='item41' class='icon'></div><div class='text'>Advisory Assistant</div></a></div>";

                }
            }
            if (Session["Role_Type"] == "tutor")
            {
                if (view[0]["aa"].ToString() == "True")
                {

                    Literal17.Text = @"<div class='monthebox'><a href='../Instructor/AdviserAssistant.aspx'><div id='item41' class='icon'></div><div class='text'>Advisory Assistant</div></a></div>";

                }
            
            }
            /*if (view[0]["cm"].ToString() == "True")
            {

                Literal18.Text = @"<div class='monthebox'><a href='cm.aspx'><div id='item7' class='icon'></div><div class='text'>Career Management</div></a></div>";


            }*/
            if (view[0]["ds"].ToString() == "True")
            {

                Literal19.Text = @"<div class='monthebox'><a href='../Director/DirectorSubjects.aspx'><div id='item39' class='icon'></div><div class='text'>Director Subjects</div></a></div>";


            }
            if (view[0]["aiweb"].ToString() == "True")
            {

                Literal20.Text = @"<div class='monthebox'><a href='http://172.26.122.66/aiweb/aiweb_sso.asp' target='_blank'><div id='item48' class='icon'></div><div class='text'>Academic Information Web</div></a></div>";


            }
        }
       }
     
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
           Session.Clear();
		    Response.Redirect("http://172.26.122.66/aiweb/logout.asp");
          // Response.Redirect("~/staff.aspx");
    }
	 protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("http://www.ipm.edu.mo/en/index.php");
    }
}
