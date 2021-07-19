<%@ Page Language="C#" AutoEventWireup="true" CodeFile="css01.aspx.cs" Inherits="css01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        img {
            position: absolute;
            -webkit-filter: blur(5px);
            -webkit-transition: all 0.5s;
        }

        #flower {
            margin-left: 50px;
            bottom: 0;
        }

            #flower:hover {
                -webkit-filter: blur(0);
            }

        #grass:hover {
            -webkit-filter: blur(0);
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <img id="grass" src="css01style/grass.jpg" />
            <img id="flower" src="css01style/flower.png" />
        </div>
    </form>
</body>
</html>
