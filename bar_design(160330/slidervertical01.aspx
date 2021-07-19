<%@ Page Language="C#" AutoEventWireup="true" CodeFile="slidervertical01.aspx.cs" Inherits="slidervertical01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        @font-face {
            font-family: NotoSansHant-Regular;
            src: url(slidervertical01style/NotoSansHant-Regular.otf);
        }

        html {
            height: 100%;
            overflow: hidden;
        }

        body {
            margin: 0;
            padding: 0;
            perspective: 1px;
            transform-style: preserve-3d;
            height: 100%;
            overflow-y: scroll;
            overflow-x: hidden;
            font-family: NotoSansHant-Regular;
        }

        
        .header {
            text-align: center;
            color: #fff;
            text-shadow: 2px -2px 10px rgba(0,0,0,0.7),  -2px -2px 10px rgba(0,0,0,0.7);
        }

        h1 {
            font-size: 38pt;
        }

        .header h1 {
            margin-top:100px;
            font-size: 60pt;
        }

        .card {
            width: 60%;
            padding: 5%;
            border-radius: 5px;
            background: rgba(220,220,220, .6);
            box-shadow: 0 0 10px rgba(0, 0, 0, .7);
        }

        .slide:nth-child(2n) .card {            
            margin-right: auto;
        }

        .slide:nth-child(2n+1) .card {
            margin-left: auto;
        }

        .slide, .slide:before {
            background-position: 50% 50%;
            background-size: cover;
        }
        
        p {
            font-size: 26pt;
            line-height: 30pt;
            color: #333;
        }

        .slide {
            position: relative;
            padding: 25vh 10%;
            min-height: 100vh;
            width: 100vw;
            box-sizing: border-box;
            box-shadow: 0 -1px 10px rgba(0, 0, 0, .7);
            transform-style: inherit;
        }

        /*img {
            position: absolute;
            top: 50%;
            left: 35%;
            width: 320px;
            height: 240px;
            transform: translateZ(.25px) scale(.75) translateX(-94%) translateY(-100%) rotate(2deg);
            padding: 10px;
            border-radius: 5px;
            background: rgba(240,230,220, .7);
            box-shadow: 0 0 8px rgba(0, 0, 0, .7);
        }

            img:last-of-type {
                transform: translateZ(.4px) scale(.6) translateX(-104%) translateY(-40%) rotate(-5deg);
            }*/

        .slide:before {
            content: "";
            position: absolute;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
        }
        

        #title, #end {
            background-image: url("slidervertical01style/bg0.jpg");
            background-attachment: fixed;
        }

        #slide1:before, #slide5:before {
            background-image: url("slidervertical01style/bg1.jpg");
        }

        #slide2 {
            background-image: url("slidervertical01style/bg2.jpg");
        }

        #slide3:before {
            background-image: url("slidervertical01style/bg3.jpg");
        }

        #slide4 {
            background-image: url("slidervertical01style/bg4.jpg");
        }

        .slide:nth-of-type(2n):before {            
            transform: translateZ(-1px) scale(2);
            z-index: -1;
        }

        .slide:nth-of-type(2n+1) {            
            background-attachment: fixed;
        }

    </style>



</head>
<body>
    <%--<form id="form1" runat="server">--%>

        <div id="title" class="slide header">
            <h1>Parallax Scrolling</h1>
        </div>

        <div id="slide1" class="slide">
            <div class="card">
                <h1>Slide 1</h1>
                <p>Lorem ipsum dolor sit amet, in velit iudico mandamus sit, persius dolorum in per, postulant mnesarchum cu nam. Malis movet ornatus id vim, feugait detracto est ea, eam eruditi conceptam in. Ne sit explicari interesset. Labores perpetua cum at. Id viris docendi denique vim.</p>
            </div>
        </div>

        <div id="slide2" class="slide">
            <div class="card">
                <h1>Slide 2</h1>
                <p>Lorem ipsum dolor sit amet, in velit iudico mandamus sit, persius dolorum in per, postulant mnesarchum cu nam. Malis movet ornatus id vim, feugait detracto est ea, eam eruditi conceptam in. Ne sit explicari interesset. Labores perpetua cum at. Id viris docendi denique vim.</p>
            </div>
        </div>

        <div id="slide3" class="slide">
            <div class="card">
                <h1>Slide 3</h1>
                <p>Lorem ipsum dolor sit amet, in velit iudico mandamus sit, persius dolorum in per, postulant mnesarchum cu nam. Malis movet ornatus id vim, feugait detracto est ea, eam eruditi conceptam in. Ne sit explicari interesset. Labores perpetua cum at. Id viris docendi denique vim.</p>
            </div>
        </div>

        <div id="slide4" class="slide">
            <div class="card">
                <h1>Slide 4</h1>
                <p>Lorem ipsum dolor sit amet, in velit iudico mandamus sit, persius dolorum in per, postulant mnesarchum cu nam. Malis movet ornatus id vim, feugait detracto est ea, eam eruditi conceptam in. Ne sit explicari interesset. Labores perpetua cum at. Id viris docendi denique vim.</p>
            </div>
        </div>

        <div id="slide5" class="slide">
            <div class="card">
                <h1>Slide 5</h1>
                <p>Lorem ipsum dolor sit amet, in velit iudico mandamus sit, persius dolorum in per, postulant mnesarchum cu nam. Malis movet ornatus id vim, feugait detracto est ea, eam eruditi conceptam in. Ne sit explicari interesset. Labores perpetua cum at. Id viris docendi denique vim.</p>
            </div>
        </div>

        <div id="end" class="slide header">
            <h1>The End</h1>
        </div>

  <%--  </form>--%>
</body>
</html>
