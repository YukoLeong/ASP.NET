<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegisterMenu.aspx.cs" Inherits="MPICP_RegisterMenu" %>

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
            background: url(images/title_right.png) no-repeat top center;
            width: 57%;
            height: 94px;
            margin-top: 29px;
            float: left;
        }

        #wrapper {
            width: 100%;
            height: 100vh; /*div高度等於畫面高度*/
            background: url(images/body_bg.gif) repeat left top;
            /*min-width: 960px;*/
            min-height: 705px;
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
            height: 700px;
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
                    <br />
                    <div style="width: 860px; margin: auto; margin-left: 50px; margin-right: 50px">
                        <br />
                        <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/MPICP/Register.aspx">商業機構註冊</asp:LinkButton>
                        <br />
                        <br />
                        <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/MPICP/Register02.aspx">政府部門或公共行政事業註冊</asp:LinkButton>
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <%--<div style="margin: auto; width: 930px; text-align: left">
                            <asp:Button ID="Button1" class="btn btn-primary" Style="width: 70px" runat="server" Text="Back" CausesValidation="false" OnClick="Button1_Click" />
                        </div>--%>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
