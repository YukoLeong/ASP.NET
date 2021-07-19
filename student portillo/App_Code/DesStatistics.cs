using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

/// <summary>
/// Summary description for DesStatistics
/// </summary>
public class DesStatistics
{
    public string strLoweset { get; set; }
    public string strQ1 { get; set; }
    public string strMedian { get; set; }
    public string strQ3 { get; set; }
    public string strHighest { get; set; }
    public double[] decArray { get; set; }
    public int Median { get; set; }
    public int q1 { get; set; }
    public int q3 { get; set; }
    public DesStatistics(double[] decArray)
	{
        Array.Sort(decArray);
        this.decArray = decArray;
		if(this.decArray.Length>4)
		{
        Median = (int)Math.Round((this.decArray.Length+1) * 0.5);
        q1 = (int)Math.Round((this.decArray.Length+1) * 0.25);
        q3 = (int)Math.Round((this.decArray.Length+1) * 0.75);
        getInfo();
		}
		else
			if(this.decArray.Length==4)
		{ 
	      Median=2;
	      q1=1;
		  q3=3;	
		  strLoweset = this.decArray.Min().ToString();
		  strHighest = this.decArray.Max().ToString();
		  strQ1=this.decArray[q1].ToString();
		  strMedian = this.decArray[Median].ToString();
		  strQ3 = this.decArray[q3].ToString();
		}
		else if(this.decArray.Length==3)
		{
			Median=1;
			q1=0;
			q3=2;
		  strLoweset = this.decArray.Min().ToString();
		  strHighest = this.decArray.Max().ToString();
		  strQ1=this.decArray[q1].ToString();
		  strMedian = this.decArray[Median].ToString();
		  strQ3 = this.decArray[q3].ToString();
		}
		else if(this.decArray.Length==2)
		{
			Median=1;
			q1=0;
			q3=1;
		  strLoweset = this.decArray.Min().ToString();
		  strHighest = this.decArray.Max().ToString();
		  strQ1=this.decArray[q1].ToString();
		  strMedian = this.decArray[Median].ToString();
		  strQ3 = this.decArray[q3].ToString();
		}
	}
    private void getInfo()
    {
        strLoweset = decArray.Min().ToString();
        if (this.decArray.Length % 2 == 0)
        {
            strQ1 = (Math.Round((decArray[q1] - decArray[q1 - 1]) * 0.5) + decArray[q1 - 1]).ToString();
            strMedian = (Math.Round((decArray[Median] - decArray[Median - 1]) * 0.5) + decArray[Median - 1]).ToString();
            strQ3 = (Math.Round((decArray[q3] - decArray[q3 - 1]) * 0.5) + decArray[q3 - 1]).ToString();
        }
        else
        {
            strQ1 = decArray[q1-1].ToString();
            strMedian = decArray[Median].ToString();
            strQ3 = decArray[q3-1].ToString();
        }
        strHighest = decArray.Max().ToString();
    }
}