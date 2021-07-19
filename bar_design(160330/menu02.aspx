<%@ Page Language="C#" AutoEventWireup="true" CodeFile="menu02.aspx.cs" Inherits="menu02" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>


    <link href="menu02style/css/standard6bae.css" rel="stylesheet" type="text/css" />
    <link href="menu02style/css/standardv2.css" rel="stylesheet" type="text/css" media="screen" />
    <link href="menu02style/css/responsive.css" rel="stylesheet" type="text/css" media="screen" />
    <link rel="stylesheet" href="menu02style/js/fancybox2/jquery.fancybox8cbb.css?v=2.1.5" type="text/css" media="screen" />
    <link href="menu02style/css/virtualsinger.css" rel="stylesheet" type="text/css" media="screen" />
    <link href='http://fonts.googleapis.com/css?family=Squada+One|Homenaje' rel='stylesheet' type='text/css' />

    <style>
        #menu_vs {
            text-align: center;
            z-index: 2;
            height: 40px;
            position: absolute;
            top: 85px;
            left: 0;
            width: inherit;
        }
            #menu_vs ul {
                background: url(menu02style/images/bg_menu.png) repeat center;
                font-size: 0;
                text-align: center;
                display: inline-block;
                -moz-border-radius: 4px;
                -webkit-border-radius: 4px;
                border-radius: 4px;
                overflow: hidden;
                -moz-box-shadow: 0px 0px 8px rgba(0,0,0, 0.3);
                -webkit-box-shadow: 0px 0px 8px rgba(0,0,0, 0.3);
                box-shadow: 0px 0px 8px rgba(0,0,0, 0.3);
            }

            #menu_vs li {
                width: 120px;
                border-right: 1px solid #333333;
                height: inherit;
                display: inline-block;
                font-size: 9pt; /*height:45px;*/
                line-height: 40px;
            }

                #menu_vs li:last-child {
                    border-right: none !important;
                }

            #menu_vs a {
                display: block;
                height: inherit;
                width: inherit;
                color: #fff;
            }

                #menu_vs a span {
                    display: block;
                    width: inherit;
                    height: inherit;
                    visibility: hidden;
                }

                #menu_vs a:hover {
                    text-decoration: none;
                }

            #menu_vs li:hover span {
                visibility: visible;
            }

            #menu_vs .vstop {
                background: url(menu02style/images/menu_vs_top.jpg) no-repeat center -45px;
            }

            #menu_vs .miku {
                background: url(menu02style/images/menu_vs_miku.jpg) no-repeat center -45px;
            }

            #menu_vs .kaito {
                background: url(menu02style/images/menu_vs_kaito.jpg) no-repeat center -45px;
            }

            #menu_vs .meiko {
                background: url(menu02style/images/menu_vs_meiko.jpg) no-repeat center -45px;
            }

            #menu_vs .rinlen {
                background: url(menu02style/images/menu_vs_rinlen.jpg) no-repeat center -45px;
            }

            #menu_vs .luka {
                background: url(menu02style/images/menu_vs_lukav3.jpg) no-repeat center -45px;
            }

            #menu_vs .ps {
                background: url(menu02style/images/menu_vs_ps.jpg) no-repeat center -45px;
                display: none;
            }

            #menu_vs .vstop a {
                border-bottom: 3px solid #939393;
            }

            #menu_vs .miku a {
                border-bottom: 3px solid #11ADD5;
            }

            #menu_vs .kaito a {
                border-bottom: 3px solid #4b81e0;
            }

            #menu_vs .meiko a {
                border-bottom: 3px solid #b12828;
            }

            #menu_vs .rinlen a {
                border-bottom: 3px solid #ebbd06;
            }

            #menu_vs .luka a {
                border-bottom: 3px solid #CD82CF;
            }

            #menu_vs .ps a { /*border-bottom:3px solid #a9b300;*/
            }

            #menu_vs li {
                transition: background-position 0.1s ease-out;
            }

                #menu_vs li:hover {
                    background-position: top;
                }

        .menu_vs_gray ul {
            background: url(menu02style/images/bg_menu_gray.png) repeat center !important;
        }

        .menu_vs_gray li {
            border-right: 1px solid #202020 !important;
        }
    </style>


<%--    <script type="text/javascript" src="menu02style/ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>--%>
    <script type="text/javascript" src="menu02style/js/css_browser_selector.js"></script>
    <%--<script type="text/javascript" src="menu02style/js/fancybox2/jquery.fancybox.pack8cbb.js?v=2.1.5"></script>--%>


</head>
<body>
    <form id="form1" runat="server">
        <div style="width: 1280px; margin: auto; text-align: center">
            <div id="menu_vs" class="menu_vs_gray">
                <ul>
                    <li class="vstop"><a href="index.html">TOP</a></li>
                    <li class="miku"><a href="mikuv3.html">初音ミク</a></li>
                    <li class="rinlen"><a href="cv02.html">鏡音リン・レン</a></li>
                    <li class="luka"><a href="lukav4x.html">巡音ルカ</a></li>
                    <li class="meiko"><a href="meikov3.html">MEIKO</a></li>
                    <li class="kaito"><a href="kaitov3.html">KAITO</a></li>
                </ul>
            </div>
        </div>
    </form>
</body>
</html>
