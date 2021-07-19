using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class jscontrol : System.Web.UI.Page
{
    public double seconds;
    protected void Page_Load(object sender, EventArgs e)
    {
        seconds = 10;   //設定秒數
        //seconds = (GetEndTime() - GetStartTime()).TotalSeconds;  //這部分是計算距離今天日期的倒數
    }

    //這部分是計算距離今天日期的倒數

    //private DateTime GetStartTime()
    //{
    //    return DateTime.Now;
    //}
    //private DateTime GetEndTime()
    //{
    //    return new DateTime(2016, 3, 23, 0, 0, 0);
    //}
}