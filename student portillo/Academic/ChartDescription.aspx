<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChartDescription.aspx.cs" Inherits="ChartDescription" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Chart Help</title>
    <link rel="stylesheet" href="../button.css" type="text/css" media="screen" />
    <style type="text/css">
        #wrapper
        {
            width: 1100px;
            margin-left: auto;
            margin-top:-5px;
            margin-right: auto;
            background-color:White;
            border-left:solid black 1px;
            border-right:solid black 1px;
        }
        #content
        {
           
            min-height:950px;
            margin-left: 5px;
            margin-right: 5px;
        }
        .style1
        {
            width: 108px;
        }
        .style2
        {
            width: 121px;
        }
    </style>
</head>
<body background="../images/gp1.jpg">

    <form id="form1" runat="server">
    <div id="wrapper">
    
    <table>
    
    <tr>
        <div>
       <br/>
        <h3>&nbsp; &nbsp;圖表使用說明（請參照下圖）：</h3>
        <hr  color="Gray">
        <ol>
        <li><font size=2>綠線表示本班級所有同學成績的近似分佈,正弦波形狀反映同學成績離散程度,<br />
                     波幅越陡峭表示同學成績越接近,波幅越扁平表示同學成績越分散。</font><br /><br />
        </li>
        <li><font size=2>藍線表示“及格分數線”,起到“及格”與“不及格”的標示作用,在圖表中的位置始終不變。</font><br /><br /></li>
        <li><font size=2>紅線表示“平均分數線”,即是本班成績平均分,在圖表中的位置隨同學考試成績的高低而變化；<br />
            紅線的位置能間接說明“本次考試難度”或學生成績的“總體水準”。</font><br /><br /></li>
        <li><font size=2>人數線（直方圖中）表示對應成績的人數，該圖能反映每個成績段的人數分佈。<br />
          </font><br /></li>
		   <li><font size=2>四分位表格說明：以本班所有同學為統計對象，根據他們本次的考試分數從小到大的順序進行排位。<br/>
		                    對於Q1則表示占排位總數25%的位置分界線，此位置對應的考試分數就是“第一個四分位數”；<br/>
							同理，“中位數”也就是Q2（50%）對應的考試分數就是“第二個四分位數”；<br/>
							最後，Q3（75%）對應的考試分數就是“第三個四分位數”；<br/>
							根據統計公式：排位總數=N（總同學數）+1，當排位總數大於4時，表格才能正常顯示。<br />
          </font><br /></li>
        </ol>        
        </div>
       
       </tr>      
    <tr> 
     <asp:HyperLink ID="hlChartHelp" runat="server" ImageUrl="~/images/TChartDes.png"  Target="~/Academic/ChartDescription.aspx" 
      NavigateUrl="~/Academic/ChartHelp.aspx" ></asp:HyperLink>
   
            </tr>
           
           
           </table>
            <table>
                <tr> 
		      <td>
        <asp:Button ID="btn_back" runat="server" Text="Back" style="width:120px"
                onclick="btn_back_Click" CausesValidation="false" CssClass="blue"/>
              </tr>
              </table>
       </td>
           
    </div>
    </form>
</body>
</html>
