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
    {     if (!IsPostBack)
        {
         
        if (Session["Role_Type"] == null)
        {
            Response.Write("<script>alert('Please Log In !'); window.location.href='../staff.aspx'; </script>");
            return;
        }
       
        DataView view = (DataView)SqlDataSource1.Select(new DataSourceSelectArguments());
        if (view[0]["ia"].ToString() == "True")
        {
            Literal1.Text = @"<div class='monthebox'><a href='../Teacher/AdvisoryRemark.aspx'><div id='item6' class='icon'></div><div class='text'>Instructor Advices</div></a></div>";
           
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

            Literal6.Text = @"<div class='monthebox'><a href='../YearTutor/TutorSubjects.aspx'><div id='item4' class='icon'></div><div class='text'>Year Tutor Subjects</div></a></div>";
         

        }

        if (view[0]["ts"].ToString() == "True")
        {

            Literal7.Text = @"<div class='monthebox'><a href='../Instructor/TeacherSubjects.aspx'><div id='item5' class='icon'></div><div class='text'>Teacher Subjects</div></a></div>";
         
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

        if (Session["Role_Type"] == "manager")
        {
          

            if (view[0]["sr"].ToString() == "True")
            {

                Literal13.Text = @"<div class='monthebox'><a href='../Admin/ManagerSeminarInsert.aspx'><div id='item45' class='icon'></div><div class='text'>Seminar Registration</div></a></div>";


            }
        }
        if (Session["Role_Type"] == "schooladmin" || Session["Role_Type"] == "operator")
        {


            if (view[0]["sr"].ToString() == "True")
            {

                Literal13.Text = @"<div class='monthebox'><a href='../Admin/SchoolSeminarInsert.aspx'><div id='item45' class='icon'></div><div class='text'>Seminar Registration</div></a></div>";


            }
        }
        if (view[0]["uam"].ToString() == "True")
        {

            Literal14.Text = @"<div class='monthebox'><a href='../SystemAdmin/UserManagement.aspx'><div id='item10' class='icon'></div><div class='text'>User Account Management</div></a></div>";
          

        }
        if (view[0]["ugm"].ToString() == "True")
        {

            Literal15.Text = @"<div class='monthebox'><a href='../SystemAdmin/userGroup.aspx'><div id='item7' class='icon'></div><div class='text'>User Group Management</div></a></div>";
          

        }
        if (Session["Role_Type"] == "manager")
        {

            if (view[0]["sm"].ToString() == "True")
            {

                Literal16.Text = @"<div class='monthebox'><a href='../Admin/ManagerSeminar.aspx'><div id='item46' class='icon'></div><div class='text'>Seminar/Activity Management</div></a></div>";


            }
        }
        if (Session["Role_Type"] == "schooladmin" || Session["Role_Type"] == "operator")
        {
            if (view[0]["sm"].ToString() == "True")
            {

                Literal16.Text = @"<div class='monthebox'><a href='../Admin/SchoolSeminar.aspx'><div id='item46' class='icon'></div><div class='text'>Seminar/Activity Management</div></a></div>";


            }
        }

        if (view[0]["gm"].ToString() == "True")
        {

            Literal20.Text = @"<div class='monthebox'><a href='../Admin/GiftManagement.aspx'><div id='item61' class='icon'></div><div class='text'>Gift Management</div></a></div>";


        }
        if (view[0]["ge"].ToString() == "True")
        {

            Literal21.Text = @"<div class='monthebox'><a href='../Admin/GiftExchange.aspx'><div id='item62' class='icon'></div><div class='text'>Gift Exchange</div></a></div>";


        }
        if (view[0]["ger"].ToString() == "True")
        {

            Literal22.Text = @"<div class='monthebox'><a href='../Admin/GiftExchangeRegister.aspx'><div id='item63' class='icon'></div><div class='text'>Gift(Registered) Exchange</div></a></div>";


        }
        if (view[0]["sga"].ToString() == "True")
        {

            Literal23.Text = @"<div class='monthebox'><a href='../Admin/Analysis.aspx'><div id='item64' class='icon'></div><div class='text'>Seminar/Gift Analysis</div></a></div>";


        }
        if (view[0]["gs"].ToString() == "True")
        {

            Literal24.Text = @"<div class='monthebox'><a href='../Admin/GiftDetail.aspx'><div id='item65' class='icon'></div><div class='text'>Gift Statistics</div></a></div>";


        }



        if (view[0]["rm"].ToString() == "True")
        {

             Literal37.Text = @"<div class='monthebox'><a href='../Admin/CareerFormManage.aspx'><div id='item30' class='icon'></div><div class='text'>Recruitment Management</div></a></div>";
      

        }
        if (view[0]["rr"].ToString() == "True")
        {

              Literal35.Text = @"<div class='monthebox'><a href='../Admin/CareerForm.aspx'><div id='item28' class='icon'></div><div class='text'>Recruitment Registration</div></a></div>";
      

        }
        if (view[0]["ds"].ToString() == "True")
        {

            Literal19.Text = @"<div class='monthebox'><a href='../Director/DirectorSubjects.aspx'><div id='item7' class='icon'></div><div class='text'>Director Subjects</div></a></div>";


        }

    
      
      //Literal25.Text = @"<div class='monthebox'><a href='../Admin/ManageNotice.aspx'><div id='item30' class='icon'></div><div class='text'>Manage Notice</div></a></div>";

       Literal124.Text = @"<div class='monthebox'><a href='../Admin/StudentBonus.aspx'><div id='item1' class='icon'></div><div class='text'>Student Bonus Point</div></a></div>";
     
        Literal125.Text = @"<div class='monthebox'><a href='../Admin/SetGiftTime.aspx'><div id='item7' class='icon'></div><div class='text'>Gift Time Setting</div></a></div>";
 
        Literal126.Text = @"<div class='monthebox'><a href='../Admin/SeminarStudent.aspx'><div id='item43' class='icon'></div><div class='text'>Registered Student Management</div></a></div>";
      
        //Literal224.Text = @"<div class='monthebox'><a href='../Admin/ManageComments.aspx'><div id='item58' class='icon'></div><div class='text'>Manage Comments</div></a></div>";
    
     

      }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
           Session.Clear();
           Response.Redirect("~/staff.aspx");
    }
	 protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("http://www.ipm.edu.mo/en/index.php");
    }
}
