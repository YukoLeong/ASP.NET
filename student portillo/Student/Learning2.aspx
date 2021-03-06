<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Learning2.aspx.vb" Inherits="Student_Learning2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link href='http://fonts.googleapis.com/css?family=PT+Sans+Narrow&v1' rel='stylesheet' type='text/css' />
    <link href='http://fonts.googleapis.com/css?family=Wire+One&v1' rel='stylesheet' type='text/css' />
    <link href="animatedmenu/style.css" rel="stylesheet" />
    <link href="animatedmenu/stimenu.css" rel="stylesheet" />
    <link href="animatedmenu/reset.css" rel="stylesheet" />

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.14/jquery-ui.min.js"></script>

    <script src="animatedmenu/jquery.iconmenu.js"></script>
    <script src="animatedmenu/jquery.easing.1.3.js"></script>
    <%--<script src="animatedmenu/jquery-1.6.1.min.js"></script>--%>

    <script type="text/javascript">
        $(function () {
            $('#sti-menu').iconmenu({
                animMouseenter: {
                    'mText': { speed: 400, easing: 'easeOutExpo', delay: 140, dir: 1 },
                    'sText': { speed: 400, easing: 'easeOutExpo', delay: 0, dir: 1 },
                    'icon': { speed: 800, easing: 'easeOutBounce', delay: 280, dir: 1 }
                },
                animMouseleave: {
                    'mText': { speed: 400, easing: 'easeInExpo', delay: 140, dir: 1 },
                    'sText': { speed: 400, easing: 'easeInExpo', delay: 280, dir: 1 },
                    'icon': { speed: 400, easing: 'easeInExpo', delay: 0, dir: 1 }
                }
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Animated Text and Icon Menu<span> with jQuery</span></h1>
            <ul id="sti-menu" class="sti-menu">
                <li data-hovercolor="#37c5e9">
                    <a href="#">
                        <h2 data-type="mText" class="sti-item">Advanced Patient Care</h2>
                        <h3 data-type="sText" class="sti-item">Personalized to your needs</h3>
                        <span data-type="icon" class="sti-icon sti-icon-care sti-item"></span>
                    </a>
                </li>
                <li data-hovercolor="#ff395e">
                    <a href="#">
                        <h2 data-type="mText" class="sti-item">Alternative Medicine</h2>
                        <h3 data-type="sText" class="sti-item">Holistic approaches</h3>
                        <span data-type="icon" class="sti-icon sti-icon-alternative sti-item"></span>
                    </a>
                </li>
                <li data-hovercolor="#57e676">
                    <a href="#">
                        <h2 data-type="mText" class="sti-item">Modern Info Center</h2>
                        <h3 data-type="sText" class="sti-item">Educating you</h3>
                        <span data-type="icon" class="sti-icon sti-icon-info sti-item"></span>
                    </a>
                </li>
                <li data-hovercolor="#d869b2">
                    <a href="#">
                        <h2 data-type="mText" class="sti-item">Future Family Planning</h2>
                        <h3 data-type="sText" class="sti-item">For a healthier future</h3>
                        <span data-type="icon" class="sti-icon sti-icon-family sti-item"></span>
                    </a>
                </li>
                <li data-hovercolor="#ffdd3f">
                    <a href="#">
                        <h2 data-type="mText" class="sti-item">Advanced Technology</h2>
                        <h3 data-type="sText" class="sti-item">From the latest research</h3>
                        <span data-type="icon" class="sti-icon sti-icon-technology sti-item"></span>
                    </a>
                </li>
            </ul>
<%--            <div class="more">
                <ul>
                    <li>More examples with slightly different effects:</li>
                    <li><a href="example1.html">Example 1</a></li>
                    <li class="selected"><a href="example2.html">Example 2</a></li>
                    <li><a href="example3.html">Example 3</a></li>
                    <li><a href="example4.html">Example 4</a></li>
                    <li><a href="example5.html">Example 5</a></li>
                    <li><a href="example6.html">Example 6</a></li>
                    <li><a href="example7.html">Example 7</a></li>
                    <li><a href="example8.html">Example 8</a></li>
                </ul>
            </div>
            <div class="footer">
                <a href="http://tympanus.net/Development/SlidingBackgroundImageMenu/example5.html"><span>&laquo; Previous Demo: </span>Sliding Background Image Menu</a>
                <span class="right_ab">
                    <a href="http://thenounproject.com/" target="_blank">Icons by The Noun Project</a>
                    <a href="http://tympanus.net/codrops/2011/07/12/animated-text-and-icon-menu/"><strong>back to the Codrops post</strong></a>
                </span>
            </div>--%>
        </div>
    </form>
</body>
</html>
