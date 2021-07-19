<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gallery01.aspx.cs" Inherits="gallery01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link href="gallery01style/css/import.css" rel="stylesheet" />
    <script src="gallery01style/js/jquery-1.11.0.min.js"></script>
    <script src="gallery01style/js/smoothRollOver.js"></script>
    <link href='http://fonts.googleapis.com/css?family=Noticia+Text:700' rel='stylesheet' type='text/css' />
    <link href="gallery01style/css/galleriffic-3.css" rel="stylesheet" />
    <script src="gallery01style/js/jquery-1.3.2.js"></script>
    <script src="gallery01style/js/jquery.galleriffic.js"></script>
    <script src="gallery01style/js/jquery.opacityrollover.js"></script>
    <script type="text/javascript">
        document.write('<style>.noscript { display: none; }</style>');
    </script>

<%--    <script language="JavaScript">
    num = 5;
    nme = "img/karoneko"
    exp = "png"
    cnt = 0;
    function changeImage() {
        cnt++;
        cnt %= num;
        document.img.src = nme + cnt + "." + exp;
    }
    </script>--%>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <!-- ------------------------------------------------------------------#contents▼ -->
            <div id="contents">
                <div class="area">

                    <h2>Gallery</h2>

                    <div id="galleryBox">

                        <div id="gallery" class="content">
                            <div id="controls" class="controls"></div>
                            <div class="slideshow-container">
                                <div id="loading" class="loader"></div>
                                <div id="slideshow" class="slideshow"></div>
                            </div>
                            <!-- fin_slideshow-container -->
                        </div>

                        <!-- 左サムネイル部分ここから -->
                        <div id="thumbs" class="navigation">
                            <ul class="thumbs noscript">
                                <li><a class="thumb" href="gallery01style/img/gallery/009_b.jpg">
                                    <img src="gallery01style/img/gallery/009_s.jpg" alt="" /></a></li>
                                <li><a class="thumb" href="gallery01style/img/gallery/008_b.jpg">
                                    <img src="gallery01style/img/gallery/008_s.jpg" alt="" /></a></li>
                                <li><a class="thumb" href="gallery01style/img/gallery/013_b.jpg">
                                    <img src="gallery01style/img/gallery/013_s.jpg" alt="" /></a></li>
                                <li><a class="thumb" href="gallery01style/img/gallery/012_b.jpg">
                                    <img src="gallery01style/img/gallery/012_s.jpg" alt="" /></a></li>
                                <li><a class="thumb" href="gallery01style/img/gallery/011_b.jpg">
                                    <img src="gallery01style/img/gallery/011_s.jpg" alt="" /></a></li>
                                <li><a class="thumb" href="gallery01style/img/gallery/015_b.jpg">
                                    <img src="gallery01style/img/gallery/015_s.jpg" alt="" /></a></li>
                                <li><a class="thumb" href="gallery01style/img/gallery/010_b.jpg">
                                    <img src="gallery01style/img/gallery/010_s.jpg" alt="" /></a></li>
                                <li><a class="thumb" href="gallery01style/img/gallery/014_b.jpg">
                                    <img src="gallery01style/img/gallery/014_s.jpg" alt="" /></a></li>
                                <li><a class="thumb" href="gallery01style/img/gallery/007_b.jpg">
                                    <img src="gallery01style/img/gallery/007_s.jpg" alt="" /></a></li>
                                <li><a class="thumb" href="gallery01style/img/gallery/006_b.jpg">
                                    <img src="gallery01style/img/gallery/006_s.jpg" alt="" /></a></li>
                                <li><a class="thumb" href="gallery01style/img/gallery/005_b.jpg">
                                    <img src="gallery01style/img/gallery/005_s.jpg" alt="" /></a></li>
                                <li><a class="thumb" href="gallery01style/img/gallery/004_b.jpg">
                                    <img src="gallery01style/img/gallery/004_s.jpg" alt="" /></a></li>
                                <li><a class="thumb" href="gallery01style/img/gallery/003_b.jpg">
                                    <img src="gallery01style/img/gallery/003_s.jpg" alt="" /></a></li>
                                <li><a class="thumb" href="gallery01style/img/gallery/002_b.jpg">
                                    <img src="gallery01style/img/gallery/002_s.jpg" alt="" /></a></li>
                                <li><a class="thumb" href="gallery01style/img/gallery/001_b.jpg">
                                    <img src="gallery01style/img/gallery/001_s.jpg" alt="" /></a></li>
                            </ul>
                        </div>
                        <!-- サムネイル部分ここまで -->

                        <br class="FloatEnd">
                    </div>
                    <!-- #galleryBox -->

                    <script type="text/javascript">
                        $(document).ready(function () {

                            // opacityrollover のオプション設定				
                            var onMouseOutOpacity = 0.67;
                            $('#thumbs ul.thumbs li').opacityrollover({
                                mouseOutOpacity: onMouseOutOpacity,
                                mouseOverOpacity: 1.0,
                                fadeSpeed: 'fast',
                                exemptionSelector: '.selected'
                            });

                            // Galleriffic のオプション設定
                            var gallery = $('#thumbs').galleriffic({
                                delay: 3000, // オートスライドにした時の画像が切り替わる時間
                                numThumbs: 10, // 1画面に表示させるサムネイルの数
                                preloadAhead: 10, // プリロードする画像数
                                enableTopPager: false, // サムネイルの上部のページャーを出す/出さない
                                enableBottomPager: true, // サムネイルの下部のページャーを出す/出さない
                                maxPagesToShow: 5, // ページの最大値
                                imageContainerSel: '#slideshow', // スライドショー画像部分のid名
                                controlsContainerSel: '#controls', // コントロール部分のid名
                                captionContainerSel: '#caption', // キャプション部分のid名
                                loadingContainerSel: '#loading', // ローディング部分のid名
                                renderSSControls: true, // trueでスライドショー画像の上部にスライドショーのオンオフボタン表示
                                renderNavControls: true, // trueでスライドショー画像の上部に画像送り戻しのボタン表示
                                playLinkText: 'Slideshow再生', // コントローラーのplayのテキスト変更
                                pauseLinkText: 'Slideshow停止', // コントローラーのPauseのテキスト変更
                                prevLinkText: '&lsaquo; 前の画像', // コントローラーの前の画像へのテキスト変更
                                nextLinkText: '次の画像 &rsaquo;', // コントローラーの次の画像へのテキスト変更
                                nextPageLinkText: 'Next &rsaquo;',　// コントローラーの次ページへのテキスト変更
                                prevPageLinkText: '&lsaquo; Prev',　// コントローラーの前ページへのテキスト変更
                                enableHistory: false,
                                autoStart: false, // 自動再生するかしないか
                                syncTransitions: true,
                                defaultTransitionDuration: 900,
                                onSlideChange: function (prevIndex, nextIndex) {
                                    // 'this' refers to the gallery, which is an extension of $('#thumbs')
                                    this.find('ul.thumbs').children()
                                        .eq(prevIndex).fadeTo('fast', onMouseOutOpacity).end()
                                        .eq(nextIndex).fadeTo('fast', 1.0);
                                },
                                onPageTransitionOut: function (callback) {
                                    this.fadeTo('fast', 0.0, callback);
                                },
                                onPageTransitionIn: function () {
                                    this.fadeTo('fast', 1.0);
                                }
                            });
                        });
                    </script>

                    <script>
                        (function (i, s, o, g, r, a, m) {
                            i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                                (i[r].q = i[r].q || []).push(arguments)
                            }, i[r].l = 1 * new Date(); a = s.createElement(o),
                            m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
                        })(window, document, 'script', '../www.google-analytics.com/analytics.js', 'ga');

                        ga('create', 'UA-46464610-1', 'memocarilog.info');
                        ga('send', 'pageview');

                    </script>

                </div>
            </div>
            <!-- / #contents -->
        </div>
    </form>
</body>
</html>