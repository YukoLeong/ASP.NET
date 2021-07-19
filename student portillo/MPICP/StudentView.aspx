<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StudentView.aspx.cs" Inherits="MPICP_StudentView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link rel="shortcut icon" href="images/mpicpicon.ico" />
    <%--jquery ui--%>
    <link href="js/jqueryui/jquery-ui.css" rel="stylesheet" />
    <script src="js/jqueryui/jquery-1.11.2.min.js"></script>
    <script src="js/jqueryui/jquery-ui.js"></script>


    <%--<link rel="stylesheet" href="css/button.css" type="text/css" media="screen" />--%>
    <%--<link rel="stylesheet" href="css/print.css" type="text/css" media="print" />--%>

    <%--bootstrap--%>
    <link href="css/bootstrapstyle/changebootstrap.css" rel="stylesheet" />
    <link href="css/bootstrapstyle/bootstrap-theme.min.css" rel="stylesheet" />
    <script src="css/bootstrapstyle/bootstrap.min.js"></script>



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
            border: 1px solid rgba(243, 247, 236, 0.00);
            /*border: 1px solid #000000;*/
        }

        .uptablestyle {
            width: 100%;
            border-color: transparent;
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
            /*background: url(images/logo_mcpoly.png) no-repeat top center;*/
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
            background: url(images/inside_visual2.jpg) no-repeat top center;
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

        #GridView1 td {
            padding: 10px;
        }

        #GridView1 th {
            padding: 10px;
        }
        #Panel1{
            margin-left:50px;
            margin-right:50px;
        }
    </style>

    <script type="text/javascript">

        //$("#datepicker1").datepicker();
        //$("#datepicker2").datepicker();

        $(function () {

            $('#ViewPDFButton').click(function () {
                window.open('ViewPDF.aspx', '_blank');
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
                <asp:ImageButton ID="LogoImageButton" runat="server" Style="margin-left: 149px" OnClick="LogoImageButton_Click" ImageUrl="images/logo_mcpoly.png" />
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

                        <%--<asp:Button ID="Button1" class="btn btn-primary" Style="width: 70px" runat="server" Text="Back" OnClick="BackButton_Click" />--%>
                        <asp:ImageButton ID="BackButton" runat="server" onmouseover="this.src='images/back01_hover.png'" onmouseout="this.src='images/back01.png'" ImageUrl="images/back01.png" OnClick="BackButton_Click" Style="width: 105px" />

                        <asp:Label ID="FromIDTemp" Style="display: none" runat="server" Text="Label"></asp:Label>

                        <%--<asp:ImageButton ID="UpdateButton" runat="server" onmouseover="this.src='images/update_hover.png'" onmouseout="this.src='images/update.png'" ImageUrl="images/update.png" Style="width: 105px" OnClick="UpdateButton_Click" />--%>

                        <asp:ImageButton ID="ViewPDFButton" runat="server" onmouseover="this.src='images/view02_hover.png'" onmouseout="this.src='images/view02.png'" ImageUrl="images/view02.png" Style="width: 105px" />


                        <%-- <asp:ImageButton ID="UpdateButton2" runat="server" onmouseover="this.src='layout01pppage01style/update_hover.png'" onmouseout="this.src='layout01pppage01style/update.png'" ImageUrl="~/layout01pppage01style/update.png" Style="width: 105px" OnClick="UpdateButton2_Click" />--%>


                        <%--                        <asp:ImageButton ID="ImageButton2" runat="server" onmouseover="this.src='layout01pppage01style/update_hover.png'" onmouseout="this.src='layout01pppage01style/update.png'" ImageUrl="~/layout01pppage01style/update.png" Style="width: 105px" OnClick="UpdateButton2_Click" />--%>


                        <asp:TextBox ID="ViewTemp" runat="server"></asp:TextBox>


                        <%--<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>--%>

                        <%--panel1 content--%>
                        <asp:Panel ID="Panel1" runat="server">

                            <br />
                            <div style="margin:auto; width:830px; text-align:center">
                                <asp:Label ID="OragInfo" runat="server" Style="font-size: large; font-weight: 700"></asp:Label>
                            </div>
                            <br />
                            <br />
                            <br />
                            <div align="left" id="infoContent">
                                <asp:Label ID="OfferInfo" runat="server"></asp:Label>
                                <asp:Label ID="SalaryInfo" runat="server"></asp:Label>
                                <asp:Label ID="DayStartInfo" runat="server"></asp:Label>
                                <asp:Label ID="DayEndInfo" runat="server"></asp:Label>
                                <asp:Label ID="HourInfo" runat="server"></asp:Label>
                                <asp:Label ID="DayInfo" runat="server"></asp:Label>
                                <asp:Label ID="MonthInfo" runat="server"></asp:Label>
                                <asp:Label ID="JobDescriptionInfo" runat="server"></asp:Label>
                                <asp:Label ID="RequirementsInfo" runat="server"></asp:Label>
                                <asp:Label ID="SubmitInfo" runat="server"></asp:Label>
                                <asp:Label ID="Submit1" runat="server"></asp:Label>
                                <asp:Label ID="Submit2" runat="server"></asp:Label>
                                <asp:Label ID="Submit3" runat="server"></asp:Label>
                                <asp:Label ID="Submit4" runat="server"></asp:Label>
                                <asp:Label ID="Contact1" runat="server"></asp:Label>
                                <asp:Label ID="Contact2" runat="server"></asp:Label>
                                <asp:Label ID="Contact3" runat="server"></asp:Label>
                            </div>
                            <br />
                            <p>
                                &nbsp;
                            </p>

                        </asp:Panel>
                        <%--panel2 content--%>
                        <asp:Panel ID="Panel2" runat="server">
                            <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                            <asp:Label ID="FilenameTemp" runat="server" Text=""></asp:Label>




                        </asp:Panel>

                        <%--content close--%>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>

