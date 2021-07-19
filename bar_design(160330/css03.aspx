<%@ Page Language="C#" AutoEventWireup="true" CodeFile="css03.aspx.cs" Inherits="css03" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        #accordion section, #accordion h1, #accordion p {
            transition: all 1s ease-in-out;
        }

        #accordion h1 {
            line-height: 1.2em;
            font-size: 20px;
            background-color: pink;
            margin: 0;
            padding: 10px 10px 10px 30px;
        }

            #accordion h1 a {
                color: black;
                text-decoration: none;
            }

        #accordion section {
            overflow: hidden;
            height: 44px;
            border: 1px #333 solid;
        }

        #accordion p {
            padding: 0 10px;
        }

        #accordion section:hover {
            height: 220px;
        }

        #accordion section h1:hover {
            background-color: red;
        }
    </style>



</head>
<body>
    <form id="form1" runat="server">
        <div id="accordion">
            <section id="item1">
                <h1><a href="#">A long paragraph</a></h1>
                <p>Pellentesque habitant... </p>
            </section>
            <section id="item2" class="ac_hidden">
                <h1><a href="#">A medium paragraph</a></h1>
                <p>Pellentesque habitant... </p>
            </section>
            <section id="item3" class="ac_hidden">
                <h1><a href="#">Two short paragraphs</a></h1>
                <p>Pellentesque habitant... </p>
                <p>Pellentesque habitant... </p>
            </section>
        </div>
    </form>
</body>
</html>
