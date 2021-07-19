<%@ Page Language="C#" AutoEventWireup="true" CodeFile="layout50p.aspx.cs" Inherits="layout50p" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        #wrapper {
            width: 100%;
            height: 100vh; /*div高度等於畫面高度*/
            background: url(layout50style/body_bg.gif) repeat left top;
            /*min-width: 960px;*/
            min-height: 900px;
        }

        #logopart {
            background: url(layout50style/logo_mcpoly.png) no-repeat top center;
            width: 50%;
            height: 94px;
            margin-top: 18px;
            float: left;
        }

        #logopart2 {
            background: url(layout50style/logo_student_corner.gif) no-repeat top center;
            width: 50%;
            height: 94px;
            margin-top: 29px;
            float: left;
        }

        #top_visal {
            background: url(layout50style/index_visual.jpg) no-repeat top center;
            height: 380px;
            /*display: block;*/
        }

        #middle_wrap {
            background: url(layout50style/content_visual.png) no-repeat top center;
            min-height: 384px;
            width: 100%;
            position: relative;
            float: left;
        }

        .divborder {
            width: 960px;
            background-color: white;
            margin: auto; /*置中*/
            height: 500px;
            border-right: 1px solid #CDDCB1;
            border-left: 1px solid #CDDCB1;
        }

        #centerpart {
            width: 100%;
            height: 500px;
            float: left;
        }

        #centerleft {
            background: url(layout50style/left_nav_bg.jpg) no-repeat top left;
            width: 25%;
            height: 500px;
            float: left;
        }

        #centerright {
            width: 75%;
            height: 500px;
            float: left;
        }

        ul {
            padding-top: 50px;
            padding-left: 0px;
        }

        li {
            /*background: url(bdpic/left_nav_btn_arrow_hover.gif) no-repeat ;*/
            /*list-style-image: url(bdpic/left_nav_btn_arrow_hover.gif);*/
            list-style-type: none;
            font-family: Arial, Helvetica, sans-serif;
            height: 40px;
            width: 240px;
            line-height: 40px; /*垂直置中*/
        }

            li:hover {
                background: url(layout50style/lipic2.png) no-repeat 0px 0px;
            }

            li a {
                color: white;
                text-decoration: none;
                padding: 13px 15px 13px 20px;
            }

                li a:hover {
                    color: #317598;
                    text-decoration: none;
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
            <div id="top_visal">
            </div>
            <div id="middle_wrap">
                <div class="divborder">
                    <div id="centerpart">
                        <div id="centerleft">
                            <ul>
                                <li><a href='/page/graduate_attributes.php'>Graduate Attributes</a></li>
                                <li><a href='/page/guidelines_for_medical_report.php'>Regulations & Guidelines</a></li>
                                <li><a href='/page/news_for_students.php'>News for Students</a></li>
                                <li><a href='/page/online_services_for_students.php'>Online Services for Students</a></li>
                                <li><a href='/page/academic_calendar.php'>Academic Calendar</a></li>
                            </ul>


                        </div>
                        <div id="centerright">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>