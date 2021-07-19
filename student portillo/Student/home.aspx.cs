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
        if (Session["ChineseName"] != null)
        {
            Label2.Text = Session["ChineseName"].ToString();

        }
        if (Session["student_id"] != null && Session["Name_pt"] != null)
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


            if (view[0]["ia"].ToString() == "True")
            {
			if (Session["ALUN_NUMERO"] != null && Session["ALUN_NUMERO_SEQ"]!=null)
            {
                if (chkNewMsg(Session["ALUN_NUMERO"].ToString(), Session["ALUN_NUMERO_SEQ"].ToString()))
                {
                    newMsgPanel.Visible = true;
					
					
					string noti_num = "";
                    int msg_count = Int32.Parse(countNewMsg(Session["ALUN_NUMERO"].ToString(), Session["ALUN_NUMERO_SEQ"].ToString()));

                    string singleDigit_style = "position:absolute;top:0; right:0;color:#ffffff;margin: 6px 9px;";
                    string doubleDigit_style = "position:absolute;top:0; right:0;color:#ffffff;margin: 5px;";

					if (msg_count >99)
					{
						 noti_num = "<div style=' " + doubleDigit_style + " '> "+ 99 + "</div>";
					}
					else
                    if (msg_count > 9)
                    {
                        noti_num = "<div style=' " + doubleDigit_style + " '> "
                    + Int32.Parse(countNewMsg(Session["ALUN_NUMERO"].ToString(), Session["ALUN_NUMERO_SEQ"].ToString())) + "</div>";
                    }
                    else
                    {
                        noti_num = "<div style=' " + singleDigit_style + " '> "
                      + Int32.Parse(countNewMsg(Session["ALUN_NUMERO"].ToString(), Session["ALUN_NUMERO_SEQ"].ToString())) + "</div>";
                    }
                   

                    Literal1.Text = @"<div class='monthebox'><a href='../Student/AdvisoryRemark.aspx'><div id='item49' class='icon hvr-buzz'>"+
                        noti_num + "</div><div class='text'>" + GetGlobalResourceObject("Resource", "sip_instrutor_comments") + "</div></a></div>";

                }
                else
                {
                    newMsgPanel.Visible = false;
                    Literal1.Text = @"<div class='monthebox'><a href='../Student/AdvisoryRemark.aspx'><div id='item12' class='icon'></div><div class='text'>" + GetGlobalResourceObject("Resource", "sip_instrutor_comments") + "</div></a></div>";
                }
            }
                //Literal1.Text = @"<div class='monthebox'><a href='../Student/AdvisoryRemark.aspx'><div id='item12' class='icon'></div><div class='text'>Instructors' Comments</div></a></div>";

            }
            if (view[0]["sp"].ToString() == "True")
            {
                Literal2.Text = @"<div class='monthebox'><a href='../Student/studentProfile.aspx'><div id='item53' class='icon'></div><div class='text'>" + GetGlobalResourceObject("Resource", "sip_std_profile") + "</div></a></div>";

            }

            if (view[0]["ea"].ToString() == "True")
            {
                Literal3.Text = @"<div class='monthebox'><a href='../Student/Community.aspx'><div id='item56' class='icon'></div><div class='text'>" + GetGlobalResourceObject("Resource", "sip_ex_active") + "</div></a></div>";

            }

            if (view[0]["ap"].ToString() == "True")
            {

                Literal4.Text = @"<div class='monthebox'><a href='../Student/Attribute.aspx'><div id='item35' class='icon'></div><div class='text'>Attribute Planning</div></a></div>";


            }
            if (view[0]["lr"].ToString() == "True")
            {

                Literal5.Text = @"<div class='monthebox'><a href='../Student/Learning.aspx'><div id='item54' class='icon'></div><div class='text'>" + GetGlobalResourceObject("Resource", "sip_learn_record") + "</div></a></div>";


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

                Literal9.Text = @"<div class='monthebox'><a href='../Student/CurriculumVitae.aspx'><div id='item57' class='icon'></div><div class='text'>" + GetGlobalResourceObject("Resource", "sip_cv") + "</div></a></div>";


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
            if (view[0]["ar"].ToString() == "True")
            {
                Literal123.Text = @"<div class='monthebox'><a href='../Student/AcademicRecord.aspx'><div id='item15' class='icon'></div><div class='text'>" + GetGlobalResourceObject("Resource", "sip_acad_results") + "</div></a></div>";
            
            }
          
            if (view[0]["ra"].ToString() == "True")
            {

                Literal18.Text = @"<div class='monthebox'><a href='../Student/StudentResultAnalysis.aspx'><div id='item55' class='icon'></div><div class='text'>" + GetGlobalResourceObject("Resource", "sip_result_analysis") + "</div></a></div>";


            }
            if (view[0]["rg"].ToString() == "True")
            {

                Literal42.Text = @"<div class='monthebox'><a href='../Student/RegisterGift.aspx'><div id='item51' class='icon'></div><div class='text'>" + GetGlobalResourceObject("Resource", "sip_reg_gift") + "</div></a></div>";


            }
            if (view[0]["sa"].ToString() == "True")
            {

                Literal223.Text = @"<div class='monthebox'><a href='../Student/Attendance.aspx'><div id='item50' class='icon'></div><div class='text'>" + GetGlobalResourceObject("Resource", "sip_at_Title") +"</div></a></div>";


            }
            if (view[0]["sara"].ToString() == "True")
            {

                Literal100.Text = @"<div class='monthebox'><a href='../Student/StudentAbility.aspx'><div id='item4' class='icon'></div><div class='text'>Student Academic Result Ability</div></a></div>";


            }
            if (view[0]["sscs"].ToString() == "True")
            {

                Literal101.Text = @"<div class='monthebox'><a href='../Student/SubjectCategory.aspx'><div id='item52' class='icon'></div><div class='text'>" + GetGlobalResourceObject("Resource", "sip_subject_category") + "</div></a></div>";


            }
            if (view[0]["str"].ToString() == "True")
            {

                Literal19.Text = @"<div class='monthebox'><a href='../Student/CareerFormStudent.aspx'><div id='item29' class='icon'></div><div class='text'>Student Recruitment</div></a></div>";
                

            }
           

            //Literal20.Text = @"<div class='monthebox'><a href='http://172.26.122.66/siweb/mainFrame.htm'><div id='item13' class='icon'></div><div class='text'>News</div></a></div>";
            //Literal41.Text = @"<div class='monthebox'><a href='http://172.26.122.66/siweb/stud_info.asp'><div id='item53' class='icon'></div><div class='text'>Student Profile</div></a></div>";
           // Literal21.Text = @"<div class='monthebox'><a href='http://172.26.122.66/siweb/enroll_form.asp'><div id='item14' class='icon'></div><div class='text'>" + GetGlobalResourceObject("Resource", "sip_enrol") + "</div></a></div>";
            Literal22.Text = @"<div class='monthebox'><a href='http://172.26.122.66/siweb/grade.asp'><div id='item15' class='icon'></div><div class='text'>Grade & Absence</div></a></div>";
            Literal23.Text = @"<div class='monthebox'><a href='http://172.26.122.66/siweb/time_stud.asp'><div id='item16' class='icon'></div><div class='text'>"+  GetGlobalResourceObject("Resource", "sip_class_time") +"</div></a></div>";


            Literal24.Text = @"<div class='monthebox'><a href='http://172.26.122.66/siweb/examtime_stud.asp'><div id='item17' class='icon'></div><div class='text'>" + GetGlobalResourceObject("Resource", "sip_exam_time") + "</div></a></div>";
            Literal25.Text = @"<div class='monthebox'><a href='http://172.26.122.66/siweb/supplexamtime_stud.asp'><div id='item18' class='icon'></div><div class='text'>" + GetGlobalResourceObject("Resource", "sip_resit_time") + "</div></a></div>";
            Literal26.Text = @"<div class='monthebox'><a href='https://csc.ipm.edu.mo/srms/eng/others/cms/reports/cmnotice.asp' target='_blank'><div id='item19' class='icon'></div><div class='text'>"+ GetGlobalResourceObject("Resource", "sip_class_cancel") + "</div></a></div>";
            Literal27.Text = @"<div class='monthebox'><a href='http://172.26.122.66/siweb/payment.asp'><div id='item20' class='icon'></div><div class='text'>" + GetGlobalResourceObject("Resource", "sip_pay_and_receipt") + "</div></a></div>";
            Literal28.Text = @"<div class='monthebox'><a href='http://172.26.122.66/siweb/dn_check.asp'><div id='item21' class='icon'></div><div class='text'>" + GetGlobalResourceObject("Resource", "sip_debit_note") + "</div></a></div>";
            Literal29.Text = @"<div class='monthebox'><a href='http://172.26.122.66/siweb/epay_start.asp' target='_blank'><div id='item22' class='icon'></div><div class='text'>" + GetGlobalResourceObject("Resource", "sip_ePay") + "</div></a></div>";
            Literal30.Text = @"<div class='monthebox'><a href='http://172.26.122.66/siweb/surveytest.asp?la=en'><div id='item23' class='icon'></div><div class='text'>" + GetGlobalResourceObject("Resource", "sip_course_and_tech_eval") + "</div></a></div>";
            Literal31.Text = @"<div class='monthebox'><a href='http://172.26.122.66/siweb/locker_check.asp' target='_blank'><div id='item24' class='icon'></div><div class='text'>" + GetGlobalResourceObject("Resource", "sip_locker") + "</div></a></div>";
            Literal32.Text = @"<div class='monthebox'><a href='http://172.26.122.66/siweb/student_card_regulation.asp'><div id='item25' class='icon'></div><div class='text'>" + GetGlobalResourceObject("Resource", "sip_smart_card") + "</div></a></div>";
            Literal33.Text = @"<div class='monthebox'><a href='http://172.26.122.66/siweb/cidp_form.asp'><div id='item26' class='icon'></div><div class='text'>" + GetGlobalResourceObject("Resource", "sip_CIDP_agree") + "</div></a></div>";
            Literal34.Text = @"<div class='monthebox'><a href='../Student/VenueTable.aspx'><div id='item27' class='icon'></div><div class='text'>" + GetGlobalResourceObject("Resource", "sip_venue_time") + "</div></a></div>";

            Literal38.Text = @"<div class='monthebox'><a href='https://wapps.ipm.edu.mo/rvdweb/pd_apply.asp?netid=" + Session["netid"] + "&studid=" + Session["studid"] + "&auth=Y' target='_blank'><div id='item33' class='icon'></div><div class='text'>" + GetGlobalResourceObject("Resource", "sip_app_cert") + "</div></a></div>";
            Literal99.Text = @"<div class='monthebox'><a href='../Student/CurriculumVitaeAct.aspx'><div id='item57' class='icon'></div><div class='text'>" + GetGlobalResourceObject("Resource", "sip_cv") + "</div></a></div>";
        if (Session["CurrentUI"] != null && Session["CurrentUI"].ToString().Equals("zh-TW"))
        {
            Literal39.Text = @"<div class='monthebox'><a href='http://www.ipm.edu.mo/student_corner/zh/typhoons_and_heavy_rain.php' target='_blank'><div id='item32' class='icon'></div><div class='text'>" + GetGlobalResourceObject("Resource", "sip_typs_and_rains") + "</div></a></div>";
        }
        else
        {

            Literal39.Text = @"<div class='monthebox'><a href='http://www.ipm.edu.mo/student_corner/en/typhoons_and_heavy_rain.php' target='_blank'><div id='item32' class='icon'></div><div class='text'>" + GetGlobalResourceObject("Resource", "sip_typs_and_rains") + "</div></a></div>";
        }
             
            

            //Literal40.Text = @"<div class='monthebox'><a href='http://172.26.122.66/siweb/contactus.asp'><div id='item34' class='icon'></div><div class='text'>Contact Us</div></a></div>";       
        
        
			
            //if (view[0]["sara"].ToString() == "True")
            //{
            //Literal100.Text = @"<div class='monthebox'><a href='../Student/StudentAbility.aspx'><div id='item4' class='icon'></div><div class='text'>Student Academic Result Ability</div></a></div>";
            //}
            // if (view[0]["sscs"].ToString() == "True")
            //{
            //    Literal101.Text = @"<div class='monthebox'><a href='../Student/SubjectCategory.aspx'><div id='item52' class='icon'></div><div class='text'>" + GetGlobalResourceObject("Resource", "sip_subject_category") + "</div></a></div>";
            //}
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ToString());

            conn.Open();
            string strSQL = "Select * from ImageInfo,CustomSettings where ImageInfo.id=CustomSettings.imgID and pess_cod=@pess_cod";
            string couSQL = "Select COUNT(*) from ImageInfo,CustomSettings where ImageInfo.id=CustomSettings.imgID and pess_cod=@pess_cod";
            string favSQL = "Select COUNT(*) from DefaultFavourite where pess_cod=@pess_cod";
            string favICONSizeSQL = "Select icon_size from DefaultFavourite where pess_cod=@pess_cod";
			string noticeSQL = "Select * from Notice where isPost=1";
			
            SqlCommand cmd = new SqlCommand(strSQL, conn);
            SqlCommand cmd1 = new SqlCommand(couSQL, conn);
            SqlCommand cmdfav = new SqlCommand(favSQL, conn);
            SqlCommand cmdfavIconSize = new SqlCommand(favICONSizeSQL, conn);
			SqlCommand cmdnotice = new SqlCommand(noticeSQL, conn);
			
			SqlDataReader sdr = cmdnotice.ExecuteReader();
                if (sdr.Read())
                {    
                    lit_notice.Text = sdr["notice"].ToString();
                }
			
            if (Session["pess_cod"] != null)
            {
                cmd.Parameters.AddWithValue("@pess_cod", Session["pess_cod"].ToString());
                cmd1.Parameters.AddWithValue("@pess_cod", Session["pess_cod"].ToString());
                cmdfav.Parameters.AddWithValue("@pess_cod", Session["pess_cod"].ToString());
                cmdfavIconSize.Parameters.AddWithValue("@pess_cod", Session["pess_cod"].ToString());

                int count = (int)cmd1.ExecuteScalar();
                int favCount = (int)cmdfav.ExecuteScalar();
                Boolean flag = false;

                

                if (count == 0 && favCount == 0)
                {
                    flag = true;
                    string sql = "Select * from DefaultImgInfo";
                    SqlCommand cmd2 = new SqlCommand(sql, conn);
                    SqlDataReader sun1 = cmd2.ExecuteReader();
                    StringBuilder str1 = new StringBuilder();
                    while (sun1.Read())
                    {
                        str1.Append(@"<div class='monthebox'><a href='");
                        str1.Append(sun1["url"].ToString());
                        str1.Append("'><img src='");
                        str1.Append(sun1["imgPath"].ToString());
                        str1.Append("' class='icon'><div class='text'>");
                        //str1.Append(sun1["appName"].ToString());
                        str1.Append(GetGlobalResourceObject("Resource", sun1["appString"].ToString()));
                        str1.Append("</div></a></div>");

                    }
                    favourites.Text = str1.ToString();
                    txt_size.Value = "big";
                }
                if (flag == false)
                {
                    SqlDataReader sun = cmd.ExecuteReader();
                    StringBuilder str = new StringBuilder();

                    SqlDataReader iconSDR = cmdfavIconSize.ExecuteReader();

                    while (iconSDR.Read())
                    {
                        txt_size.Value = iconSDR["icon_size"].ToString();
                    }


                    while (sun.Read())
                    {
                        if (sun["appName"].ToString() == "Instructors' Comments")
                        {

                            if (chkNewMsg(Session["ALUN_NUMERO"].ToString(), Session["ALUN_NUMERO_SEQ"].ToString()))
                            {
                                string noti_num = "";
                                int msg_count = Int32.Parse(countNewMsg(Session["ALUN_NUMERO"].ToString(), Session["ALUN_NUMERO_SEQ"].ToString()));

                                string singleDigit_style = "position:relative;top:14px; right:12px;color:#ffffff;margin: -9px 0px;float:right; z-index: 1;";
                                string doubleDigit_style = "position:relative;top:14px; right:8px;color:#ffffff;margin: -9px 0px;float:right; z-index:1;";

                                if (msg_count > 99)
                                {
                                    noti_num = "<div id='noti' style=' " + doubleDigit_style + " '> " + 99 + "</div>";
                                }
                                else
                                    if (msg_count > 9)
                                    {
                                        noti_num = "<div id='noti'  style=' " + doubleDigit_style + " '> "
                                    + Int32.Parse(countNewMsg(Session["ALUN_NUMERO"].ToString(), Session["ALUN_NUMERO_SEQ"].ToString())) + "</div>";
                                    }
                                    else
                                    {
                                        noti_num = "<div id='noti'  style=' " + singleDigit_style + " '> "
                                      + Int32.Parse(countNewMsg(Session["ALUN_NUMERO"].ToString(), Session["ALUN_NUMERO_SEQ"].ToString())) + "</div>";
                                    }

                                str.Append(@"<div class='monthebox'><a href='");
                                str.Append(sun["url"].ToString());
                                str.Append("'>");
								 str.Append(noti_num);
								str.Append("<img src='");
                                str.Append("../images/haveop1.png");
                                str.Append("' class='icon hvr-buzz' > ");
                               
                                str.Append("  <div class='text'>");
                                //str.Append(sun["appName"].ToString());
                                str.Append(GetGlobalResourceObject("Resource", sun["appString"].ToString()));
                                str.Append("</div></a></div>");

                            }
                            else
                            {

                                str.Append(@"<div class='monthebox'><a href='");
                                str.Append(sun["url"].ToString());
                                str.Append("'><img src='");
                                str.Append(sun["imgPath"].ToString());
                                str.Append("' class='icon'>");
                                str.Append(" <div class='text'>");
                               // str.Append(sun["appName"].ToString());
                                str.Append(GetGlobalResourceObject("Resource", sun["appString"].ToString()));
                                str.Append("</div></a></div>");
                            }

                        }
                        else
                            if (sun["appName"].ToString() == "Class Cancellation" || sun["appName"].ToString() == "ePayment" || sun["appName"].ToString() == "Locker Application" || sun["appName"].ToString() == "Application For Certificate" || sun["appName"].ToString() == "Typhoons and Heavy Rain")
                            {

                                str.Append(@"<div class='monthebox'><a href='");
                                str.Append(sun["url"].ToString());
                                str.Append("' target='_blank'><img src='");
                                str.Append(sun["imgPath"].ToString());
                                str.Append("' class='icon'><div class='text'>");
                                //str.Append(sun["appName"].ToString());
                                str.Append(GetGlobalResourceObject("Resource", sun["appString"].ToString()));
                                str.Append("</div></a></div>");
                            }

                            else
                            {
                                str.Append(@"<div class='monthebox'><a href='");
                                str.Append(sun["url"].ToString());
                                str.Append("'><img src='");
                                str.Append(sun["imgPath"].ToString());
                                str.Append("' class='icon'><div class='text'>");
                                //str.Append(sun["appName"].ToString());
                                str.Append(GetGlobalResourceObject("Resource", sun["appString"].ToString()));
                                str.Append("</div></a></div>");
                            }


                    }
                    favourites.Text = str.ToString();
                }

            }
      

            
            if (MultiView1.ActiveViewIndex == 4)
            {


                TimeTable.CssClass = "change";
                ePortfolio.CssClass = "change";
                Common.CssClass = "change";
                AcademicNavigator.CssClass = "change";
                Finance.CssClass = "change";
                StudentRecord.CssClass = "change";


            }
            if (Session["dex"] == "0")
            {
                MultiView1.ActiveViewIndex = 0;
                MyFavourite.CssClass = "change";
                ePortfolio.CssClass = "change1";
                AcademicNavigator.CssClass = "change";
                Common.CssClass = "change";
                Finance.CssClass = "change";
                StudentRecord.CssClass = "change";
                TimeTable.CssClass = "change";
            }
            if (Session["dex"] == "1")
            {
                MultiView1.ActiveViewIndex = 1;
                MyFavourite.CssClass = "change";
                AcademicNavigator.CssClass = "change1";
                ePortfolio.CssClass = "change";
                Common.CssClass = "change";
                Finance.CssClass = "change";
                StudentRecord.CssClass = "change";
                TimeTable.CssClass = "change";

            }
            if (Session["dex"] == "2")
            {
                MultiView1.ActiveViewIndex = 2;
                MyFavourite.CssClass = "change";
                Common.CssClass = "change1";
                ePortfolio.CssClass = "change";
                AcademicNavigator.CssClass = "change";
                Finance.CssClass = "change";
                StudentRecord.CssClass = "change";
                TimeTable.CssClass = "change";
            }
            if (Session["dex"] == "3")
            {
                MultiView1.ActiveViewIndex = 3;
                MyFavourite.CssClass = "change";
                StudentRecord.CssClass = "change1";
                ePortfolio.CssClass = "change";
                AcademicNavigator.CssClass = "change";
                Common.CssClass = "change";
                Finance.CssClass = "change";
                TimeTable.CssClass = "change";
            }
            if (Session["dex"] == "4")
            {
                MultiView1.ActiveViewIndex = 4;
                MyFavourite.CssClass = "change";
                TimeTable.CssClass = "change1";
                ePortfolio.CssClass = "change";
                AcademicNavigator.CssClass = "change";
                Common.CssClass = "change";
                Finance.CssClass = "change";
                StudentRecord.CssClass = "change";

            }

            if (Session["dex"] == "5")
            {
                MultiView1.ActiveViewIndex = 5;
                MyFavourite.CssClass = "change";
                Finance.CssClass = "change1";
                ePortfolio.CssClass = "change";
                AcademicNavigator.CssClass = "change";
                Common.CssClass = "change";
                StudentRecord.CssClass = "change";
                TimeTable.CssClass = "change";

            }

            if (Session["dex"] == "6")
            {
                MultiView1.ActiveViewIndex = 6;
                MyFavourite.CssClass = "change1";
                Finance.CssClass = "change";
                ePortfolio.CssClass = "change";
                AcademicNavigator.CssClass = "change";
                Common.CssClass = "change";
                StudentRecord.CssClass = "change";
                TimeTable.CssClass = "change";
            }

        }


    }



    protected void SignOut_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("http://172.26.122.66/siweb/logout.asp");
        // Response.Redirect("https://wire.ipm.edu.mo/cas/logout?url=https://sip.ipm.edu.mo/home.aspx");


    }
    protected void ePortfolio_Click(object sender, EventArgs e)
    {

        Session.Add("dex", "0");
        MyFavourite.CssClass = "change";
        ePortfolio.CssClass = "change1";
        AcademicNavigator.CssClass = "change";
        Common.CssClass = "change";
        Finance.CssClass = "change";
        StudentRecord.CssClass = "change";
        TimeTable.CssClass = "change";


        MultiView1.ActiveViewIndex = 0;
    }
    protected void AcademicNavigator_Click(object sender, EventArgs e)
    {
        Session.Add("dex", "1");
        MyFavourite.CssClass = "change";
        AcademicNavigator.CssClass = "change1";
        ePortfolio.CssClass = "change";
        Common.CssClass = "change";
        Finance.CssClass = "change";
        StudentRecord.CssClass = "change";
        TimeTable.CssClass = "change";


        MultiView1.ActiveViewIndex = 1;

    }
    protected void Common_Click(object sender, EventArgs e)
    {
        Session.Add("dex", "2");
        MyFavourite.CssClass = "change";
        Common.CssClass = "change1";
        ePortfolio.CssClass = "change";
        AcademicNavigator.CssClass = "change";
        Finance.CssClass = "change";
        StudentRecord.CssClass = "change";
        TimeTable.CssClass = "change";


        MultiView1.ActiveViewIndex = 2;
    }
    protected void TimeTable_Click(object sender, EventArgs e)
    {
        Session.Add("dex", "4");
        MyFavourite.CssClass = "change";
        TimeTable.CssClass = "change1";
        ePortfolio.CssClass = "change";
        AcademicNavigator.CssClass = "change";
        Common.CssClass = "change";
        Finance.CssClass = "change";
        StudentRecord.CssClass = "change";



        MultiView1.ActiveViewIndex = 4;
    }
    protected void StudentRecord_Click(object sender, EventArgs e)
    {
        Session.Add("dex", "3");

        MyFavourite.CssClass = "change";
        StudentRecord.CssClass = "change1";
        ePortfolio.CssClass = "change";
        AcademicNavigator.CssClass = "change";
        Common.CssClass = "change";
        Finance.CssClass = "change";
        TimeTable.CssClass = "change";


        MultiView1.ActiveViewIndex = 3;
    }
    protected void Finance_Click(object sender, EventArgs e)
    {
        Session.Add("dex", "5");

        MyFavourite.CssClass = "change";
        Finance.CssClass = "change1";
        ePortfolio.CssClass = "change";
        AcademicNavigator.CssClass = "change";
        Common.CssClass = "change";
        StudentRecord.CssClass = "change";
        TimeTable.CssClass = "change";



        MultiView1.ActiveViewIndex = 5;
    }


    protected void MyFavourite_Click(object sender, EventArgs e)
    {
        Session.Add("dex", "6");
        MyFavourite.CssClass = "change1";
        TimeTable.CssClass = "change";
        ePortfolio.CssClass = "change";
        AcademicNavigator.CssClass = "change";
        Common.CssClass = "change";
        Finance.CssClass = "change";
        StudentRecord.CssClass = "change";



        MultiView1.ActiveViewIndex = 6;
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("http://www.ipm.edu.mo/en/index.php");
    }

    protected Boolean chkNewMsg(string num, string seq)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ToString());
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("Select *  " +
               "FROM AdvisoryRemark a  " +
               "inner join academic_result_info b " +
               "on a.ALUN_NUMERO = b.ALUN_NUMERO and a.ALUN_NUMERO_SEQ =b.ALUN_NUMERO_SEQ and a.class_code = b.SUBJECT_CODE " +
               "where a.ALUN_NUMERO=@num and a.ALUN_NUMERO_SEQ=@seq and a.status ='Unread' order by a.postDate desc", conn);

            cmd.Parameters.AddWithValue("@num", num);
			cmd.Parameters.AddWithValue("@seq", seq);

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
            conn.Close();
        }
        return false;
    }

    private string countNewMsg(string num, string seq)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ToString());
        int totalUnreadMsg = 0;

        try
        {
            conn.Open();
            StringBuilder sb = new StringBuilder();

            sb.Append("SELECT COUNT(*)  as 'UnreadMsg' ");
            sb.Append("FROM AdvisoryRemark ");
            sb.Append("WHERE status = 'Unread' and ALUN_NUMERO=@num and ALUN_NUMERO_SEQ=@seq ");

            SqlCommand cmd = new SqlCommand(sb.ToString(), conn);

            cmd.Parameters.AddWithValue("@num", num);
			cmd.Parameters.AddWithValue("@seq", seq);


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
