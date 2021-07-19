<%@ Page Language="C#" AutoEventWireup="true" CodeFile="bd03.aspx.cs" Inherits="bd03" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            background: black;
        }

        #bg1 {
            width:100%;
            height:950px;
            background-image:
                radial-gradient(rgba(255,255,255,.7), rgba(255,255,255,.2) 2px, transparent 40px),
                radial-gradient(rgba(255,255,255,.5), rgba(255,255,255,.15) 1px, transparent 30px),
                radial-gradient(rgba(255,255,255,.5), rgba(255,255,255,.1) 2px, transparent 40px),
                radial-gradient(rgba(255,255,255,.4), rgba(255,255,255,.1) 2px, transparent 30px);
            background-size: 550px 550px, 350px 350px, 250px 250px, 150px 150px; 
            background-position: 0 0, 40px 60px, 130px 270px, 70px 100px;
            -webkit-transition: all 100s linear;
        }

            #bg1:hover {
                background-position-x: 200%,200%,50%,50%;
            }
    </style>


</head>
<body>
    <form id="form1" runat="server">
        <div id="bg1"></div>
    </form>
</body>
</html>
