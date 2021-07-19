using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Text;

/// <summary>
/// Summary description for EpDao
/// </summary>
/// 
/// 



public class EpDao
{
  

	public EpDao()
	{
		//
		// TODO: Add constructor logic here
		//





	}



    public static ArrayList getALUN_NUMERO(string sid)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ToString());
        ArrayList result = new ArrayList();
        try
        {
            con.Open();
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT  ALUN_NUMERO, ");
            sb.Append("ALUN_NUMERO_SEQ ");
            sb.Append("FROM student_academic_info ");
            sb.Append("where STUDENT_ID=@std_id order by ALUN_NUMERO_SEQ desc ");

            SqlCommand cmd = new SqlCommand(sb.ToString(), con);

            cmd.Parameters.AddWithValue("@std_id", sid);

            SqlDataReader rdr = null;
            rdr = cmd.ExecuteReader();

            while (rdr.Read())
            {
                if (rdr["ALUN_NUMERO"] != null && rdr["ALUN_NUMERO_SEQ"]!=null)
                {
                    result.Add(rdr["ALUN_NUMERO"].ToString());
                    result.Add(rdr["ALUN_NUMERO_SEQ"].ToString());
                }
            }


        }
        catch(Exception ex){
            throw ex;
        }
        finally{
            con.Close();
        }

        return result;
    }

    public static string getSchoolNameEN(string schoolCode)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ToString());
        string name = "";

        try
        {
            con.Open();
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT  school_en ");            
            sb.Append("FROM school_info ");
            sb.Append("where SCHOOL_CODE=@scode");

            SqlCommand cmd = new SqlCommand(sb.ToString(), con);

            cmd.Parameters.AddWithValue("@scode", schoolCode);


            SqlDataReader rdr = null;
            rdr = cmd.ExecuteReader();

            while (rdr.Read())
            {
                if (rdr["school_en"] != null)
                {
                    name = rdr["school_en"].ToString();
                  
                }
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
        return name;
    }

    public static string getSchoolName(string schoolCode)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EPConnectionString"].ToString());
        string name = "";

        try
        {
            con.Open();
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT  school_en + ' - ' + school_ch as school_en ");
            sb.Append("FROM school_info ");
            sb.Append("where SCHOOL_CODE=@scode");

            SqlCommand cmd = new SqlCommand(sb.ToString(), con);

            cmd.Parameters.AddWithValue("@scode", schoolCode);


            SqlDataReader rdr = null;
            rdr = cmd.ExecuteReader();

            while (rdr.Read())
            {
                if (rdr["school_en"] != null)
                {
                    name = rdr["school_en"].ToString();

                }
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
        return name;
    }
   

}