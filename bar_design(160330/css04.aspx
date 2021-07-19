<%@ Page Language="C#" AutoEventWireup="true" CodeFile="css04.aspx.cs" Inherits="css04" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            background-image: url(css02style/cork.jpg);
        }

        .img01 {
            width: 500px;
            border: solid white;
            border-width: 15px 15px 50px 15px;
            box-shadow: rgba(0,0,0,0.6) 20px 20px 10px;
            transform: translate(60px,60px) rotate(-10deg) scale(0.5);
        }

            .img01:hover {
                transform: scale(1) translate(100px,60px) rotate(0deg);
            }

        .img02 {
            width:500px;
            border:solid white;
            border-width: 15px 15px 50px 15px;
            -webkit-transition:all 1s;
            box-shadow:rgba(0,0,0,0.6) 20px 20px 10px;
            -webkit-transform-origin: 0 0;
        }

        .img02:hover {            
            -webkit-transform: rotate(30deg);
        }

    </style>


</head>
<body>
    <form id="form1" runat="server">
        <img class="img01" src="css02style/photo.jpg" />
        <br />
        <br />
        <br />
        <br />
        <br />
        <img class="img02" style="margin-left:100px" src="css02style/photo.jpg" />
    </form>
</body>
</html>
