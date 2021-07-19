<%@ Page Language="C#" AutoEventWireup="true" CodeFile="layout50.aspx.cs" Inherits="layout50" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        #logopart {
            background: url(layout50style/logo_mcpoly.png) no-repeat top center;
            width: 43%;
            height: 94px;
            margin-top: 18px;
            float: left;
        }

        #logopart2 {
            background: url(layout50style/title_right.png) no-repeat top center;
            width: 57%;
            height: 94px;
            margin-top: 29px;
            float: left;
        }
        #wrapper {
            width: 100%;
            height: 100vh; /*div高度等於畫面高度*/
            background: url(layout50style/body_bg.gif) repeat left top;
            /*min-width: 960px;*/
            /*min-height:900px;*/
        }

        #top_wrap { 
            background: url(layout50style/inside_visual2.jpg) no-repeat top center;
            height: 192px;
            /*display: block;*/
        }

        #middle_wrap {
            background: url(layout50style/content_visual.png) no-repeat top center;
            min-height: 384px;
            width: 100%;
            /*            position: relative;
            float: left;*/
        }

        .divborder {
            width: 961px;
            background-color: white;
            margin: auto; /*置中*/
            height: 500px;
            border-right: 1px solid #CDDCB1;
            border-left: 1px solid #CDDCB1;
        }
    </style>


</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 100px; width: 1000px; margin: auto">
            <div id="logopart">
            </div>
            <div id="logopart2">
            </div>
        </div>
        <div id="wrapper">
            <div id="top_wrap">
            </div>
            <div id="middle_wrap">
                <div class="divborder">

                </div>
            </div>
        </div>
    </form>
</body>
</html>
