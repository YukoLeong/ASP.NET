using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Data;
using System.Text;
using System.Globalization;
using System.Threading;
/// <summary>
/// Summary description for AttendanceService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class AttendanceService : System.Web.Services.WebService {
	 

    public AttendanceService () {
      
    }

    [WebMethod()]
      public List<NameInfo> GetNameInYear(string yearID){
       string[] strs=yearID.Split('|');
       SqlConnection con = new SqlConnection(
           WebConfigurationManager.ConnectionStrings["EPConnectionString"].ConnectionString);
       SqlCommand cmd = new SqlCommand(
          @"SELECT DISTINCT e.CURSO,a.SECTION_YEAR, e.STUDENT_ID,e.NAME,a.ALUN_NUMERO,a.ALUN_NUMERO_SEQ ,a.SECTION_CODE,a.TEACHER_CODE
           FROM student_attend_info a INNER JOIN ep_class_grade e 
           ON  a.ALUN_NUMERO=e.NUMERO AND a.ALUN_NUMERO_SEQ= e.NUMERO_SEQ 
           AND a.TEACHER_CODE=@TeacherCode 
           WHERE e.SECT_ANOL_ANO=@Year and a.SECTION_CODE=@SectionCode ", con);
       cmd.Parameters.Add(new SqlParameter("@Year", System.Data.SqlDbType.NVarChar, 128));
       cmd.Parameters["@Year"].Value = strs[0].ToString();
       cmd.Parameters.Add(new SqlParameter("@SectionCode", System.Data.SqlDbType.NVarChar, 128));
       cmd.Parameters["@SectionCode"].Value = strs[1].ToString();
       cmd.Parameters.Add(new SqlParameter("@TeacherCode", System.Data.SqlDbType.NVarChar, 128));
       cmd.Parameters["@TeacherCode"].Value = strs[2].ToString();
       
       List <NameInfo> NameInfoes = new List<NameInfo>();
        try
        {
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                NameInfoes.Add(new NameInfo(
                    reader["CURSO"].ToString(),
                    reader["SECTION_YEAR"].ToString(),
                    reader["STUDENT_ID"].ToString(),
                    reader["NAME"].ToString(),
                    reader["ALUN_NUMERO"].ToString(),
                    reader["ALUN_NUMERO_SEQ"].ToString(),
                    reader["SECTION_CODE"].ToString(),
                    reader["TEACHER_CODE"].ToString()
                                     
                    ));
            }
            reader.Close();
        }
        catch (SqlException err)
        {

            throw new ApplicationException("Data Error.");
        }
        finally
        {
            con.Close();
        }
       
       return NameInfoes ;
    }
    [WebMethod()]
    public List<EventInfo> GetAttendInfoInName(string nameValue)
    {
        string[] strs = nameValue.Split('|');
        string[] strStart;
        string[] strEnd;
        SqlConnection con = new SqlConnection(
            WebConfigurationManager.ConnectionStrings["EPConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand(
            @"SELECT distinct attend_info.id,attend_info.SECTION_YEAR,attend_info.SECTION_CODE,attend_info.ACTUAL_DATE,attend_info.ACTUAL_START_TIME,attend_info.ACTUAL_END_TIME,
             attend_info.TEACHER_CODE ,t.NAME_CH,t.NAME_PT,attend_info.ALUN_NUMERO,attend_info.ALUN_NUMERO_SEQ,attend_info.STATUS_CODE,attend_info.STATUS_CH,attend_info.STATUS_EN,attend_info.OBS,
             stu_info.SCHOOL,stu_info.CURSO,stu_info.CLASS_CODE,stu_info.CLASS_NAME,stu_info.COURSE,stu_info.COURSE_CH,
             stu_info.NUMERO,stu_info.NUMERO_SEQ, stu_info.NAME,stu_info.SEMESTRE 
             FROM(SELECT  id,SECTION_YEAR,SECTION_CODE,ACTUAL_DATE,ACTUAL_START_TIME,ACTUAL_END_TIME,
             TEACHER_CODE,ALUN_NUMERO,ALUN_NUMERO_SEQ,STATUS_CODE,STATUS_CH,STATUS_EN,OBS
             FROM student_attend_info WHERE ALUN_NUMERO=@an AND ALUN_NUMERO_SEQ=@aq )attend_info
             LEFT JOIN(SELECT  SCHOOL,CURSO,CLASS_CODE,CLASS_NAME,COURSE,COURSE_CH,
             NUMERO,NUMERO_SEQ, NAME,SEMESTRE,SECT_ANOL_ANO,SECT_COD FROM ep_class_grade 
             WHERE NUMERO=@an AND NUMERO_SEQ=@aq ) stu_info
             ON attend_info.SECTION_YEAR=stu_info.SECT_ANOL_ANO AND attend_info.SECTION_CODE=stu_info.SECT_COD
			 INNER JOIN teacher_course_info t on attend_info.TEACHER_CODE=t.CODE ", con);

       
       
          cmd.Parameters.Add(new SqlParameter("@an", System.Data.SqlDbType.NChar, 128));
          cmd.Parameters["@an"].Value = strs[0].ToString();
          cmd.Parameters.Add(new SqlParameter("@aq", System.Data.SqlDbType.NChar, 128));
          cmd.Parameters["@aq"].Value = strs[1].ToString();
     
        List<EventInfo> EventInfoes = new List<EventInfo>();
        string strColor=string.Empty;
		       
        try
        {
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {        
                           if(reader["STATUS_CODE"].ToString().Trim()=="P")
                           strColor = @"#257e4a";
                           else if(reader["STATUS_CODE"].ToString().Trim()=="U")
                           strColor = @"#ff9f89";
                           else if (reader["STATUS_CODE"].ToString().Trim() =="R")
                           strColor = @"#66B3FF";
					       else
						   strColor = @"black";
                           strStart = reader["ACTUAL_START_TIME"].ToString().Split('.');
                           strEnd = reader["ACTUAL_END_TIME"].ToString().Split('.');
                                EventInfoes.Add(
                                    new EventInfo(reader["id"].ToString(),
                                                  reader["TEACHER_CODE"].ToString() ,
                                                  reader["NAME_CH"].ToString(),
                                                  reader["NAME_PT"].ToString(),
                                                  reader["COURSE"].ToString() ,
                                                  reader["COURSE_CH"].ToString(),												 
                                Convert.ToDateTime(reader["ACTUAL_DATE"].ToString()).
                                AddHours(double.Parse(strStart[0].ToString())).
                                AddMinutes(double.Parse(strStart[1].ToString())).
								ToString("s",CultureInfo.CreateSpecificCulture("en-US")), 										   
                                Convert.ToDateTime(reader["ACTUAL_DATE"].ToString()).
                                AddHours(double.Parse(strEnd[0].ToString())).
                                AddMinutes(double.Parse(strEnd[1].ToString())).
								ToString("s",CultureInfo.CreateSpecificCulture("en-US")),								         
                                "allDay: true",
                                strColor.ToString(),
                                ( "Attendance: " + reader["STATUS_CODE"].ToString() +" "+ reader["STATUS_CH"].ToString())
                                ));
                           }
            reader.Close();
        }
        catch (SqlException err)
        {

            throw new ApplicationException("Data Error.");
        }
        finally
        {
            con.Close();
        }
      
        return EventInfoes;
        
    }
    private static void ConvertToDateTime(string value)
    {
        DateTime convertedDate;
        try
        {
            convertedDate = Convert.ToDateTime(value);
           
        }
        catch (FormatException e)
        {
            throw new ApplicationException( "Data Error");
        }
    }
	
	
}
public class NameInfo
{
    public string Curso;
    public string SectionYear;
    public string ID;
    public string Name;
    public string AlumNumero;
    public string AlumNumeroSeq;
    public string SectionCode;
    public string TeacherCode;
    public NameInfo(string curso,string sectionYear, string id, string name,
                    string alumNumero,string alumNumeroSeq,
                    string sectionCode, string teacherCode)
    {
        this.Curso = curso;
        this.SectionYear = sectionYear;
        this.ID= id;
        this.Name = name;
        this.AlumNumero = alumNumero;
        this.AlumNumeroSeq = alumNumeroSeq;
        this.SectionCode = sectionCode;
        this.TeacherCode = teacherCode;
   }
    public NameInfo() { }
}
public class AttendInfo
{
    public string SectionYear;
    public string SectionCode;
    public string ActualDate;
    public string ActualStartTime;
    public string ActualEndTime;
    public string TeacherCode;
    public string AlunNumero;
    public string AlunNumeroAeq;
    public string StatusCode;
    public string StatusCh;
    public string StatusEn;
    public string Obs;
    public AttendInfo(string sectionYear, string sectionCode, string actualDate,
        string actualStartTime, string actualEndTime, string teacherCode, string alunNumero,
        string alunNumeroAeq, string statusCode, string statusCh, string statusEn , string obs)
    {
        this.SectionYear = sectionYear;
        this.SectionCode = sectionCode;
        this.ActualDate = actualDate;
        this.ActualStartTime = actualStartTime;
        this.ActualEndTime = actualEndTime;
        this.TeacherCode = teacherCode;
        this.AlunNumero = alunNumero;
        this.AlunNumeroAeq = alunNumeroAeq;
        this.StatusCode= statusCode;
        this.StatusCh = statusCh;
        this.StatusEn = statusEn;
        this.Obs = obs;
    }
    public AttendInfo() { }
}
public class EventInfo
{
    public string ID;
    public string TeacherCode;
    public string NameCh;
    public string NameEn;
    public string Course;
    public string CourseEn;
    public string StartTime;
    public string EndTime;
    public string AllDay;
    public string Color;
    public string AttendInfo;
    public EventInfo(string id, string teacherCode,
          string nameCh,string nameEn,string course,string courseEn,
        string starttime, string endtime, string allday, string color,string attendInfo)
    {
        this.ID = id;
        this.TeacherCode=teacherCode;
        this.NameCh=nameCh;
        this.NameEn=nameEn;
        this.Course=course;
        this.CourseEn =courseEn;
        this.StartTime = starttime;
        this.EndTime = endtime;
        this.AllDay = allday;
        this.Color = color;
        this.AttendInfo =attendInfo;
    }
    public EventInfo() { }
}