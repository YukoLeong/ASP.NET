using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text;
using System.Text.RegularExpressions;


public class StringFormat
{
   
    private static StringBuilder outstr;
    private static Regex objregex;
      
    public static string OutString(string instr)
    {
        instr = HttpContext.Current.Server.HtmlDecode(instr);
        instr = instr.Replace("<br />" + Environment.NewLine, Environment.NewLine);
        return instr;
    }
    public static string OutString(string instr, int WordCount)
    {
        byte[] mybyte = System.Text.Encoding.Default.GetBytes(instr);
        if (mybyte.Length > WordCount)
        {
            outstr = new StringBuilder();
            for (int i = 0; i < instr.Length; i++)
            {
                byte[] tempByte = System.Text.Encoding.Default.GetBytes(outstr.ToString());
                if (tempByte.Length < WordCount * 2)
                {
                    outstr.Append(instr.Substring(i, 1));
                }
                else
                {
                    break;
                }
            }
            return outstr.ToString();
        }
        else
        {
            return instr;
        }
    }
    public static string OutString(string instr, int WordCount, bool Prolong)
    {
        byte[] mybyte = System.Text.Encoding.Default.GetBytes(instr);
        if (mybyte.Length > WordCount)
        {
            outstr = new StringBuilder();
            for (int i = 0; i < instr.Length; i++)
            {
                byte[] tempByte = System.Text.Encoding.Default.GetBytes(outstr.ToString());
                if (tempByte.Length < WordCount * 2)
                {
                    outstr.Append(instr.Substring(i, 1));
                }
                else
                {
                    if (Prolong)
                    {
                        outstr.Append("...");
                    }
                    break;
                }
            }
            return outstr.ToString();
        }
        else
        {
            return instr;
        }
    }
    public static string Out(string instr, int count)
    {
        return OutString(instr, count, true);
    }
  
    public static string HighLight(string instr, bool light)
    {
        if (light)
        {
            instr = "<span style='color:red'>" + instr + "</span>";
        }
        else
        {
            instr = "<span style='color:blue'>" + instr + "</span>";
        }
        return instr;
    }
}
