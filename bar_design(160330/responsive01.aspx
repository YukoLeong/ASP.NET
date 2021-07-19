<%@ Page Language="C#" AutoEventWireup="true" CodeFile="responsive01.aspx.cs" Inherits="responsive01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Temple University, Japan Campus</title>

    <%--responsive tool--%>
    <%--http://mmenu.frebsite.nl/examples.html--%>



    <meta name="description" content="Temple University, Japan Campus (TUJ), is the oldest and largest foreign university in Japan - located in Minami-Azabu.　In addition to its core undergraduate program, TUJ offers graduate programs in law, business, and education; an English-language preparation program; continuing education courses; and corporate education classes." />
    <meta property="fb:page_id" content="52396266310" />
    <meta name="author" content="Temple University, Japan Campus" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="shortcut icon" href="responsive01style/favicon.ico" />
    <link rel="apple-touch-icon-precomposed" href="responsive01style/img/apple-touch-icon.png" />
    <link rel="stylesheet" href="responsive01style/core.css" />
    <!--[if lt IE 9]>
  <link rel="stylesheet" href="responsive01style/ie.css" />
  <script src="responsive01style/html5shiv.js"></script>
  <![endif]-->
    <style>
        #slideshow {
            padding-bottom: 100%;
            margin-bottom: -100%;
            background: #000 url(responsive01style/img/top-wide.jpg) no-repeat top left;
            z-index: 10;
        }

        #main .action-buttons {
            background: #444 url(responsive01style/img/noise.png) repeat 0 0;
            -moz-border-radius: 8px;
            -webkit-border-radius: 8px;
            border-radius: 8px;
            padding: 11px 5px;
            margin-bottom: 12px;
        }

            #main .action-buttons ul {
                width: 100%;
                overflow: hidden;
                margin: 0;
                padding: 0;
            }

            #main .action-buttons li {
                float: left;
                margin: 0;
                padding: 0;
                list-style: none;
                width: 25%;
            }

            #main .action-buttons a {
                margin: 0 5px;
                display: block;
                text-align: center;
                font-family: Arial, Helvetica, sans-serif;
                font-size: 131%;
                font-weight: 500;
                color: #ffffff;
                padding: 10px;
                border-radius: 3px;
                -moz-border-radius: 3px;
                -webkit-border-radius: 3px;
            }

            #main .action-buttons li.btn-request-info a {
                background: #ef9413 url(responsive01style/img/noise.png) repeat 0 0;
                border: 1px solid #ef9413;
            }

                #main .action-buttons li.btn-request-info a:hover {
                    background: #ffb821 url(responsive01style/img/noise.png) repeat 0 0;
                    border: 1px solid #ffb821;
                }

            #main .action-buttons li.btn-info-sessions a {
                background: #a6b01e url(responsive01style/img/noise.png) repeat 0 0;
                border: 1px solid #a6b01e;
            }

                #main .action-buttons li.btn-info-sessions a:hover {
                    background: #c2ce20 url(responsive01style/img/noise.png) repeat 0 0;
                    border: 1px solid #c2ce20;
                }

            #main .action-buttons li.btn-admissions a {
                background: #a03047 url(responsive01style/img/noise.png) repeat 0 0;
                border: 1px solid #a03047;
            }

                #main .action-buttons li.btn-admissions a:hover {
                    background: #c92f4f url(responsive01style/img/noise.png) repeat 0 0;
                    border: 1px solid #c92f4f;
                }

            #main .action-buttons li.btn-contact a {
                background: #4b79be url(responsive01style/img/noise.png) repeat 0 0;
                border: 1px solid #4b79be;
            }

                #main .action-buttons li.btn-contact a:hover {
                    background: #5f97ea url(responsive01style/img/noise.png) repeat 0 0;
                    border: 1px solid #5f97ea;
                }

            #main .action-buttons a:hover {
                text-decoration: none;
            }

        #main .program-links {
            padding: 0;
            margin: 0 0 16px 0;
            background: #e5e0d0;
            width: auto;
            overflow: hidden;
        }

            #main .program-links h2 {
                float: left;
                font-size: 100%;
                font-family: sans-serif;
                padding: 9px 12px;
                margin: 0 2px 0 0;
                background: #aba284;
                color: #fff;
            }

            #main .program-links ul {
                width: auto;
                overflow: hidden;
                margin: 0;
                padding: 6px 6px 6px 10px;
                float: left;
            }

            #main .program-links li {
                float: left;
                list-style: none;
                margin: 0 16px 0 0;
                padding: 0 0 0 15px;
            }

        .program-links .li-spr {
            display: block;
            float: left;
            background: url(responsive01style/img/sprite.png) no-repeat;
            padding: 0 !important;
            width: 8px;
            height: 10px;
            margin: 5px 0 0 -13px;
            background-position: -71px -107px;
        }

        @media screen and (max-width: 1060px) {
            #main .program-links h2 {
                width: 100%;
                margin: 0 3px 3px 0;
            }

            #main .program-links li {
                padding: 0 0 3px 15px;
            }
        }

        @media screen and (max-width: 1024px) {
            #slideshow {
                background: #000 url(responsive01style/img/top-wide-1024.jpg) no-repeat top left;
            }
        }

        @media screen and (max-width: 900px) {
            #slideshow {
                background: #000 url(responsive01style/img/top-wide-900.jpg) no-repeat top left;
            }
        }

        @media screen and (max-width: 800px) {
            #slideshow {
                background: #000 url(responsive01style/img/top-wide-800.jpg) no-repeat top left;
            }

            #main .action-buttons a {
                font-size: 108%;
            }
        }

        @media screen and (max-width: 600px) {
            #slideshow {
                background: #000 url(responsive01style/img/top-wide-600.jpg) no-repeat top left;
            }

            #main .action-buttons li {
                width: 50%;
            }

            #main .action-buttons a {
                font-size: 116%;
            }

            #main .action-buttons li.btn-request-info, #main .action-buttons li.btn-info-sessions {
                margin-bottom: 8px;
            }
        }

        @media screen and (max-width: 480px) {
            #slideshow {
                display: none;
            }

            #main .action-buttons li {
                width: 100%;
            }

            #main .action-buttons a {
                font-size: 93%;
                font-weight: 600;
                padding: 6px;
            }

            #main .action-buttons li.btn-admissions {
                margin-bottom: 8px;
            }

            .program-links .li-spr {
                margin: 6px 0 0 -13px;
            }
        }

        @media only screen and (-webkit-min-device-pixel-ratio: 2), only screen and (min-device-pixel-ratio: 2) {
            .program-links .li-spr {
                background-image: url(responsive01style/img/sprite2x.png);
                background-size: 285px 300px;
            }
        }
    </style>


    <script src="responsive01style/jquery.min.js"></script>
    <script>window.jQuery || document.write("<script src='responsive01style/jquery-1.6.1.min.js'>\x3C/script>")</script>
    <script src="responsive01style/script.js"></script>
    <script>
        $(document).ready(function () {
            if (document.documentElement.clientWidth >= 480) {
                setImg();

                var preloadArr = new Array();
                var i;

                /* preload images */
                for (i = 0; i < imgArr.length; i++) {
                    preloadArr[i] = new Image();
                    preloadArr[i].src = imgArr[i];
                }

                var currImg = 1;
                var intID = setInterval(changeImg, 6000);
            }

            /* image rotator */
            function changeImg() {
                $('#slideshow').stop(true, true).animate({ opacity: 0.3 }, 200, function () {
                    $(this).css('background', '#000 url(' + preloadArr[currImg++ % preloadArr.length].src + ') no-repeat top left');
                }).animate({ opacity: 1 }, 200);
            }

            /* image setter */
            function setImg() {
                if (document.documentElement.clientWidth <= 1024 && document.documentElement.clientWidth > 900) {
                    imgArr = [ // relative paths of images
                      'responsive01style/img/top-wide-1024.jpg',
                      'responsive01style/img/top-grad-1024.jpg',
                      'responsive01style/img/top-inter-1024.jpg'
                    ];
                } else if (document.documentElement.clientWidth <= 900 && document.documentElement.clientWidth > 800) {
                    imgArr = [ // relative paths of images
                      'responsive01style/img/top-wide-900.jpg',
                      'responsive01style/img/top-grad-900.jpg',
                      'responsive01style/img/top-inter-900.jpg'
                    ];
                } else if (document.documentElement.clientWidth <= 800 && document.documentElement.clientWidth > 600) {
                    imgArr = [ // relative paths of images
                      'responsive01style/img/top-wide-800.jpg',
                      'responsive01style/img/top-grad-800.jpg',
                      'responsive01style/img/top-inter-800.jpg'
                    ];
                } else if (document.documentElement.clientWidth <= 600) {
                    imgArr = [ // relative paths of images
                      'responsive01style/img/top-wide-600.jpg',
                      'responsive01style/img/top-grad-600.jpg',
                      'responsive01style/img/top-inter-600.jpg'
                    ];
                } else {
                    imgArr = [ // relative paths of images
                      'responsive01style/img/top-wide.jpg',
                      'responsive01style/img/top-grad.jpg',
                      'responsive01style/img/top-inter.jpg'
                    ];
                }
            }
        });
</script>
    <!--[if lt IE 9 ]>
<script src="/js/libs/respond.min.js"></script>
<![endif]-->
    <!--[if lt IE 7 ]>
  <script src="/js/libs/minmax-1.0.js"></script>
  <script src="/js/libs/dd_belatedpng.js"></script>
  <script>DD_belatedPNG.fix("img, .png_bg"); // Fix any <img> or .png_bg bg-images. Also, please read goo.gl/mZiyb </script>
<![endif]-->
    <!--include virtual="/ssi/sms-scripts.html"-->
    <script>
        var _gaq = [["_setAccount", "UA-669453-1"], ["_trackPageview"]];
        (function (d, t) {
            var g = d.createElement(t), s = d.getElementsByTagName(t)[0]; g.async = 1;
            g.src = ("https:" == location.protocol ? "//ssl" : "//www") + ".google-analytics.com/ga.js";
            s.parentNode.insertBefore(g, s)
        }(document, "script"));
</script>



</head>
<body class="home">
    <form id="form1" runat="server">
        <div id="top">
            <header id="globalheader">
                <nav id="tbar">
                    <div class="content">
                        <ul class="tbar-left">
                            <li id="ubutton"><a href="#" class="utop">&nbsp;</a>
                                <ul id="umenu">
                                    <li><a href="index.html">University Top</a></li>
                                    <li class="mob-only"><a href="about/index.html">About Temple</a></li>
                                    <li class="mob-only"><a href="admissions/index.html">Admissions</a></li>
                                    <li class="mob-only"><a href="programs/index.html">Programs</a></li>
                                    <li class="mob-only"><a href="services/index.html">Services &amp; Facilities</a></li>
                                    <li class="mob-only"><a href="news/index.html">News</a></li>
                                    <li class="mob-only"><a href="events/index.html">Events</a></li>
                                    <li class="no-600"><a href="ug/index.html">Undergraduate</a></li>
                                    <li class="no-600"><a href="tesol/index.html">TESOL</a></li>
                                    <li class="no-600"><a href="mba/index.html">Executive MBA Program</a></li>
                                    <li class="no-600"><a href="law/index.html">Law School</a></li>
                                    <li class="no-600"><a href="aep/index.html">Academic English Program</a></li>
                                    <li class="no-600"><a href="cont-ed/index.html">Continuing Education</a></li>
                                    <li class="no-600"><a href="cep/index.html">Corporate Education</a></li>
                                </ul>
                        </ul>
                        <ul class="tbar-right">
                            <li class="tb-maps"><a href="maps/index.html">Maps<span class="mob-no"> &amp; Directions</span></a></li>
                            <li class="tb-contact"><a href="contact/index.html">Contact</a></li>
                            <li class="tb-lang"><a href="jp/index.html">日本語</a></li>
                            <li id="ibutton"><a href="#">&nbsp;</a><ul id="imenu">
                                <li class="tb-lang only-360"><a href="jp/index.html">日本語</a></li>
                                <li><a href="current-students.html">Students</a></li>
                                <li><a href="alumni.html">Alumni</a></li>
                                <li><a href="faculty-staff.html">Faculty &amp; Staff</a></li>
                                <li><a href="https://tumail.temple.edu/" target="_blank">TUmail<i class="spr new-win"></i></a></li>
                                <li><a href="https://tuportal3.temple.edu/" target="_blank">TUportal<i class="spr new-win"></i></a></li>
                                <li><a href="https://blackboard.temple.edu/" target="_blank">Blackboard<i class="spr new-win"></i></a></li>
                                <li><a href="library/index.html">Library Website</a></li>
                            </ul>
                            </li>
                        </ul>
                    </div>
                </nav>
                <div class="content">
                    <div id="sechead">
                        <h1><a href="index.html" class="spr tuj-logo">Temple University, Japan Campus</a></h1>
                        <nav id="actionnavi">
                            <div id="search">
                                <form action="http://www.tuj.ac.jp/search.html">
                                    <input type="text" name="q" value="Search TUJ website" id="searchbox" /><input type="submit" id="searchbutton" value="SEARCH" />
                                </form>
                            </div>
                            <ul>
                                <li class="brochure"><a href="request-info.html" onclick="_gaq.push(['_trackEvent', 'Header', 'Click', 'Request Info (Header)']);"><i class="spr arr-action"></i>Request Info</a></li>
                                <li class="session"><a href="info-sessions.html" onclick="_gaq.push(['_trackEvent', 'Header', 'Click', 'Info Sessions (Header)']);"><i class="spr arr-action"></i>Info Sessions</a></li>
                                <!--<li class="apply"><a href="/apply.html">Apply</a></li>-->
                            </ul>
                        </nav>
                    </div>
                </div>
                <div class="content">
                    <nav id="globalnavi" class="grid grid-12 first">
                        <ul class="sec-top">
                            <!--
        -->
                            <li><a href="index.html">University Top</a></li>
                            <!--
      -->
                        </ul>
                        <ul class="mainlinks">
                            <!--
        -->
                            <li class="about"><a href="about/index.html">About Temple</a></li>
                            <!--
        -->
                            <li class="admissions"><a href="admissions/index.html">Admissions</a></li>
                            <!--
        -->
                            <li class="programs"><a href="programs/index.html">Programs</a></li>
                            <!--
        -->
                            <li class="services"><a href="services/index.html">Services<span class="mob-no"> &amp; Facilities</span></a></li>
                            <!--
        -->
                            <li class="news"><a href="news/index.html">News</a></li>
                            <!--
        -->
                            <li class="events"><a href="events/index.html" class="last">Events</a></li>
                            <!--
      -->
                        </ul>
                    </nav>
                </div>
            </header>
            <div id="main" role="main">
                <div class="content bm-10px">
                    <div class="grid grid-12 first">
                        <div id="slideshow"></div>
                        <ul class="link-audience png_bg">
                            <li class="first"><a href="current-students.html">CURRENT STUDENTS<i class="spr arr-audience"></i></a></li>
                            <li><a href="future-students.html">PROSPECTIVE STUDENTS<i class="spr arr-audience"></i></a></li>
                            <li><a href="parents.html">PARENTS<i class="spr arr-audience"></i></a></li>
                            <li><a href="alumni.html">ALUMNI<i class="spr arr-audience"></i></a></li>
                            <li><a href="corporations.html">CORPORATIONS &amp; EMPLOYERS<i class="spr arr-audience"></i></a></li>
                            <li><a href="faculty-staff.html">FACULTY &amp; STAFF<i class="spr arr-audience"></i></a></li>
                        </ul>
                    </div>
                </div>
                <!--/
  <div class="content">
    <div class="grid grid-12 first announcements">
      <h1>ANNOUNCEMENTS</h1>
      <ul>
        <li><a href="/announcements/2015/"> (Posted on May 1)</a></li>
      </ul>
    </div>
  </div>
  /-->
                <div class="content">
                    <div class="action-buttons">
                        <ul>
                            <li class="btn-request-info"><a href="request-info.html" onclick="_gaq.push(['_trackEvent', 'TUJ-Top', 'Click', 'Brochure Request']);">Brochure Request</a></li>
                            <li class="btn-info-sessions" onclick="_gaq.push(['_trackEvent', 'TUJ-Top', 'Click', 'Information Sessions']);"><a href="info-sessions.html">Information Sessions</a></li>
                            <li class="btn-admissions"><a href="admissions/index.html" onclick="_gaq.push(['_trackEvent', 'TUJ-Top', 'Click', 'Apply for Admissions']);">Apply for Admissions</a></li>
                            <li class="btn-contact"><a href="contact/index.html" onclick="_gaq.push(['_trackEvent', 'TUJ-Top', 'Click', 'Contact Us']);">Contact Us</a></li>
                        </ul>
                    </div>
                    <div class="program-links">
                        <h2>Programs:</h2>
                        <ul>
                            <li><i class="li-spr"></i><a href="ug/index.html" onclick="_gaq.push(['_trackEvent', 'TUJ-Top', 'Click', 'Undergraduate']);">Undergraduate</a></li>
                            <li><i class="li-spr"></i><a href="tesol/index.html" onclick="_gaq.push(['_trackEvent', 'TUJ-Top', 'Click', 'TESOL']);">TESOL</a></li>
                            <li><i class="li-spr"></i><a href="mba/index.html" onclick="_gaq.push(['_trackEvent', 'TUJ-Top', 'Click', 'Executive MBA']);">Executive MBA</a></li>
                            <li><i class="li-spr"></i><a href="law/index.html" onclick="_gaq.push(['_trackEvent', 'TUJ-Top', 'Click', 'Law School']);">Law School</a></li>
                            <li><i class="li-spr"></i><a href="aep/index.html" onclick="_gaq.push(['_trackEvent', 'TUJ-Top', 'Click', 'Academic English']);">Academic English</a></li>
                            <li><i class="li-spr"></i><a href="cont-ed/index.html" onclick="_gaq.push(['_trackEvent', 'TUJ-Top', 'Click', 'Continuing Education']);">Continuing Education</a></li>
                            <li><i class="li-spr"></i><a href="cep/index.html" onclick="_gaq.push(['_trackEvent', 'TUJ-Top', 'Click', 'Corporate Education']);">Corporate Education</a></li>
                        </ul>
                    </div>
                </div>
                <div class="content featured">
                    <aside class="grid grid-3 first">
                        <h1 class="h-sm-dark bm-none">Graduation</h1>
                        <figure class="aligncenter">
                            <a href="graduation2015/index.html">
                                <img src="responsive01style/img/top-feat-graduation-2015.png" alt="TUJ 2015 Graduation Ceremony - Sunday, June 7 at Shinagawa Prince Hotel" /></a>
                        </figure>
                    </aside>
                    <aside class="grid grid-3">
                        <h1 class="h-sm-dark bm-none">Law School</h1>
                        <figure class="aligncenter">
                            <a href="law/events/2015/0611.html">
                                <img src="responsive01style/img/top-feat-law-cle-20150611.jpg" alt="2-credit CLE Event: Limits/Challenges of the Current Doctrine on Contract Formation Online & Consumer Protection in US & Europe" /></a>
                        </figure>
                    </aside>
                    <aside class="grid grid-3 second-row">
                        <h1 class="h-sm-dark bm-none">Undergraduate</h1>
                        <figure class="aligncenter">
                            <a href="ug/info-sessions.html">
                                <img src="responsive01style/img/top-feat-ug-info-session-20150614.png" alt="Undergraduate Program Information Session on June 14" /></a>
                        </figure>
                    </aside>
                    <aside class="grid grid-3">
                        <h1 class="h-sm-dark bm-none">Executive MBA</h1>
                        <figure class="aligncenter">
                            <a href="mba/info-sessions.html">
                                <img src="responsive01style/img/top-feat-mba-info-session-20150620.png" alt="Executive MBA Info Session on August 9, 2014" /></a>
                        </figure>
                    </aside>
                </div>
                <!-- Share Buttons -->
                <!--include virtual="/ssi/share.html"-->
            </div>
            <nav id="bcnavi">
                <div class="content">
                    <div class="grid grid-12 first">
                        <h1>You are here:</h1>
                        <ul>
                            <li class="bc-last bc-top">University Top</li>
                        </ul>
                    </div>
                </div>
            </nav>
            <footer id="globalfooter">
                <div class="content">
                    <div class="grid grid-4 first grid-reset" itemscope itemtype="http://schema.org/CollegeOrUniversity">
                        <h1>Contact Us</h1>
                        <p class="bm-none"><span itemprop="name">Temple University, Japan Campus</span></p>
                        <p itemprop="address" itemscope itemtype="PostalAddress">
                            <span itemprop="streetAddress">2-8-12 Minami Azabu</span>, <span itemprop="addressLocality">Minato-ku</span><br />
                            <span itemprop="addressRegion">Tokyo</span>, <span itemprop="addressCountry">Japan</span> <span itemprop="postalCode">106-0047</span>
                        </p>
                        <dl>
                            <dt>Tel</dt>
                            <dd itemprop="telephone">+81-3-5441-9800</dd>
                            <dt>E-mail</dt>
                            <dd><a href="mailto:tujinfo@tuj.temple.edu" itemprop="email">tujinfo@tuj.temple.edu</a></dd>
                        </dl>
                        <ul class="link-medium">
                            <li><i class="li-spr"></i><a href="contact/index.html">Contact</a></li>
                            <li><i class="li-spr"></i><a href="maps/index.html">Maps and Directions</a></li>
                            <li><i class="li-spr"></i><a href="joblistings/index.html">Job Opportunities</a></li>
                            <li><i class="li-spr"></i><a href="support-tuj/index.html">Support TUJ</a></li>
                        </ul>
                    </div>
                    <div class="grid grid-8 grid-reset">
                        <div class="grid grid-4 first">
                            <h1>TUJ Everywhere</h1>
                            <ul class="link-social bm-20px">
                                <li><i class="li-spr facebook"></i><a href="http://www.facebook.com/TUJAdmissions" target="_blank">UG Admissions</a></li>
                                <li><i class="li-spr twitter"></i><a href="http://twitter.com/tujweb" target="_blank">News &amp; Updates</a></li>
                                <li><i class="li-spr youtube"></i><a href="http://www.youtube.com/tujcomm" target="_blank">YouTube</a></li>
                                <li><i class="li-spr linkedin"></i><a href="http://www.linkedin.com/groups?gid=65797&amp;trk=anetsrch_name&amp;goback=.gdr_1234752200326_1" target="_blank">LinkedIn</a></li>
                            </ul>
                            <ul class="link-medium">
                                <li><i class="li-spr"></i><a href="about/japan-campus/social-media.html">View All TUJ Social Media</a></li>
                            </ul>
                        </div>
                        <div class="grid grid-4">
                            <h1>Info Sessions</h1>
                            <ul class="link-medium">
                                <li><i class="li-spr"></i><a href="ug/info-sessions.html">Undergraduate</a></li>
                                <li><i class="li-spr"></i><a href="mba/info-sessions.html">Executive MBA Program</a></li>
                                <li><i class="li-spr"></i><a href="law/info-sessions.html">Law School</a></li>
                                <li><i class="li-spr"></i><a href="aep/info-sessions.html">Academic English Program</a></li>
                                <li><i class="li-spr"></i><a href="cont-ed/about/form-info-session.html">Continuing Education</a></li>
                            </ul>
                        </div>
                        <div class="grid grid-4">
                            <h1>Programs</h1>
                            <ul class="link-medium">
                                <li><i class="li-spr"></i><a href="ug/index.html" onclick="_gaq.push(['_trackEvent', 'Footer', 'Click', 'Undergraduate (Footer)']);">Undergraduate</a></li>
                                <li><i class="li-spr"></i><a href="tesol/index.html" onclick="_gaq.push(['_trackEvent', 'Footer', 'Click', 'TESOL (Footer)']);">TESOL</a></li>
                                <li><i class="li-spr"></i><a href="mba/index.html" onclick="_gaq.push(['_trackEvent', 'Footer', 'Click', 'Executive MBA (Footer)']);">Executive MBA Program</a></li>
                                <li><i class="li-spr"></i><a href="law/index.html" onclick="_gaq.push(['_trackEvent', 'Footer', 'Click', 'Law School (Footer)']);">Law School</a></li>
                                <li><i class="li-spr"></i><a href="aep/index.html" onclick="_gaq.push(['_trackEvent', 'Footer', 'Click', 'Academic English Program (Footer)']);">Academic English Program</a></li>
                                <li><i class="li-spr"></i><a href="cont-ed/index.html" onclick="_gaq.push(['_trackEvent', 'Footer', 'Click', 'Continuing Education (Footer)']);">Continuing Education</a></li>
                                <li><i class="li-spr"></i><a href="cep/index.html" onclick="_gaq.push(['_trackEvent', 'Footer', 'Click', 'Corporate Education (Footer)']);">Corporate Education</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="grid grid-12 first">
                        <p>Copyright &copy; 2015, Temple University. All rights reserved. <a href="privacy-policy.html">Privacy Policy</a> | <a href="terms.html">Terms &amp; Conditions</a> | <a href="emergency/index.html">Useful Links for Emergencies</a></p>
                    </div>
                </div>
            </footer>
        </div>
    </form>
</body>
</html>
