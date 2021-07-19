<%@ Page Language="C#" AutoEventWireup="true" CodeFile="button02.aspx.cs" Inherits="button02" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        html,
        body {
            padding: 0;
            margin: 0;
        }

        .main-nav {
            position: absolute;
            bottom: 0;
            width: 100%;
            padding: 0;
            margin: 0;
            text-align: center;
            font-size: 0;
        }

        .main-nav-list {
            display: inline-block;
            padding: 0;
            list-style: none;
        }

            .main-nav-list li {
                display: inline-block;
                margin: 0;
                padding: 0;
                min-width: 50px;
                min-height: 50px;
            }

                .main-nav-list li.habitats {
                    background-color: #9ae900;
                }

                .main-nav-list li.animals {
                    background-color: #00cb79;
                }

                .main-nav-list li.materials {
                    background-color: #ffd600;
                }

                .main-nav-list li.earth {
                    background-color: #ffa200;
                }

                .main-nav-list li.forces {
                    background-color: #ff2200;
                }

                .main-nav-list li.evolution {
                    background-color: #a8218e;
                }

                .main-nav-list li.light {
                    background-color: #00a7ef;
                }

                .main-nav-list li.electricity {
                    background-color: #00989a;
                }

                .main-nav-list li img {
                    display: inline-block;
                    cursor: pointer;
                    margin: 0;
                    padding: 0;
                }
    </style>
    <%--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>--%>
    <script src="button02style/jquery-1.11.1.js"></script>
    <script src="button02style/jquery.resizeOnApproach.1.0.min.js"></script>

    <script>
        $(document).ready(function () {
            $('.main-nav-list img').resizeOnApproach({
                elementDefault: 50,
                elementClosest: 120,
                triggerDistance: 130
            });
        });
    </script>
    <script type="text/javascript">

        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-36251023-1']);
        _gaq.push(['_setDomainName', 'jqueryscript.net']);
        _gaq.push(['_trackPageview']);

        (function () {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();

    </script>


</head>

<body>


    <nav class="main-nav">
        <ul class="main-nav-list">
            <li class="evolution">
                <img src="button02style/main-nav-evolution@2x.png" alt="Evolution and inheritance" title="Evolution and inheritance" /></li>
            <li class="light">
                <img src="button02style/main-nav-light@2x.png" alt="Light" title="Light" /></li>
            <li class="earth">
                <img src="button02style/main-nav-earth@2x.png" alt="Earth and space" title="Earth and space" /></li>
            <li class="habitats">
                <img src="button02style/main-nav-habitats@2x.png" alt="Living things and their habitats" title="Living things and their habitats" /></li>
            <li class="forces">
                <img src="button02style/main-nav-forces@2x.png" alt="Forces" title="Forces" /></li>
            <li class="animals">
                <img src="button02style/main-nav-animals@2x.png" alt="Animals, including humans" title="Animals, including humans" /></li>
            <li class="electricity">
                <img src="button02style/main-nav-electricity@2x.png" alt="Electricity" title="Electricity" /></li>
            <li class="materials">
                <img src="button02style/main-nav-materials@2x.png" alt="Properties and changes of materials" title="Properties and changes of materials" /></li>
        </ul>
    </nav>

</body>
</html>
