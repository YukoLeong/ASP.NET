using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SpeedCal : System.Web.UI.Page
{
    int counting=1;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            MarkRandomNum();
            ViewState["counting"] = 1;
            CountLabel.Text = counting.ToString();
        }
        Label3.Visible = false;
        Label4.Visible = false;
    }

    protected void MarkRandomNum()
    {
        int minValue = 11;
        int maxValue = 99;
        Random rnd = new Random();
        int num1 = rnd.Next() % (maxValue - minValue + 1) + minValue;
        int num2 = rnd.Next() % (maxValue - minValue + 1) + minValue;
        //確保隨機數後面是兩位數和不能整除10
        while (num1 % 10 == 0)
        {
            num1 = rnd.Next() % (maxValue - minValue + 1) + minValue;
        }
        while (num2 % 10 == 0)
        {
            num2 = rnd.Next() % (maxValue - minValue + 1) + minValue;
        }
        Label1.Text = num1.ToString();
        Label2.Text = num2.ToString();
        string string1 = num1.ToString();
        string string2 = num2.ToString();
        Label3.Text = "( " + int.Parse(string1.Substring(0, 1)) * 10 * int.Parse(string2.Substring(0, 1)) * 10 + " + " + int.Parse(string1.Substring(1)) * 10 * int.Parse(string2.Substring(0, 1)) + " + " + int.Parse(string1.Substring(0, 1)) * int.Parse(string2.Substring(1)) * 10 + " + " + int.Parse(string1.Substring(1)) * int.Parse(string2.Substring(1)) + " )";
        Label4.Text = (num1 * num2).ToString();
    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        Label3.Visible = true;
        Label4.Visible = true;

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        MarkRandomNum();
        Label3.Visible = false;
        Label4.Visible = false;

        if (ViewState["counting"] != null)
        {
            counting = (int)ViewState["counting"] + 1;
        }
        CountLabel.Text = counting.ToString();
        ViewState["counting"] = counting;
    }
}