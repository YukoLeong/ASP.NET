<%@ Page Language="C#" AutoEventWireup="true" CodeFile="layout01pppage04.aspx.cs" Inherits="layout01pppage04" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <%--<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>--%>
    <link href="layout01pppage01style/jquery-ui.css" rel="stylesheet" />
    <script src="layout01pppage01style/jquery-1.11.2.min.js"></script>
    <script src="layout01pppage01style/jquery-ui.js"></script>


    <%--<link rel="stylesheet" href="layout01pppage01style/button.css" type="text/css" media="screen" />--%>
    <%--<link rel="stylesheet" href="layout01pppage01style/print.css" type="text/css" media="print" />--%>

    <link rel="stylesheet" href="layout01pppage01style/changebootstrap.css" />
    <link rel="stylesheet" href="bootstrapstyle/bootstrap-theme.min.css" />
    <script src="bootstrapstyle/bootstrap.min.js"></script>


    <style type="text/css">
        body {
            /*font-family: DFKai-sb;*/
        }

        #content {
            margin-left: 20px;
            margin-right: 20px;
        }

        .style1 {
            width: 100%;
            /*border: 1px solid #000000;*/
        }

        .uptablestyle{
            width: 100%;
            border-color:transparent;
        }


        .style3 {
            width: 100%;
        }

        .style4 {
            width: 212px;
            height: 36px;
        }

        .style5 {
            height: 36px;
        }

        .style6 {
            width: 212px;
        }

        .midleftstyle {
            width: 150px;
        }

        .style10 {
            width: 200px;
        }

        #ImageButton2 {
            width: 9%;
        }

        #logopart {
            /*background: url(layout50style2/logo_mcpoly.png) no-repeat top center;*/
            width: 44%;
            height: 94px;
            margin-top: 18px;
            float: left;
        }


        /*layout*/

        #logopart2 {
            background: url(layout50style2/jobsmanagement.png) no-repeat top center;
            width: 56%;
            height: 94px;
            margin-top: 20px;
            float: left;
        }

        #wrapper {
            width: 100%;
            /*height: 100vh;*/ /*div高度等於畫面高度*/
            background: url(layout50style2/body_bg.gif) repeat;
            /*min-width: 960px;*/
            /*min-height:900px;*/
        }

        #top_wrap {
            background: url(layout50style2/inside_visual5.png) no-repeat top center;
            height: 192px;
            /*display: block;*/
        }

        #middle_wrap {
            background: url(layout50style2/content_visual.png) no-repeat top center;
            min-height: 384px;
            width: 100%;
            /*position: relative;
            float: left;*/
        }

        .divborder {
            width: 961px;
            background-color: white;
            margin: auto; /*置中*/
            /*height: 600px;*/
            height: 100%;
            border-right: 1px solid #CDDCB1;
            border-left: 1px solid #CDDCB1;
        }

        #GridView1 td {
            padding: 10px;
        }

        #GridView1 th {
            padding: 10px;
        }
    </style>

    <script type="text/javascript">

        //$("#datepicker1").datepicker();
        //$("#datepicker2").datepicker();

        $(function () {

            $('#ViewPDFButton').click(function () {
                window.open('layout01pppage05.aspx', '_blank');
                return false;
            });

            $("#datepicker1").datepicker({
                //changeMonth: true,
                //changeYear: true
            });

            $("#datepicker2").datepicker({
                //changeMonth: true,
                //changeYear: true
            });

        });
    </script>



</head>
<body>
    <form id="form1" runat="server">

        <div style="height: 100px; width: 1200px; margin: auto">
            <div id="logopart">
                <asp:ImageButton ID="LogoImageButton" runat="server" Style="margin-left: 149px" OnClick="LogoImageButton_Click" ImageUrl="~/layout50style2/logo_mcpoly.png" />
            </div>
            <div id="logopart2">
            </div>
        </div>
        <div id="wrapper">
            <div id="top_wrap">
            </div>
            <div id="middle_wrap">
                <div class="divborder">
                    <br />
                    <br />
                    <div style="width: 930px; height: 1068px; margin: auto">
                        <%--content start--%>

                        <%--                        <asp:Button ID="Button1" class="btn btn-primary" Style="width: 70px" runat="server" Text="Back" OnClick="BackButton_Click" />--%>
                        <asp:ImageButton ID="BackButton" runat="server" onmouseover="this.src='layout01pppage01style/back01_hover.png'" onmouseout="this.src='layout01pppage01style/back01.png'" ImageUrl="~/layout01pppage01style/back01.png" OnClick="BackButton_Click" Style="width: 105px" />

                        <asp:Label ID="FromIDTemp" Style="display: none" runat="server" Text="Label"></asp:Label>

                        <asp:ImageButton ID="UpdateButton" runat="server" onmouseover="this.src='layout01pppage01style/update_hover.png'" onmouseout="this.src='layout01pppage01style/update.png'" ImageUrl="~/layout01pppage01style/update.png" Style="width: 105px" OnClick="UpdateButton_Click" />

                        <asp:ImageButton ID="ViewPDFButton" runat="server" onmouseover="this.src='layout01pppage01style/view02_hover.png'" onmouseout="this.src='layout01pppage01style/view02.png'" ImageUrl="~/layout01pppage01style/view02.png" Style="width: 105px"  />


                        <asp:ImageButton ID="UpdateButton2" runat="server" onmouseover="this.src='layout01pppage01style/update_hover.png'" onmouseout="this.src='layout01pppage01style/update.png'" ImageUrl="~/layout01pppage01style/update.png" Style="width: 105px" OnClick="UpdateButton2_Click" />


                        <%--                        <asp:ImageButton ID="ImageButton2" runat="server" onmouseover="this.src='layout01pppage01style/update_hover.png'" onmouseout="this.src='layout01pppage01style/update.png'" ImageUrl="~/layout01pppage01style/update.png" Style="width: 105px" OnClick="UpdateButton2_Click" />--%>





                        <%--<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>--%>

                        <%--panel1 content--%>
                        <asp:Panel ID="Panel1" runat="server">

                            <%--   <asp:ImageButton ID="UpdateButton" runat="server" onmouseover="this.src='layout01pppage01style/update_hover.png'" onmouseout="this.src='layout01pppage01style/update.png'" ImageUrl="~/layout01pppage01style/update.png" Style="width: 105px" OnClick="UpdateButton_Click" />--%>


                            <%--<asp:Label ID="Label1" runat="server" Text="Label">This is mutiview 1</asp:Label>--%>

                            <%--                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                                    Text="必須提供中英文職位名稱 Post Offered needs to be in Chinese and English" SetFocusOnError="True"
                                    Style="color: Red;"></asp:RequiredFieldValidator>--%>
                                &nbsp;
                                <%--                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="CatalogDll"
                                    Text="請輸入行業類別 Please Input Category" InitialValue="- - - Please select category - - -"
                                    Style="color: Red;"></asp:RequiredFieldValidator>--%>
                            <br />
                            <table class="style1" border="1" cellpadding="2" cellspacing="0">
                                <tr>
                                    <td class="style6" align="center">
                                        <%--normal style--%>
                                        <asp:Label ID="Label3" runat="server" Text="招聘職位(必選)&lt;br&gt;Post Offered"></asp:Label>

                                        <%--red star style--%>
                                        <%--<label for="account1">招聘職位<span style="color:red">*</span><br/>Post Offered</label>--%>
                                    </td>
                                    <td style="padding: 4px 4px 4px 4px;">行業類別

                                                                    <asp:DropDownList ID="CatalogDll" class="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="CatalogDll_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                        職位名稱
                                            <asp:TextBox ID="TextBox2" class="form-control" runat="server"></asp:TextBox>
                                        <%--<asp:TextBox ID="TextBox2" class="form-control" runat="server"></asp:TextBox>--%>

                                        <%--                                            <br />
                                            <asp:Label ID="Label2" runat="server" Text="招聘人數No.of Vacancy"></asp:Label>
                                            <asp:TextBox ID="TextBox2" runat="server" Width="32px"></asp:TextBox>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:CheckBox ID="CheckBox1" runat="server" class="checkbox-inline" Text="全職 Full-Time" />
                                            <asp:CheckBox ID="CheckBox2" runat="server" class="checkbox-inline" Text="兼職 Part-Time" />--%>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style6" align="center">
                                        <asp:Label ID="Label4" runat="server" class="form-control-inline" Text="機構名稱&lt;br&gt;Organization Name"></asp:Label>
                                    </td>
                                    <td style="padding: 4px 4px 4px 4px;">
                                        <asp:TextBox ID="TextBox3" class="form-control" runat="server" MaxLength="30"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style6" align="center">
                                        <asp:Label ID="Label5" runat="server" Text="工作性質&lt;br&gt;Business Nature"></asp:Label>
                                    </td>
                                    <td style="padding: 4px 4px 4px 4px;">
                                        <asp:DropDownList ID="NatureDll" class="form-control" runat="server">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style6" align="center">
                                        <asp:Label ID="Label6" runat="server" Text="工作內容&lt;br&gt;Job Description &amp; Basic Duties"></asp:Label>
                                    </td>
                                    <td style="padding: 4px 4px 4px 4px;">
                                        <asp:TextBox ID="TextBox5" class="form-control" runat="server" TextMode="MultiLine" Height="100px" MaxLength="300"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style6" align="center">
                                        <asp:Label ID="Label7" runat="server" Text="薪金&lt;br&gt;Salary Offered"></asp:Label>
                                    </td>
                                    <td style="padding: 4px 4px 2px 4px;">
                                        <%--<asp:Label ID="Label7" runat="server" Text="MOP" Style="font-weight: bold;"></asp:Label>--%>
                                        <asp:TextBox ID="TextBox26" class="form-control" runat="server" placeholder="MOP" MaxLength="30"></asp:TextBox>
                                        <asp:CheckBox ID="CheckBox3" class="checkbox-inline" Style="padding-left: 26px; padding-top: 4px" runat="server" Text="小時Hour" />
                                        <asp:CheckBox ID="CheckBox4" class="checkbox-inline" Style="padding-top: 4px" runat="server" Text="日Day" />
                                        <asp:CheckBox ID="CheckBox5" class="checkbox-inline" Style="padding-top: 4px" runat="server" Text="月Month" />
                                        <asp:CheckBox ID="CheckBox6" class="checkbox-inline" Style="padding-top: 4px" runat="server" Text="其他Others" />
                                        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                            ControlToValidate="TextBox26" Text="Please Insert Number" ValidationExpression="[0-9]*\.?[0-9]{0,8}"
                                            Style="color: Red;"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style6" align="center">
                                        <asp:Label ID="Label8" runat="server" Text="要求&lt;br&gt;Qualification Requirements"></asp:Label>
                                    </td>
                                    <td style="padding: 4px 4px 4px 4px;">
                                        <asp:TextBox ID="TextBox6" class="form-control" runat="server" TextMode="MultiLine" Height="100px" MaxLength="300"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style6" align="center">
                                        <asp:Label ID="Label9" runat="server">重要日期<br/>Important Dates</asp:Label>
                                    </td>
                                    <td>
                                        <table>
                                            <tr>
                                                <td style="padding: 4px 4px 4px 5px;">
                                                    <%--inline1--%>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="Label1" runat="server" Text="申請截止日期 Application Deadline"></asp:Label></td>
                                                            <td>
                                                                <asp:TextBox ID="datepicker1" runat="server" type="text" class="form-control" Style="width: 200px; margin-left: 5px" MaxLength="30"></asp:TextBox></td>
                                                        </tr>
                                                    </table>

                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="padding: 4px 4px 4px 5px;">
                                                    <%--inline2--%>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="Label11" runat="server" Text="工作開始日期 Start Date"></asp:Label></td>
                                                            <td>
                                                                <asp:TextBox ID="datepicker2" runat="server" type="text" class="form-control" Style="width: 200px; margin-left: 70px" MaxLength="30"></asp:TextBox></td>
                                                        </tr>
                                                    </table>

                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style6" align="center">
                                        <asp:Label ID="Label12" runat="server" Text="申請者須遞交文件<br>Docs to Submit for Application"></asp:Label>
                                    </td>
                                    <td style="padding: 6px 4px 4px 9px;">
                                        <asp:CheckBox ID="CheckBox7" class="checkbox-inline" runat="server" Text="應徵信 Job Application Letter" />
                                        <asp:CheckBox ID="CheckBox8" class="checkbox-inline" runat="server" Text="履歷表 Resume" />
                                        <br />
                                        <asp:CheckBox ID="CheckBox9" class="checkbox-inline" runat="server" Text="身份證副本 ID Copy" />
                                        <asp:CheckBox ID="CheckBox10" class="checkbox-inline" runat="server" Text="成績單 Transcript" />
                                        <br />
                                        <asp:CheckBox ID="CheckBox11" class="checkbox-inline" runat="server" Text="駕駛執照副本 Copy of Driving License" />
                                        <br />
                                        <asp:CheckBox ID="CheckBox13" class="checkbox-inline" runat="server" Text="其他 Others" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style6" align="center">
                                        <asp:Label ID="Label13" runat="server" Text="申請者之應徵方式<br>Methods of Application"></asp:Label>
                                    </td>
                                    <td style="padding: 4px 4px 4px 5px;">
                                        <%--<asp:CheckBox ID="CheckBox14" class="checkbox-inline" runat="server" Text="郵寄至 Post to" OnCheckedChanged="CheckBox14_CheckedChanged"
                                                AutoPostBack="true" />--%>

                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label14" runat="server" Text="郵寄至 Post to"></asp:Label></td>
                                                <td>
                                                    <asp:TextBox ID="TextBox9" runat="server" type="text" class="form-control" Style="width: 400px; margin-left: 26px; margin-bottom: 2px" MaxLength="40"></asp:TextBox></td>
                                            </tr>
                                        </table>

                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label15" runat="server" Text="電郵 E-mail"></asp:Label></td>
                                                <td>
                                                    <asp:TextBox ID="TextBox10" runat="server" type="text" class="form-control" Style="width: 400px; margin-left: 44px; margin-bottom: 2px" MaxLength="40"></asp:TextBox>
                                                </td>
                                                <td>&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server"
                                                    ControlToValidate="TextBox10" Text="Insert correct E-mail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                    Style="color: Red;"></asp:RegularExpressionValidator>
                                                </td>
                                            </tr>
                                        </table>

                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label18" runat="server" Text="電話 Phone"></asp:Label></td>
                                                <td>
                                                    <asp:TextBox ID="TextBox11" runat="server" type="text" class="form-control" Style="width: 400px; margin-left: 43px; margin-bottom: 2px" MaxLength="40">
                                                    </asp:TextBox>
                                                </td>
                                                <td>&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"
                                                    ControlToValidate="TextBox11" Text="Insert correct number" ValidationExpression="\d+"
                                                    Style="color: Red;"></asp:RegularExpressionValidator>
                                                </td>
                                            </tr>
                                        </table>

                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label19" runat="server" Text="其他方式 Others"></asp:Label></td>
                                                <td>
                                                    <asp:TextBox ID="TextBox12" runat="server" type="text" class="form-control" Style="width: 400px; margin-left: 13px; margin-bottom: 2px" MaxLength="40"></asp:TextBox></td>
                                            </tr>
                                        </table>






                                        <%--                                        <form class="form-inline">
                                        </form>
                                        <form class="form-inline">
                                            <div class="form-group">
                                                <asp:Label ID="Label15" runat="server" Text="電郵 E-mail"></asp:Label>
                                                <asp:TextBox ID="TextBox10" runat="server" type="text" class="form-control" Style="width: 400px; margin-left: 31px; margin-top: 2px; margin-bottom: 2px"></asp:TextBox>
                                                &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server"
                                                    ControlToValidate="TextBox10" Text="Insert correct E-mail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                    Style="color: Red;"></asp:RegularExpressionValidator>
                                            </div>
                                        </form>



           
                                        <form class="form-inline">
                                            <div class="form-group">
                                                <asp:Label ID="Label18" runat="server" Text="電話 Phone"></asp:Label>
                                                <asp:TextBox ID="TextBox11" runat="server" type="text" class="form-control" Style="width: 400px; margin-left: 30px; margin-top: 2px; margin-bottom: 2px"></asp:TextBox>
                                                &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"
                                                    ControlToValidate="TextBox11" Text="Insert correct number" ValidationExpression="\d+"
                                                    Style="color: Red;"></asp:RegularExpressionValidator>
                                            </div>
                                        </form>


                                        <form class="form-inline">
                                            <div class="form-group">
                                                <asp:Label ID="Label19" runat="server" Text="其他方式 Others"></asp:Label>
                                                <asp:TextBox ID="TextBox12" runat="server" type="text" class="form-control" Style="width: 400px; margin-top: 2px"></asp:TextBox>
                                            </div>
                                        </form>--%>



                                    </td>
                                </tr>
                                <tr>
                                    <td class="style6" align="center">
                                        <asp:Label ID="Label16" runat="server" Text="查詢及聯絡方法<br>Enquireies &amp; Contact Informaion"></asp:Label>
                                    </td>
                                    <td style="padding: 4px 4px 4px 5px;">


                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label20" runat="server" Text="聯絡人 Contact Person"></asp:Label>

                                                </td>
                                                <td>
                                                    <asp:TextBox ID="TextBox13" runat="server" type="text" class="form-control" Style="width: 356px; margin-left: 13px; margin-bottom: 2px" MaxLength="40"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="CheckBox18" Style="margin-left: 17px" class="checkbox-inline" runat="server" Text="女士 Ms/" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="CheckBox19" Style="margin-left: 17px" runat="server" Text="先生 Mr" />
                                                </td>
                                            </tr>
                                        </table>


                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label17" runat="server" Text="聯絡電話 Phone"></asp:Label></td>
                                                <td>
                                                    <asp:TextBox ID="TextBox14" runat="server" type="text" class="form-control" Style="width: 356px; margin-left: 56px; margin-bottom: 2px" MaxLength="40"></asp:TextBox></td>
                                                <td>&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                                                    ControlToValidate="TextBox14" Text="Please insert correct number" ValidationExpression="\d+"
                                                    Style="color: Red;"></asp:RegularExpressionValidator>
                                                </td>
                                            </tr>
                                        </table>

                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label21" runat="server" Text="電郵 Email"></asp:Label></td>
                                                <td>
                                                    <asp:TextBox ID="TextBox15" runat="server" type="text" class="form-control" Style="width: 356px; margin-left: 90px; margin-bottom: 2px" MaxLength="40"></asp:TextBox></td>
                                                <td>&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                                                    ControlToValidate="TextBox15" Text="Please insert correct E-mail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                    Style="color: Red;"></asp:RegularExpressionValidator>
                                                </td>
                                            </tr>
                                        </table>




                                        <%--                                        <form class="form-inline">
                                            <div class="form-group">
                                                <asp:Label ID="Label20" runat="server" Text="聯絡人 Contact Person:"></asp:Label>
                                                <asp:TextBox ID="TextBox13" runat="server" type="text" class="form-control" Style="width: 300px; margin-top: 2px; margin-bottom: 2px"></asp:TextBox>
                                                <asp:CheckBox ID="CheckBox18" Style="margin-left: 2px" class="checkbox-inline" runat="server" Text="女士 Ms/" />
                                                <asp:CheckBox ID="CheckBox19" runat="server" Text="先生 Mr" />
                                            </div>
                                        </form>

                                        <form class="form-inline">
                                            <div class="form-group">
                                                <asp:Label ID="Label17" runat="server" Text="聯絡電話 Phone:"></asp:Label>
                                                <asp:TextBox ID="TextBox14" runat="server" type="text" class="form-control" Style="width: 300px; margin-left: 43px; margin-top: 2px; margin-bottom: 2px"></asp:TextBox>
                                                &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                                                    ControlToValidate="TextBox14" Text="Please insert correct number" ValidationExpression="\d+"
                                                    Style="color: Red;"></asp:RegularExpressionValidator>
                                            </div>
                                        </form>


 

                                        <form class="form-inline">
                                            <div class="form-group">
                                                <asp:Label ID="Label21" runat="server" Text="電郵 Email:"></asp:Label>
                                                <asp:TextBox ID="TextBox15" runat="server" type="text" class="form-control" Style="width: 300px; margin-top: 2px; margin-left: 77px"></asp:TextBox>
                                                &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                                                    ControlToValidate="TextBox15" Text="Please insert correct E-mail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                    Style="color: Red;"></asp:RegularExpressionValidator>
                                            </div>
                                        </form>--%>




                                    </td>
                                </tr>
                        </asp:Panel>
                        <%--panel2 content--%>
                        <asp:Panel ID="Panel2" runat="server">
                            <asp:Label ID="Label2" runat="server" Text="Label" Style="display: none">This is mutiview 2</asp:Label>

                            <br />
                            <table class="uptablestyle" border="1" cellpadding="2" cellspacing="0" border-color="#ffffff" >
                            <tr>
                                <td class="style6" align="center">
                                    <asp:Label ID="Label10" runat="server" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"></asp:Label>
                                </td>
                                <td style="padding: 34px 4px 4px 5px;">

                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label41" runat="server" Text="行業類別"></asp:Label>
                                                &nbsp;
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="CatalogDll2" Style="width: 356px; margin-left: 5px ;margin-bottom: 5px" runat="server" class="form-control">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                    </table>
                                    <table>
                                        <tr>
                                            <td style="margin-bottom:3px">
                                                <asp:Label ID="Label45" runat="server" Text="機構名稱" MaxLength="40"></asp:Label>
                                                &nbsp;
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBox3B" runat="server" Style="width: 356px; margin-left: 5px ;margin-top: 16px" class="form-control"></asp:TextBox>
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                    <table>
                                        <tr>
                                            <td style="padding-bottom:20px">
                                                <asp:Label ID="Label46" runat="server" Text="招聘職位"></asp:Label>
                                                &nbsp;
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBox1B" runat="server" Width="356px" Style="width: 356px; margin-left: 5px" class="form-control" MaxLength="40"></asp:TextBox>
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label47" runat="server" Text="Choose PDF File: "></asp:Label>
                                                &nbsp;
                                            </td>
                                            <td>
                                                <asp:FileUpload ID="FileUpload1" runat="server" EnableTheming="True" Style="margin-top:22px "/>
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>

                                </td>
                            </tr>
                                </table>

                            <br />
                            <asp:Label ID="FileUpLoadLable" runat="server" Text=""></asp:Label>
                            <br />
                            <%--<asp:Button ID="ViewFileButton" runat="server" Text="View PDF File" />--%>
                            <br />
                            <asp:TextBox ID="FilenameTemp" runat="server" Style="display: none"></asp:TextBox>
                            <br />


                        </asp:Panel>







                        <%--content close--%>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
