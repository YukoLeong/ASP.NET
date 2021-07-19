<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CareerForm.aspx.cs" Inherits="Student_CareerForm2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script src="Scripts/jquery.js" type="text/javascript"></script>
    <script src="Styles/jquery-ui.js" type="text/javascript"></script>
    <link href="Styles/jquery-ui.css" rel="stylesheet" />
    <link rel="stylesheet" href="../button.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="../print.css" type="text/css" media="print" />
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
    <style type="text/css">
        body
        {
            font-family: DFKai-sb;
        }
        #content
        {
            margin-left: 200px;
            margin-right: 200px;
        }
        .style1
        {
            width: 100%;
            border: 1px solid #000000;
        }
        .style3
        {
            width: 100%;
        }
        .style4
        {
            width: 212px;
            height: 36px;
        }
        .style5
        {
            height: 36px;
        }
        .style6
        {
            width: 212px;
        }
        .style10
        {
            width: 200px;
        }
        #ImageButton2{
            width:9%;
        }

    </style>
    <script type="text/javascript">
        $(function () {
            $("#datepicker1").datepicker({
                showOn: "button",
                buttonImage: "../images/calendar.gif",
                buttonImageOnly: true,
                showWeek: false,
                changeMonth: true,
                changeYear: true,
                buttonText: "Select date"
            });

            $("#datepicker2").datepicker({
                showOn: "button",
                buttonImage: "../images/calendar.gif",
                buttonImageOnly: true,
                showWeek: false,
                changeMonth: true,
                changeYear: true,
                buttonText: "Select date"
            });

            $("#datepicker3").datepicker({
                showOn: "button",
                buttonImage: "../images/calendar.gif",
                buttonImageOnly: true,
                showWeek: false,
                changeMonth: true,
                changeYear: true,
                buttonText: "Select date"
            });

            $("#datepicker4").datepicker({
                showOn: "button",
                buttonImage: "../images/calendar.gif",
                buttonImageOnly: true,
                showWeek: false,
                changeMonth: true,
                changeYear: true,
                buttonText: "Select date"
            });

            $(".ui-datepicker-trigger").css("margin-bottom", "-1px");
            $(".ui-datepicker-trigger").css("margin-left", "1px");

        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="content">
        <div align="center">
<%--            <asp:Button ID="HomeButton" runat="server" Text="Home" CssClass="blue" Width="100px"
                Height="40px" OnClick="HomeButton_Click" CausesValidation="false" />--%>
    <div style="text-align:center;margin-top:5px;padding-bottom:3px;width:1554px">
               <asp:ImageButton ID="ImageButton2" runat="server" onmouseover="this.src='../images/homeblue_hover.png'" onmouseout="this.src='../images/homeblue.png'" ImageUrl="~/images/homeblue.png" OnClick="ImageButton2_Click" CausesValidation="False" /> 
    </div>

            <br />


        </div>
        <div align="center" style="font-size: 11pt;">
            <asp:Label ID="TopLabel1" runat="server" Text="【第 一 部 份 Section 1】"></asp:Label></div>
        <div align="center" style="font-size: 14pt; font-weight: bold;">
            <asp:Label ID="TopLabel2" runat="server" Text="招聘信息刊登 Job Opportunity Information Ref #_________"></asp:Label>
        </div>
        <span id="RecruitWay">
            <asp:RadioButton ID="RecruitWay1" runat="server" Text="表格方式招聘" GroupName="RecruitWay"
                Checked="true" OnCheckedChanged="RecruitWay1_CheckedChanged" AutoPostBack="true" />
            <asp:RadioButton ID="RecruitWay2" runat="server" Text="上載檔案招聘" GroupName="RecruitWay"
                OnCheckedChanged="RecruitWay2_CheckedChanged" AutoPostBack="true" />
            <br />
        </span>
        <asp:Panel ID="Panel1" runat="server">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                Text="必須提供中英文職位名稱 Post Offered needs to be in Chinese and English" SetFocusOnError="True"
                Style="color: Red;"></asp:RequiredFieldValidator>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="CatalogDll"
                Text="請輸入行業類別 Please Input Category" InitialValue="- - - Please select category - - -"
                Style="color: Red;"></asp:RequiredFieldValidator>
            <br />
            <table class="style1" border="1" cellpadding="2" cellspacing="0">
                <tr>
                    <td class="style6" align="center">
                        <asp:Label ID="Label1" runat="server" Text="招聘職位(必選)&lt;br&gt;Post Offered"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" Width="443px"></asp:TextBox>
                        &nbsp;行業類別
                        <asp:DropDownList ID="CatalogDll" runat="server" AutoPostBack="true" OnSelectedIndexChanged="CatalogDll_SelectedIndexChanged">
                        </asp:DropDownList>
                        <br />
                        <asp:Label ID="Label2" runat="server" Text="招聘人數No.of Vacancy"></asp:Label>
                        <asp:TextBox ID="TextBox2" runat="server" Width="32px"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:CheckBox ID="CheckBox1" runat="server" Text="全職 Full-Time" />
                        <asp:CheckBox ID="CheckBox2" runat="server" Text="兼職 Part-Time" />
                    </td>
                </tr>
                <tr>
                    <td class="style6" align="center">
                        <asp:Label ID="Label3" runat="server" Text="機構名稱&lt;br&gt;Organization Name"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server" Height="22px" Width="454px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style6" align="center">
                        <asp:Label ID="Label4" runat="server" Text="工作性質&lt;br&gt;Business Nature"></asp:Label>
                    </td>
                    <td>
                        &nbsp;<asp:DropDownList ID="NatureDll" runat="server" Width="200px">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="style6" align="center">
                        <asp:Label ID="Label5" runat="server" Text="工作內容&lt;br&gt;Job Description &amp; Basic Duties"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox5" runat="server" Height="101px" TextMode="MultiLine" Width="592px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style6" align="center">
                        <asp:Label ID="Label6" runat="server" Text="薪金&lt;br&gt;Salary Offered"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label7" runat="server" Text="MOP" Style="font-weight: bold;"></asp:Label>
                        <asp:TextBox ID="TextBox26" runat="server"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:CheckBox ID="CheckBox3" runat="server" Text="小時Hour" />
                        <asp:CheckBox ID="CheckBox4" runat="server" Text="日Day" />
                        <asp:CheckBox ID="CheckBox5" runat="server" Text="月Month" />
                        <asp:CheckBox ID="CheckBox6" runat="server" Text="其他Others" />
                        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                            ControlToValidate="TextBox26" Text="Please Insert Number" ValidationExpression="[0-9]*\.?[0-9]{0,8}"
                            Style="color: Red;"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style6" align="center">
                        <asp:Label ID="Label8" runat="server" Text="要求&lt;br&gt;Qualification Requirements"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox6" runat="server" Height="107px" TextMode="MultiLine" Width="590px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style6" align="center">
                        <asp:Label ID="Label9" runat="server">重要日期<br/>Important Dates</asp:Label>
                    </td>
                    <td>
                        <table>
                            <tr>
                                <td>
                                    <asp:Label ID="Label10" runat="server" Text="申請截止日期 Application Deadline"></asp:Label>
                                    <asp:TextBox ID="datepicker1" runat="server" Style="height: 11px; margin-left: 4px;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label11" runat="server" Text="工作開始日期 Start Date"></asp:Label>
                                    <asp:TextBox ID="datepicker2" runat="server" Style="height: 11px; margin-left: 84px;"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="style6" align="center">
                        <asp:Label ID="Label12" runat="server" Text="申請者須遞交文件<br>Docs to Submit for Application"></asp:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="CheckBox7" runat="server" Text="應徵信 Job Application Letter" />
                        <asp:CheckBox ID="CheckBox8" runat="server" Text="履歷表 Resume" />
                        <br />
                        <asp:CheckBox ID="CheckBox9" runat="server" Text="身份證副本 ID Copy" />
                        <asp:CheckBox ID="CheckBox10" runat="server" Text="成績單 Transcript" />
                        <br />
                        <asp:CheckBox ID="CheckBox11" runat="server" Text="駕駛執照副本 Copy of Driving License" />
                        <br />
                        <asp:CheckBox ID="CheckBox13" runat="server" Text="其他 Others" />
                    </td>
                </tr>
                <tr>
                    <td class="style6" align="center">
                        <asp:Label ID="Label13" runat="server" Text="申請者之應徵方式<br>Methods of Application"></asp:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="CheckBox14" runat="server" Text="郵寄至 Post to" OnCheckedChanged="CheckBox14_CheckedChanged"
                            AutoPostBack="true" />
                        <asp:TextBox ID="TextBox9" runat="server" Style="margin-left: 20px"></asp:TextBox>
                        <br />
                        <asp:CheckBox ID="CheckBox15" runat="server" Text="電郵 E-mail" OnCheckedChanged="CheckBox15_CheckedChanged"
                            AutoPostBack="true" />
                        <asp:TextBox ID="TextBox10" runat="server" Style="margin-left: 44px"></asp:TextBox>
                        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"
                            ControlToValidate="TextBox10" Text="Please insert correct E-mail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                            Style="color: Red;"></asp:RegularExpressionValidator>
                        <br />
                        <asp:CheckBox ID="CheckBox16" runat="server" Text="電話 Phone" OnCheckedChanged="CheckBox16_CheckedChanged"
                            AutoPostBack="true" />
                        <asp:TextBox ID="TextBox11" runat="server" Style="margin-left: 52px"></asp:TextBox>
                        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                            ControlToValidate="TextBox11" Text="Please insert correct number" ValidationExpression="\d+"
                            Style="color: Red;"></asp:RegularExpressionValidator>
                        <br />
                        <asp:CheckBox ID="CheckBox17" runat="server" Text="其他方式 Others" OnCheckedChanged="CheckBox17_CheckedChanged"
                            AutoPostBack="true" />
                        <asp:TextBox ID="TextBox12" runat="server" Style="margin-left: 12px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style6" align="center">
                        <asp:Label ID="Label14" runat="server" Text="查詢及聯絡方法<br>Enquireies &amp; Contact Informaion"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label15" runat="server" Text="聯絡人 Contact Person:"></asp:Label>
                        <asp:TextBox ID="TextBox13" runat="server"></asp:TextBox>
                        <asp:CheckBox ID="CheckBox18" runat="server" Text="女士 Ms/" />
                        <asp:CheckBox ID="CheckBox19" runat="server" Text="先生 Mr" />
                        <br />
                        <asp:Label ID="Label16" runat="server" Text="聯絡電話 Phone:"></asp:Label>
                        <asp:TextBox ID="TextBox14" runat="server" Style="margin-left: 56px"></asp:TextBox>
                        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                            ControlToValidate="TextBox14" Text="Please insert correct number" ValidationExpression="\d+"
                            Style="color: Red;"></asp:RegularExpressionValidator>
                        <br />
                        <asp:Label ID="Label17" runat="server" Text="電郵 Email:"></asp:Label>
                        <asp:TextBox ID="TextBox15" runat="server" Style="margin-left: 88px"></asp:TextBox>
                        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server"
                            ControlToValidate="TextBox15" Text="Please insert correct E-mail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                            Style="color: Red;"></asp:RegularExpressionValidator>
                    </td>
                </tr>
            </table>
            <p>
                &nbsp;</p>
            <table class="style1">
                <tr>
                    <td align="left" class="style6">
                        要求特質<br />
                        Request Ability
                    </td>
                    <td class="style10">
                        <asp:Label ID="Label32" runat="server" Text="專業能力&lt;br&gt;Professional Competence"></asp:Label>
                        <br />
                        <asp:DropDownList ID="DropDownList1" runat="server">
                            <asp:ListItem Value="1">不重要</asp:ListItem>
                            <asp:ListItem Value="2">一般</asp:ListItem>
                            <asp:ListItem Value="3">有需要</asp:ListItem>
                            <asp:ListItem Value="4">重要</asp:ListItem>
                            <asp:ListItem Value="5">非常重要</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="style10">
                        <asp:Label ID="Label33" runat="server" Text="領導&lt;br&gt;Leadership"></asp:Label>
                        <br />
                        <asp:DropDownList ID="DropDownList2" runat="server">
                            <asp:ListItem Value="1">不重要</asp:ListItem>
                            <asp:ListItem Value="2">一般</asp:ListItem>
                            <asp:ListItem Value="3">有需要</asp:ListItem>
                            <asp:ListItem Value="4">重要</asp:ListItem>
                            <asp:ListItem Value="5">非常重要</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:Label ID="Label34" runat="server" Text="溝通&lt;br&gt;Communication"></asp:Label>
                        <br />
                        <asp:DropDownList ID="DropDownList3" runat="server">
                            <asp:ListItem Value="1">不重要</asp:ListItem>
                            <asp:ListItem Value="2">一般</asp:ListItem>
                            <asp:ListItem Value="3">有需要</asp:ListItem>
                            <asp:ListItem Value="4">重要</asp:ListItem>
                            <asp:ListItem Value="5">非常重要</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:Label ID="Label35" runat="server" Text="創造力&lt;br&gt;Creativity"></asp:Label>
                        <br />
                        <asp:DropDownList ID="DropDownList4" runat="server">
                            <asp:ListItem Value="1">不重要</asp:ListItem>
                            <asp:ListItem Value="2">一般</asp:ListItem>
                            <asp:ListItem Value="3">有需要</asp:ListItem>
                            <asp:ListItem Value="4">重要</asp:ListItem>
                            <asp:ListItem Value="5">非常重要</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:Label ID="Label36" runat="server" Text="主動性&lt;br&gt;Initiative"></asp:Label>
                        <br />
                        <asp:DropDownList ID="DropDownList5" runat="server">
                            <asp:ListItem Value="1">不重要</asp:ListItem>
                            <asp:ListItem Value="2">一般</asp:ListItem>
                            <asp:ListItem Value="3">有需要</asp:ListItem>
                            <asp:ListItem Value="4">重要</asp:ListItem>
                            <asp:ListItem Value="5">非常重要</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="style6">
                        &nbsp;
                    </td>
                    <td class="style10">
                        <asp:Label ID="Label37" runat="server" Text="自我發展&lt;br&gt;Self Development"></asp:Label>
                        <br />
                        <asp:DropDownList ID="DropDownList6" runat="server">
                            <asp:ListItem Value="1">不重要</asp:ListItem>
                            <asp:ListItem Value="2">一般</asp:ListItem>
                            <asp:ListItem Value="3">有需要</asp:ListItem>
                            <asp:ListItem Value="4">重要</asp:ListItem>
                            <asp:ListItem Value="5">非常重要</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="style10">
                        <asp:Label ID="Label38" runat="server" Text="社會責任&lt;br&gt;Social Responsibility"></asp:Label>
                        <br />
                        <asp:DropDownList ID="DropDownList7" runat="server">
                            <asp:ListItem Value="1">不重要</asp:ListItem>
                            <asp:ListItem Value="2">一般</asp:ListItem>
                            <asp:ListItem Value="3">有需要</asp:ListItem>
                            <asp:ListItem Value="4">重要</asp:ListItem>
                            <asp:ListItem Value="5">非常重要</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:Label ID="Label39" runat="server" Text="語言&lt;br&gt;Language"></asp:Label>
                        <br />
                        <asp:DropDownList ID="DropDownList8" runat="server">
                            <asp:ListItem Value="1">不重要</asp:ListItem>
                            <asp:ListItem Value="2">一般</asp:ListItem>
                            <asp:ListItem Value="3">有需要</asp:ListItem>
                            <asp:ListItem Value="4">重要</asp:ListItem>
                            <asp:ListItem Value="5">非常重要</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:Label ID="Label40" runat="server" Text="電腦應用&lt;br&gt;IT Application"></asp:Label>
                        <br />
                        <asp:DropDownList ID="DropDownList9" runat="server">
                            <asp:ListItem Value="1">不重要</asp:ListItem>
                            <asp:ListItem Value="2">一般</asp:ListItem>
                            <asp:ListItem Value="3">有需要</asp:ListItem>
                            <asp:ListItem Value="4">重要</asp:ListItem>
                            <asp:ListItem Value="5">非常重要</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <br />
                    </td>
                </tr>
            </table>
            <p>
                &nbsp;</p>
            <table class="style3" frame="border">
                <tr>
                    <td class="style4">
                        <asp:Label ID="Label18" runat="server" Text="機構名稱<br>Organiztion Name"></asp:Label>
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="TextBox16" runat="server" Width="464px"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label28" runat="server" Text="需填寫中英文名稱 Name in Chinese &amp; English are required"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style6">
                        <asp:Label ID="Label19" runat="server" Text="公司地址&lt;br&gt;Company Address"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox17" runat="server" Width="464px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style6">
                        <asp:Label ID="Label20" runat="server" Text="公司商業登記號碼<br>Commercial Reg No"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox18" runat="server" Width="464px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style6">
                        <asp:Label ID="Label21" runat="server" Text="本登記聯絡人&lt;br&gt;Contact Person for Job Posting"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox19" runat="server" Width="318px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style6">
                        <asp:Label ID="Label22" runat="server" Text="職位及部門&lt;br&gt;Position &amp; Department"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox20" runat="server" Width="318px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style6">
                        <asp:Label ID="Label23" runat="server" Text="電話&lt;br&gt;Telephone"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox21" runat="server" Width="148px"></asp:TextBox>
                        <asp:Label ID="Label24" runat="server" Text="傳真Fax"></asp:Label>
                        <asp:TextBox ID="TextBox22" runat="server" Width="207px"></asp:TextBox>
                        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server"
                            ControlToValidate="TextBox21" Text="Please insert correct number" ValidationExpression="\d+"
                            Style="color: Red;"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style6">
                        <asp:Label ID="Label25" runat="server" Text="電郵&lt;br&gt;E-mail"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox23" runat="server" Width="315px"></asp:TextBox>
                        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server"
                            ControlToValidate="TextBox23" Text="Please insert correct E-mail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                            Style="color: Red;"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style6">
                        <asp:Label ID="Label26" runat="server" Text="招聘訊息刊登日期<br>Date of Posting"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label29" runat="server" Text="由From"></asp:Label>
                        <asp:TextBox ID="datepicker3" runat="server" Style="height: 11px;"></asp:TextBox>
                        <asp:Label ID="Label30" runat="server" Text="至to"></asp:Label>
                        <asp:TextBox ID="datepicker4" runat="server" Style="height: 11px;"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <p>
                &nbsp;</p>
            <table class="style3" frame="border">
                <tr>
                    <td>
                        <asp:Label ID="Label263" runat="server" Text="注意事項 Important Notice: " />
                        <br />
                        <ol>
                            <li>商業機構第一次申請刊登需要同時遞交公司商業登記副本。For commercial organizations, copy of your Commericial
                                Registration should be submitted when posting your first advertisement on this site.</li>
                            <li>申請招聘刊登申請最長可刊登3 個月。The maximum duration dor each posting is 3 months. </li>
                            <li>申請獲接納後第一部份內容將刊登在本院網頁&quot;學生園地&quot;內，版權為本院所有。<br />
                                Upon acceptance, &quot;Session 1&quot; will be displayed on our website - Student&#39;s
                                corner. The copyright (website) belongs to MPI, and the Institute has the authority
                                to amend the information posted whenever appropriate.<br />
                                &quot;Session 2&quot; will only be seen by MPI staff.</li>
                            <li>澳門理工學院學生事務處聯絡資料。Contact information of the Student Affairs Office, MPI:
                                <br />
                                傅真 Fax: +853 28706747 ; 電話: 8599 6625/6463; 電郵 Email: <a href="mailto:jobsforstudent@ipm.edu.mo">
                                    jobsforstudent@ipm.edu.mo</a><br />
                                地址 Address: 澳門高美士街A119室Room A119, Rua de Luis Gonzaga Comes, Macau<br />
                                <li>塡妥表格後請先列印，再按&quot;提交&quot;按鈕，而列印表格需簽名蓋章後以電郵或傳真方式交回學生事務處。</li>
                                Please print out the completed form before pressing &quot;Submit&quot;buttons, and
                                send the form with signature &amp; stamp to the Student Affairs Office via email
                                or fax.</li>
                        </ol>
                        <br />
                        <br />
                        <div style="margin: 0 auto; width: 80%;">
                            <div style="float: left; width: 50%; text-align: center;">
                                _____________________________________________&nbsp;&nbsp;&nbsp;&nbsp;
                                <br />
                                公司簽章 Signature &amp; Company&#39;s Stamp</div>
                            <div style="float: right; width: 50%;">
                                ___________/___________/__________<br />
                                日DO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; / 月MM&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /年YY
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="Panel2" runat="server">
            <br />
            <br />
            <br />
            <asp:Label ID="RecruitWayLabel1" runat="server" Text="行業類別: "></asp:Label>
            <asp:DropDownList ID="RecruitWayDropDownList" runat="server" Height="22px" Width="350px">
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="RecruitWayDropDownList" 
                ErrorMessage="Please insert information1" 
                InitialValue="- - - Please select category - - -"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Label ID="RecruitWayLabel2" runat="server" Text="機構名稱: "></asp:Label>
            <asp:TextBox ID="RecruitWayText2" runat="server" Height="22px" Width="346px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="RecruitWayText2" ErrorMessage="Please insert information2"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Label ID="RecruitWayLabel3" runat="server" Text="招聘職位: "></asp:Label>
            <asp:TextBox ID="RecruitWayText3" runat="server" Height="22px" Width="346px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ControlToValidate="RecruitWayText3" ErrorMessage="Please insert information3"></asp:RequiredFieldValidator>
            <br />
            <br />
            <br />
            <br />
            <asp:FileUpload ID="FileUpload1" runat="server" accept=".pdf,.doc,.docx" />
            <asp:Label ID="RecruitLabel" runat="server" Text="(Less than 50MB of pdf file)"
                Style="font-family: Arial Unicode MS"></asp:Label>
            <br />
            <br />
            <br />
            <asp:Button ID="RecruitWayButton" runat="server" Text="Submit" CssClass="blue" OnClick="RecruitWayButton_Click" />
        </asp:Panel>
    </div>
    <table class="style3">
        <tr>
            <td align="center">
                <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="blue" OnClick="Button1_Click" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
