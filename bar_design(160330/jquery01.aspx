<%@ Page Language="C#" AutoEventWireup="true" CodeFile="jquery01.aspx.cs" Inherits="jquery01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .picstyle1, .picstyle2, .picstyle3, .picstyle4, .picstyle5 {
            width: 150px;
        }
        /*div{
            border:1px;
            border-color:black;
        }*/
    </style>
    <script src="jquery01style/jquery-2.1.1.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".picstyle1").click(function () {
                var key = $(".picstyle1").attr("data");
                $(".divtext").text(key);
            })
            $(".picstyle2").click(function () {
                var key = $(".picstyle2").attr("data");
                $(".divtext").text(key);
            })
            $(".picstyle3").click(function () {
                var key = $(".picstyle3").attr("data");
                $(".divtext").text(key);
            })
            $(".picstyle4").click(function () {
                var key = $(".picstyle4").attr("data");
                $(".divtext").text(key);
            })
            $(".picstyle5").click(function () {
                var key = $(".picstyle5").attr("data");
                $(".divtext").text(key);
            })
        });
    </script>


</head>
<body>
    <form id="form1" runat="server">
    <img class="picstyle1" data="醫生" src="jquery01style/pic/doctor.jpg" />
    <img class="picstyle2" data="護士" src="jquery01style/pic/nurse.jpg" />
    <img class="picstyle3" data="警察" src="jquery01style/pic/police.jpg" />
    <img class="picstyle4" data="郵差" src="jquery01style/pic/postman.jpg" />
    <img class="picstyle5" data="服務員" src="jquery01style/pic/sweeper.jpg" />
    <br />
    <div class="divtext" style="border-style:solid; border-color:black; height:100px; width:150px; font-size:30px"></div>
    </form>
</body>
</html>
