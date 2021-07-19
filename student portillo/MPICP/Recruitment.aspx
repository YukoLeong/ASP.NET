<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Recruitment.aspx.cs" Inherits="MPICP_Recruitment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />

    <link rel="shortcut icon" href="images/mpicpicon.ico" />
    <%--jquery ui--%>
    <link href="js/jqueryui/jquery-ui.css" rel="stylesheet" />
    <script src="js/jqueryui/jquery-1.11.2.min.js"></script>
    <script src="js/jqueryui/jquery-ui.js"></script>

    <%--bootstrap--%>
    <link href="css/bootstrapstyle/bootstrap.min2.css" rel="stylesheet" />
    <link href="css/bootstrapstyle/bootstrap-theme.min.css" rel="stylesheet" />
    <script src="css/bootstrapstyle/bootstrap.min.js"></script>

    <%--sliderratebar--%>
    <%--<link rel="stylesheet" href="sliderbar01style/normalize.min.css" />--%>
    <%--<link rel="stylesheet" href="sliderbar01style/main.css" />--%>
    <link href="css/ratebar/changeexamples.css" rel="stylesheet" />

    <%--    <link href="http://fonts.googleapis.com/css?family=Lato:300,400,600" rel="stylesheet" type="text/css" />
    <link href="http://fonts.googleapis.com/css?family=Source+Code+Pro" rel="stylesheet" type="text/css" />--%>

    <%--    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="sliderbar01style2/jquery-1.11.2.min.js"><\/script>')</script>--%>

    <script src="js/ratebar/jquery.barrating.js"></script>
    <script src="js/ratebar/examples.js"></script>


    <!-- Add IntroJs styles -->
    <link href="js/inrojs/changeintrojs.css" rel="stylesheet" />
    <script src="js/inrojs/intro.js"></script>


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
            background: url(images/jobsrecruitment.png) no-repeat top center;
            width: 56%;
            height: 94px;
            margin-top: 20px;
            float: left;
        }

        #wrapper {
            width: 100%;
            /*height: 100vh;*/ /*div高度等於畫面高度*/
            background: url(images/body_bg.gif) repeat;
            /*min-width: 960px;*/
            /*min-height:900px;*/
        }

        #top_wrap {
            background: url(images/inside_visual5.png) no-repeat top center;
            height: 192px;
            /*display: block;*/
        }

        #middle_wrap {
            background: url(images/content_visual.png) no-repeat top center;
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
        /*back to top*/

        #back-to-top {
            position: fixed;
            bottom: 55px;
            right: 150px; /*put to right*/
            z-index: 9999;
            /*width: 32px;
            height: 32px;*/
            width: 90px;
            height: 50px;
            text-align: center;
            line-height: 30px;
            background: #f3f7ec; /*button color*/
            color: #444;
            cursor: pointer;
            border: 0;
            border-radius: 2px;
            text-decoration: none;
            transition: opacity 0.2s ease-out;
            opacity: 0;
            padding-top: 9px;
        }

            #back-to-top:hover {
                background: #e9ebec;
            }

            #back-to-top.show {
                opacity: 1;
            }

        /*introjs css*/
        .introjs-tooltiptext {
            width: 260px;
        }
    </style>


    <script type="text/javascript">

        //$("#datepicker1").datepicker();
        //$("#datepicker2").datepicker();

        $(function () {
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




    <%--sliderratebar js--%>
    <script type="text/javascript">

        $(document).ready(function () {
            $('#yyya-a').change(function () {
                var aaa = $("#yyya-a").val();
                //alert("you change something");
                $("#abilitytemp1").val(aaa);
            });
            $('#yyyb-a').change(function () {
                var bbb = $("#yyyb-a").val();
                //alert("you change something");
                $("#abilitytemp2").val(bbb);
            });
            $('#yyyc-a').change(function () {
                var ccc = $("#yyyc-a").val();
                //alert("you change something");
                $("#abilitytemp3").val(ccc);
            });
            $('#yyyd-a').change(function () {
                var ddd = $("#yyyd-a").val();
                //alert("you change something");
                $("#abilitytemp4").val(ddd);
            });
            $('#yyye-a').change(function () {
                var eee = $("#yyye-a").val();
                //alert("you change something");
                $("#abilitytemp5").val(eee);
            });
            $('#yyyf-a').change(function () {
                var fff = $("#yyyf-a").val();
                //alert("you change something");
                $("#abilitytemp6").val(fff);
            });
            $('#yyyg-a').change(function () {
                var ggg = $("#yyyg-a").val();
                //alert("you change something");
                $("#abilitytemp7").val(ggg);
            });
            $('#yyyh-a').change(function () {
                var hhh = $("#yyyh-a").val();
                //alert("you change something");
                $("#abilitytemp8").val(hhh);
            });
            $('#yyyi-a').change(function () {
                var iii = $("#yyyi-a").val();
                //alert("you change something");
                $("#abilitytemp9").val(iii);
            });
        });

        //back to top js
        $(document).ready(function () {
            if ($('#back-to-top').length) {
                var scrollTrigger = 300, // px
                    backToTop = function () {
                        var scrollTop = $(window).scrollTop();
                        if (scrollTop > scrollTrigger) {
                            $('#back-to-top').addClass('show');
                        } else {
                            $('#back-to-top').removeClass('show');
                        }
                    };
                backToTop();
                $(window).on('scroll', function () {
                    backToTop();
                });
                $('#back-to-top').on('click', function (e) {
                    e.preventDefault();
                    $('html,body').animate({
                        scrollTop: 0
                    }, 700);
                });
            }
        });


    </script>


</head>
<body>
    <form id="form1" runat="server">
        <%--<a href="#" id="back-to-top" title="Back to top">&uarr;</a>--%>
        <div style="line-height: 10px">
            <a href="#" id="back-to-top" title="Back to top">Go Top &uarr;</a>

        </div>
        <div style="height: 100px; width: 1200px; margin: auto">
            <div id="logopart">
                <asp:ImageButton ID="LogoImageButton" runat="server" Style="margin-left: 149px" ImageUrl="images/logo_mcpoly.png" OnClick="LogoImageButton_Click" CausesValidation="false" />
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
                    <div style="width: 930px; margin: auto">
                        <%--content start--%>

                        <div id="content">

                            <asp:ImageButton ID="BackButton" runat="server" onmouseover="this.src='images/back01_hover.png'" onmouseout="this.src='images/back01.png'" ImageUrl="images/back01.png" OnClick="BackButton_Click" Style="width: 105px" CausesValidation="false" />

                            <%--<asp:ImageButton ID="SubmitButton" runat="server" onmouseover="this.src='layout01pppage01style/submit01_hover.png'" onmouseout="this.src='layout01pppage01style/submit01.png'" ImageUrl="~/layout01pppage01style/submit01.png" OnClick="Button1_Click" Style="width: 105px" />--%>



                            <br />
                            <br />

                            <%--                           <div align="center" style="font-size: 11pt;">
                                <asp:Label ID="TopLabel1" runat="server" Text="【第 一 部 份 Section 1】"></asp:Label>
                            </div>
                            <div align="center" style="font-size: 14pt; font-weight: bold;">
                                <asp:Label ID="TopLabel2" runat="server" Text="招聘信息刊登 Job Opportunity Information Ref #_________"></asp:Label>
                            </div>--%>

                            <span id="RecruitWay">
                                <asp:RadioButton ID="RecruitWay1" class="radio-inline" runat="server" Text="表格方式招聘" GroupName="RecruitWay"
                                    Checked="true" OnCheckedChanged="RecruitWay1_CheckedChanged" AutoPostBack="true" />
                                <asp:RadioButton ID="RecruitWay2" class="radio-inline" runat="server" Text="上載檔案招聘" GroupName="RecruitWay"
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
                                            <%--normal style--%>
                                            <asp:Label ID="Label1" runat="server" Text="招聘職位(必選)&lt;br&gt;Post Offered"></asp:Label>

                                            <%--red star style--%>
                                            <%--<label for="account1">招聘職位<span style="color:red">*</span><br/>Post Offered</label>--%>
                                            
                                        </td>
                                        <td style="padding: 4px 4px 4px 4px;">中文職位名稱 Post Offered in Chinese
                                            <asp:TextBox ID="TextBox1" class="form-control" runat="server" MaxLength="30"></asp:TextBox>
                                            英文職位名稱 Post Offered in English
                                            <asp:TextBox ID="TextBox2" class="form-control" runat="server" MaxLength="30"></asp:TextBox>
                                            <%--<br />
                                            <asp:Label ID="Label2" runat="server" Text="招聘人數No.of Vacancy"></asp:Label>
                                            <asp:TextBox ID="TextBox2" runat="server" Width="32px"></asp:TextBox>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:CheckBox ID="CheckBox1" runat="server" class="checkbox-inline" Text="全職 Full-Time" />
                                            <asp:CheckBox ID="CheckBox2" runat="server" class="checkbox-inline" Text="兼職 Part-Time" />--%>
                                        </td>
                                    </tr>
                                    <%--                                    <tr>
                                        <td class="style6" align="center">
                                            <asp:Label ID="Label3" runat="server" class="form-control-inline" Text="機構名稱&lt;br&gt;Organization Name"></asp:Label>
                                        </td>
                                        <td style="padding: 4px 4px 4px 4px;">
                                            <asp:TextBox ID="TextBox3" class="form-control" runat="server" MaxLength="50"></asp:TextBox>
                                        </td>
                                    </tr>--%>
                                    <tr>
                                        <td class="style6" align="center">
                                            <asp:Label ID="Label4" runat="server" Text="工作性質&lt;br&gt;Job Nature"></asp:Label>
                                        </td>
                                        <td style="padding: 4px 4px 4px 4px;">行業類別
                        <asp:DropDownList ID="CatalogDll" class="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="CatalogDll_SelectedIndexChanged">
                        </asp:DropDownList>

                                            <div style="margin-top:10px">
                                            <asp:DropDownList ID="NatureDll" class="form-control" runat="server">
                                            </asp:DropDownList></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style6" align="center">
                                            <asp:Label ID="Label5" runat="server" Text="工作內容&lt;br&gt;Job Description &amp; Basic Duties"></asp:Label>
                                        </td>
                                        <td style="padding: 4px 4px 4px 4px;">
                                            <asp:TextBox ID="TextBox5" class="form-control" runat="server" TextMode="MultiLine" Height="100px" MaxLength="50"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style6" align="center">
                                            <asp:Label ID="Label6" runat="server" Text="薪金&lt;br&gt;Salary Offered"></asp:Label>
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
                                                        <form class="form-inline">
                                                        </form>
                                                        <form class="form-inline">
                                                            <div class="form-group">
                                                                <asp:Label ID="Label10" runat="server" Text="申請截止日期 Application Deadline"></asp:Label>
                                                                <asp:TextBox ID="datepicker1" runat="server" type="text" class="form-control" Style="width: 200px; margin-left: 5px"></asp:TextBox>
                                                            </div>
                                                        </form>

                                                        <%--<asp:TextBox ID="datepicker1" runat="server"></asp:TextBox>--%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 4px 4px 4px 5px;">
                                                        <form class="form-inline">
                                                        </form>
                                                        <form class="form-inline">
                                                            <div class="form-group">
                                                                <asp:Label ID="Label2" runat="server" Text="工作開始日期 Start Date"></asp:Label>
                                                                <asp:TextBox ID="datepicker2" runat="server" type="text" class="form-control" Style="width: 200px; margin-left: 70px"></asp:TextBox>
                                                            </div>
                                                        </form>
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

                                            <form class="form-inline">
                                            </form>
                                            <form class="form-inline">
                                                <div class="form-group">
                                                    <asp:Label ID="Label7" runat="server" Text="郵寄至 Post to"></asp:Label>
                                                    <asp:TextBox ID="TextBox9" runat="server" type="text" class="form-control" Style="width: 400px; margin-left: 13px; margin-bottom: 2px" MaxLength="40"></asp:TextBox>
                                                </div>
                                            </form>



                                            <%--                                           <asp:TextBox ID="TextBox9" Style="width: 400px" class="form-control" runat="server"></asp:TextBox>--%>

                                            <%--<asp:CheckBox ID="CheckBox15" class="checkbox-inline" runat="server" Text="電郵 E-mail" OnCheckedChanged="CheckBox15_CheckedChanged"
                                                AutoPostBack="true" />--%>

                                            <form class="form-inline">
                                            </form>
                                            <form class="form-inline">
                                                <div class="form-group">
                                                    <asp:Label ID="Label11" runat="server" Text="電郵 E-mail"></asp:Label>
                                                    <asp:TextBox ID="TextBox10" runat="server" type="text" class="form-control" Style="width: 400px; margin-left: 31px; margin-top: 2px; margin-bottom: 2px" MaxLength="40"></asp:TextBox>
                                                    &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server"
                                                        ControlToValidate="TextBox10" Text="Insert correct E-mail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                        Style="color: Red;"></asp:RegularExpressionValidator>
                                                </div>
                                            </form>



                                            <%-- <asp:TextBox ID="TextBox10" Style="width: 400px" class="form-control" runat="server"></asp:TextBox>
                                            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"
                                                ControlToValidate="TextBox10" Text="Please insert correct E-mail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                Style="color: Red;"></asp:RegularExpressionValidator>--%>

                                            <%--<asp:CheckBox ID="CheckBox16" class="checkbox-inline" runat="server" Text="電話 Phone" OnCheckedChanged="CheckBox16_CheckedChanged"
                                                AutoPostBack="true" />--%>

                                            <%--<form class="form-inline">
                                                        </form>--%>
                                            <form class="form-inline">
                                                <div class="form-group">
                                                    <asp:Label ID="Label18" runat="server" Text="電話 Phone"></asp:Label>
                                                    <asp:TextBox ID="TextBox11" runat="server" type="text" class="form-control" Style="width: 400px; margin-left: 30px; margin-top: 2px; margin-bottom: 2px" MaxLength="40"></asp:TextBox>
                                                    &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"
                                                        ControlToValidate="TextBox11" Text="Insert correct number" ValidationExpression="\d+"
                                                        Style="color: Red;"></asp:RegularExpressionValidator>
                                                </div>
                                            </form>



                                            <%--  <asp:TextBox ID="TextBox11" Style="width: 400px" class="form-control" runat="server"></asp:TextBox>
                                            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                                                ControlToValidate="TextBox11" Text="Please insert correct number" ValidationExpression="\d+"
                                                Style="color: Red;"></asp:RegularExpressionValidator>--%>

                                            <%--<asp:CheckBox ID="CheckBox17" class="checkbox-inline" runat="server" Text="其他方式 Others" OnCheckedChanged="CheckBox17_CheckedChanged"
                                                AutoPostBack="true" />--%>

                                            <%--<form class="form-inline">
                                                        </form>--%>
                                            <form class="form-inline">
                                                <div class="form-group">
                                                    <asp:Label ID="Label19" runat="server" Text="其他方式 Others"></asp:Label>
                                                    <asp:TextBox ID="TextBox12" runat="server" type="text" class="form-control" Style="width: 400px; margin-top: 2px" MaxLength="40"></asp:TextBox>
                                                </div>
                                            </form>

                                            <%--<asp:TextBox ID="TextBox12" Style="width: 400px" class="form-control" runat="server"></asp:TextBox>--%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style6" align="center">
                                            <asp:Label ID="Label14" runat="server" Text="查詢及聯絡方法<br>Enquireies &amp; Contact Informaion"></asp:Label>
                                        </td>
                                        <td style="padding: 4px 4px 4px 5px;">

                                            <form class="form-inline">
                                                <div class="form-group">
                                                    <asp:Label ID="Label20" runat="server" Text="聯絡人 Contact Person:"></asp:Label>
                                                    <asp:TextBox ID="TextBox13" runat="server" type="text" class="form-control" Style="width: 300px; margin-top: 2px; margin-bottom: 2px" MaxLength="30"></asp:TextBox>
                                                    <asp:CheckBox ID="CheckBox18" Style="margin-left: 2px" class="checkbox-inline" runat="server" Text="女士 Ms/" />
                                                    <asp:CheckBox ID="CheckBox19" runat="server" Text="先生 Mr" />
                                                </div>
                                            </form>

                                            <form class="form-inline">
                                                <div class="form-group">
                                                    <asp:Label ID="Label16" runat="server" Text="聯絡電話 Phone:"></asp:Label>
                                                    <asp:TextBox ID="TextBox14" runat="server" type="text" class="form-control" Style="width: 300px; margin-left: 43px; margin-top: 2px; margin-bottom: 2px" MaxLength="30"></asp:TextBox>
                                                    &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                                                        ControlToValidate="TextBox14" Text="Please insert correct number" ValidationExpression="\d+"
                                                        Style="color: Red;"></asp:RegularExpressionValidator>
                                                </div>
                                            </form>


                                            <%--                                            <asp:Label ID="Label15" runat="server" Text="聯絡人 Contact Person:"></asp:Label>
                                            <asp:TextBox ID="TextBox13" runat="server"></asp:TextBox>
                                            <asp:CheckBox ID="CheckBox18" class="checkbox-inline" runat="server" Text="女士 Ms/" />
                                            <asp:CheckBox ID="CheckBox19" class="checkbox-inline" runat="server" Text="先生 Mr" />
                                            <br />--%>

                                            <%--                                            <asp:Label ID="Label16" runat="server" Text="聯絡電話 Phone:"></asp:Label>
                                            <asp:TextBox ID="TextBox14" runat="server" Style="margin-left: 56px"></asp:TextBox>
                                            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                                                ControlToValidate="TextBox14" Text="Please insert correct number" ValidationExpression="\d+"
                                                Style="color: Red;"></asp:RegularExpressionValidator>--%>

                                            <%--<br />--%>

                                            <form class="form-inline">
                                                <div class="form-group">
                                                    <asp:Label ID="Label15" runat="server" Text="電郵 Email:"></asp:Label>
                                                    <asp:TextBox ID="TextBox15" runat="server" type="text" class="form-control" Style="width: 300px; margin-top: 2px; margin-left: 77px" MaxLength="30"></asp:TextBox>
                                                    &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                                                        ControlToValidate="TextBox15" Text="Please insert correct E-mail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                        Style="color: Red;"></asp:RegularExpressionValidator>
                                                </div>
                                            </form>


                                            <%--                                            <asp:Label ID="Label17" runat="server" Text="電郵 Email:"></asp:Label>
                                            <asp:TextBox ID="TextBox15" runat="server" Style="margin-left: 88px"></asp:TextBox>
                                            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server"
                                                ControlToValidate="TextBox15" Text="Please insert correct E-mail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                Style="color: Red;"></asp:RegularExpressionValidator>--%>
                                        </td>
                                    </tr>
                                </table>
                                <p>
                                    &nbsp;
                                </p>

                                <a href="javascript:void(0);" onclick="javascript:introJs().start();" style="float: right">什麼是職業要求特質</a>
                                <table class="style1" data-step="1" data-intro="職業要求特質配對是理工學院為了幫助企業更快速尋找理想員工的一個分析系統,<br/> 系統會根據企業所輸入的特質來和理工的學生資料庫做配對, 從而令企業更快速地找到合適和理想的員工。" data-position='left'>
                                    <tr>
                                        <%--                                       <td align="left" class="midleftstyle">要求特質<br />
                                            Request Ability
                                        </td>--%>
                                        <td class="style10" data-step="2" data-intro="職業特質系統共分為9大類別, 最大為5最小為1, 然後我們會在我們的資料庫作出配對。<br/>來讓學生知道自身的能力是否適合這份工作, 讓企業節省更多的時間。" data-position='right'>
                                            <%--<asp:Label ID="Label32" runat="server" Text="專業能力&lt;br&gt;Professional Competence"></asp:Label>--%>
                                            <%--<br />   --%>
                                            <div class="box box-orange">
                                                <div class="box-header">專業能力(Professional)</div>
                                                <div class="box-body">
                                                    <select id="yyya-a" name="rating">
                                                        <option value="1">不重要</option>
                                                        <option value="2">一般</option>
                                                        <option value="3" selected="selected">有需要</option>
                                                        <option value="4">重要</option>
                                                        <option value="5">非常重要</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <%--                                            <asp:DropDownList ID="DropDownList1" runat="server">
                                                <asp:ListItem Value="1">不重要</asp:ListItem>
                                                <asp:ListItem Value="2">一般</asp:ListItem>
                                                <asp:ListItem Value="3">有需要</asp:ListItem>
                                                <asp:ListItem Value="4">重要</asp:ListItem>
                                                <asp:ListItem Value="5">非常重要</asp:ListItem>
                                            </asp:DropDownList>--%>
                                        </td>
                                        <td class="style10">

                                            <div class="box box-orange">
                                                <div class="box-header">領導(Leadership)</div>
                                                <div class="box-body">
                                                    <select id="yyyb-a" name="rating">
                                                        <option value="1">不重要</option>
                                                        <option value="2">一般</option>
                                                        <option value="3" selected="selected">有需要</option>
                                                        <option value="4">重要</option>
                                                        <option value="5">非常重要</option>
                                                    </select>
                                                </div>
                                            </div>


                                            <%--                                            <asp:Label ID="Label33" runat="server" Text="領導&lt;br&gt;Leadership"></asp:Label>
                                            <br />
                                            <asp:DropDownList ID="DropDownList2" runat="server">
                                                <asp:ListItem Value="1">不重要</asp:ListItem>
                                                <asp:ListItem Value="2">一般</asp:ListItem>
                                                <asp:ListItem Value="3">有需要</asp:ListItem>
                                                <asp:ListItem Value="4">重要</asp:ListItem>
                                                <asp:ListItem Value="5">非常重要</asp:ListItem>
                                            </asp:DropDownList>--%>


                                        </td>
                                        <td class="style10">

                                            <div class="box box-orange">
                                                <div class="box-header">溝通(Communication)</div>
                                                <div class="box-body">
                                                    <select id="yyyc-a" name="rating">
                                                        <option value="1">不重要</option>
                                                        <option value="2">一般</option>
                                                        <option value="3" selected="selected">有需要</option>
                                                        <option value="4">重要</option>
                                                        <option value="5">非常重要</option>
                                                    </select>
                                                </div>
                                            </div>


                                            <%--                                            <asp:Label ID="Label34" runat="server" Text="溝通&lt;br&gt;Communication"></asp:Label>
                                            <br />
                                            <asp:DropDownList ID="DropDownList3" runat="server">
                                                <asp:ListItem Value="1">不重要</asp:ListItem>
                                                <asp:ListItem Value="2">一般</asp:ListItem>
                                                <asp:ListItem Value="3">有需要</asp:ListItem>
                                                <asp:ListItem Value="4">重要</asp:ListItem>
                                                <asp:ListItem Value="5">非常重要</asp:ListItem>
                                            </asp:DropDownList>--%>
                                        </td>
                                        <td class="style10">

                                            <div class="box box-orange">
                                                <div class="box-header">創造力(Creativity)</div>
                                                <div class="box-body">
                                                    <select id="yyyd-a" name="rating">
                                                        <option value="1">不重要</option>
                                                        <option value="2">一般</option>
                                                        <option value="3" selected="selected">有需要</option>
                                                        <option value="4">重要</option>
                                                        <option value="5">非常重要</option>
                                                    </select>
                                                </div>
                                            </div>




                                            <%--                                            <asp:Label ID="Label35" runat="server" Text="創造力&lt;br&gt;Creativity"></asp:Label>
                                            <br />
                                            <asp:DropDownList ID="DropDownList4" runat="server">
                                                <asp:ListItem Value="1">不重要</asp:ListItem>
                                                <asp:ListItem Value="2">一般</asp:ListItem>
                                                <asp:ListItem Value="3">有需要</asp:ListItem>
                                                <asp:ListItem Value="4">重要</asp:ListItem>
                                                <asp:ListItem Value="5">非常重要</asp:ListItem>
                                            </asp:DropDownList>--%>
                                        </td>
                                        <td class="style10">

                                            <div class="box box-orange">
                                                <div class="box-header">主動性(Initiative)</div>
                                                <div class="box-body">
                                                    <select id="yyye-a" name="rating">
                                                        <option value="1">不重要</option>
                                                        <option value="2">一般</option>
                                                        <option value="3" selected="selected">有需要</option>
                                                        <option value="4">重要</option>
                                                        <option value="5">非常重要</option>
                                                    </select>
                                                </div>
                                            </div>



                                            <%--                                            <asp:Label ID="Label36" runat="server" Text="主動性&lt;br&gt;Initiative"></asp:Label>
                                            <br />
                                            <asp:DropDownList ID="DropDownList5" runat="server">
                                                <asp:ListItem Value="1">不重要</asp:ListItem>
                                                <asp:ListItem Value="2">一般</asp:ListItem>
                                                <asp:ListItem Value="3">有需要</asp:ListItem>
                                                <asp:ListItem Value="4">重要</asp:ListItem>
                                                <asp:ListItem Value="5">非常重要</asp:ListItem>
                                            </asp:DropDownList>--%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <%--                                        <td class="style6">&nbsp;
                                        </td>--%>
                                        <td class="style10">

                                            <div class="box box-orange">
                                                <div class="box-header">自我發展(Self Develop)</div>
                                                <div class="box-body">
                                                    <select id="yyyf-a" name="rating">
                                                        <option value="1">不重要</option>
                                                        <option value="2">一般</option>
                                                        <option value="3" selected="selected">有需要</option>
                                                        <option value="4">重要</option>
                                                        <option value="5">非常重要</option>
                                                    </select>
                                                </div>
                                            </div>




                                            <%--                                            <asp:Label ID="Label37" runat="server" Text="自我發展&lt;br&gt;Self Development"></asp:Label>
                                            <br />
                                            <asp:DropDownList ID="DropDownList6" runat="server">
                                                <asp:ListItem Value="1">不重要</asp:ListItem>
                                                <asp:ListItem Value="2">一般</asp:ListItem>
                                                <asp:ListItem Value="3">有需要</asp:ListItem>
                                                <asp:ListItem Value="4">重要</asp:ListItem>
                                                <asp:ListItem Value="5">非常重要</asp:ListItem>
                                            </asp:DropDownList>--%>



                                        </td>
                                        <td class="style10">

                                            <div class="box box-orange">
                                                <div class="box-header">社會責任(Responsibility)</div>
                                                <div class="box-body">
                                                    <select id="yyyg-a" name="rating">
                                                        <option value="1">不重要</option>
                                                        <option value="2">一般</option>
                                                        <option value="3" selected="selected">有需要</option>
                                                        <option value="4">重要</option>
                                                        <option value="5">非常重要</option>
                                                    </select>
                                                </div>
                                            </div>





                                            <%--                                            <asp:Label ID="Label38" runat="server" Text="社會責任&lt;br&gt;Social Responsibility"></asp:Label>
                                            <br />
                                            <asp:DropDownList ID="DropDownList7" runat="server">
                                                <asp:ListItem Value="1">不重要</asp:ListItem>
                                                <asp:ListItem Value="2">一般</asp:ListItem>
                                                <asp:ListItem Value="3">有需要</asp:ListItem>
                                                <asp:ListItem Value="4">重要</asp:ListItem>
                                                <asp:ListItem Value="5">非常重要</asp:ListItem>
                                            </asp:DropDownList>--%>
                                        </td>
                                        <td class="style10">

                                            <div class="box box-orange">
                                                <div class="box-header">語言(Language)</div>
                                                <div class="box-body">
                                                    <select id="yyyh-a" name="rating">
                                                        <option value="1">不重要</option>
                                                        <option value="2">一般</option>
                                                        <option value="3" selected="selected">有需要</option>
                                                        <option value="4">重要</option>
                                                        <option value="5">非常重要</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <%--                                            <asp:Label ID="Label39" runat="server" Text="語言&lt;br&gt;Language"></asp:Label>
                                            <br />
                                            <asp:DropDownList ID="DropDownList8" runat="server">
                                                <asp:ListItem Value="1">不重要</asp:ListItem>
                                                <asp:ListItem Value="2">一般</asp:ListItem>
                                                <asp:ListItem Value="3">有需要</asp:ListItem>
                                                <asp:ListItem Value="4">重要</asp:ListItem>
                                                <asp:ListItem Value="5">非常重要</asp:ListItem>
                                            </asp:DropDownList>--%>
                                        </td>
                                        <td class="style10">

                                            <div class="box box-orange">
                                                <div class="box-header">電腦應用(IT Application)</div>
                                                <div class="box-body">
                                                    <select id="yyyi-a" name="rating">
                                                        <option value="1">不重要</option>
                                                        <option value="2">一般</option>
                                                        <option value="3" selected="selected">有需要</option>
                                                        <option value="4">重要</option>
                                                        <option value="5">非常重要</option>
                                                    </select>
                                                </div>
                                            </div>


                                            <%--                                            <asp:Label ID="Label40" runat="server" Text="電腦應用&lt;br&gt;IT Application"></asp:Label>
                                            <br />
                                            <asp:DropDownList ID="DropDownList9" runat="server">
                                                <asp:ListItem Value="1">不重要</asp:ListItem>
                                                <asp:ListItem Value="2">一般</asp:ListItem>
                                                <asp:ListItem Value="3">有需要</asp:ListItem>
                                                <asp:ListItem Value="4">重要</asp:ListItem>
                                                <asp:ListItem Value="5">非常重要</asp:ListItem>
                                            </asp:DropDownList>--%>
                                        </td>
                                        <td>
                                            <br />
                                        </td>
                                    </tr>
                                </table>
                                <p>
                                    &nbsp;
                                </p>
                                <asp:TextBox ID="abilitytemp1" runat="server" Style="display: none;">3</asp:TextBox>
                                <asp:TextBox ID="abilitytemp2" runat="server" Style="display: none;">3</asp:TextBox>
                                <asp:TextBox ID="abilitytemp3" runat="server" Style="display: none;">3</asp:TextBox>
                                <asp:TextBox ID="abilitytemp4" runat="server" Style="display: none;">3</asp:TextBox>
                                <asp:TextBox ID="abilitytemp5" runat="server" Style="display: none;">3</asp:TextBox>
                                <asp:TextBox ID="abilitytemp6" runat="server" Style="display: none;">3</asp:TextBox>
                                <asp:TextBox ID="abilitytemp7" runat="server" Style="display: none;">3</asp:TextBox>
                                <asp:TextBox ID="abilitytemp8" runat="server" Style="display: none;">3</asp:TextBox>
                                <asp:TextBox ID="abilitytemp9" runat="server" Style="display: none;">3</asp:TextBox>




                                <%--            <table class="style3" frame="border">
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
            </table>--%>

                                <%--            <p>
                                    &nbsp;
                                </p>


                                <table class="style3" frame="border">
                                    <tr>
                                        <td style="padding: 4px 4px 4px 4px;">
                                            <asp:Label ID="Label263" runat="server" Text="注意事項 Important Notice: " />
                                            <br />
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
                                                    傅真 Fax: +853 28706747 ; 電話: 8599 6625/6463; 電郵 Email: <a href="mailto:jobsforstudent@ipm.edu.mo">jobsforstudent@ipm.edu.mo</a><br />
                                                    地址 Address: 澳門高美士街A119室Room A119, Rua de Luis Gonzaga Comes, Macau<br />
                                                    <li>塡妥表格後請先列印，再按&quot;提交&quot;按鈕，而列印表格需簽名蓋章後以電郵或傳真方式交回學生事務處。</li>
                                                    Please print out the completed form before pressing &quot;Submit&quot;buttons, and
                                send the form with signature &amp; stamp to the Student Affairs Office via email
                                or fax.</li>
                                            </ol>
                                            <br />
                                            <div style="margin: 0 auto; width: 80%;">
                                                <div style="float: left; width: 50%; text-align: center;">
                                                    _____________________________________________&nbsp;&nbsp;&nbsp;&nbsp;
                                <br />
                                                    公司簽章 Signature &amp; Company&#39;s Stamp
                                                </div>
                                                <div style="float: right; width: 50%;">
                                                    ___________/___________/__________<br />
                                                    日DO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; / 月MM&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /年YY
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </table>--%>
                            </asp:Panel>

                            <%--panel2 start--%>

                            <asp:Panel ID="Panel2" runat="server">
                                <br />
                                <br />

                                <%--        <form class="form-inline">
        </form>
        <form class="form-inline">
            <div class="form-group">
                                <asp:Label ID="RecruitWayLabel1" runat="server" Text="行業類別: "></asp:Label>
                                <asp:DropDownList ID="RecruitWayDropDownList" class="form-control" runat="server">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                    ControlToValidate="RecruitWayDropDownList"
                                    ErrorMessage="Please insert information1"
                                    InitialValue="- - - Please select category - - -"></asp:RequiredFieldValidator>
            </div>
        </form>--%>


                                <asp:Label ID="RecruitWayLabel1" runat="server" Text="行業類別: "></asp:Label>
                                <asp:DropDownList ID="RecruitWayDropDownList" class="form-control" runat="server" Width="400px">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                    ControlToValidate="RecruitWayDropDownList"
                                    ErrorMessage="Please insert category"
                                    InitialValue="- - - Please select category - - -"></asp:RequiredFieldValidator>
                                <br />
                                <asp:Label ID="RecruitWayLabel2" runat="server" Text="機構名稱: "></asp:Label>
                                <asp:TextBox ID="RecruitWayText2" class="form-control" runat="server" Width="400px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                    ControlToValidate="RecruitWayText2" ErrorMessage="Please insert organiztion name"></asp:RequiredFieldValidator>
                                <br />
                                <asp:Label ID="RecruitWayLabel3" runat="server" Text="招聘職位: "></asp:Label>
                                <asp:TextBox ID="RecruitWayText3" class="form-control" runat="server" Width="400px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                    ControlToValidate="RecruitWayText3" ErrorMessage="Please insert career position"></asp:RequiredFieldValidator>
                                <br />
                                <br />
                                <asp:FileUpload ID="FileUpload1" runat="server" accept=".pdf,.doc,.docx" />
                                <asp:Label ID="RecruitLabel" runat="server" Text="(Less than 50MB of pdf file)"
                                    Style="font-family: Arial Unicode MS"></asp:Label>
                                <br />
                                <br />
                                <asp:Button ID="RecruitWayButton" runat="server" Text="Submit" class="btn btn-primary" Style="width: 70px" OnClick="RecruitWayButton_Click" />
                                <%--<asp:ImageButton ID="RecruitWayButton" runat="server" onmouseover="this.src='layout01pppage01style/submit01_hover.png'" onmouseout="this.src='layout01pppage01style/submit01.png'" ImageUrl="~/layout01pppage01style/submit01.png" OnClick="RecruitWayButton_Click" Style="width: 105px" />--%>
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                            </asp:Panel>

                            <%--panel2 close--%>
                        </div>
                        <table class="style3">
                            <tr>
                                <br />
                                <td align="center">

                                    <asp:ImageButton ID="SubmitButton2" runat="server" onmouseover="this.src='images/submit01_hover.png'" onmouseout="this.src='images/submit01.png'" ImageUrl="images/submit01.png" OnClick="Button1_Click" Style="width: 130px" />
                                    <%--                                   <asp:ImageButton ID="BackButton2" runat="server" onmouseover="this.src='layout01pppage01style/back01_hover.png'" onmouseout="this.src='layout01pppage01style/back01.png'" ImageUrl="~/layout01pppage01style/back01.png" OnClick="Button2_Click" Style="width: 105px" CausesValidation="false" />--%>

                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                        <%--content close--%>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
