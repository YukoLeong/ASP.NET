<%@ Page Language="C#" AutoEventWireup="true" CodeFile="bd02.aspx.cs" Inherits="bd02" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <%--http://www.ipm.edu.mo/orientation/index.html--%>
    <%--<script src="http://s.codepen.io/assets/libs/modernizr.js" type="text/javascript"></script>
<link href='http://fonts.googleapis.com/css?family=Lato:300,400,700' rel='stylesheet' type='text/css'>--%>
    <link href="bd02style/bd02star.css" rel="stylesheet" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <style type="text/css">


</style>

</head>
<body class="colorful">
    <form id="form1" runat="server">
        <div id='stars'></div>
        <div id='stars2'></div>
        <div id='stars3'></div>
        <div id='title'>
            <span>
                <img src="bd02style/top.jpg" width="1024px" height="165px" /></span>
            <p></p>
            <p></p>
            <span>歡迎學位課程一年級新生參加！</span><br />
            <br />
            <br />
            <table width="75%" border="0" cellspacing="0" cellpadding="0" class="etext">
                <tr>
                    <td width="80%">&nbsp;</td>
                    <td height="30" align="center" bgcolor="#FF2A8C"><a href="index_e.html">English</a></td>
                </tr>
            </table>
            <table width="75%" border="1" align="center" cellpadding="4" cellspacing="0" class="cborder">
                <tr class="ctitle">
                    <td height="30" align="center" bgcolor="#FDD104">活動日期</td>
                    <td height="30" align="center" bgcolor="#FDD104">活動內容簡介</td>
                    <td height="30" align="center" bgcolor="#FDD104">時間/地點</td>
                </tr>
                <tr>
                    <td width="25%" rowspan="2" align="center">迎新會<br>
                        <span class="email"><strong>22/08/2015</strong></span><br>
                        星期六</td>
                    <td width="52%" height="40" align="center">迎新活動及遊戲、茶點&nbsp;<a href="1516/poster1516.pdf" target="_blank"><font color="#FF2A8C" class="cmail2">詳情</font></a></td>
                    <td width="23%" align="center"><span class="email">11:00~13:00</span><br>
                        禮堂</td>
                </tr>
                <tr>
                    <td width="52%" height="40" align="center">校園方位大作戰&nbsp;<a href="1516/game_rule.pdf" target="_blank"><font color="#FF2A8C" class="cmail2">詳情</font></a></td>
                    <td width="23%" align="center"><span class="email">14:00~17:00</span><br />
                        禮堂</td>
                </tr>
            </table>
            <table width="75%" align="center" cellpadding="4" class="cmail">
                <tr>
                    <td width="" align="left">迎新會報名：於<span class="email"><strong>8</strong></span>月<span class="email"><strong>20</strong></span>日前填妥<a href="https://goo.gl/DuTaqk" target="_blank">網上表格</a></td>
                </tr>
                <tr>
                    <td align="left"><font color="#FED104"><strong>*</strong></font>&nbsp;&nbsp;當天出席的新生將獲派發迎新禮品包一份及T恤一件，場內更設有免費拍照服務及茶點款待。</td>
                </tr>
            </table>
            <p></p>
            <table width="75%" border="1" align="center" cellpadding="4" cellspacing="0" class="cborder">
                <tr class="ctitle">
                    <td height="30" colspan="4" align="center" bgcolor="#FED104">迎新系列活動</td>
                </tr>
                <tr>
                    <td width="5%" height="30" valign="top">&nbsp;</td>
                    <td width="26%" height="30" align="center">活動項目</td>
                    <td width="50%" height="30" align="center">活動內容簡介</td>
                    <td width="20%" height="30" align="center">舉辦日期/地點</td>
                </tr>
                <tr>
                    <td width="5%" align="center" valign="top" class="email">1.</td>
                    <td width="26%" align="left" valign="top">校園生活講座及泡泡氣球大作戰 </td>
                    <td width="50%" align="left" valign="top">&ldquo;四年大學要做的<span class="email">25</span>件事&rdquo;多重要?<br>
                        &ldquo;泡泡氣球大作戰&rdquo;你玩過嗎?</td>
                    <td width="20%" align="left" valign="top"><span class="email">26/09/2015</span><br>
                        星期六<br>
                        <span class="email">11:00~18:00</span><br />
                        匯智樓3號演講廳及體育館</td>
                </tr>
                <tr>
                    <td width="5%" height="66" align="center" valign="top" class="email">2.</td>
                    <td height="66" align="left" valign="top">「再度無間」義工計劃</td>
                    <td align="left" valign="top">義工計劃帶你走進精彩人生，計劃包括義工培訓工作坊及香港義工服務實習等。</td>
                    <td height="" align="left" valign="top"><span class="email">10,17,18,24/10/2015</span><br />
                        澳門及香港</td>
                </tr>
                <tr>
                    <td width="5%" height="28" align="center" valign="top" class="email">3.</td>
                    <td height="28" align="left" valign="top">獎學金獲獎學生分享會</td>
                    <td height="28" align="left" valign="top">啟發新同學找出適合自己的學習方式，並在學習目標等方面作好計劃及準備。
                        <br>
                    </td>
                    <td height="28" align="left" valign="top">稍後公佈<br>
                    </td>
                </tr>
                <tr>
                    <td width="5%" height="28" align="center" valign="top" class="email">4.</td>
                    <td height="28" align="left" valign="top">生涯規劃專題講座</td>
                    <td height="28" align="left" valign="top">甚麼是「生涯規劃」？為何要生涯規劃？怎樣才能規劃好自己的人生？<br>
                    </td>
                    <td height="28" align="left" valign="top">稍後公佈 </td>
                </tr>
                <tr>
                    <td width="5%" height="28" align="center" valign="top" class="email">5.</td>
                    <td height="28" align="left" valign="top">「如何進入公職」講座</td>
                    <td height="28" align="left" valign="top">講解公務人員的招聘、甄選及晉級培訓等內容。 </td>
                    <td height="28" align="left" valign="top">稍後公佈</td>
                </tr>
                <tr>
                    <td width="5%" align="center" valign="top" class="email">6.</td>
                    <td align="left" valign="top">內地新生說明會</td>
                    <td align="left" valign="top">如何在澳學習?生活小錦囊幫到你。
                        <br>
                        歡迎內地學生及家長出席！</td>
                    <td align="left" valign="top"><span class="email">20/08/2015</span><br>
                        星期四<br>
                        <span class="email">15:00-17:00</span><br>
                        匯智樓1號演講廳</td>
                </tr>
            </table>
            <br />
            <table width="75%" border="0" align="center" cellpadding="4" cellspacing="1" class="border">
                <tr>
                    <td width="36%" height="85" align="left" class="cmail">&nbsp;</td>
                    <td width="64%" align="left" class="cmail">查詢：學生事務處(<span class="email">A119</span>室)
                        <br />
                        電話：<span class="email">8599 6203 / 85996 6486</span><br />
                        電郵：<span class="email"><a href="mailto:dae@ipm.edu.mo">dae@ipm.edu.mo</a></span></td>
                </tr>
            </table>
            <br />
        </div>
    </form>
</body>
</html>
