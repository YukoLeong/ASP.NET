<%@ Page Language="C#" AutoEventWireup="true" CodeFile="layout_vertical01.aspx.cs" Inherits="layout_vertical01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <script>document.documentElement.className += " js";</script>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">



    <link rel="shortcut icon" href="wp-content/themes/themify-v3/favicon.png" />

    <%--<link rel='stylesheet' id='theme-style-css'  href='layout_vertical01style/style4bf4.css?ver=1.0.3' type='text/css' media='all'/>--%>
    <link rel='stylesheet' href='layout_vertical01style/media-queries4bf4.css?ver=1.0.3' type='text/css' media='all' />
    <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,700,600|Montserrat:400,700' type='text/css' media='all' />
    <link rel='stylesheet' href='layout_vertical01style/font-awesome.min.css' type='text/css' media='all' />
    <link rel='stylesheet' href='layout_vertical01style/fontello4bf4.css?ver=1.0.3' type='text/css' media='all' />
    <link rel='stylesheet' href='layout_vertical01style/themify-icons4bf4.css?ver=1.0.3' type='text/css' media='all' />


    <!-- This site is optimized with the Yoast SEO plugin v2.3.4 - https://yoast.com/wordpress/plugins/seo/ -->
    <title>Drag &amp; Drop WordPress Themes &bull; Themify</title>
    <meta name="description" content="Create responsive &amp; mobile friendly WordPress sites with the best drag &amp; drop page Builder." />
    <link rel="canonical" href="index.html" />
    <link rel="next" href="page/2.html" />
    <meta property="og:locale" content="en_US" />
    <meta property="og:type" content="website" />
    <meta property="og:title" content="Drag &amp; Drop WordPress Themes &bull; Themify" />
    <meta property="og:description" content="Create responsive &amp; mobile friendly WordPress sites with the best drag &amp; drop page Builder." />
    <meta property="og:url" content="https://themify.me" />
    <meta property="og:site_name" content="Themify" />
    <meta name="twitter:card" content="summary" />
    <meta name="twitter:description" content="Create responsive &amp; mobile friendly WordPress sites with the best drag &amp; drop page Builder." />
    <meta name="twitter:title" content="Drag &amp; Drop WordPress Themes &bull; Themify" />
    <meta name="twitter:domain" content="Themify" />
    <script type='application/ld+json'>{"@context":"http:\/\/schema.org","@type":"WebSite","url":"https:\/\/themify.me\/","name":"Themify","potentialAction":{"@type":"SearchAction","target":"https:\/\/themify.me\/?s={search_term_string}","query-input":"required name=search_term_string"}}</script>
    <!-- / Yoast SEO plugin. -->

    <script type="text/javascript">
        window._wpemojiSettings = { "baseUrl": "http:\/\/s.w.org\/images\/core\/emoji\/72x72\/", "ext": ".png", "source": { "concatemoji": "http:\/\/themify.me\/wp-includes\/js\/wp-emoji-release.min.js?ver=4.3" } };
        !function (a, b, c) { function d(a) { var c = b.createElement("canvas"), d = c.getContext && c.getContext("2d"); return d && d.fillText ? (d.textBaseline = "top", d.font = "600 32px Arial", "flag" === a ? (d.fillText(String.fromCharCode(55356, 56812, 55356, 56807), 0, 0), c.toDataURL().length > 3e3) : (d.fillText(String.fromCharCode(55357, 56835), 0, 0), 0 !== d.getImageData(16, 16, 1, 1).data[0])) : !1 } function e(a) { var c = b.createElement("script"); c.src = a, c.type = "text/javascript", b.getElementsByTagName("head")[0].appendChild(c) } var f, g; c.supports = { simple: d("simple"), flag: d("flag") }, c.DOMReady = !1, c.readyCallback = function () { c.DOMReady = !0 }, c.supports.simple && c.supports.flag || (g = function () { c.readyCallback() }, b.addEventListener ? (b.addEventListener("DOMContentLoaded", g, !1), a.addEventListener("load", g, !1)) : (a.attachEvent("onload", g), b.attachEvent("onreadystatechange", function () { "complete" === b.readyState && c.readyCallback() })), f = c.source || {}, f.concatemoji ? e(f.concatemoji) : f.wpemoji && f.twemoji && (e(f.twemoji), e(f.wpemoji))) }(window, document, window._wpemojiSettings);
		</script>
    <style type="text/css">
        img.wp-smiley,
        img.emoji {
            display: inline !important;
            border: none !important;
            box-shadow: none !important;
            height: 1em !important;
            width: 1em !important;
            margin: 0 .07em !important;
            vertical-align: -0.1em !important;
            background: none !important;
            padding: 0 !important;
        }
    </style>




    <link rel='stylesheet' href='layout_vertical01style/bbpresse4d2.css?ver=2.5.8-5815' type='text/css' media='screen' />
    <link rel='stylesheet' href='layout_vertical01style/styles3a05.css?ver=4.2.2' type='text/css' media='all' />
    <link rel='stylesheet' href='layout_vertical01style/fvch-styles4963.css?ver=1.1' type='text/css' media='all' />
    <link rel='stylesheet' href='layout_vertical01style/download-cssac05.css?ver=1.65' type='text/css' media='all' />
    <script type='text/javascript' src='layout_vertical01style/jqueryc1d8.js?ver=1.11.3'></script>
    <script type='text/javascript' src='layout_vertical01style/jquery-migrate.min1576.js?ver=1.2.1'></script>
    <script type='text/javascript' src='layout_vertical01style/jquery.validated7b7.js?ver=4.3'></script>
    <script type='text/javascript' src='layout_vertical01style/shortcoded7b7.js?ver=4.3'></script>
    <script type='text/javascript' src='layout_vertical01style/aweberd7b7.js?ver=4.3'></script>
    <script type='text/javascript' id="omapi-script" src='layout_vertical01style/api509e.js?ver=1.1.3.3'></script>
    <meta name="generator" content="WordPress 4.3" />
    <img src="layout_vertical01style/image/notepaper.png" />

    <style type="text/css">
        .fvch-codeblock {
            background: url(layout_vertical01style/image/notepaper.png) top left repeat;
        }

            .fvch-codeblock pre, .fvch-line-numbers pre {
                background: url(layout_vertical01style/image/notepaper.png) top left repeat;
                line-height: 18px;
                font-family: 'Menlo', 'Courier New', Courier, monospace;
                font-size: 11px;
            }

        .fvch-line-numbers pre {
            background: #e2e2e2;
        }
    </style>
    <meta name="generator" content="FV Code Highlighter" />

    <!-- Google Analytics -->
    <script type="text/javascript">

        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-17956277-1']);
        _gaq.push(['_trackPageview']);

        (function () {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();

	</script>




</head>
<body class="home blog animation-on development promo-bar-on">
    <form id="form1" runat="server">


        <div class="promo-bar-wrap closed init">
            <div class="promo-bar">
                <p><strong>New:</strong> <a href="ptb-addons/extra-fields.html">Extra Fields</a> addon for Post Type Builder and <a href="addons/slider-pro.html">Slider Pro</a> Builder addon</p>
            </div>
            <span class="close promo-toggle"></span>
        </div>


        <div id="pagewrap">

            <div id="headerwrap">

                <header id="header" class="pagewidth">
                    <a id="themify-logo" href="index.html">
                        <img src="layout_vertical01style/image/themify-logo.png" alt="Themify Home"></a>
                    <span id="menu-icon" href="#sidr"></span>
                    <nav id="sidr" class="sidr">
                        <ul id="main-nav" class="clearfix main-nav">
                            <li id="menu-item-7034" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children menu-item-7034"><a href="themes.html">Themes</a>
                                <ul class="sub-menu">
                                    <li id="menu-item-7040" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-7040"><a href="themes.html">All Themes</a></li>
                                    <li id="menu-item-43277" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-43277"><a href="pricing.html">Pricing</a></li>
                                    <li id="menu-item-7043" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-7043"><a href="features.html">Features</a></li>
                                    <li id="menu-item-7036" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-7036"><a href="widgets.html">Widgets</a></li>
                                </ul>
                            </li>
                            <li id="menu-item-8197" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-8197"><a href="#">Plugins</a>
                                <ul class="sub-menu">
                                    <li id="menu-item-75028" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-75028"><a href="post-type-builder.html">Post Type Builder</a></li>
                                    <li id="menu-item-7035" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-7035"><a href="builder.html">Themify Builder</a></li>
                                    <li id="menu-item-10096" class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-10096"><a href="addons.html">Builder Addons</a></li>
                                    <li id="menu-item-48277" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-48277"><a href="tiles-plugin.html">Tiles Plugin</a></li>
                                    <li id="menu-item-8100" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-8100"><a href="announcement-bar.html">Announcement Bar</a></li>
                                    <li id="menu-item-8148" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-8148"><a href="conditional-menus.html">Conditional Menus</a></li>
                                </ul>
                            </li>
                            <li id="menu-item-7046" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-7046"><a href="club.html">Club</a></li>
                            <li id="menu-item-77160" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-77160"><a href="http://themifyflow.com/">Flow</a></li>
                            <li id="menu-item-89414" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-89414"><a href="themify-icons.html">Icons</a></li>
                            <li id="menu-item-7037" class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-7037"><a href="blog.html">Blog</a></li>
                            <li id="menu-item-7029" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-7029"><a href="contact.html">Contact</a></li>
                            <li id="menu-item-7039" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-7039"><a href="#">Members</a>
                                <ul class="sub-menu">
                                    <li id="menu-item-7041" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-7041"><a href="member/index.html">Member Area</a></li>
                                    <li id="menu-item-7072" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-7072"><a href="forum.html">Support Forums</a></li>
                                    <li id="menu-item-7030" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-7030"><a href="docs.html">Documentation</a></li>
                                    <li id="menu-item-7027" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-7027"><a href="affiliates.html">Affiliates</a></li>
                                    <li id="menu-item-7026" class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-7026"><a href="showcase.html">User Showcase</a></li>
                                    <li id="menu-item-7042" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-7042"><a href="faq.html">Support FAQ</a></li>
                                </ul>
                            </li>
                        </ul>
                        <!-- /#main-nav -->
                        <a id="menu-icon-close" href="#sidr"></a>
                    </nav>
                </header>
                <!-- /#header -->
            </div>
            <!-- /#headerwrap -->

            <div id="body">
                <section class="section white">
                    <div class="pagewidth">

                        <h1>Premium WordPress Themes</h1>
                        <h2 class="large">Trusted by <strong>48,000+</strong> users, Themify themes &amp; plugins help you make beautiful responsive WordPress sites, faster and easier than ever before.</h2>
                        <ol class="grid3 theme-list fly-in clearfix">


                            <li id="post-60151" class="theme-post  post-60151 post type-post status-publish format-standard hentry category-corporate-themes category-ecommerce-themes category-featured-themes category-portfolio-themes category-responsive-themes category-themes">
                                <figure class="theme-image">
                                    <a href="themes/ultra.html">
                                        <img src="layout_vertical01style/image/product/ultra-thumb.jpg" alt="Ultra">
                                    </a>
                                </figure>
                                <div class="theme-info">
                                    <div class="theme-title">
                                        <h3><a href="themes/ultra.html">Ultra</a></h3>
                                        <a class="tag-button lightbox" href="demo/themes/ultra/index.html">demo
				</a>
                                    </div>
                                    <!-- /theme-title -->
                                    <div class="theme-excerpt">
                                        <p>The most powerful &#038; flexible WordPress theme by Themify.</p>
                                    </div>
                                    <!-- /theme-excerpt -->
                                </div>
                                <!-- /theme-info -->


                            </li>




                            <li id="post-38237" class="theme-post  post-38237 post type-post status-publish format-standard hentry category-blog-themes category-corporate-themes category-featured-themes category-portfolio-themes category-responsive-themes category-themes">
                                <figure class="theme-image">
                                    <a href="themes/landing.html">
                                        <img src="layout_vertical01style/image/product/landing-thumb.jpg" alt="Landing">
                                    </a>
                                </figure>
                                <div class="theme-info">
                                    <div class="theme-title">
                                        <h3><a href="themes/landing.html">Landing</a></h3>
                                        <a class="tag-button lightbox" href="demo/themes/landing/index.html">demo
				</a>
                                    </div>
                                    <!-- /theme-title -->
                                    <div class="theme-excerpt">
                                        <p>Design converting landing pages with drag &#038; drop Builder. Sample layouts provided.</p>
                                    </div>
                                    <!-- /theme-excerpt -->
                                </div>
                                <!-- /theme-info -->


                            </li>




                            <li id="post-21674" class="theme-post  post-21674 post type-post status-publish format-standard hentry category-blog-themes category-featured-themes category-portfolio-themes category-responsive-themes category-themes">
                                <figure class="theme-image">
                                    <a href="themes/stack.html">
                                        <img src="layout_vertical01style/image/product/stack-thumb.jpg" alt="Stack">
                                    </a>
                                </figure>
                                <div class="theme-info">
                                    <div class="theme-title">
                                        <h3><a href="themes/stack.html">Stack</a></h3>
                                        <a class="tag-button lightbox" href="demo/themes/stack/index.html">demo
				</a>
                                    </div>
                                    <!-- /theme-title -->
                                    <div class="theme-excerpt">
                                        <p>An elegant, minimal &#038; typography focused theme for blog, shop, and portfolio.</p>
                                    </div>
                                    <!-- /theme-excerpt -->
                                </div>
                                <!-- /theme-info -->


                            </li>




                            <li id="post-10193" class="theme-post  post-10193 post type-post status-publish format-standard hentry category-blog-themes category-corporate-themes category-featured-themes category-portfolio-themes category-responsive-themes category-themes">
                                <figure class="theme-image">
                                    <a href="themes/elegant.html">
                                        <img src="layout_vertical01style/image/product/elegant-thumb.jpg" alt="Elegant">
                                    </a>
                                </figure>
                                <div class="theme-info">
                                    <div class="theme-title">
                                        <h3><a href="themes/elegant.html">Elegant</a></h3>
                                        <a class="tag-button lightbox" href="demo/themes/elegant/index.html">demo
				</a>
                                    </div>
                                    <!-- /theme-title -->
                                    <div class="theme-excerpt">
                                        <p>An elegant, minimal &#038; typography focused theme for blog, shop, and portfolio.</p>
                                    </div>
                                    <!-- /theme-excerpt -->
                                </div>
                                <!-- /theme-info -->


                            </li>




                            <li id="post-9668" class="theme-post  post-9668 post type-post status-publish format-standard hentry category-corporate-themes category-ecommerce-themes category-featured-themes category-portfolio-themes category-responsive-themes category-themes">
                                <figure class="theme-image">
                                    <a href="themes/corporate.html">
                                        <img src="layout_vertical01style/image/product/corporate-thumb.jpg" alt="Corporate">
                                    </a>
                                </figure>
                                <div class="theme-info">
                                    <div class="theme-title">
                                        <h3><a href="themes/corporate.html">Corporate</a></h3>
                                        <a class="tag-button lightbox" href="demo/themes/corporate/index.html">demo
				</a>
                                    </div>
                                    <!-- /theme-title -->
                                    <div class="theme-excerpt">
                                        <p>A professional-looking multi-purpose theme that is based from our very own Themify.me site.</p>
                                    </div>
                                    <!-- /theme-excerpt -->
                                </div>
                                <!-- /theme-info -->


                            </li>




                            <li id="post-8491" class="theme-post  post-8491 post type-post status-publish format-standard hentry category-featured-themes category-multimedia-themes category-portfolio-themes category-responsive-themes category-themes">
                                <figure class="theme-image">
                                    <a href="themes/music.html">
                                        <img src="layout_vertical01style/image/product/music-thumb.jpg" alt="Music">
                                    </a>
                                </figure>
                                <div class="theme-info">
                                    <div class="theme-title">
                                        <h3><a href="themes/music.html">Music</a></h3>
                                        <a class="tag-button lightbox" href="demo/themes/music/index.html">demo
				</a>
                                    </div>
                                    <!-- /theme-title -->
                                    <div class="theme-excerpt">
                                        <p>Responsive &#038; retina-ready theme built for artists, events, portfolios, photographers, and even app sites.</p>
                                    </div>
                                    <!-- /theme-excerpt -->
                                </div>
                                <!-- /theme-info -->


                            </li>




                            <li id="post-7773" class="theme-post  post-7773 post type-post status-publish format-standard hentry category-featured-themes category-multimedia-themes category-responsive-themes category-restaurant-themes category-themes">
                                <figure class="theme-image">
                                    <a href="themes/event.html">
                                        <img src="layout_vertical01style/image/product/event-thumb.jpg" alt="Event">
                                    </a>
                                </figure>
                                <div class="theme-info">
                                    <div class="theme-title">
                                        <h3><a href="themes/event.html">Event</a></h3>
                                        <a class="tag-button lightbox" href="demo/themes/event/index.html">demo
				</a>
                                    </div>
                                    <!-- /theme-title -->
                                    <div class="theme-excerpt">
                                        <p>Fluid, responsive &amp; retina ready WordPress theme for bands, nightclubs, restaurants, bars...</p>
                                    </div>
                                    <!-- /theme-excerpt -->
                                </div>
                                <!-- /theme-info -->


                            </li>




                            <li id="post-6699" class="theme-post  post-6699 post type-post status-publish format-standard hentry category-corporate-themes category-featured-themes category-portfolio-themes category-responsive-themes category-themes">
                                <figure class="theme-image">
                                    <a href="themes/fullpane.html">
                                        <img src="layout_vertical01style/image/product/fullpane-thumb.jpg" alt="Fullpane">
                                    </a>
                                </figure>
                                <div class="theme-info">
                                    <div class="theme-title">
                                        <h3><a href="themes/fullpane.html">Fullpane</a></h3>
                                        <a class="tag-button lightbox" href="demo/themes/fullpane/index.html">demo
				</a>
                                    </div>
                                    <!-- /theme-title -->
                                    <div class="theme-excerpt">
                                        <p>Responsive &amp; retina ready WordPress theme with full section scrolling like the iPhone 5C and JOBS movie site.</p>
                                    </div>
                                    <!-- /theme-excerpt -->
                                </div>
                                <!-- /theme-info -->


                            </li>




                            <li id="post-4724" class="theme-post  post-4724 post type-post status-publish format-standard hentry category-blog-themes category-corporate-themes category-featured-themes category-portfolio-themes category-responsive-themes category-themes">
                                <figure class="theme-image">
                                    <a href="themes/parallax.html">
                                        <img src="layout_vertical01style/image/product/parallax-thumb.jpg" alt="Parallax">
                                    </a>
                                </figure>
                                <div class="theme-info">
                                    <div class="theme-title">
                                        <h3><a href="themes/parallax.html">Parallax</a></h3>
                                        <a class="tag-button lightbox" href="demo/themes/parallax/index.html">demo
				</a>
                                    </div>
                                    <!-- /theme-title -->
                                    <div class="theme-excerpt">
                                        <p>Parallax scrolling with fly-in animation single-page theme for business and portfolio.</p>
                                    </div>
                                    <!-- /theme-excerpt -->
                                </div>
                                <!-- /theme-info -->


                            </li>

                        </ol>
                        <!-- /theme-list -->
                        <div class="cta-box clearfix">
                            <span class="ribbon"></span>
                            <div class="cta-content">
                                <h3>Get All Themes <span>for $79</span></h3>
                                <p>Join Theme Club to access all themes</p>
                            </div>
                            <p><a href="club.html" class="button red">More Details</a></p>
                        </div>
                        <!-- /cta-box -->
                        <ol class="grid3 theme-list clearfix">
                        </ol>
                        <!-- /showcase-list -->

                    </div>
                    <!-- /pagewidth -->
                </section>
                <!-- /section -->

                <section class="section light-blue">
                    <div class="pagewidth">
                        <h1>Drag &amp; Drop Builder</h1>
                        <h2>Every Themify theme is packed with the best-in-class drag &amp; drop Builder. With Themify Builder, you can create any kind of layout with live preview on the frontend. It comes with many cool effects like parallax scrolling, background video, animations, and more!</h2>

                        <div style="width: 890px; margin: 1em auto 80px; max-width: 100%;">
                            <div class="post-video">
                                <iframe src="http://www.youtube.com/embed/_AsoMMYqf_g?rel=0" width="853" height="480" frameborder="0" allowfullscreen="allowfullscreen"></iframe>
                            </div>
                        </div>

                        <ul class="grid3 slide-up clearfix animated circle-video">
                            <li class="animate-up">
                                <div class="post-image">
                                    <a href="https://www.youtube.com/watch?v=Vm3gDSxsN-g" title="Play Customize Panel" class="lightbox">
                                        <img src="layout_vertical01style/image/customize-panel-thumb.png" alt="Customize Panel">
                                        <span class="fa fa-play"></span>
                                    </a>
                                </div>
                                <div class="post-content">
                                    <h4>Customize Panel</h4>
                                    <p>Style almost every element of the theme from header to footer. Just point and select, and see it live on the preview. No CSS coding required.</p>
                                </div>
                            </li>
                            <li class="animate-up">
                                <div class="post-image">
                                    <a href="https://www.youtube.com/watch?v=fKP1QnFbVVs" title="Play Demo Import" class="lightbox">
                                        <img src="layout_vertical01style/image/demo-import-thumb.png" alt="Demo Import">
                                        <span class="fa fa-play"></span>
                                    </a>
                                </div>
                                <div class="post-content">
                                    <h4>Demo Import</h4>
                                    <p>Like what you see on our demo? Quickly replicate your site like our demo setup (it is erasable). Then you just need to replace the images and text. All done!</p>
                                </div>
                            </li>
                            <li class="animate-up">
                                <div class="post-image">
                                    <a href="https://www.youtube.com/watch?v=Va7HJZJ8Fb4" title="Play Hook Content" class="lightbox">
                                        <img src="layout_vertical01style/image/hook-content-thumb.png" alt="Hook Content">
                                        <span class="fa fa-play"></span>
                                    </a>
                                </div>
                                <div class="post-content">
                                    <h4>Hook Content</h4>
                                    <p>Dynamically display content and banner ads anywhere on your site without having to edit any template file, post or page.</p>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <!-- /pagewidth -->
                </section>
                <!-- /section -->

                <section class="section purple">
                    <div class="pagewidth">
                        <h1>What Can You Build?</h1>
                        <h2>Below are some of the WordPress sites created by our members using Themify Themes.</h2>

                        <div id="showcase-slider" class="slider">
                            <ul class="slides clearfix">


                                <li class="slide">
                                    <div class="slide-wrapper">
                                        <figure class="slide-image">
                                            <a href="http://verniceklier.com/" rel="nofollow" class="lightbox">
                                                <img src="layout_vertical01style/image/product/vernice-killer.jpg" />
                                            </a>
                                        </figure>
                                        <div class="slide-meta">
                                            <a href="http://verniceklier.com/" rel="nofollow" class="lightbox">Vernice Killer</a>
                                            based on <a href="themes/Parallax/index.html" class="based-on">Parallax</a> 					<i>----</i> <span>by</span> Rob Sitbon 			
                                        </div>
                                        <div class="slide-content">
                                            <p>Themify themes are innovative, practical and even fun to use! My clients (and their clients…) are thrilled from the results, and the Themify support team are always there for you.</p>
                                        </div>
                                    </div>
                                </li>



                                <li class="slide">
                                    <div class="slide-wrapper">
                                        <figure class="slide-image">
                                            <a href="http://www.attainhousing.org/" rel="nofollow" class="lightbox">
                                                <img src="layout_vertical01style/image/product/attain-housing.jpg" />
                                            </a>
                                        </figure>
                                        <div class="slide-meta">
                                            <a href="http://www.attainhousing.org/" rel="nofollow" class="lightbox">Attain Housing</a>
                                            based on <a href="themes/Bold/index.html" class="based-on">Bold</a> 					<i>----</i> <span>by</span> Robin Stark 			
                                        </div>
                                        <div class="slide-content">
                                            <p>I don't even like to use other themes anymore. No builder? No layout parts? No hook content? No, thank you. I only use Themify now.</p>
                                        </div>
                                    </div>
                                </li>



                                <li class="slide">
                                    <div class="slide-wrapper">
                                        <figure class="slide-image">
                                            <a href="http://craftymcfangirl.com/home/" rel="nofollow" class="lightbox">
                                                <img src="layout_vertical01style/image/product/crafty-mcfangirl.jpg" />
                                            </a>
                                        </figure>
                                        <div class="slide-meta">
                                            <a href="http://craftymcfangirl.com/home/" rel="nofollow" class="lightbox">Crafty McFangirl</a>
                                            based on <a href="themes/Responz/index.html" class="based-on">Responz</a> 					<i>----</i> <span>by</span> Amy Alexander 			
                                        </div>
                                        <div class="slide-content">
                                            <p>I chose Themify's Rezponz theme for my site because of it's clean design, and how easy it is to set up for a web novice like myself.  The slider is engaging and I love the way my site looks on my desktop, laptop, tablet and smart phone. A great responsive theme!</p>
                                        </div>
                                    </div>
                                </li>



                                <li class="slide">
                                    <div class="slide-wrapper">
                                        <figure class="slide-image">
                                            <a href="http://akioneam.com/" rel="nofollow" class="lightbox">
                                                <img src="layout_vertical01style/image/product/akioneam.jpg" />
                                            </a>
                                        </figure>
                                        <div class="slide-meta">
                                            <a href="http://akioneam.com/" rel="nofollow" class="lightbox">Akioneam</a>
                                            based on <a href="themes/Base/index.html" class="based-on">Base</a> 					<i>----</i> <span>by</span> Shatakshi K 			
                                        </div>
                                        <div class="slide-content">
                                            <p>Themify theme comes with tons of customization options, and it's also easy to grasp even for first timers. There is also, an added bonus of a helpful support team. Thank you.</p>
                                        </div>
                                    </div>
                                </li>



                                <li class="slide">
                                    <div class="slide-wrapper">
                                        <figure class="slide-image">
                                            <a href="http://www.gourmettage.com/" rel="nofollow" class="lightbox">
                                                <img src="layout_vertical01style/image/product/kuhlungsborn-kocht.jpg" />
                                            </a>
                                        </figure>
                                        <div class="slide-meta">
                                            <a href="http://www.gourmettage.com/" rel="nofollow" class="lightbox">Kuhlungsborn Kocht</a>
                                            based on <a href="themes/Event/index.html" class="based-on">Event</a> 					<i>----</i> <span>by</span> Martin Krause 			
                                        </div>
                                        <div class="slide-content">
                                            <p>We love using Themify for our websites. For the Gourmet-Days in Kühlungsborn it was the best choice to use the Event theme. Big pictures and pretty nice layouts fit perfectly with the photographs.</p>
                                        </div>
                                    </div>
                                </li>



                                <li class="slide">
                                    <div class="slide-wrapper">
                                        <figure class="slide-image">
                                            <a href="http://psycholog-norwegia.com/" rel="nofollow" class="lightbox">
                                                <img src="layout_vertical01style/image/product/psycholog-norwegia.jpg" />
                                            </a>
                                        </figure>
                                        <div class="slide-meta">
                                            <a href="http://psycholog-norwegia.com/" rel="nofollow" class="lightbox">Psycholog Norwegia</a>
                                            based on <a href="themes/Corporate/index.html" class="based-on">Corporate</a> 					<i>----</i> <span>by</span> Bartek 			
                                        </div>
                                        <div class="slide-content">
                                            <p>Themify is a powerfull tool that make my customers happy</p>
                                        </div>
                                    </div>
                                </li>


                                <!-- More Showcase -->
                                <li>
                                    <div class="slide-wrapper">
                                        <figure class="slide-image">
                                            <a href="showcase.html" title="More Showcase">
                                                <img src="layout_vertical01style/image/product/more-showcase-img.png" alt="More Showcase" />
                                            </a>
                                        </figure>
                                    </div>
                                </li>
                                <!-- /More Showcase -->
                            </ul>
                        </div>
                        <!-- /showcase-list -->

                    </div>
                    <!-- /pagewidth -->
                </section>
                <!-- /section -->

                <section class="section red">
                    <div class="pagewidth">
                        <h1>Pick a Theme Now</h1>
                        <h2>Fair Pricing. Great WordPress Themes. Awesome Support. 30 Day Money Back Guarantee!</h2>
                        <p class="center">
                            <a class="button white outline large" href="themes.html">Browse Themes</a>
                            <div class="arrorw-animated">
                                <span class="ti-arrow-up"></span>
                            </div>
                        </p>
                    </div>
                    <!-- /pagewidth -->
                </section>
                <!-- /section -->

                <section class="section yellow" id="newsletter">
                    <div class="pagewidth">

                        <ul class="grid2 clearfix">
                            <li class="boxed black">
                                <h3>Tweet &amp; Save 15%</h3>
                                <p>Tweet a message to @themify to get an instant 15% coupon which can be used on any purchase.</p>
                                <a class="button white" href="javascript:void(0);" onclick="window.open('http://twtqpon.com/themify-coupon/tweet', '_blank', 'width=800,height=600,scrollbars=yes,status=yes,resizable=yes,screenx=0,screeny=0,left=380,top=100');">Tweet Now</a>
                            </li>
                            <li class="boxed black">
                                <h3>Get a 20% Off Coupon Code Now!</h3>
                                <p>Subscribe to our Newsletter and receive a 20% discount on all Themify purchases excluding Lifetime Club.</p>
                                <link href="layout_vertical01style/classic-081711.css" rel="stylesheet" type="text/css">
                                <div class="mailchimp-signup" id="mc_embed_signup">
                                    <form action="http://themify.us2.list-manage.com/subscribe/post?u=03462cf158e86ea00590274ab&amp;id=0f2a95e5de" method="post" id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" class="validate" target="_blank" novalidate>
                                        <div id="mc_embed_signup_scroll">
                                            <div class="mc-field-group">
                                                <input type="email" value="" name="EMAIL" class="required email" id="mce-EMAIL" placeholder="Enter your email">
                                            </div>
                                            <div id="mce-responses" class="clear">
                                                <div class="response" id="mce-error-response" style="display: none"></div>
                                                <div class="response" id="mce-success-response" style="display: none"></div>
                                            </div>
                                            <div style="position: absolute; left: -5000px;">
                                                <input type="text" name="b_03462cf158e86ea00590274ab_0f2a95e5de" tabindex="-1" value="">
                                            </div>
                                            <div class="clear">
                                                <input type="submit" value="Subscribe" name="subscribe" id="mc-embedded-subscribe" class="button black">
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <script type="text/javascript" src="layout_vertical01style/mc-validate.js"></script>
                                <script type="text/javascript">(function ($) { window.fnames = new Array(); window.ftypes = new Array(); fnames[0] = "EMAIL"; ftypes[0] = "email"; fnames[1] = "FNAME"; ftypes[1] = "text"; fnames[2] = "LNAME"; ftypes[2] = "text"; fnames[3] = "MMERGE3"; ftypes[3] = "radio"; fnames[4] = "MMERGE4"; ftypes[4] = "text"; }(jQuery)); var $mcj = jQuery.noConflict(true);</script>
                            </li>
                        </ul>
                    </div>
                    <!-- /pagewidth -->
                </section>
                <!-- /section -->

            </div>
            <!-- /body -->

            <div id="footerwrap" class="purple animated-bg stopsticky">
                <footer id="footer" class="pagewidth">

                    <div class="back-top clearfix">
                        <div class="arrow-up">
                            <a href="#header"></a>
                            <span>Back to Top</span>
                        </div>
                    </div>

                    <div class="footer-logo-wrapper clearfix">
                        <div class="footer-logo"><a href="index.html">
                            <img src="layout_vertical01style/image/logo-white.png" alt="Themify Home"></a></div>
                        <p>
                            Powered by <a href="https://wordpress.org/">WordPress</a><br>
                            &copy;Themify.me 2015
                        </p>
                    </div>
                    <!-- /footer-logo-wrapper -->

                    <div class="social-share">

                        <div class="facebook-share sharrre" data-url="http://themify.me/" data-text="Check out Themify responsive themes"></div>

                        <div class="twitter-share sharrre" data-url="http://themify.me/" data-text="Check out Themify responsive themes"></div>

                        <div class="googleplus-share sharrre" data-url="http://themify.me/" data-text="Check out Themify responsive themes"></div>

                    </div>
                    <!-- /social-share -->

                    <div class="footer-menu-wrapper clearfix">

                        <div class="products">
                            <h6 class="menu-title">Products</h6>
                            <ul>
                                <li><a href="themes.html">Themes</a></li>
                                <li><a href="club.html">Club</a></li>
                                <li><a href="builder.html">Builder</a></li>
                                <li><a href="announcement-bar.html">Announcement</a></li>
                            </ul>
                        </div>
                        <!-- /products -->

                        <div class="info">
                            <h6 class="menu-title">Info</h6>
                            <ul>
                                <li><a href="pricing.html">Pricing</a></li>
                                <li><a href="terms.html">Terms</a></li>
                                <li><a href="affiliates.html">Affiliates</a></li>
                                <li><a href="blog.html">Blog</a></li>
                            </ul>
                        </div>
                        <!-- /info -->

                        <div class="support">
                            <h6 class="menu-title">Support</h6>
                            <ul>
                                <li><a href="docs.html">Documentation</a></li>
                                <li><a href="faq.html">FAQs</a></li>
                                <li><a href="forum.html">Forums</a></li>
                                <li><a href="contact.html">Contact</a></li>
                            </ul>
                        </div>
                        <!-- /support -->

                    </div>
                    <!-- /footer-menu-wrapper -->

                </footer>
                <!-- /#footer -->
            </div>
            <!-- /#footerwrap -->

        </div>
        <!-- /#pagewrap -->

        <!--[if lt IE 9]>
	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
	<script src="http://themify.me/wp-content/themes/themify-v3/js/respond.js"></script>
<![endif]-->

        <script type='text/javascript' src='layout_vertical01style/jquery3e5a.js?ver=1.10.2'></script>
        <script type='text/javascript' src='layout_vertical01style/image/product/jquery-migrate.min1576.js?ver=1.2.1'></script>

        <script type='text/javascript' src='layout_vertical01style/jquery.sidr.min4bf4.js?ver=1.0.3'></script>
        <script type='text/javascript' src='layout_vertical01style/jquery.sharrre.min4bf4.js?ver=1.0.3'></script>
        <script type='text/javascript' src='layout_vertical01style/carousel4bf4.js?ver=1.0.3'></script>
        <script type='text/javascript' src='layout_vertical01style/jquery.inview.min4bf4.js?ver=1.0.3'></script>
        <script type='text/javascript' src='layout_vertical01style/jquery.color4bf4.js?ver=1.0.3'></script>
        <script type='text/javascript' src='layout_vertical01style/jquery.magnific-popup.min4bf4.js?ver=1.0.3'></script>
        <script type='text/javascript' src='layout_vertical01style/jquery.jsticky4bf4.js?ver=1.0.3'></script>
        <script type='text/javascript' src='layout_vertical01style/jquery.nicescroll.min4bf4.js?ver=1.0.3'></script>
        <script type='text/javascript' src='layout_vertical01style/underscore.minc2d0.js?ver=1.4.4'></script>
        <script>
            /* <![CDATA[ */
            var themifyScript = { "ajax_nonce": "84c48d6c46", "ajax_url": "https://themify.me/wp-admin/admin-ajax.php", "sharrrephp": "https:\/\/themify.me\/wp-content\/themes\/themify-v2\/includes\/sharrre.php", "is_mobile": false };
            /* ]]> */
</script>
        <script type='text/javascript' src='layout_vertical01style/themify.script4bf4.js?ver=1.0.3'></script>

        <!-- This site is converting visitors into subscribers and customers with OptinMonster - http://optinmonster.com -->
        <div id="om-vzt6ovpcrkglnjob-holder"></div>
        <script>var vzt6ovpcrkglnjob, vzt6ovpcrkglnjob_poll = function () { var r = 0; return function (n, l) { clearInterval(r), r = setInterval(n, l) } }(); !function (e, t, n) { if (e.getElementById(n)) { vzt6ovpcrkglnjob_poll(function () { if (window['om_loaded']) { if (!vzt6ovpcrkglnjob) { vzt6ovpcrkglnjob = new OptinMonsterApp(); return vzt6ovpcrkglnjob.init({ u: "9682.192749", staging: 0 }); } } }, 25); return; } var d = false, o = e.createElement(t); o.id = n, o.src = "../a.optinmonster.com/app/js/api.min.js", o.onload = o.onreadystatechange = function () { if (!d) { if (!this.readyState || this.readyState === "loaded" || this.readyState === "complete") { try { d = om_loaded = true; vzt6ovpcrkglnjob = new OptinMonsterApp(); vzt6ovpcrkglnjob.init({ u: "9682.192749", staging: 0 }); o.onload = o.onreadystatechange = null; } catch (t) { } } } }; (document.getElementsByTagName("head")[0] || document.documentElement).appendChild(o) }(document, "script", "omapi-script");</script>
        <!-- / OptinMonster -->
        <script type='text/javascript' src='wp-content/plugins/contact-form-7/includes/js/jquery.form.mind03d.js?ver=3.51.0-2014.06.20'></script>
        <script type='text/javascript'>
            /* <![CDATA[ */
            var _wpcf7 = { "loaderUrl": "http:\/\/themify.me\/wp-content\/plugins\/contact-form-7\/images\/ajax-loader.gif", "sending": "Sending ...", "cached": "1" };
            /* ]]> */
</script>
        <script type='text/javascript' src='wp-content/plugins/contact-form-7/includes/js/scripts3a05.js?ver=4.2.2'></script>
        <script type="text/javascript">var omapi_localized = { ajax: 'https://themify.me/wp-admin/admin-ajax.php?optin-monster-ajax-route=1', nonce: '5cae41ce2b' };</script>
    </form>
</body>
</html>
