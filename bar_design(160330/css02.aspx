<%@ Page Language="C#" AutoEventWireup="true" CodeFile="css02.aspx.cs" Inherits="css02" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        /*car*/
        .careffect {
            -webkit-filter: drop-shadow(10px 10px 10px rgba(0, 0, 0, 0.8));
            margin: 20px;
            cursor: pointer;
            -webkit-transition: all 1s;
        }

            .careffect:hover {
                -webkit-filter: drop-shadow(-8px 10px 10px rgba(0, 0, 0, 0.8));
            }
        /*three item*/
        .threeitem {
            width:100px;
            height:30px;
            line-height:30px;
            text-align:center;
            border-radius:10px;
            margin:5px;
            font:50px;
            background-color:#ccc;
            -webkit-transition: all 1s;
        }

        .threeitem:hover {
            opacity:0.5;
            -webkit-transform: translate(-10px,0);
        }

    </style>


</head>
<body>
    <form id="form1" runat="server">
        <div>
            <%--car--%>
            <img id="btn1" class="careffect" src="css02style/car.png" />
            <br />
            <br />
            <br />
            <%--three item--%>
            <div class="threeitem">item1</div>
            <div class="threeitem">item2</div>
            <div class="threeitem">item3</div>

        </div>
    </form>
</body>
</html>
