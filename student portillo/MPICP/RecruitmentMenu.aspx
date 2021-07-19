<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RecruitmentMenu.aspx.cs" Inherits="MPICP_RecruitmentMenu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link rel="shortcut icon" href="images/mpicpicon.ico" />

    <style>
        #logopart {
            /*background: url(images/logo_mcpoly.png) no-repeat top center;*/
            width: 43%;
            height: 94px;
            margin-top: 18px;
            float: left;
        }

        #logopart2 {
            background: url(images/jobsrecruitment.png) no-repeat top center;
            width: 56%;
            height: 94px;
            margin-top: 20px;
            float: left;
        }


        #wrapper {
            width: 100%;
            height: 100vh; /*div高度等於畫面高度*/
            background: url(images/body_bg.gif) repeat left top;
            /*min-width: 960px;*/
            min-height: 1445px;
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
            height: 1250px;
            border-right: 1px solid #CDDCB1;
            border-left: 1px solid #CDDCB1;
        }

        ol li {
            font-size: 14px;
        }
    </style>

    <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
    <link rel="stylesheet" href="css/bootstrapstyle/bootstrap.min.css" />
    <link rel="stylesheet" href="css/bootstrapstyle/bootstrap-theme.min.css" />
    <script src="css/bootstrapstyle/bootstrap.min.js"></script>



</head>
<body>
    <form id="form1" runat="server">
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
                    <div style="width: 930px; margin: auto; margin-left: 50px">
                        <%--<asp:ImageButton ID="BackButton" runat="server" onmouseover="this.src='images/back01_hover.png'" onmouseout="this.src='images/back01.png'" ImageUrl="images/back01.png" OnClick="BackButton_Click" Style="width: 105px" CausesValidation="false" />--%>
                        <br />
                        <br />
                        <br />
                        <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/MPICP/Recruitment.aspx">填寫招聘信息表格</asp:LinkButton>
                        <br />
                        <br />
                        <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/MPICP/Management.aspx">管理招聘表格</asp:LinkButton>
                        <br />
                        <br />
                        <asp:LinkButton ID="LinkButton3" runat="server" PostBackUrl="~/MPICP/Management2.aspx">管理公司註冊信息</asp:LinkButton>



                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
