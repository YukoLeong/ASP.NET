<%@ Page Language="C#" AutoEventWireup="true" CodeFile="font01.aspx.cs" Inherits="font01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        @font-face {
            font-family: myFirstFont;
            src: url(sansation_light.woff);
        }

        div {
            font-family: myFirstFont;
        }
    </style>



</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
</body>
</html>
