﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="slider03.aspx.cs" Inherits="slider03" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <%--http://tympanus.net/Development/ItemTransitions/index.html--%>

    <link rel="stylesheet" type="text/css" href="slider03style/css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="slider03style/css/demo.css" />
    <link rel="stylesheet" type="text/css" href="slider03style/css/component.css" />
    <link rel="stylesheet" type="text/css" href="slider03style/css/fxsmall.css" />
    <script src="slider03style/js/modernizr.custom.js"></script>


    <script type="text/javascript">
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-7243260-2']);
        _gaq.push(['_trackPageview']);
        (function () {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();
</script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <!-- Top Navigation -->
            <div class="codrops-top clearfix">
                <a class="codrops-icon codrops-icon-prev" href="http://tympanus.net/Tutorials/TiltedContentSlideshow/"><span>Previous Demo</span></a>
                <span class="right"><a class="codrops-icon codrops-icon-drop" href="http://tympanus.net/codrops/?p=18632"><span>Back to the Codrops Article</span></a></span>
            </div>
            <header class="codrops-header">
                <h1>Item Transition Inspiration</h1>
                <nav class="codrops-demos">
                    <a class="current-demo" href="index.html">Small Component</a>
                    <a href="index2.html">Full Width</a>
                    <a href="index3.html">Transparent</a>
                </nav>
            </header>
            <section>
                <div class="custom-select">
                    <select id="fxselect" name="fxselect">
                        <option value="-1" selected>Choose an effect...</option>
                        <option value="fxCorner">Corner scale</option>
                        <option value="fxVScale">Vertical scale</option>
                        <option value="fxFall">Fall</option>
                        <option value="fxFPulse">Forward pulse</option>
                        <option value="fxRPulse">Rotate pulse</option>
                        <option value="fxHearbeat">Hearbeat</option>
                        <option value="fxCoverflow">Coverflow</option>
                        <option value="fxRotateSoftly">Rotate me softly</option>
                        <option value="fxDeal">Deal 'em</option>
                        <option value="fxFerris">Ferris wheel</option>
                        <option value="fxShinkansen">Shinkansen</option>
                        <option value="fxSnake">Snake</option>
                        <option value="fxShuffle">Shuffle</option>
                        <option value="fxPhotoBrowse">Photo Browse</option>
                        <option value="fxSlideBehind">Slide Behind</option>
                        <option value="fxVacuum">Vacuum</option>
                        <option value="fxHurl">Hurl it</option>
                    </select>
                </div>
                <div id="component" class="component component-small">
                    <ul class="itemwrap">
                        <li class="current">
                            <img src="slider03style/img/1.jpg" alt="img01" /></li>
                        <li>
                            <img src="slider03style/img/2.jpg" alt="img02" /></li>
                        <li>
                            <img src="slider03style/img/3.jpg" alt="img03" /></li>
                        <li>
                            <img src="slider03style/img/4.jpg" alt="img04" /></li>
                        <li>
                            <img src="slider03style/img/5.jpg" alt="img05" /></li>
                    </ul>
                    <nav>
                        <a class="prev" href="#">Previous item</a>
                        <a class="next" href="#">Next item</a>
                    </nav>
                </div>
            </section>
<%--            <section class="related">
                <p>Images from the Hand Lettering project by <a href="https://www.behance.net/gallery/Hand-Lettering/14532289">Ben Johnston</a></p>
                <h3>If you enjoyed this demo you might also like:</h3>
                <a href="http://tympanus.net/Development/StackEffects/">
                    <img src="../../../codropspz.tympanus.netdna-cdn.com/codrops/wp-content/uploads/2014/03/StackEffects-300x162.jpg" />
                    <h3>Simple Stack Effects</h3>
                </a>
                <a href="http://tympanus.net/Development/ThumbnailGridAnimations/">
                    <img src="../../../codropspz.tympanus.netdna-cdn.com/codrops/wp-content/uploads/2013/10/ThumbnailGridAnimations1-300x162.jpg" />
                    <h3>Medium-Style Page Transition</h3>
                </a>
            </section>--%>
        </div>
        <!-- /container -->
        <script src="slider03style/js/classie.js"></script>
        <script src="slider03style/js/main.js"></script>
        <!-- For the demo ad only -->
        <%--<script src="../../codrops/adpacks/demoad.js"></script>--%>
    </form>
</body>
</html>
