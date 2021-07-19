<%@ Page Language="C#" AutoEventWireup="true" CodeFile="buttonbookmark01p.aspx.cs" Inherits="buttonbookmark01p" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="buttonbookmark01style/styles2.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">

<%--        <h1>CSS3 Minimalistic Navigation Menu</h1>
        <h2><a href="http://tutorialzine.com/2010/06/css3-minimalistic-navigation-menu/">Read the tutorial on Tutorialzine &raquo;</a></h2>--%>


        <div id="main">
            <ul id="navigationMenu">
                <li>
                    <asp:LinkButton  cssClass="home active" ID="ColorButton1" runat="server"  CausesValidation="False"><span>Personal Info</span>
					 </asp:LinkButton>
                </li>

                <li>
                    <a class="about" href="#">
                        <span>Education</span>
                    </a>
                </li>
                <li>
                    <a class="services" href="#">
                        <span>Academic</span>
                    </a>
                </li>
            </ul>
        </div>

    </form>
</body>
</html>