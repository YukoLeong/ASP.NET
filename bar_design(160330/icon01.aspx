<%@ Page Language="C#" AutoEventWireup="true" CodeFile="icon01.aspx.cs" Inherits="icon01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <%--https://icomoon.io/app/#/select--%>
    <%--https://icomoon.io/#home--%>

    <style>
        @font-face {
            font-family: 'icomoon';
            src: url('icon01style/icomoon.woff');
        }
        [class^="icon-"] {
            font-family: 'icomoon';
            font-size: 50px;
            /*color: grey;*/
        }
        .icon-home3:before {
            content: "\e600";
        }
        span{
            font-family:sans-serif;
        }

    </style>


</head>
<body>
    <form id="form1" runat="server">
        <div>
            <span class="icon-home3"></span>
            <span>home3</span>

        </div>
    </form>
</body>
</html>
