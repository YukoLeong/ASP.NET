<%@ Page Language="C#" AutoEventWireup="true" CodeFile="font_design.aspx.cs" Inherits="font_design" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        @font-face {
            font-family: Bulmer MT W01 Italic;
            src: url(font_designstyle/BulmerMTW01Italic.ttf);
        }

        @font-face {
            font-family: AvenirNextLTPro-Regular;
            src: url(font_designstyle/AvenirNextLTPro-Regular.otf);
        }

        @font-face {
            font-family: museosansrounded;
            src: url(font_designstyle/museosansrounded-300.woff);
        }

        @font-face {
            font-family: museosansrounded2;
            src: url(font_designstyle/museosansrounded-500.woff);
        }

        @font-face {
            font-family: museosansrounded3;
            src: url(font_designstyle/museosansrounded-700.woff);
        }

        @font-face {
            font-family: proximanova1;
            src: url(font_designstyle/proximanova-light-webfont.woff);
        }

        @font-face {
            font-family: proximanova2;
            src: url(font_designstyle/proximanova-regular-webfont.woff);
        }

        @font-face {
            font-family: proximanova3;
            src: url(font_designstyle/proximanovacond-light-webfont.woff);
        }



        .font01 {
            position: relative;
            min-height: 1px;
            padding-left: 15px;
            padding-right: 15px;
            text-align: center;
            color: #81af41;
            margin-top: 50px;
            font-family: 'Bulmer MT W01 Italic';
            font-size: 40px;
        }

        .font02 {
            position: relative;
            min-height: 1px;
            padding-left: 15px;
            padding-right: 15px;
            text-align: center;
            color: #00b5c8;
            margin-top: 50px;
            font-family: 'AvenirNextLTPro-Regular';
            font-size: 40px;
        }

        .font03 {
            position: relative;
            min-height: 1px;
            padding-left: 15px;
            padding-right: 15px;
            text-align: center;
            color: #4b8ca7;
            margin-top: 50px;
            font-family: 'museosansrounded';
            font-size: 40px;
        }

        .font04 {
            position: relative;
            min-height: 1px;
            padding-left: 15px;
            padding-right: 15px;
            text-align: center;
            color: #4b8ca7;
            margin-top: 50px;
            font-family: 'museosansrounded2';
            font-size: 40px;
        }

        .font05 {
            position: relative;
            min-height: 1px;
            padding-left: 15px;
            padding-right: 15px;
            text-align: center;
            color: #4b8ca7;
            margin-top: 50px;
            font-family: 'museosansrounded3';
            font-size: 40px;
        }

        .font06 {
            position: relative;
            min-height: 1px;
            padding-left: 15px;
            padding-right: 15px;
            text-align: center;
            color: #4b8ca7;
            margin-top: 50px;
            font-family: 'proximanova1';
            font-size: 1.2em;
        }

        .font07 {
            position: relative;
            min-height: 1px;
            padding-left: 15px;
            padding-right: 15px;
            text-align: center;
            color: #4b8ca7;
            margin-top: 50px;
            font-family: 'proximanova2';
            font-size: 1.2em;
        }

        .font08 {
            position: relative;
            min-height: 1px;
            padding-left: 15px;
            padding-right: 15px;
            text-align: center;
            color: #4b8ca7;
            margin-top: 50px;
            font-family: 'proximanova3';
            font-size: 1.2em;
        }
    </style>


</head>
<body>
    <form id="form1" runat="server">

        <%--http://www.k2.com/platform/business-process-improvement-apps--%>
        <div class="font01">
            Anatomy of a K2 business app
        </div>

        <div class="font01" style="color: #00b5c8; font-size: 23px">
            Start with information from your LOB systems
        </div>
        <div class="font02" style="color: #00b5c8; font-size: 30px">
            K2 BUSINESS PROCESS IMPROVEMENT APPLICATIONS
            <br />
            HELP YOU WORK SMARTER AND GET BUSINESS DONE
            <br />
            FASTER
        </div>
        <%--http://www.choosemuse.com/--%>
        <div class="font03">
            IT’S EASY TO MEDITATE WITH MUSE
        </div>
        <div class="font04">
            IT’S EASY TO MEDITATE WITH MUSE
        </div>
        <div class="font05">
            IT’S EASY TO MEDITATE WITH MUSE
        </div>
        <div class="font06">
            Passively detects changes in your brain from outside your head.
            <br />
            Uses EEG technology, which hospitals and clinics have used for over a century.
            <br />
            Tested and certified to meet all safety standards.
        </div>
        <div class="font07">
            Passively detects changes in your brain from outside your head.
            <br />
            Uses EEG technology, which hospitals and clinics have used for over a century.
            <br />
            Tested and certified to meet all safety standards.
        </div>
        <div class="font08">
            Passively detects changes in your brain from outside your head.
            <br />
            Uses EEG technology, which hospitals and clinics have used for over a century.
            <br />
            Tested and certified to meet all safety standards.
        </div>
        <br />
        <br />



    </form>
</body>
</html>
