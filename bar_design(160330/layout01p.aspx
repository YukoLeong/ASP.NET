<%@ Page Language="C#" AutoEventWireup="true" CodeFile="layout01p.aspx.cs" Inherits="layout01p" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="slider02style/cfm/css/normalizeee0f.css?23789456" rel="stylesheet" />
    <link href="slider02style/cfm/css/standardee0f.css?23789456" rel="stylesheet" />
    <link href="slider02style/cfm/css/responsive59bc.css?23574662" rel="stylesheet" />
    <link href="slider02style/cfm/js/mmenufd1a.css?23181697" rel="stylesheet" />
    <link href="slider02style/cfm/js/fancybox/jquery.fancybox-1.3.4.css" rel="stylesheet" type="text/css" media="screen" />
    <link href='http://fonts.googleapis.com/css?family=Courgette' rel='stylesheet' type='text/css' />

    <link rel="stylesheet" href="slider02style/cfm/js/fontawesome/css/font-awesome.css" />
    <link rel="shortcut icon" href="favicon.ico" />
    <script type="text/javascript" src="slider02style/ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="slider02style/cfm/js/page_link_scroll/jquery.easingscroll.js"></script>
    <script type="text/javascript" src="slider02style/cfm/js/css_browser_selector.js"></script>
    <script type="text/javascript" src="slider02style/cfm/js/jquery.mmenu.min.js"></script>
    <script type="text/javascript" src="slider02style/cfm/js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
    <script type="text/javascript" src="slider02style/cfm/js/jquery.champagne.min.js"></script>


    <script type="text/javascript">
        $(function () {

            //extraのtext,bgを非表示
            function extra_hide() {
                $(".header_bg").hide();
                $(".desk_msg").hide();
            }


            var w = $(window).width();
            var w_m = 768;
            if (w > w_m) {

                $(".topbtn_dtm").hover(
                    function () {
                        if ($(".topimg1").css("display") == "none") {
                            $(".topimg").fadeOut(350);
                            $(".topimg1").fadeIn(350);
                            $(".topbtn_title").not(this.children).css("color", "#ffffff");
                            $(this).children(".topbtn_title").css("color", "#f29556");

                            $(".topbtn_icon").not(this.children).removeClass("topbtn_icon_on");
                            $(this).children(".topbtn_icon").addClass("topbtn_icon_on");

                            $(".topbtn_arrow").not(this.children).animate({ top: "10px" }, 200);
                            $(this).children(".topbtn_arrow").animate({ top: "-10px" }, 200);
                            $(".siteid").removeClass("site_id_bk");
                            $(".siteid").addClass("site_id_wht");
                            $(".gmenu").removeClass("gmenu_bk");
                            $(".gmenu").addClass("gmenu_wht");
                            extra_hide();
                        }
                    },
                    function () {
                    });

                $(".topbtn_fxbgm").hover(
                    function () {
                        if ($(".topimg2").css("display") == "none") {
                            $(".topimg").fadeOut(350);
                            $(".topimg2").fadeIn(350);
                            $(".topbtn_title").not(this.children).css("color", "#ffffff");
                            $(this).children(".topbtn_title").css("color", "#cfc63a");

                            $(".topbtn_icon").not(this.children).removeClass("topbtn_icon_on");
                            $(this).children(".topbtn_icon").addClass("topbtn_icon_on");

                            $(".topbtn_arrow").not(this.children).animate({ top: "10px" }, 200);
                            $(this).children(".topbtn_arrow").animate({ top: "-10px" }, 200);
                            $(".siteid").removeClass("site_id_wht");
                            $(".siteid").addClass("site_id_bk");
                            $(".gmenu").removeClass("gmenu_wht");
                            $(".gmenu").addClass("gmenu_bk");
                            extra_hide();
                        }
                    },
                    function () {

                    });

                $(".topbtn_mobile").hover(
                    function () {
                        if ($(".topimg3").css("display") == "none") {
                            $(".topimg").fadeOut(350);
                            $(".topimg3").fadeIn(350);
                            $(".topbtn_title").not(this.children).css("color", "#ffffff");
                            $(this).children(".topbtn_title").css("color", "#88c538");

                            $(".topbtn_icon").not(this.children).removeClass("topbtn_icon_on");
                            $(this).children(".topbtn_icon").addClass("topbtn_icon_on");

                            $(".topbtn_arrow").not(this.children).animate({ top: "10px" }, 200);
                            $(this).children(".topbtn_arrow").animate({ top: "-10px" }, 200);
                            $(".siteid").removeClass("site_id_wht");
                            $(".siteid").addClass("site_id_bk");
                            $(".gmenu").removeClass("gmenu_wht");
                            $(".gmenu").addClass("gmenu_bk");
                            extra_hide();
                        }
                    },
                    function () {

                    });

                $(".topbtn_character").hover(
                    function () {
                        if ($(".topimg4").css("display") == "none") {
                            $(".topimg").fadeOut(350);
                            $(".topimg4").fadeIn(350);
                            $(".topbtn_title").not(this.children).css("color", "#ffffff");
                            $(this).children(".topbtn_title").css("color", "#6abfc4");

                            $(".topbtn_icon").not(this.children).removeClass("topbtn_icon_on");
                            $(this).children(".topbtn_icon").addClass("topbtn_icon_on");

                            $(".topbtn_arrow").not(this.children).animate({ top: "10px" }, 200);
                            $(this).children(".topbtn_arrow").animate({ top: "-10px" }, 200);
                            $(".siteid").removeClass("site_id_bk");
                            $(".siteid").addClass("site_id_wht");
                            $(".gmenu").removeClass("gmenu_bk");
                            $(".gmenu").addClass("gmenu_wht");
                            extra_hide();
                        }
                    },
                    function () {

                    });

                $(".topbtn_extra").hover(
                    function () {
                        if ($(".topimg5").css("display") == "none") {
                            $(".topimg").fadeOut(350);
                            $(".topimg5").fadeIn(350);
                            $(".topbtn_title").not(this.children).css("color", "#ffffff");
                            $(this).children(".topbtn_title").css("color", "#e98a1b");
                            $(".topbtn_arrow").not(this.children).animate({ top: "10px" }, 200);
                            $(this).children(".topbtn_arrow").animate({ top: "-10px" }, 200);
                            $(".siteid").removeClass("site_id_bk");
                            $(".siteid").addClass("site_id_wht");
                            $(".gmenu").removeClass("gmenu_bk");
                            $(".gmenu").addClass("gmenu_wht");
                        }

                        $(".topbtn").addClass("topbtn_on");
                        $(this).addClass("topbtn_extra_on");
                        $(".extra_hidden").fadeIn(200);


                        $("ul.champagne").champagne({
                            //beginning_delay: 1000,
                            delay_between: 300,
                            duration: 200,
                            onFinish: function () {
                                //$(".desk_msg").fadeIn(500);
                            }
                        });

                        $(".header_bg").delay(500).fadeIn(2000);
                        $(".desk_msg").delay(500).fadeIn(1000);
                    },
                    function () {
                        $(".topbtn").removeClass("topbtn_on");
                        $(this).removeClass("topbtn_extra_on");
                        $(".extra_hidden").hide();
                    });

                $(".subcont").hover(
                    function () {
                        if ($(".topimg0").css("display") == "none") {
                            $(".topimg").fadeOut(250);
                            $(".topimg0").fadeIn(250);
                            $(".topbtn_title").css("color", "#ffffff");

                            $(".topbtn_icon").removeClass("topbtn_icon_on");

                            $(".topbtn_arrow").animate({ top: "10px" }, 200);
                            $(".siteid").removeClass("site_id_wht");
                            $(".siteid").addClass("site_id_bk");
                            $(".gmenu").removeClass("gmenu_wht");
                            $(".gmenu").addClass("gmenu_bk");
                            extra_hide();
                        }
                    },
                    function () {

                    });
            }

            $('.backtotop').hide();
            $('.backtotop').click(function () {
                $('body,html').animate({
                    scrollTop: 0
                })
                return false
            });
            $(window).scroll(function () {
                if ($(this).scrollTop() > 200) {
                    $('.backtotop').fadeIn();
                } else {
                    $('.backtotop').fadeOut();
                }
            });

            $("a[href*='#']:not(.gmenu_icon)").easingScroll({
                easing: "easeOutQuad",
                duration: 400
            });

        });
    </script>

    <script type="text/javascript">
        function menu_slide() {
            var ww = $(window).width();
            if (ww <= 768) {
                $(".gmenu").addClass('gmenu_mobile');
                $(".fancybox").addClass('fancybox_mobile');
                $(".fancybox").removeClass('fancybox');
            }
            else {
                $(".gmenu").removeClass('gmenu_mobile mm-menu mm-opened');
                $(".gmenu > div").removeClass('mm-inner');
            }
        }
        $(function () {
            menu_slide();
            $('.gmenu_mobile').mmenu();
        });
        $(window).resize(function () {
            menu_slide();
            $('.gmenu_mobile').mmenu();
        });
    </script>

    <script type="text/javascript">

        $(document).ready(function () {
            $("a#fancybox, a.fancybox").fancybox({
                'overlayColor': '#111111',
                'speedOut': 80,
                'overlayOpacity': 0.8,
                'margin': 100,
                'titlePosition': 'inside'
            });
        });

        $(document).ready(function () {
            $("a.fancybox_mobile").fancybox({
                'overlayColor': '#111111',
                'speedOut': 80,
                'overlayOpacity': 0.8,
                'autoScale': true,
                'showCloseButton': false,
                'padding': 0,
                'margin': 20
            });
        });

    </script>


</head>
<body topmargin="0" leftmargin="0" marginheight="0" marginwidth="0">
    <form id="form1" runat="server">

        <script>(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "../connect.facebook.net/ja_JP/all.js#xfbml=1&appId=646910018705815";
    js.async = true;
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>


        <!--like button-->
        <div id="fb-root"></div>
        <script>(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "../connect.facebook.net/ja_JP/all.js#xfbml=1&appId=646910018705815";
    js.async = true;
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

        <ul class="gmenu gmenu_bk" id="gmenu">
            <li><a href="slider02.aspx">TOP</a></li>
            <li><a class="" href="slider02style/cfm/pages/project.html">事業内容</a></li>
            <li class="lv2"><a href="slider02style/cfm/pages/project_dtm.html">サウンド素材・ソフト音源</a></li>
            <li class="lv2"><a href="slider02style/cfm/pages/project_fxbgm.html">効果音・BGM</a></li>
            <li class="lv2"><a href="slider02style/cfm/pages/project_mobile.html">モバイルコンテンツ</a></li>
            <li class="lv2"><a href="slider02style/cfm/pages/project_character.html">キャラクター</a></li>
            <li class="lv2"><a href="slider02style/cfm/pages/project_other.html">その他</a></li>
            <li><a class="" href="slider02style/cfm/pages/aboutus.html">会社概要</a></li>
            <li><a class="" href="slider02style/cfm/news.html">ニュースリリース</a></li>
            <li><a class="" href="slider02style/cfm/pages/recruit.html">採用情報</a></li>
            <li class="lv2"><a href="slider02style/cfm/pages/recruit.html">クリプトンってどんな会社？</a></li>
            <li class="lv2"><a href="slider02style/cfm/pages/recruit_info.html">募集職種/要項</a></li>
        </ul>


	<div class="wrapper">


		<div class="maincont">
			<a href="slider02style/cfm/pages/index.html" class="siteid site_id_bk" title="クリプトン・フューチャー・メディア（株）｜音で発想するチーム"></a>
			<a class="gmenu_icon" href="#gmenu"><i class="icon-reorder"></i></a>
			<div class="topimg topimg0"></div>
			<div class="topimg topimg_fixed"></div>
			<a href="slider02style/cfm/pages/project_dtm.html" class="topimg topimg1">
				<div class="topimg_inner topimg_inner1">
					<div class="topimg_icon"></div>
					<div class="topimg_copy"><span class="br">パソコンで</span><span class="br">音楽をつくる。</span></div>
					<p class="topimg_desc">音楽制作に欠かせないサンプルパックやソフトウェア音源を販売。ジャンルや楽器ごとにまとめられた多彩なサウンド素材から、「初音ミク」などの自社開発ソフトウェアまで、世界最大級の品揃えを実現。</p>
				</div>
			</a>
			<a href="slider02style/cfm/pages/project_fxbgm.html" class="topimg topimg2">
				<div class="topimg_inner topimg_inner2">
					<div class="topimg_icon"></div>
					<div class="topimg_copy"><span class="br">映像を</span><span class="br">音で彩る。</span></div>
					<p class="topimg_desc">映像表現が一層と際立つ効果音やBGMを販売。大自然の風景から近未来の世界まで様々なシーンを網羅する、200,000種類以上の効果音と10,000曲以上のBGMをダウンロード配信。その品揃えは世界最大規模。</p>
				</div>
			</a>
			<a href="slider02style/cfm/pages/project_mobile.html" class="topimg topimg3">
				<div class="topimg_inner topimg_inner3">
					<div class="topimg_icon"></div>
					<div class="topimg_copy"><span class="br">モバイルを</span><span class="br">もっとたのしく。</span></div>
					<p class="topimg_desc">「初音ミク」などのキャラクターを題材としたゲームや、50,000音以上の着信音・効果音がダウンロードできるアプリなど、モバイルを楽しくするコンテンツを企画・開発。</p>
				</div>
			</a>
			<a href="slider02style/cfm/pages/project_character.html" class="topimg topimg4">
				<div class="topimg_inner topimg_inner4">
					<div class="topimg_icon"></div>
					<div class="topimg_copy"><span class="br">広がる創作</span><span class="br">の連鎖。</span></div>
					<p class="topimg_desc">ソフトウェアのパッケージイラストとして登場した「初音ミク」たち。今ではキャラクターとして確立し、クリエイターたちの注目を集める存在に。国内外を問わずライブやグッズ展開を行うなど活躍の場を拡大中。</p>
				</div>
			</a>
			
			<a href="slider02style/cfm/pages/desk.html" class="topimg topimg5">
				
				<div class="desk_msg"><div class="desk_msg_inner font_courgette">Whose Desk?</div></div>
				<div class="header_bg"></div>
				
				<ul class="deskthumbox champagne">
					<li><div class="deskthum" style="background-image:url(slider02style/cfm/images/desk/250_001.jpg);"></div></li>
					<li><div class="deskthum" style="background-image:url(slider02style/cfm/images/desk/250_002.jpg);"></div></li>
					<li><div class="deskthum" style="background-image:url(slider02style/cfm/images/desk/250_003.jpg);"></div></li>
					<li><div class="deskthum" style="background-image:url(slider02style/cfm/images/desk/250_004.jpg);"></div></li>
					<li><div class="deskthum" style="background-image:url(slider02style/cfm/images/desk/250_005.jpg);"></div></li>
					<li><div class="deskthum" style="background-image:url(slider02style/cfm/images/desk/250_006.jpg);"></div></li>
					<li><div class="deskthum" style="background-image:url(slider02style/cfm/images/desk/250_007.jpg);"></div></li>
					<li><div class="deskthum" style="background-image:url(slider02style/cfm/images/desk/250_008.jpg);"></div></li>
					<li><div class="deskthum" style="background-image:url(slider02style/cfm/images/desk/250_009.jpg);"></div></li>
					<li><div class="deskthum" style="background-image:url(slider02style/cfm/images/desk/250_010.jpg);"></div></li>
					<li><div class="deskthum" style="background-image:url(slider02style/cfm/images/desk/250_011.jpg);"></div></li>
					<li><div class="deskthum" style="background-image:url(slider02style/cfm/images/desk/250_012.jpg);"></div></li>
					<li><div class="deskthum" style="background-image:url(slider02style/cfm/images/desk/250_013.jpg);"></div></li>
					<li><div class="deskthum" style="background-image:url(slider02style/cfm/images/desk/250_014.jpg);"></div></li>
					<li><div class="deskthum" style="background-image:url(slider02style/cfm/images/desk/250_015.jpg);"></div></li>
					<li><div class="deskthum" style="background-image:url(slider02style/cfm/images/desk/250_016.jpg);"></div></li>
					<li><div class="deskthum" style="background-image:url(slider02style/cfm/images/desk/250_017.jpg);"></div></li>
					<li><div class="deskthum" style="background-image:url(slider02style/cfm/images/desk/250_018.jpg);"></div></li>
					<li><div class="deskthum" style="background-image:url(slider02style/cfm/images/desk/250_019.jpg);"></div></li>
					<li><div class="deskthum" style="background-image:url(slider02style/cfm/images/desk/250_020.jpg);"></div></li>
				</ul>
			</a>
			
		</div>
		
		<div class="showcase">
			<a href="slider02style/cfm/pages/project_dtm.html" class="topbtn topbtn_dtm">
				<div class="topbtn_title">サンプルパック／ソフト音源</div>
				<p class="topbtn_desc">音楽制作に欠かせないサンプルパックやソフトウェア音源を販売。ジャンルや楽器ごとにまとめられた多彩なサウンド素材から、「初音ミク」などの自社開発ソフトウェアまで、世界最大の品揃えを実現。</p>
				<div class="topbtn_icon"></div>
				<div class="topbtn_arrow"></div>
			</a>
			<a href="slider02style/cfm/pages/project_fxbgm.html" class="topbtn topbtn_fxbgm">
				<div class="topbtn_title">効果音／BGM</div>
				<p class="topbtn_desc">映像表現が一層と際立つ効果音やBGMを販売。大自然の風景から近未来の世界まで様々なシーンを網羅する、200,000種類以上の効果音と5,000曲以上のBGMをダウンロード配信。その品揃えは世界最大規模。</p>
				<div class="topbtn_icon"></div>
				<div class="topbtn_arrow"></div>
			</a>
			<a href="slider02style/cfm/pages/project_mobile.html" class="topbtn topbtn_mobile">
				<div class="topbtn_title">モバイルコンテンツ</div>
				<p class="topbtn_desc">「初音ミク」などのキャラクターを題材としたゲームや、50,000音以上の着信音・効果音がダウンロードできるアプリなど、モバイルを楽しくするコンテンツを企画・開発。</p>
				<div class="topbtn_icon"></div>
				<div class="topbtn_arrow"></div>
			</a>
			<a href="slider02style/cfm/pages/project_character.html" class="topbtn topbtn_character">
				<div class="topbtn_title">キャラクター</div>
				<p class="topbtn_desc">ソフトウェアのパッケージイラストとして登場した「初音ミク」たち。今ではキャラクターとして確立し、クリエイターたちの注目を集める存在に。国内外を問わずライブやグッズ展開を行うなど活躍の場を拡大中。</p>
				<div class="topbtn_icon"></div>
				<div class="topbtn_arrow"></div>
			</a>
			<a href="slider02style/cfm/pages/desk.html" class="topbtn topbtn_extra">
				<div class="topbtn_title extra_hidden">Whose Desk?</div>
				<div class="topbtn_icon extra_hidden"></div>
				<div class="topbtn_arrow"></div>
			</a>
		</div>
		
		<div class="subcont">
			
<%--			<div class="newsbox">
				<div class="newsicon">ニュースリリース</div>
				<ul class="newscont">
					<li><a href="slider02style/cfm/news/2015/04/16yosakoi.html"><span class="news_date">2015. 04 .16</span><span class="news_ctg">キャラクター</span><span class="news_title">ジュニアダンサー募集！雪ミクのスペシャルチームがYOSAKOIソーラン祭りに参加！</span></a></li>
					<li><a href="slider02style/cfm/news/2015/03/takemurajuku.html"><span class="news_date">2015. 03 .23</span><span class="news_ctg">その他</span><span class="news_title">武邑塾 North ―『トランスメディア都市としての札幌の未来』開催</span></a></li>
					<li><a href="slider02style/cfm/news/2015/03/lukav4x.html"><span class="news_date">2015. 03 .19</span><span class="news_ctg">サンプルパック／ソフト音源</span><span class="news_title">バイリンガル・シンガー『巡音ルカ V4X』販売開始！</span></a></li>
					<li><a href="slider02style/cfm/news/2015/03/magicalmirai2015.html"><span class="news_date">2015. 03 .09</span><span class="news_ctg">キャラクター</span><span class="news_title">日本武道館でのライブを実現！初音ミク「マジカルミライ 2015」開催決定！</span></a></li>
					<li><a href="slider02style/cfm/news/2015/02/sugotoku.html"><span class="news_date">2015. 02 .17</span><span class="news_ctg">モバイルコンテンツ</span><span class="news_title">「スゴ得コンテンツ（R）」向けに【初音ミクモバイル for スゴ得】を提供開始！</span></a></li>
					<li><a href="slider02style/cfm/news.html"><i class="icon-ellipsis-horizontal icon_more"></i>もっと読む</a></li>
				</ul>
			</div>
			--%>

           
<%--			<div class="linkbox">
				<div class="br">
				<a target="_blank" href="vienna.html" class="linkthum linkthum_vsl"></a>
				<a target="_blank" href="http://sonicwire.com/toontrack" class="linkthum linkthum_toontrack"></a>
				<a target="_blank" href="mp/pages/prod/vocaloid/index.html" class="linkthum linkthum_vocaloid"></a>
				<a target="_blank" href="http://sonicwire.com/" class="linkthum linkthum_sonicwire"></a>
				<a target="_blank" href="http://sonicwire.com/mutant" class="linkthum linkthum_mutant"></a>
				<a target="_blank" href="http://karent.jp/" class="linkthum linkthum_karent"></a>
				<a target="_blank" href="http://router.fm/" class="linkthum linkthum_router"></a>
				<a target="_blank" href="http://gigle.jp/" class="linkthum linkthum_gigle"></a>
				<a target="_blank" href="http://www.pokeon.net/" class="linkthum linkthum_pokeon"></a>
				<a target="_blank" href="http://mirai.st/" class="linkthum linkthum_miraist"></a>
				</div>
				<div class="br">
				<a target="_blank" href="mikucolle/index.html" class="linkthum linkthum_gurakore"></a>
				<a target="_blank" href="mikucolle_app/index.html" class="linkthum linkthum_gurakore_nt"></a>
				<a target="_blank" href="http://mikumoba.jp/mikumoba/index.php" class="linkthum linkthum_mikumoba"></a>
				<a target="_blank" href="http://piapro.net/" class="linkthum linkthum_piapronet"></a>
				<a target="_blank" href="http://piapro.jp/" class="linkthum linkthum_piapro"></a>
				</div>
				<div class="br">
				<a target="_blank" href="http://www.youtube.com/user/HatsuneMiku/featured" class="linkthum linkthum_39ch"></a>
				<a target="_blank" href="http://magicalmirai.com/" class="linkthum linkthum_magicalmirai"></a>
				<a target="_blank" href="http://mikuexpo.com/" class="linkthum linkthum_mikuexpo"></a>
				<a target="_blank" href="http://snowmiku.com/" class="linkthum linkthum_snowmiku"></a>
				</div>
			</div>--%>
			

		</div>



<%--		<div class="footer">
			<ul class="footer_link">
				<li><a href="cfm/pages/rule.html">利用条件</a></li>
				<li><a href="cfm/pages/security_policy.html">セキュリティーポリシー</a></li>
				<li><a href="cfm/pages/privacy_policy.html">プライバシーポリシー</a></li>
				<li><a href="cfm/pages/inquiry.html">お問い合わせ</a></li>
				<li><a href="mp/pages/aboutus/aboutus_en.html">ENGLISH</a></li>
			</ul>
			<div class="footer_lang"><span>日本語</span><a href="#">ENGLISH</a></div>
			<div class="footer_copyright">&copy; Crypton Future Media, INC.</div>
			
			<div class="snsbox_top">
				<div class="snsbtn"><a href="https://twitter.com/share" class="twitter-share-button" data-lang="en">ツイート</a><script src="../platform.twitter.com/widgets.js"></script></div>
				<div class="snsbtn"><div class="fb-like" data-send="false" data-layout="button_count" data-width="120" data-show-faces="false"></div></div>
			</div>
		</div>--%>


	</div>
	<div class="backtotop"><i class="icon-chevron-up"></i></div>


    </form>
</body>
</html>