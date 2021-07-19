<%@ Page Language="C#" AutoEventWireup="true" CodeFile="layout03.aspx.cs" Inherits="layout03" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HATSUNE MIKU EXPO</title>
    <link href="layout03style/css/animate.css" rel="stylesheet" />
    <link href="layout03style/css/normalize.css" rel="stylesheet" />
    <link href="layout03style/css/standard.20150325.css" rel="stylesheet" />
    <link href="layout03style/css/responsive.20150325.css" rel="stylesheet" />
    <link href="layout03style/js/mmenu.css" rel="stylesheet" media="all and (max-width: 640px)" />
    <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Aldrich' type='text/css' />
    <link rel="stylesheet" href="layout03style/js/fontawesome/css/font-awesome.css" />

    <script type="text/javascript" src="layout03style/ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="layout03style/js/page_link_scroll/jquery.easingscroll.js"></script>
    <script type="text/javascript" src="layout03style/js/css_browser_selector.js"></script>
    <script type="text/javascript" src="layout03style/js/jquery.mmenu.min.js"></script>
    <script type="text/javascript" src="layout03style/js/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="layout03style/js/jquery.tile.js"></script>
    <script type="text/javascript" src="layout03style/js/functions.js"></script>


    <script type="text/javascript">
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-48468382-1']);
        _gaq.push(['_trackPageview']);
        (function () {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();
    </script>

    <script type="text/javascript" src="layout03style/js/ytplayer/jquery.mb.YTPlayer.js"></script>
    <script>
        $(function () {
            if ($(window).width() >= 640) {
                $(".player").mb_YTPlayer();
            }
        });
    </script>
    <link href="layout03style/js/ytplayer/YTPlayer.css" rel="stylesheet" type="text/css" media="all and (max-width: 768px)" />
</head>
<body topmargin="0" leftmargin="0" marginheight="0" marginwidth="0" class="page_top">
    <form id="form1" runat="server">
        <nav class="gmenu font_aldrich" id="gmenu">
            <ul class="gmenu_main">
                <li class="txt_m"><a href="index.html">TOP</a></li>
                <li class="txt_m pastmenu">
                    <div class="past">2014</div>
                    <ul class="gmenu_sub past_sub">
                        <li class="txt_m"><a class="p2014_ind" href="indonesia_top.html">
                            <div>INDONESIA</div>
                        </a></li>
                        <li class="txt_m"><a class="p2014_la" href="la.html">
                            <div>LOS ANGELES</div>
                        </a></li>
                        <li class="txt_m"><a class="p2014_ny" href="ny.html">
                            <div>NEW YORK</div>
                        </a></li>
                    </ul>
                </li>
            </ul>
        </nav>


        <div class="for_mmenu">

            <span class="siteid" title="">
                <img src="layout03style/images/logo_mikuexpo_txt.png" class="img100"></span>

            <div class="wrapper">

                <a id="bgndVideo" class="player" data-property="{videoURL:'http://youtu.be/8zjqQCtHOTg',containment:'body',autoPlay:true, mute:true, startAt:2, opacity:1, showControls:false, quality:'medium'}"></a>
                <div class="movie_mask"></div>

                <div id="fb-root"></div>
                <script>(function (d, s, id) {
                    var js, fjs = d.getElementsByTagName(s)[0];
                    if (d.getElementById(id)) return;
                    js = d.createElement(s); js.id = id;
                    js.src = "../connect.facebook.net/en_US/all.js#xfbml=1";
                    js.async = true;
                    fjs.parentNode.insertBefore(js, fjs);
                    }(document, 'script', 'facebook-jssdk'));</script>

                <div class="header header_no_bg">
                    <div class="header_inner">
                        <a class="gmenu_icon" href="#gmenu"><i class="icon-reorder txt_l"></i></a>
                    </div>
                </div>

                <div class="wrapper_inner wrapper_inner1280" style="height:989px">

                    <div class="fixedbox_table">
                        <div class="fixedbox_cell">
                            <div class="fixedbox_cell_inner">
                                <div class="logo_top">
                                    <img src="layout03style/images/logo_mikuexpo.png" class="img100"></div>
                                <p class="txt_top_copy txt_l font_aldrich">Discover the world of Hatsune Miku Exhibition, Company Booths, Live Concerts and more!</p>

                                <div class="top_menubox clearfix">

                                    <div class="top_menu top_menu_soon anime_top05 animated zoomIn">
                                        <div class="comingsoon"><i class="icon-question txt_xl"></i></div>
                                    </div>

                                    <div class="top_menu" style="display: none;">
                                        <div class="comingsoon"><i class="icon-question txt_xl"></i></div>
                                    </div>

                                    <a href="ny_bd.html" class="top_menu top_menu_ny_dvd anime_top06 animated zoomIn"></a>

                                </div>

                                <div class="top_menubox clearfix">
                                    <a class="top_menu past top_menu_indonesia anime_top03 animated zoomIn" href="indonesia_top.html">
                                        <div class="txt_l font_aldrich"><span class="txt_m">HATSUNE MIKU EXPO 2014</span><br>
                                            <span class="txt_l">in INDONESIA</span></div>
                                        <div class="br_t_s font_aldrich">May 28th &amp; May 29th 2014</div>
                                        <div class="txt_s">at Jakarta Convention Center Cendrawasih Room</div>
                                        <div class="bnr_closed"></div>
                                    </a>

                                    <a class="top_menu past top_menu_la anime_top02 animated zoomIn" href="la.html">
                                        <div class="txt_l font_aldrich"><span class="txt_m">HATSUNE MIKU EXPO 2014</span><br>
                                            <span class="txt_l">in LOS ANGELES</span></div>
                                        <div class="br_t_s font_aldrich">Oct. 11th &amp; 12th 2014</div>
                                        <div class="txt_s">Live Concert @NOKIA Theatre</div>
                                        <div class="txt_s">Hatsune Miku Halloween Party @Los Angeles Center Studios</div>
                                        <div class="bnr_closed"></div>
                                    </a>

                                    <a class="top_menu past top_menu_ny anime_top01 animated zoomIn" href="ny.html">
                                        <div class="txt_l font_aldrich"><span class="txt_m">HATSUNE MIKU EXPO 2014</span><br>
                                            <span class="txt_l">in NEW YORK</span></div>
                                        <div class="br_t_ss font_aldrich">Oct. 17th &amp; 18th 2014</div>
                                        <div class="txt_s">Live Concert @Hammerstein Ballroom</div>
                                        <div class="br_t_ss font_aldrich">Oct. 9th - 19th 2014</div>
                                        <div class="txt_s">Hatsune Miku Art Exhibition “Universal Positivity” @Wallplay</div>
                                        <div class="bnr_closed"></div>
                                    </a>
                                </div>

                                <div class="snsbox_top">
                                    <div class="snsbtn"><a href="https://twitter.com/share" class="twitter-share-button" data-lang="en">ツイート</a><script src="../platform.twitter.com/widgets.js"></script></div>
                                    <div class="snsbtn">
                                        <div class="fb-like" data-send="false" data-layout="button_count" data-width="120" data-show-faces="false"></div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                    <a class="btn_whois" href="http://piapro.net/en_character.html" target="_blank"></a>

                </div>

            </div>

<%--            <div class="footer txt_s">
                <div class="credit">
                    <span class="txt_s">Organizer: Crypton Future Media, INC.</span>
                </div>

                <div class="copy"><span class="contact"><a href="https://www.crypton.co.jp/mp/pages/aboutus/aboutus_en.jsp" target="_blank">Press Contact</a></span><span class="copy_piapro">&copy;&nbsp; Crypton Future Media, INC. www.piapro.net</span></div>
                <a href="http://piapro.net/en_character.html" target="_blank" class="logo_miku"></a>
            </div>--%>

            <div class="backtotop"><i class="icon-arrow-up txt_l"></i></div>

        </div>

    </form>
</body>
</html>
