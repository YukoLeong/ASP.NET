<%@ Page Language="C#" AutoEventWireup="true" CodeFile="introjs01.aspx.cs" Inherits="introjs01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <!-- styles -->
    <%--this part can delete when you use--%>
    <link href="inrojs01style/bootstrap.min.css" rel="stylesheet" />
    <link href="inrojs01style/demo.css" rel="stylesheet" />

    <!-- Add IntroJs styles -->
    <link href="inrojs01style/introjs.css" rel="stylesheet" />

    <link href="inrojs01style/bootstrap-responsive.min.css" rel="stylesheet" />
    <script src="inrojs01style/intro.js"></script>
</head>
<body>
    <form id="form1" runat="server">

        <div class="container-narrow">

            <div class="masthead">
                <ul class="nav nav-pills pull-right" data-step="5" data-intro="Get it, use it.">
                    <li><a href="https://github.com/usablica/intro.js/tags"><i class='icon-black icon-download-alt'></i>Download</a></li>
                    <li><a href="https://github.com/usablica/intro.js">Github</a></li>
                    <li><a href="https://twitter.com/usablica">@usablica</a></li>
                </ul>
                <h3 class="muted">Intro.js</h3>
            </div>
            <hr />

            <div class="jumbotron">
                <h1 data-step="1" data-intro="This is a tooltip!">Basic Usage</h1>
                <p class="lead" data-step="4" data-intro="Another step.">This is the basic usage of IntroJs, with <code>data-step</code> and <code>data-intro</code> attributes.</p>
                <a class="btn btn-large btn-success" href="javascript:void(0);" onclick="javascript:introJs().start();">Show me how</a>
            </div>

            <hr />

            <div class="row-fluid marketing">
                <div class="span6" data-step="2" data-intro="Ok, wasn't that fun?" data-position='right'>
                    <h4>Section One</h4>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis mollis augue a neque cursus ac blandit orci faucibus. Phasellus nec metus purus.</p>

                    <h4>Section Two</h4>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis mollis augue a neque cursus ac blandit orci faucibus. Phasellus nec metus purus.</p>

                    <h4>Section Three</h4>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis mollis augue a neque cursus ac blandit orci faucibus. Phasellus nec metus purus.</p>
                </div>

                <div class="span6" data-step="3" data-intro="More features, more fun." data-position='left'>
                    <h4>Section Four</h4>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis mollis augue a neque cursus ac blandit orci faucibus. Phasellus nec metus purus.</p>

                    <h4>Section Five</h4>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis mollis augue a neque cursus ac blandit orci faucibus. Phasellus nec metus purus.</p>

                    <h4>Section Six</h4>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis mollis augue a neque cursus ac blandit orci faucibus. Phasellus nec metus purus.</p>

                </div>
            </div>

            <hr/>
        </div>
    </form>
</body>
</html>
