<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChartDescription.aspx.cs" ClientTarget="uplevel" Inherits="ChartDescription" %>

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
        <h3>&nbsp;圖表使用說明（請參照下圖）：</h3>
        <hr  color="Gray">
        <ol>
        <li><font size=3>綠線表示本班級所有同學成績的近似分佈,正弦波形狀反映同學成績離散程度,<br />
                     波幅越陡峭表示同學成績越接近,波幅越扁平表示同學成績越分散。</font><br /><br />
        </li>
        <li><font size=3>藍線表示“及格分數線”,起到“及格”與“不及格”的標示作用,在圖表中的位置始終不變。</font><br /><br /></li>
        <li><font size=3>紅線表示“平均分數線”,即是本班成績平均分,在圖表中的位置隨同學考試成績的高低而變化；<br />
            紅線的位置能間接說明“本次考試難度”或學生成績的“總體水準”。</font><br /><br /></li>
        <li><font size=3>黃線表示“我的成績”在本班成績中的位置,越靠右表示排位越往前,越靠左表示排位越往後。<br />
            黃線在藍線的左方,表示本次考試未通過,要加油啦；<br />
            黃線在藍線的右方而在紅線的左方,表示本次考試通過但是達不到班級平均分,<br />
            要想為班級貢獻點平均分,那麼就得在學習上用多點時間啦；<br />
            黃線在紅線的右方,恭喜您！您是本班平均分的主要貢獻者,請繼續保持；</font><br /></li>
        </ol>
        
        </div>
       
       </tr>      
    <tr> 
     <asp:HyperLink ID="hlChartHelp" runat="server" ImageUrl="~/Student/images/DesHelp.png"  Target="~/Student/ChartDescription.aspx" 
      NavigateUrl="~/Student/ChartHelp.aspx" ></asp:HyperLink>
   
            </tr>
           
           
           </table>
            <table>
                <tr> <td> <asp:Button ID="btn_home" runat="server" Text="Home" style="width:120px"
        CssClass="blue" CausesValidation="false" onclick="btn_home_Click"/></td>
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
