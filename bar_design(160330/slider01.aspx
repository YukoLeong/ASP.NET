<%@ Page Language="C#" AutoEventWireup="true" CodeFile="slider01.aspx.cs" Inherits="slider01" %>

<!DOCTYPE html>

<%--another slider example--%>
<%--http://vectorflower.com/preview/trans_banner/index.html?s_sel=1&&t_sel=1--%>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="slider01style/css/import.css" rel="stylesheet" />
    <script src="slider01style/js/jquery-1.11.0.min.js"></script>
    <script src="slider01style/js/smoothRollOver.js"></script>
    <link href='http://fonts.googleapis.com/css?family=Noticia+Text:700' rel='stylesheet' type='text/css' />
    <script src="slider01style/js/jquery.bxslider.min.js"></script>
    <script type="text/javascript" charset="utf-8">
        jQuery(function ($) {
            $('.bxslider').bxSlider({
                auto: true,
                pause: 4000,          
                mode: 'horizontal',
                easing: 'ease-in-out'
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <br /><br /><br />
        <div>
            <div id="topvisual">
                <ul class="bxslider">
                    <li><a href="http://moeoh.dengeki.com/archives/2092">
                        <img src="slider01style/img/topvisual02.jpg" width="1200" height="580" alt="MOEOHセレクション karory画集 Karorful a la carte" /></a></li>
                    <li><a href="http://www.etsu.jp/books/karory/">
                        <img src="slider01style/img/topvisual03.jpg" width="1200" height="580" alt="feather karory ARTWORKS" /></a></li>
                    <li><a href="dojin.html">
                        <img src="slider01style/img/topvisual01.jpg" width="1200" height="580" alt="コミックマーケット87 KAROMIX 12月30日・3日目東3館A-75" /></a></li>
                    <li><a href="http://www.etsu.jp/books/gasyu11/">
                        <img src="slider01style/img/topvisual04.jpg" width="1200" height="580" alt="work｜ガールズガールズガールズ! 11 -Plus Girl Collection-発売中！" /></a></li>
                    <li><a href="http://www.feng.jp/feng8th/index.html">
                        <img src="slider01style/img/topvisual05.jpg" width="1200" height="580" alt="feng新作" /></a></li>
                </ul>
            </div>
        </div>
    </form>
</body>
</html>
