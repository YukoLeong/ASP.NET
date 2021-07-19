<%@ Page Language="C#" AutoEventWireup="true" CodeFile="layout02.aspx.cs" Inherits="layout02" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>


    <link href="layout02style/css/normalize.css" rel="stylesheet"/>
    <link href="layout02style/css/standard.css" rel="stylesheet"/>
    <link href="layout02style/css/responsive.css" rel="stylesheet"/>
    <link href="layout02style/css/jgcvi.css" rel="stylesheet"/>
    <link href="layout02style/js/fancybox/jquery.fancybox-1.3.4.css" rel="stylesheet" type="text/css" media="screen" />
    <!--font awesome-->
    <link rel="stylesheet" href="layout02style/js/fontawesome/css/font-awesome.css" />


    <script type="text/javascript" src="layout02style/ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="layout02style/js/page_link_scroll/jquery.easingscroll.js"></script>
    <script type="text/javascript" src="layout02style/js/css_browser_selector.js"></script>
    <script type="text/javascript" src="layout02style/js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
    <script type="text/javascript" src="layout02style/js/mm.js"></script>
    <script type="text/javascript" src="layout02style/js/jpcvi.js"></script>
    <script type="text/javascript" src="layout02style/js/jquery.tile.js"></script>

    <!-- Sidr -->
    <script src="layout02style/js/sidr/jquery.sidr.min.js"></script>
    <link rel="stylesheet" href="layout02style/js/sidr/jquery.sidr.dark.css" media="all and (max-width: 768px)"/>

    <!--[if lte IE 8]>
    <script type="text/javascript">
		$(function(){
			$(".section:nth-child(odd)").addClass('odd');
			$(".section:nth-child(even)").addClass('even');
			$(".sect_half2_50:nth-child(odd)").addClass('sect_half2_50_odd');
			$(".sect_half2_50:nth-child(even)").addClass('sect_half2_50_even');
			$(".item_thum:nth-child(3)").addClass('item_thum_3');
		});
	</script>
	<script type="text/javascript" src="js/ie.separate.js"></script>
	<script type="text/javascript" src="js/jquery.backgroundSize.js"></script>
	<script>
	$(function() {
		$(".fixedbox").css( "background-size", "cover" );
	});
	</script>
<![endif]-->

    <!-- Google Analytics -->
    <script>
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date(); a = s.createElement(o),
            m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
        })(window, document, 'script', '../../www.google-analytics.com/analytics.js', 'ga');
        ga('create', 'UA-43747583-1', 'auto');
        ga('send', 'pageview');
    </script>


</head>

<body  topmargin="0" leftmargin="0" marginheight="0" marginwidth="0">
    <form id="form1" runat="server">
        <div id="fb-root"></div>
        <script>(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "layout02style/connect.facebook.net/ja_JP/all.js#xfbml=1";
    js.async = true;
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

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


                <!--------video popup
<script type="text/javascript">

$(function(){

	$(".btn_close").click(function(){
		$(".layer_bk").fadeOut(600);
		$("#ytplayer").attr("src", "");
	});

	$(".btn_demomovie1").click(function(){
		if ($("#ytplayer").attr("src") == "") {
			$("#ytplayer").attr("src", "http://www.youtube.com/embed/ZUeOc7MvdPI?rel=0&autoplay=1");
		}
		$(".demomovie1").fadeIn(200);
	});

});

</script>

<div class="layer_bk demomovie1">
	<div class="bg_video">
	<div class="btn_close"></div>
	<iframe id="ytplayer" width="640" height="360"  src="" frameborder="0" allowfullscreen></iframe>
	</div>
</div>
-------->

                <!-- header -->
                <div class="header header_top">
                    <div class="header_inner">
                        <a href="http://snowmiku.com/" class="siteid" title="">
                            <img src="layout02style/images/logo_header.png" class="img100" alt="SNOW MIKU 2015"/></a>
                        <a id="simple-menu" class="gmenu_icon" href="#sidr"><i class=" fa fa-bars"></i></a>
                    </div>
                </div>
                <!-- header END -->

                <div class="fixedbox_table">
                    <div class="cont_top">
                        <div class="top_logo">
                            <img src="layout02style/images/logo.png" alt="SNOW MIKU 2015" class="img100"></div>

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
                        <img src="layout02style/images/twitter.png"></a></div>
                    <div class="credit_top">illustration by Nardack</div>
                </div>

                <div class="logo_miku"><a href="http://piapro.net/ja_character.html" target="_blank"></a></div>
                <div class="mainvisual_copy"></div>
                <div class="link_twitter"><a href="https://twitter.com/magicalmirai" target="_blank"></a></div>

                <div class="section_whole">

                    <div>
                        <a class="newsbox effect1" href="goods.html">オフィシャルグッズの事後通販受付中！</a>
                    </div>
                    <!--
			<div class="section">
				<div class="section_inner">
					<h2 class="sect_title"><div class="sect_snow"></div>生放送</h2>
					<iframe class="niconama" src="http://live.nicovideo.jp/embed/lv209331974" scrolling="no" style="border:solid 1px #CCC;" frameborder="0"><a href="http://live.nicovideo.jp/watch/lv209331974">【ミクコレ公式生放送】公式放送4回目！SNOW MIKU 2015ファクトリーステージからの生放送なんて大丈夫なんですか？！の巻</a></iframe>
					<iframe class="niconama" src="http://live.nicovideo.jp/embed/lv209332325" scrolling="no" style="border:solid 1px #CCC;" frameborder="0"><a href="http://live.nicovideo.jp/watch/lv209332325">【SNOW MIKU 2015】「巡音ルカ V4X」完成記念トークイベント</a></iframe>
					<iframe class="niconama" src="http://live.nicovideo.jp/embed/lv209003218" scrolling="no" style="border:solid 1px #CCC;" frameborder="0"><a href="http://live.nicovideo.jp/watch/lv209003218">SNOW MIKU 2015 開催特別企画 ～帰ってきた雪ミクニコ生放送＠クリプトン～</a></iframe>
					<iframe class="niconama" src="http://live.nicovideo.jp/embed/lv209331532" scrolling="no" style="border:solid 1px #CCC;" frameborder="0"><a href="http://live.nicovideo.jp/watch/lv209331532">【SNOW MIKU 2015】シンポジウム「つながる世界　～Think Global, Act Local Part 3～」</a></iframe>
				</div>
			</div>
-->


                    <div class="section">
                        <div class="section_inner">
                            <h2 class="sect_title">
                                <div class="sect_snow"></div>
                                NEWS</h2>
                            <ul class="top_news">
                                <li><a href="news.html#news35"><span class="newslist_date">2015.04.10</span><span class="news_title">各地の「北海道物産展」で雪ミクグッズの一部を販売！</span></a></li>
                                <li><a href="news.html#news34"><span class="newslist_date">2015.04.01</span><span class="news_title">「SNOW MIKU 2015」全コラボ施策終了！</span></a></li>
                                <li><a href="news.html#news33"><span class="newslist_date">2015.02.27</span><span class="news_title">オフィシャルグッズの事後通販が本日より開始しました！</span></a></li>
                                <li><a href="news.html#news32"><span class="newslist_date">2015.02.12</span><span class="news_title">「SNOW MIKU 2015」終了しました！思い出ギャラリー公開！</span></a></li>
                                <li><a href="news.html#news31"><span class="newslist_date">2015.02.10</span><span class="news_title">「SNOW MIKU 2015」アンケート実施中！ライブ動画＆会場風景の動画を公開！</span></a></li>
                            </ul>
                            <p class="txt_r"><a href="news.html">もっとみる <i class="fa fa-arrow-right"></i></a></p>
                            <!--<div class="br_t txt_c"><a href="goods.html#gsc"><img src="images/bnr_gsc.jpg" class="img100" alt="ねんどろいど 雪ミク＆figma 雪ミク" style="max-width:700px;"></a></div>-->

                        </div>
                    </div>


                    <div class="section">
                        <div class="section_inner">
                            <div class="sect_half2_whole clearfix">
                                <h2 class="sect_title">
                                    <div class="sect_snow"></div>
                                    「SNOW MIKU 2015」開催決定！</h2>
                                <p class="sect_title_s">冬の北海道を応援する「雪ミク（初音ミク）」のフェスティバル！</p>
                                <div class="sect_txt">
                                    <p class="br_t">冬の北海道を応援するフェスティバル「SNOW MIKU 2015」の開催が今年も決定しました！メインキャラクターを務めるのは、“真っ白い「初音ミク」の雪像”をモチーフにデザインされたキャラクター「雪ミク」です。 「SNOW MIKU」は、「初音ミク」を企画・開発したクリプトン・フューチャー・メディア株式会社が北海道札幌市にあることから、2010年より毎冬北海道で開催しているフェスティバルです。フェスティバルのメインイベントは「さっぽろ雪まつり」開催時期に合わせて実施しています。 6周年目の今冬は、大通公園での雪像展示をはじめ、市電ラッピング、グッズ販売、各界のゲストをお招きしてのステージイベントなどを実施予定です。「雪ミク」や「初音ミク」が大好きなあなたにとって絶対に見逃せない冬のフェスティバルです！</p>
                                </div>
                                <div class="sect_half2_whole clearfix br_t">
                                    <p class="sect_half2_50 txt_c"><a class="btn" href="sp_chara.html#sm">「雪ミク」とは？ <i class="fa fa-chevron-right"></i></a></p>
                                    <p class="sect_half2_50 txt_c"><a class="btn" href="sp_chara.html#hm">「初音ミク」とは？ <i class="fa fa-chevron-right"></i></a></p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="section">
                        <div class="section_inner">
                            <div class="sect_half2_whole clearfix">

                                <div class="sect_half2_whole clearfix">
                                    <div class="sect_half2_50 txt_c">
                                        <a href="http://snowmiku.com/skytown/" target="_blank">
                                            <img src="layout02style/images/bnr_skytown2.jpg" class="img100" alt="SNOW MIKU SKY TOWN" style="max-width: 420px;"></a>
                                    </div>
                                    <div class="sect_half2_50 txt_c">
                                        <a href="http://piapro.net/snowmiku2014/" target="_blank">
                                            <img src="layout02style/images/bnr_snowmiku20142.jpg" class="img100" alt="SNOW MIKU 2014" style="max-width: 420px;"></a>
                                    </div>
                                </div>

                                <div class="sect_half2_whole clearfix br_t">
                                    <div class="sect_half2_50 txt_c">
                                        <a href="http://pixiv-zingaro.jp/exhibition/snowmiku/" target="_blank">
                                            <img src="layout02style/images/bnr_pixiv.jpg" class="img100" alt="SNOW MIKU 東京展" style="max-width: 420px;"></a>
                                    </div>
                                    <div class="sect_half2_50 txt_c">
                                        <a href="http://www.crypton.co.jp/miku_portal/runner/" target="_blank">
                                            <img src="layout02style/images/bnr_runner.png" class="img100" alt="SNOW MIKU ブツカランナー" style="max-width: 420px;"></a>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>


                    <div class="section sponsor">
                        <div class="section_inner last">

                            <h3>主催</h3>
                            <ul class="sponsor_bnr">
                                <li><a href="http://www.crypton.co.jp/" target="_blank">
                                    <img src="layout02style/images/top_sponsor_cfm.jpg" width="120" height="80" alt="クリプトン・フューチャー・メディア株式会社"></a></li>
                            </ul>
                            <h3>特別協賛</h3>
                            <ul class="sponsor_bnr">
                                <li><a href="http://tv1.nottv.jp/" target="_blank">
                                    <img src="layout02style/images/top_sponsor_nottv.jpg" width="120" height="80" alt="nottv"></a></li>
                                <li><a href="http://www.rohto.jp/digieye/" target="_blank">
                                    <img src="layout02style/images/top_sponsor_digieye.jpg" width="120" height="80" alt="ロート デジアイ"></a></li>
                            </ul>
                            <h3>協賛</h3>
                            <p class="kaigyo_no_sm">
                                <span>株式会社アニメイト</span> / <span>株式会社 一迅社</span> / <span>株式会社エクシヴィ</span> / <span>株式会社エンスカイ</span> / <span>オットージャパン株式会社</span> / <span>株式会社活里</span> / <span>株式会社KADOKAWA</span> / <span>ガンホー・オンライン・エンターテイメント株式会社</span> / <span>株式会社Gift</span> / <span>近畿日本ツーリスト株式会社</span> / <span>株式会社グッドスマイルカンパニー</span> / <span>小路谷写真株式会社</span> / <span>株式会社コスパ</span> / <span>株式会社セガ</span> / <span>株式会社ソニー・コンピュータエンタテインメント</span> / <span>株式会社ソニー・ミュージックコミュニケーションズ</span> / <span>株式会社第一興商</span> / <span>株式会社タイトー</span> / <span>ダイハツ北海道販売株式会社</span> / <span>株式会社タカハシ</span> / <span>トリバゴ</span> / <span>株式会社ナガトヤ</span> / <span>ノルベサ</span> / <span>パラシュート株式会社</span> / <span>株式会社 バンダイ</span> / <span>株式会社バンプレスト</span> / <span>株式会社ファミリーマート</span> / <span>フジミ模型株式会社</span> / <span>株式会社 FREEing</span> / <span>株式会社ボークス</span> / <span>北海道純馬油本舗 有限会社</span> / <span>ポッカサッポロ北海道株式会社</span> / <span>株式会社ホビーストック</span> / <span>株式会社マックスファクトリー</span> / <span>株式会社ムービック　　※50音順</span>
                            </p>
                            <h3>協力</h3>
                            <p class="kaigyo_no_sm">
                                <span>三井住友カード株式会社</span>
                            </p>
                            <h3>後援</h3>
                            <p class="kaigyo_no_sm">
                                <span>札幌市</span>
                            </p>
                        </div>

                    </div>

                    <div class="footer">
                        <!-- LANG -->
                        <div class="menu_lang">
                            <ul>
                                <li><a href="http://snowmiku.com/" class="now">日本語</a></li>
                                <li><a href="index_en.html">ENGLISH</a></li>
                                <li><a href="index_cn.html">中文简体</a></li>
                                <li><a href="index_tw.html">中文繁體</a></li>
                            </ul>
                        </div>
                        <!-- LANG END -->
                        <div class="copy br_t_ss">
                            <span class="copy_piapro">&copy;&nbsp;Crypton Future Media, INC. www.piapro.net</span>
                        </div>
                    </div>

                    <div class="backtotop"><i class="fa fa-4x fa-arrow-circle-o-up"></i></div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
