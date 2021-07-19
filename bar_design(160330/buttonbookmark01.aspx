<%@ Page Language="C#" AutoEventWireup="true" CodeFile="buttonbookmark01.aspx.cs" Inherits="buttonbookmark01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="buttonbookmark01style/styles.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">

        <h1>CSS3 Minimalistic Navigation Menu</h1>
        <h2><a href="http://tutorialzine.com/2010/06/css3-minimalistic-navigation-menu/">Read the tutorial on Tutorialzine &raquo;</a></h2>

        <div id="main">

            <ul id="navigationMenu">
                <li>
                    <a class="home" href="#">
                        <span>Home</span>
                    </a>
                </li>

                <li>
                    <a class="about" href="#">
                        <span>About</span>
                    </a>
                </li>

                <li>
                    <a class="services" href="#">
                        <span>Services</span>
                    </a>
                </li>

                <li>
                    <a class="portfolio" href="#">
                        <span>Portfolio</span>
                    </a>
                </li>

                <li>
                    <a class="contact" href="#">
                        <span>Contact us</span>
                    </a>
                </li>
            </ul>

        </div>

        <p class="note">View in a Webkit browser (Safari, Chrome) for the full effect.</p>
    </form>
</body>
</html>