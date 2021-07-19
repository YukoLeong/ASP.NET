<%@ Page Language="C#" AutoEventWireup="true" CodeFile="menu03.aspx.cs" Inherits="menu03" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="menu03style/css/normalize.css" rel="stylesheet" />
    <link href="menu03style/css/standard.css" rel="stylesheet" />
    <link href="menu03style/css/responsive.css" rel="stylesheet" />
    <link href="menu03style/css/jgcvi.css" rel="stylesheet" />
    <link href="menu03style/js/fancybox/jquery.fancybox-1.3.4.css" rel="stylesheet" type="text/css" media="screen" />
    <!--font awesome-->
    <link rel="stylesheet" href="menu03style/js/fontawesome/css/font-awesome.css" />

    <script type="text/javascript" src="menu03style/ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="menu03style/js/page_link_scroll/jquery.easingscroll.js"></script>
    <script type="text/javascript" src="menu03style/js/css_browser_selector.js"></script>
    <script type="text/javascript" src="menu03style/js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
    <script type="text/javascript" src="menu03style/js/mm.js"></script>
    <script type="text/javascript" src="menu03style/js/jpcvi.js"></script>
    <script type="text/javascript" src="menu03style/js/jquery.tile.js"></script>

    <!-- Sidr -->
    <script src="menu03style/js/sidr/jquery.sidr.min.js"></script>
    <link rel="stylesheet" href="menu03style/js/sidr/jquery.sidr.dark.css" media="all and (max-width: 768px)" />


</head>
<body>
    <form id="form1" runat="server">
        <div class="wrapper smart_bg">
            <div id="sidr">
                <nav class="nav">
                    <ul class="menu_body">
                        <li><a href="news.html" class="webfont">News</a>
                            <ul>
                                <li><a href="news.html">ニュース</a></li>
                                <li><a href="news_now.html">期間限定受付</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="location.html" class="webfont">Locations</a>
                            <ul>
                                <li><a href="location.html">会場情報</a></li>
                                <li><a href="location_time.html">タイムスケジュール</a></li>
                                <li><a href="location_fac.html">サッポロファクトリー</a></li>
                                <li><a href="location_odori.html">大通西11丁目会場</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="goods.html" class="webfont">Goods</a>
                            <ul>
                                <li><a href="goods.html">グッズ</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="live_ticket.html" class="webfont">Live</a>
                            <ul>
                                <li><a href="live_ticket.html">チケット</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="sp_chara.html" class="webfont">Special</a>
                            <ul>
                                <li><a href="sp_chara.html">キャラクター</a></li>
                                <li><a href="sp_collab.html">関連企画</a></li>
                                <li><a href="sp_train.html">札幌市電</a></li>
                                <li><a href="sp_tour.html">ツアー情報</a></li>
                                <li><a href="sp_movie.html">動画</a></li>
                                <li><a href="sp_gallery.html">思い出ギャラリー</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="info_atention.html" class="webfont">Info</a>
                            <ul>
                                <li><a href="info_atention.html">注意事項</a></li>
                                <li><a href="https://www.crypton.co.jp/cfm/inquiry/snowmiku" target="_blank">お問い合わせ <i class="fa fa-external-link"></i></a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>
            <div id="all">
                <div class="header header_top">
                    <div class="header_inner">
                        <a href="http://snowmiku.com/" class="siteid" title="">
                            <img src="menu03style/images/logo_header.png" class="img100" alt="SNOW MIKU 2015" /></a>
                        <a id="simple-menu" class="gmenu_icon" href="#sidr"><i class=" fa fa-bars"></i></a>
                    </div>
                </div>
                <div class="fixedbox_table">
                    <div class="cont_top">
                        <div class="top_logo">
                            <img src="menu03style/images/logo.png" alt="SNOW MIKU 2015" class="img100" /></div>

                        <!-- SNS -->
                        <div class="snsbox_top">
                            <div class="snsbtn"><a href="https://twitter.com/share" class="twitter-share-button" data-lang="en">ツイート</a><script src="../../platform.twitter.com/widgets.js"></script></div>
                            <div class="snsbtn">
                                <div class="fb-like" data-send="false" data-layout="button_count" data-width="120" data-show-faces="false"></div>
                            </div>
                            <div class="snsbtn" style="padding: 10px;">
                                <span>
                                    <script type="text/javascript" src="../../media.line.me/js/line-button57ed.js?v=20140127"></script>
                                    <script type="text/javascript">new media_line_me.LineButton({ "pc": false, "lang": "ja", "type": "a" });</script>
                                </span>
                            </div>
                        </div>
                        <!-- SNS END -->
                        <!--
				<div class="btn_demomovie1 br_t"><img src="images/img_movie.jpg" class="img100"><p style="color:#050a23; font-size:9pt; text-align:center; padding-bottom:5px; line-height:1;">プロモーション動画公開中！</p></div>
			-->
                        <div class="btn_demomovie1 br_t">
                            <iframe width="100%" height="200px" src="http://www.youtube.com/embed/_of2sKbRUko" frameborder="0" allowfullscreen></iframe>
                        </div>

                    </div>
                    <div class="top_twitter"><a href="https://twitter.com/cfm_snowmiku" target="_blank">
                        <img src="menu03style/images/twitter.png" /></a></div>
                    <div class="credit_top">illustration by Nardack</div>
                </div>

                <div class="logo_miku"><a href="http://piapro.net/ja_character.html" target="_blank"></a></div>
                <div class="mainvisual_copy"></div>
                <div class="link_twitter"><a href="https://twitter.com/magicalmirai" target="_blank"></a></div>

                <div class="section_whole">

                    <div>
                        <a class="newsbox effect1" href="goods.html">オフィシャルグッズの事後通販受付中！</a>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>