<%@ Page Language="C#" AutoEventWireup="true" CodeFile="responsive03.aspx.cs" Inherits="responsive03" %>

<!DOCTYPE html>

<html class="no-js" xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title></title>

    <link rel="shortcut icon" href="http://www.k2.com/favicon.ico?v=2" />
    <script src="responsive03style/js/340087103.js"></script>

    <link rel="stylesheet" href="responsive03style/css/K2ComV5Styles.min3ee2.css?z=10292015.3" />
    <style>
        .page-header h1 {
            top: auto;
            bottom: 8px;
            width: auto;
            height: auto;
        }

        * .SingleColumnFullWidthList {
            font-family: "AvenirNextLTW01-Regular", sans-serif;
        }

        .SingleColumnFullWidthList .fluid-list li a {
            display: inline-block;
            font-size: 16px;
            line-height: 18px;
            width: 100%;
            padding: 13px 0px;
        }

        .SingleColumnFullWidthList .fluid-list li .sprite {
            float: right;
        }

        .SingleColumnFullWidthList li a {
            font-family: "AvenirNextLTW01-Regular", sans-serif;
        }

            .SingleColumnFullWidthList li a .date {
                margin-right: 10px;
                color: #000000;
            }

            .SingleColumnFullWidthList li a .title {
                color: #33647f;
                font-size: inherit;
            }

        .SingleColumnFullWidthList .content-cta-link {
            padding-top: 0px;
        }

        @media only screen and (max-width: 768px) {
            .page-header h1 {
                margin: 0px;
                height: auto;
                line-height: 35px;
            }

            .expanding-list .cta-link {
                font-size: 16px;
                line-height: 28px;
                width: 100%;
                padding-right: 0px;
                height: auto;
            }

            .SingleColumnFullWidthList h1 {
                margin-left: 72px;
                margin-top: -22px;
            }

            .SingleColumnFullWidthList h2 {
                font-size: 24px;
            }

            .SingleColumnFullWidthList h3 {
                font-size: 18px;
            }

            .SingleColumnFullWidthList li a {
                position: relative;
            }

                .SingleColumnFullWidthList li a .title {
                    white-space: normal;
                    display: block;
                    width: 254px;
                }

                .SingleColumnFullWidthList li a i {
                    position: absolute;
                    margin-left: 276px;
                    top: 50%;
                    margin-top: -14px !important;
                }
        }

        @media only screen and (max-width: 480px) {
            .content-cta-link a .text {
                font-size: 14px !important;
                margin-left: 0px !important;
            }
        }
    </style>
    <link href="responsive03style/css/jqModal3ee2.css?z=10292015.3" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="responsive03style/css/www.k2.com.css" />
    <script src="../scripts/K2ComV5/modernizr.min3ee2.js?z=10292015.3"></script>
    <!-- This block is required to make CSS media queries work in IE8 and below -->
    <!--[if lte IE 8]>
          <script src="/scripts/libs/respond.min.js"></script>
          <![endif]-->

    <script type="text/javascript">
        var _gaq = _gaq || [];
    </script>
    <script>
        var _prum = [['id', '52cd8654abe53de715000000'],
        ['mark', 'firstbyte', (new Date()).getTime()]];
        (function () {
            var s = document.getElementsByTagName('script')[0]
            , p = document.createElement('script');
            p.async = 'async';
            p.src = '../../rum-static.pingdom.net/prum.min.js';
            s.parentNode.insertBefore(p, s);
        })();
    </script>

    <script src="../repository/scripts/sites/www.k2.com_head.js"></script>
    <meta content="|1||6|" name="MyRoles" />
    <script type="text/javascript">var _myRoles = "||1||6|"; var _userStatus = "_Guest"; var _userName = ""; var _firstName = ""; var _TermsChanged = '3/1/2012 12:00:00 AM';</script>
    <meta content="noarchive" name="ROBOTS" />
    <meta content="00:00:00.0156230" name="GetRecordExecuteTime" />
    <link href="business-process-improvement-apps.html" rel="canonical" />
    <meta content="http://www.k2.com/platform/business-process-improvement-apps" name="ExternalURL" />
    <meta content="http://www.k2.com/platform/business-process-improvement-apps" name="og:url" />
    <meta content="http://www.k2.com/img/logo@x2.png" name="og:image" />
    <meta content="website" name="og:type" />
    <script type="text/javascript">var _NAMINGCONTAINER = "Body_";</script>
    <meta id="CMSTemplateID" content="1000" name="CMSTemplateID" />
    <meta id="Filter_SearchCategory" content="K2 Site;" name="Filter_SearchCategory" />
    <meta id="Keywords" content="Business process " name="Keywords" />
    <meta id="Filter_Product" content="K2 blackpearl;K2 Appit;" name="Filter_Product" />
    <meta id="Filter_SiteID" content="www.k2.com;" name="Filter_SiteID" />
    <meta id="og:title" content="Process improvement and rapid application development " name="og:title" />
    <meta id="Title" content="Process improvement and rapid application development " name="Title" />
    <meta id="og:title" content="Process improvement and rapid application development " name="og:title" />
    <meta id="Description" content="Business process improvement applications that are mobile ready and integrate with your current systems. Rapid application development with little to no code." name="Description" />
    <meta id="og:description" content="Business process improvement applications that are mobile ready and integrate with your current systems. Rapid application development with little to no code." name="og:description" />
    <meta id="TotalViews" content="0" name="TotalViews" />
    <meta id="LastViewed" content="11/11/2015 7:34:37 AM" name="LastViewed" />
    <style>
        .main-stage-learn-more__description, .overview__graph--right-content p, .overview__graph--left-content p, .overview__description, .products-slice__description, .one-miniute-video-slice__description, .fwd__right-description, .featured-asset__description {
            font-size: 14px;
            line-height: 18px;
        }

        .overview__graph--right-content h3, .overview__graph--left-content h3, .overview__title, .products-slice__title, .fwd__right-title {
            font-size: 30px;
            font-family: "Bulmer MT W01 Italic" !important;
        }

        @media (min-width: 770px) {
            .overview__graph--right-content h3, .overview__graph--left-content h3, .overview__title, .products-slice__title, .fwd__right-title {
                font-size: 40px;
            }
        }

        .one-miniute-video-slice__title {
            font-family: "Avenir Next LT W01 Bold" !important;
            font-size: 20px;
            font-weight: normal;
            text-transform: uppercase;
            margin: 40px 0px;
        }

        @media (min-width: 770px) {
            .one-miniute-video-slice__title {
                font-size: 24px;
            }
        }

        .main-stage-learn-more__button--primary, .main-stage-learn-more__button--secondary, .products-slice__primary-cta, .one-miniute-video-slice__primary-cta, .featured-asset__button--primary, .fwd__mobile-button {
            display: inline-block;
            padding: 10px 15px;
            color: white;
            text-transform: uppercase;
            font-size: 14px;
            margin-top: 20px;
            text-align: center;
            white-space: nowrap;
            -ms-touch-action: manipulation;
            touch-action: manipulation;
            cursor: pointer;
            -webkit-user-select: none;
            transition: all 0.2s ease;
        }

        .main-stage-learn-more__button--primary {
            background-color: #81af41;
        }

            .main-stage-learn-more__button--primary:hover {
                background-color: #00b5c8;
            }

        .main-stage-learn-more__button--secondary {
            border: 1px solid #81af41;
            color: #272d43;
        }

            .main-stage-learn-more__button--secondary:hover {
                background-color: #81af41;
                color: white !important;
            }

        .featured-asset__button--primary, .fwd__mobile-button {
            background-color: #00b5c8;
        }

            .featured-asset__button--primary:hover, .fwd__mobile-button:hover {
                background-color: #81af41;
            }

        .products-slice__primary-cta {
            border: 1px solid #00b5c8;
        }

            .products-slice__primary-cta:hover {
                background-color: #00b5c8;
            }

        .one-miniute-video-slice__primary-cta {
            border: 1px solid white;
            color: white;
        }

            .one-miniute-video-slice__primary-cta:hover {
                background-color: white;
                color: #272d43 !important;
            }

            .main-stage-learn-more__button--primary:hover, .main-stage-learn-more__button--secondary:hover, .products-slice__primary-cta:hover, .one-miniute-video-slice__primary-cta:hover, .featured-asset__button--primary:hover, .fwd__mobile-button:hover {
                color: white !important;
            }

        .three-column-layout {
            width: 100%;
        }

        @media (min-width: 770px) {
            .three-column-layout {
                text-align: justify;
                -ms-text-justify: distribute-all-lines;
                text-justify: distribute-all-lines;
            }
        }

        @media (min-width: 770px) {
            .three-column-layout__single {
                vertical-align: top;
                display: inline-block;
                *display: inline;
                zoom: 1;
                margin: auto;
            }
        }

        @media (min-width: 770px) {
            .three-column-layout:after {
                content: '';
                width: 100%;
                display: inline-block;
                font-size: 0;
                line-height: 0;
            }
        }

        .products-slice, .one-miniute-video-slice {
            padding: 40px 0px;
            border-top: 5px solid white;
            text-align: center;
        }

        .products-slice__content, .one-miniute-video-slice__content {
            position: relative;
            float: left;
            width: 100%;
            min-height: 1px;
            padding-left: 15px;
            padding-right: 15px;
            margin-left: 0%;
            position: relative;
            min-height: 1px;
            padding-left: 15px;
            padding-right: 15px;
        }

        @media (min-width: 770px) {
            .products-slice__content, .one-miniute-video-slice__content {
                float: left;
                width: 66.66667%;
            }
        }

        @media (min-width: 770px) {
            .products-slice__content, .one-miniute-video-slice__content {
                margin-left: 16.66667%;
            }
        }

        .products-slice__title, .one-miniute-video-slice__title {
            margin: 10px 0px;
        }

        .products-slice br, .one-miniute-video-slice br {
            display: none;
        }

        @media (min-width: 770px) {
            .products-slice br, .one-miniute-video-slice br {
                display: auto;
            }
        }

        .wrapper-header {
            position: fixed;
        }

        .main-stage-learn-more {
            background-image: url("../img/1/learn-more-main-stage.jpg");
            background-position: top center;
            background-repeat: no-repeat;
            background-size: cover;
            min-height: 423px;
            padding-bottom: 30px;
        }

        @media (min-width: 770px) {
            .main-stage-learn-more {
                min-height: 523px;
            }
        }

        @media only screen and (min-device-width: 768px) and (max-device-width: 1024px) and (orientation: portrait) {
            .main-stage-learn-more {
                min-height: auto;
            }
        }

        .main-stage-learn-more__content {
            position: relative;
            float: left;
            width: 100%;
            min-height: 1px;
            padding-left: 15px;
            padding-right: 15px;
            margin-left: 0%;
            position: relative;
            min-height: 1px;
            padding-left: 15px;
            padding-right: 15px;
        }

        @media (min-width: 770px) {
            .main-stage-learn-more__content {
                float: left;
                width: 83.33333%;
            }
        }

        @media (min-width: 770px) {
            .main-stage-learn-more__content {
                margin-left: 8.33333%;
            }
        }

        .main-stage-learn-more__title {
            text-transform: uppercase;
            margin-top: 40px;
            color: #00b5c8;
            font-size: 26px;
        }

            .main-stage-learn-more__title br {
                display: none;
            }

        @media (min-width: 770px) {
            .main-stage-learn-more__title {
                font-size: 30px;
                margin-top: 125px;
            }

                .main-stage-learn-more__title br {
                    display: block;
                }
        }

        .main-stage-learn-more__description {
            margin-top: 20px;
        }

            .main-stage-learn-more__description br {
                display: none;
            }

        @media (min-width: 770px) {
            .main-stage-learn-more__description br {
                display: block;
            }
        }

        .main-stage-learn-more__button--primary {
            font-size: 16px;
        }

        .main-stage-learn-more__button--secondary {
            color: #272d43;
            font-size: 16px;
            margin-left: 20px;
        }

        @media only screen and (min-device-width: 768px) and (max-device-width: 1024px) and (orientation: portrait) {
            .main-stage-learn-more {
                min-height: 370px;
            }

            .main-stage-learn-more__content {
                padding-right: 120px;
            }
        }

        .tabs-content {
            min-height: 452px;
        }

        .overview {
            padding-top: 70px;
        }

        @media (min-width: 770px) {
            .overview {
                padding-top: 30px;
            }
        }

        .overview__graph {
            position: relative;
            float: left;
            width: 100%;
            min-height: 1px;
            padding-left: 15px;
            padding-right: 15px;
            position: relative;
        }

        @media (min-width: 770px) {
            .overview__graph {
                background-image: url("../img/1/learn-more-graph.jpg");
                background-size: 1001px 1006px;
                min-height: 1190px;
                background-repeat: no-repeat;
                background-position: top center;
            }
        }

        .overview__graph--right-content {
            max-width: 90%;
            margin: 0 auto;
        }

        @media (min-width: 770px) {
            .overview__graph--right-content:nth-child(1) {
                max-width: 400px;
                position: absolute;
                top: 65px;
                left: 50%;
                margin-left: -24px;
            }
        }

        @media (min-width: 770px) {
            .overview__graph--right-content:nth-child(3) {
                max-width: 400px;
                position: absolute;
                top: 447px;
                left: 50%;
                margin-left: 18px;
            }
        }

        @media (min-width: 770px) {
            .overview__graph--right-content:nth-child(5) {
                max-width: 400px;
                position: absolute;
                top: 547px;
                left: 50%;
                margin-left: 18px;
            }
        }

        .overview__graph--right-content h3 {
            font-size: 23px;
            color: #00b5c8;
            margin-bottom: 5px;
        }

        .overview__graph--right-content p a {
            color: #00b5c8 !important;
        }

        .overview__graph--left-content {
            max-width: 90%;
            margin: 0 auto;
        }

        @media (min-width: 770px) {
            .overview__graph--left-content:nth-child(2) {
                max-width: 400px;
                position: absolute;
                top: 247px;
                left: 50%;
                margin-left: -375px;
            }
        }

        @media (min-width: 770px) {
            .overview__graph--left-content:nth-child(4) {
                max-width: 400px;
                position: absolute;
                top: 683px;
                left: 50%;
                margin-left: -324px;
            }
        }

        @media (min-width: 770px) {
            .overview__graph--left-content:nth-child(5) {
                max-width: 400px;
                position: absolute;
                top: 1034px;
                left: 50%;
                margin-left: -200px;
                text-align: center;
            }
        }

        .overview__graph--left-content h3 {
            font-size: 23px;
            color: #81af41;
            margin-bottom: 5px;
        }

        .overview__graph--left-content p a {
            color: #00b5c8 !important;
        }

        .overview__graph--mobile-image {
            text-align: center;
            padding: 10px 0px;
            position: relative;
        }

        @media (min-width: 770px) {
            .overview__graph--mobile-image {
                display: none;
            }
        }

        .overview__graph--mobile-image .down-arrow {
            width: 2px;
            margin: 0 auto;
            padding-bottom: 30px;
        }

        @media (min-width: 770px) {
            .overview__graph--mobile-image .down-arrow {
                display: none;
            }
        }

        .overview__graph--mobile-image .down-arrow:before {
            content: '';
            height: 50px;
            background-color: #00b5c8;
            width: 2px;
            display: block;
        }

        .overview__graph--mobile-image .down-arrow:after {
            width: 0;
            height: 0;
            border-left: 7px solid transparent;
            border-right: 7px solid transparent;
            content: '';
            border-top: 11px solid #00b5c8;
            display: block;
            margin-left: -6px;
        }

        .overview__graph--mobile-image .down-arrow.-blue:before {
            background-color: #00b5c8;
        }

        .overview__graph--mobile-image .down-arrow.-blue:after {
            border-top: 11px solid #00b5c8;
        }

        .overview__graph--mobile-image .down-arrow.-green:before {
            background-color: #81af41;
        }

        .overview__graph--mobile-image .down-arrow.-green:after {
            border-top: 11px solid #81af41;
        }

        .overview__title {
            position: relative;
            float: left;
            width: 100%;
            min-height: 1px;
            padding-left: 15px;
            padding-right: 15px;
            margin-left: 0%;
            position: relative;
            min-height: 1px;
            padding-left: 15px;
            padding-right: 15px;
            text-align: center;
            color: #81af41;
            margin-bottom: 20px;
        }

        @media (min-width: 770px) {
            .overview__title {
                float: left;
                width: 83.33333%;
            }
        }

        @media (min-width: 770px) {
            .overview__title {
                margin-left: 8.33333%;
            }
        }

        .overview__description {
            position: relative;
            float: left;
            width: 100%;
            min-height: 1px;
            padding-left: 15px;
            padding-right: 15px;
            margin-left: 0%;
            position: relative;
            min-height: 1px;
            padding-left: 15px;
            padding-right: 15px;
        }

        @media (min-width: 770px) {
            .overview__description {
                float: left;
                width: 83.33333%;
            }
        }

        @media (min-width: 770px) {
            .overview__description {
                margin-left: 8.33333%;
            }
        }

        .products-slice {
            background-color: #272d43;
            padding: 60px 0px;
        }

        .products-slice__title {
            color: #00b5c8;
            margin: 0px 0px 10px;
        }

        .products-slice__description {
            color: white;
        }

        .products-slice br {
            display: none;
        }

        @media (min-width: 770px) {
            .products-slice br {
                display: auto;
            }
        }

        .one-miniute-video-slice {
            background-color: #00b5c8;
            padding: 60px 0px;
            border: 0px;
        }

        .one-miniute-video-slice__title {
            margin-bottom: 20px;
            color: #272d43;
        }

        .one-miniute-video-slice__description {
            color: white;
        }

        .one-miniute-video-slice__primary-cta:hover {
            background-color: white;
            color: #272d43 !important;
        }

        .one-miniute-video-slice br {
            display: none;
        }

        @media (min-width: 770px) {
            .one-miniute-video-slice br {
                display: auto;
            }
        }

        .wrapper-header {
            position: fixed;
        }

        .fwd {
            padding: 60px 0px 80px;
            position: relative;
        }

        @media (min-width: 770px) {
            .fwd {
                min-height: 381px;
            }
        }

        @media (min-width: 992px) {
            .fwd {
                min-height: 430px;
            }
        }

        .fwd__menu {
            position: absolute;
            left: 0px;
            display: none;
        }

        @media (min-width: 770px) {
            .fwd__menu {
                display: block;
            }
        }

        .fwd__menu:before {
            height: 170px;
            width: 2px;
            content: '';
            background-color: #5d5d5d;
            position: absolute;
            left: 12px;
            top: 0px;
        }

        .fwd__menu:after {
            content: '';
            width: 14px;
            border-radius: 14px;
            height: 14px;
            background-color: #81af41;
            position: absolute;
            left: 6px;
            top: 0px;
            transition: all .4s ease;
        }

        .fwd__menu.-data:before {
            height: 118px;
        }

        .fwd__menu.-one:after {
            top: 0px;
        }

        .fwd__menu.-two:after {
            top: 50px;
        }

        .fwd__menu.-three:after {
            top: 105px;
        }

        .fwd__menu.-four:after {
            top: 160px;
        }

        .fwd__menu ul li {
            cursor: pointer;
            font-size: 12px;
            list-style: none;
            text-transform: uppercase;
            line-height: 14px;
            font-weight: bold;
            color: #5d5d5d;
            width: 200px;
            transition: color .2s ease;
        }

            .fwd__menu ul li:nth-child(1) {
                position: absolute;
                left: 30px;
                top: -10px;
            }

            .fwd__menu ul li:nth-child(2) {
                position: absolute;
                left: 30px;
                top: 50px;
            }

            .fwd__menu ul li:nth-child(3) {
                position: absolute;
                left: 30px;
                top: 105px;
            }

            .fwd__menu ul li:nth-child(4) {
                position: absolute;
                left: 30px;
                top: 160px;
            }

            .fwd__menu ul li.active {
                color: #81af41;
            }

            .fwd__menu ul li:hover {
                color: #81af41;
            }

        .fwd__left {
            position: relative;
            float: left;
            width: 100%;
            min-height: 1px;
            padding-left: 15px;
            padding-right: 15px;
            position: relative;
            min-height: 1px;
            padding-left: 0px;
            padding-right: 0px;
            position: relative;
        }

        @media (min-width: 770px) {
            .fwd__left {
                float: left;
                width: 66.66667%;
            }
        }

        .fwd__right {
            position: relative;
            float: left;
            width: 100%;
            min-height: 1px;
            padding-left: 15px;
            padding-right: 15px;
            position: relative;
            min-height: 1px;
            padding-left: 0px;
            padding-right: 0px;
        }

        @media (min-width: 770px) {
            .fwd__right {
                float: left;
                width: 33.33333%;
            }
        }

        @media (min-width: 0px) and (max-width: 770px) {
            .fwd__right {
                padding: 0px 30px 30px;
            }
        }

        .fwd__right-title {
            line-height: 24px;
            line-height: 39px;
            color: #81af41;
            margin-top: 20px;
        }

        @media (min-width: 770px) {
            .fwd__right-title {
                margin-top: 0px;
            }
        }

        .fwd__computer {
            display: none;
        }

        @media (min-width: 770px) {
            .fwd__computer {
                position: absolute;
                top: 0px;
                right: -47px;
                z-index: 5;
                display: block;
                zoom: 0.87;
                /* IE */
                -moz-transform: scale(0.87);
                /* Firefox */
                -moz-transform-origin: 0 0;
                -o-transform: scale(0.87);
                /* Opera */
                -o-transform-origin: 0 0;
                -webkit-transform: scale(0.87);
                /* Safari And Chrome */
                -webkit-transform-origin: 0 0;
                -webkit-transform: scale(0.87);
                transform: scale(0.87);
                /* Standard Property */
                -webkit-transform-origin: 0 0;
                transform-origin: 0 0;
                /* Standard Property */
            }
        }

        @media (min-width: 992px) {
            .fwd__computer {
                zoom: 1;
                /* IE */
                -moz-transform: scale(1);
                /* Firefox */
                -moz-transform-origin: 0 0;
                -o-transform: scale(1);
                /* Opera */
                -o-transform-origin: 0 0;
                -webkit-transform: scale(1);
                /* Safari And Chrome */
                -webkit-transform-origin: 0 0;
                -webkit-transform: scale(1);
                transform: scale(1);
                /* Standard Property */
                -webkit-transform-origin: 0 0;
                transform-origin: 0 0;
                /* Standard Property */
                right: 0px;
            }
        }

        .fwd__screen {
            display: none;
        }

        @media (min-width: 770px) {
            .fwd__screen {
                position: absolute;
                z-index: 2;
                width: 350px;
                top: 12px;
                right: 33px;
                height: 200px;
                overflow: hidden;
                display: block;
                zoom: 0.87;
                /* IE */
                -moz-transform: scale(0.87);
                /* Firefox */
                -moz-transform-origin: 0 0;
                -o-transform: scale(0.87);
                /* Opera */
                -o-transform-origin: 0 0;
                -webkit-transform: scale(0.87);
                /* Safari And Chrome */
                -webkit-transform-origin: 0 0;
                -webkit-transform: scale(0.87);
                transform: scale(0.87);
                /* Standard Property */
                -webkit-transform-origin: 0 0;
                transform-origin: 0 0;
                /* Standard Property */
            }
        }

        @media (min-width: 992px) {
            .fwd__screen {
                zoom: 1;
                /* IE */
                -moz-transform: scale(1);
                /* Firefox */
                -moz-transform-origin: 0 0;
                -o-transform: scale(1);
                /* Opera */
                -o-transform-origin: 0 0;
                -webkit-transform: scale(1);
                /* Safari And Chrome */
                -webkit-transform-origin: 0 0;
                -webkit-transform: scale(1);
                transform: scale(1);
                /* Standard Property */
                -webkit-transform-origin: 0 0;
                transform-origin: 0 0;
                /* Standard Property */
                right: 70px;
            }
        }

        .fwd__slides {
            position: absolute;
            top: 0px;
            transition: top 0.7s ease;
        }

            .fwd__slides.-one {
                top: 0px;
            }

            .fwd__slides.-two {
                top: -200px;
            }

            .fwd__slides.-three {
                top: -403px;
            }

            .fwd__slides.-four {
                top: -606px;
            }

        @media (min-width: 770px) {
            .fwd__right-content--one {
                display: none;
            }

            .fwd__right-content--two {
                display: none;
            }

            .fwd__right-content--three {
                display: none;
            }

            .fwd__right-content--four {
                display: none;
            }
        }

        .fwd__right.-one .fwd__right-content--one {
            display: block;
            animation: fade-in 1;
            -webkit-animation: fade-in 1s;
        }

        .fwd__right.-two .fwd__right-content--two {
            display: block;
            animation: fade-in 1s;
            -webkit-animation: fade-in 1s;
        }

        .fwd__right.-three .fwd__right-content--three {
            display: block;
            animation: fade-in 1s;
            -webkit-animation: fade-in 1s;
        }

        .fwd__right.-four .fwd__right-content--four {
            display: block;
            animation: fade-in 1s;
            -webkit-animation: fade-in 1s;
        }

        .featured-asset {
            background-image: url("../img/1/learn-more-forrester%402x.jpg");
            background-repeat: no-repeat;
            background-size: cover;
            min-height: 350px;
            background-position: top center;
        }

        .featured-asset__content {
            position: relative;
            float: left;
            width: 100%;
            min-height: 1px;
            padding-left: 5px;
            padding-right: 5px;
            position: relative;
            min-height: 1px;
            padding-left: 10px;
            padding-right: 10px;
            text-align: center;
        }

        @media (min-width: 770px) {
            .featured-asset__content {
                float: left;
                width: 50%;
            }
        }

        .featured-asset__content_column {
            position: relative;
            float: left;
            width: 100%;
            min-height: 1px;
            padding-left: 5px;
            padding-right: 5px;
            min-height: 400px;
            background-color: rgba(255, 255, 255, 0.8);
            text-align: center;
            padding-top: 20px;
            padding-bottom: 20px;
        }

        @media only screen and (min-device-width: 768px) and (max-device-width: 1024px) and (orientation: portrait) {
            .featured-asset__content_column {
                min-height: auto;
            }
        }

        .featured-asset__title {
            margin-top: 40px;
            margin-bottom: 20px;
            font-size: 17px;
            font-weight: bold;
            text-transform: uppercase;
            line-height: 22px;
            padding: 0px 45px;
        }

        @media (min-width: 770px) {
            .featured-asset__description {
                padding: 0px 45px;
            }
        }

        .featured-asset__button--primary {
            margin-top: 30px;
            margin-bottom: 30px;
        }

        @media (min-width: 770px) {
            .mobile-tab-content {
                display: none;
            }
        }

        .is-not-desktop {
            display: block;
        }

        @media (min-width: 770px) {
            .is-not-desktop {
                display: none;
            }
        }

        .fwd__mobile-button {
            margin-top: 2px;
        }

        .mobile-access-download-link {
            display: inline-block;
            border-bottom: 1px solid #81af41;
        }

        .mobile-screen {
            display: none;
        }
    </style>


</head>
<body class="WhiteSite">
    <form method="post" id="form1" runat="server">
        <div class="aspNetHidden">
            <input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUJNDY0NjgyNzE1ZGS+yCK0fzRnHOCtUMqyLkj42etjoQ==" />
        </div>

        <div class="aspNetHidden">

            <input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="B81F4FB5" />
        </div>

        <div class="PageContainer">
            <!--admin-->
            <!--end_admin-->


            <span id="Header_TopNavMenu">
                <menucontrol><span><div class="wrapper-header sl_swap" id="megamenu"><header class="header"><a href="http://www.k2.com/" class="header__logo"><img src="../img/1/k2-logo.png" alt="" /></a><!-- The start of the Best Nav Ever (BNE). NO BEM here.  --><nav class="header__best-nav-ever bne" role="navigation"><div id="menu-close"><img src="../img/btn-close.png" width="32" alt="" /></div><ul class="top-utility"><li><a href="http://www.k2.com/contact-us" class="top-utility__button--contact">Contact</a></li><li><a class="mobile-login right-border _AccountLinks _LoginLink _InlineForm" targetClass="K2V5DefaultPopup" addRoundCorners="false" target="/forms/form_login.xml" href="http://login.k2.com/">Login</a></li></ul><ul><li role="menuitem"><a>WHAT IS K2?</a><ul class="sub-menu--what-is-k2"><li><a>Intro to Business Applications</a><ul class="sub-sub-menu"><li><a href="business-process-improvement-apps.html">Overview</a></li><li><a href="smartforms-electronic-forms.html">Forms</a></li><li><a href="workflow-software.html">Workflow</a></li><li><a href="data-integration-tools.html">Data & Systems</a></li><li><a href="business-app-benefits.html">App experience</a></li></ul></li><li><a href="http://www.k2.com/products-blackpearl-appit">Products</a></li><li><a href="http://www.k2.com/experience-k2">One-Minute Demos</a></li><li><a href="http://www.k2.com/company-overview">About the Company</a></li></ul></li><li role="menuitem"><a>HOW PEOPLE USE K2</a><ul class="sub-menu--how-people-use-k2"><li><a href="http://www.k2.com/customers">Customer Stories</a></li><li><a href="http://www.k2.com/industry-and-department-solutions">Industries</a><!-- <ul class="sub-sub-menu">
                                        <li><a href="/industry-detail.html">Financial Services</a></li>
                                        <li><a href="/industry-detail.html">Legal</a></li>
                                        <li><a href="/industry-detail.html">Manufacturing</a></li>
                                        <li><a href="/industry-detail.html">Healthcare</a></li>
                                        <li><a href="/industry-detail.html">Public Sector</a></li>
                                        <li><a href="/industry-detail.html">Oil & Gas</a></li>
                                    </ul> --></li><li><a>Departments</a><ul class="sub-sub-menu"><li><a href="http://www.k2.com/industry-and-department-solutions/hr-software">Human Resources</a></li><li><a href="http://www.k2.com/industry-and-department-solutions/financial-services-software">Finance</a></li><li><a href="http://www.k2.com/industry-and-department-solutions/operations-management-software">Operations</a></li><li><a href="http://www.k2.com/industry-and-department-solutions/e-procurement-software">Purchasing</a></li><li><a href="http://www.k2.com/industry-and-department-solutions/sales-management-software">Sales & Marketing</a></li><li><a href="http://www.k2.com/industry-and-department-solutions/IT-rapid-application-development">IT</a></li></ul></li><li><a href="http://www.k2.com/bpm-software">Business Process Management</a></li><li><a href="http://www.k2.com/sharepoint-workflow">SharePoint Workflow</a></li></ul></li><li><a class="last">RESOURCES</a><ul class="sub-menu--resources"><li><a href="http://www.k2.com/events">Events</a></li><li><a>Support</a><ul class="sub-sub-menu"><li class="no-pointer"><span class="top-title">Consulting and Training</span></li><li><a href="http://www.k2.com/consulting">Consulting Options</a></li><li><a href="http://www.k2.com/training">Training Options</a></li><li class="no-pointer"><span class="top-title">Support Overview</span></li><li><a href="http://www.k2.com/appit-support">Appit</a></li><li><a href="http://www.k2.com/blackpearl-support">K2 blackpearl</a></li><li class="wtf"><a href="http://www.k2.com/access-k2-support" class="access-support2">Access Support</a></li></ul></li><li><a>Partners</a><ul class="sub-sub-menu"><li limitto="!|48PP|16PP|64PP|2PP|32PP|128PP|1950|1000|"><a href="http://www.k2.com/partners/program">Partner Program</a></li><li limitto="!|48PP|16PP|64PP|2PP|32PP|128PP|1950|1000|"><a href="http://www.k2.com/partners/partnerlist">Partner List</a></li><li limitto="!|48PP|16PP|64PP|2PP|32PP|128PP|1950|1000|"><a href="http://www.k2.com/technology-partners">Technology Partners</a></li><li limitto="|1|"><a class="_InlineForm" targetClass="K2V5DefaultPopup" addRoundCorners="false" target="/forms/form_signin.xml" href="http://login.k2.com/">Partner Login</a></li></ul></li><li><a href="http://www.k2.com/blog">Blog</a></li><li><a>Community</a><ul class="sub-sub-menu"><li><a target="_blank" href="http://community.k2.com/t5/Forum/ct-p/K2-forum">Forums</a></li><li><a target="_blank" href="http://community.k2.com/t5/Market/ct-p/market-category">Market (Free code/plugins)</a></li><li><a target="_blank" href="http://community.k2.com/t5/Community-Articles/ct-p/TKB_Community_Articles">Community Articles</a></li></ul></li><li><a href="http://help.k2.com/" target="_blank">Knowledge Center</a></li><li><a href="http://www.k2.com/resources/downloads">Downloads</a></li><!-- <li><a>Application Accelerators</a>
                                    
                                    <ul class="sub-sub-menu">
                                      <li><a href="#">Leave Request</a></li>
                                      <li><a href="#">New Idea Submission</a></li>
                                      <li><a href="#">Expense Claim</a></li>
                                      <li><a href="#">Task Management</a></li>
                                      <li><a href="#">Travel Request</a></li>
                                      <li><a href="#">Incident Management</a></li>
                                    </ul>
                                  </li> --></ul></li></ul></nav><a class="header__cta-contact" href="http://www.k2.com/contact-us">Contact</a><a href="http://www.k2.com/free-trial?home=request-demo" class="header__cta-see-it-live">Request Demo</a><div class="header__utility"><div class="header__login"><a class="_AccountLinks _LoginLink _InlineForm" targetClass="K2V5DefaultPopup" addRoundCorners="false" target="/forms/form_login.xml" href="http://login.k2.com/">log in</a></div><div class="header__search"><img class="search-icon" style="background-image: none;background-size: auto;height: auto;width: 23px;margin: 0px;" src="../img/1/search-icon.png" width="23" alt="" /></div></div><div class="menu-icon" id="menu-icon"><img src="../img/1/mobile-menu-1.png" width="32" alt="" /></div></header></div><div class="search-box noindex"><div class="row noindex"><span>Search: </span><input placeholder="" id="Text1" class="_SiteSearch FormFieldRequired" /><img class="btn-close-search-bar" src="../img/btn-close.png" alt="Search Close Button" width="25" /></div></div><div class="hide-for-small"></div></span></menucontrol>
            </span>



            <input type="hidden" name="ctl00$Body$PageRoles" id="Body_PageRoles" value="1|2|3|4|5" />
            <span>
                <input type="hidden" name="ctl00$Body$NameContainerPrefix" id="Body_NameContainerPrefix" /><div class="_LanguageOptions">
                    <input type='hidden' id='PublishedLangs' value='en' /><input type='hidden' id='UnPublishedLangs' value='' /><input type='hidden' id='CurrentLang' value='en' />
                </div>
                <input type='hidden' id='Mode' name='Mode' value='False' /><input type='hidden' value='' id='_QSHIDDEN' /><singlevalue_control genericnodename="Memo1" publicnodename="TempContents"><span id="Body_richtext_Memo1_TempContents" orientation="horizontal" internal_col="Memo1" internal_ID="abab1dbe-f96a-4e05-a4e3-fdeb790d1065" col="TempContents" controltype="RichText" class="_Wizard" style="min-width:100px;min-height:20px;"><section class="main-stage-learn-more push-for-menu">
                                    <div class="wrapper">
                                      <div class="main-stage-learn-more__content topajax">
                                        <h1 class="main-stage-learn-more__title">
                                          K2 business process improvement applications help you work smarter and get business done faster

                                        </h1>
                                        <p class="main-stage-learn-more__description">
                                          Create, modify and reuse K2 business apps with little to no code — on premises or in the cloud. <br>  Leverage current systems and technologies, and interact with your apps from any device.

                                        </p>
                                        <a href="http://www.k2.com/free-trial?home=request-demo" class="main-stage-learn-more__button--primary">REQUEST A DEMO</a>
                                        <a href="http://www.k2.com/buy-k2" class="main-stage-learn-more__button--secondary">How To Buy</a>
                                      </div>

                                    </div>
                                  </section>
                                  <section class="tabs">
                                    <div class="wrapper">
                                      <div class="tabs__content">
                                        <ul>
                                          <li class="active"><a class="ajax" href="business-process-improvement-apps.html">Overview</a></li>
                                          <li><a class="ajax" href="smartforms-electronic-forms.html">Forms</a></li>
                                          <li><a class="ajax" href="http://www.k2.com/displayContent.aspx?id=10312">Workflow</a></li>
                                          <li><a class="ajax" href="data-integration-tools.html">Data</a></li>
                                          <li><a class="ajax" href="business-app-benefits.html">App Experience</a></li>
                                        </ul>
                                      </div>
                                    </div>
                                  </section>
                                  <section class="tabs-content">
                                    <div class="wrapper">
                                      <div class="tab-content__content">
                                        <div class="overview">
                                          <h2 class="overview__title">
                                            Anatomy of a K2 business app
                                          </h2>
                                          <div class="overview__description">
                                            K2 business apps help you streamline processes — expense claims, customer onboarding, travel authorizations or any other process you use at work. They connect people, data and systems to drive substantial time savings and offer full traceability on every process. Bring products to market faster, gain critical approvals quickly, meet regulatory and compliance demands with full confidence. K2 enables you to build apps the way you want, with components like forms and workflow. Let’s look at an example:
                                          </div>
                                          <div class="overview__graph">
                                            <div class="overview__graph--right-content">

                                              <div class="overview__graph--mobile-image">

                                                <img src="../img/1/mobile-graph1.png" alt="">

                                              </div>
                                              <h3>Start with information from your LOB systems</h3>
                                              <p>Reusable data connections (we call them SmartObjects) allow you to leverage line-of-business and Web-based data in your applications, securely, regardless of where it lives.<br>
                                                <a href="data-integration-tools.html">Learn more about K2's data integration.</a>
                                              </p>

                                            </div>
                                            <div class="overview__graph--left-content">
                                              <div class="overview__graph--mobile-image">
                                                <div class="down-arrow -blue"></div>
                                                <img src="../img/1/mobile-graph2.png" alt="">
                                              </div>
                                              <h3>Organize with electronic forms</h3>
                                              <p>Mobile-ready forms provide an intuitive interface for gathering, distributing and interacting with information.<br>
                                                <a href="smartforms-electronic-forms.html">Learn more about forms.</a>

                                              </p>
                                            </div>
                                            <div class="overview__graph--right-content">
                                              <div class="overview__graph--mobile-image">
                                                <div class="down-arrow -green"></div>
                                                <img src="../img/1/mobile-graph3.png" alt="">
                                              </div>
                                              <h3>Process with a custom workflow</h3>
                                              <p>Automated workflows route information, drive action and ensure consistency by connecting your people with relevant tasks and information.
                                                <br>
                                                <a href="http://www.k2.com/displayContent.aspx?id=10312">Learn more about workflow.</a>
                                              </p>
                                            </div>
                                            <div class="overview__graph--left-content">
                                              <div class="overview__graph--mobile-image">
                                               <div class="down-arrow -blue"></div>
                                               <img src="../img/1/mobile-graph4.png" alt="">
                                             </div>
                                             <h3>View comprehensive reports</h3>
                                             <p>Track your applications with real-time insight into process status and business performance.
                                              <br>
                                              <a href="data-integration-toolsd41d.html?">Learn more about reports.</a>
                                            </p>
                                          </div>
                                          <div class="overview__graph--left-content">
                                            <div class="overview__graph--mobile-image">
                                             <div class="down-arrow -green"></div>
                                             <img src="../img/1/mobile-graph5.png" alt="">
                                           </div>
                                           <h3>Work from any device</h3>
                                           <p>K2 business apps work across your devices, so you can get work done and make data-driven decisions from anywhere, at any time.

                                           </p>
                                         </div>

                                       </div>
                                     </div>
                                   </div>
                                 </div>
                               </section>
                               <div class="tabs-scripts">
                                <section class="products-slice">
                                  <div class="wrapper">
                                    <div class="products-slice__content">
                                      <h4 class="products-slice__title">Products</h4>
                                      <p class="products-slice__description">K2 business apps run on premises or in the cloud, they integrate with your current systems, and they allow for insightful reporting. Everything you build is reusable and easy to change with little-to-no code.
                                      </p>
                                      <a href="http://www.k2.com/products-blackpearl-appit" class="products-slice__primary-cta">View K2 Products</a>
                                    </div>
                                  </div>
                                </section>
                                <section class="featured-asset">
                                  <div class="wrapper">
                                    <div class="featured-asset__content">   
                                      <div class="featured-asset__content_column">
                                        <h4 class="featured-asset__title">
                                          Gartner Report: Market Guide to Business Process Management Platforms
                                        </h4>
                                        <div class="featured-asset__description">
                                          BPM platforms enable rapid application development, transform processes and digitize paper-based applications, but it can be difficult to know which BPM solution will fit your business needs best. Read this report to learn about key criteria to look for and which BPM vendors will best meet your company's business process improvement needs.
                                        </div>
                                        <a href="http://content.k2.com/web_70114000002Jkok" taget="_blank" class="featured-asset__button--primary">Download the Gartner report</a>
                                      </div>
                                    </div>
                                    <div class="featured-asset__content">   
                                      <div class="featured-asset__content_column">
                                        <h4 class="featured-asset__title">
                                          Are Low-code Platforms Fast & Scalable?
                                        </h4>
                                        <div class="featured-asset__description">
                                          Low-code platforms make it possible to rapidly deliver business applications, making companies more agile and flexible in a business world that is constantly evolving and changing. Are low-code platforms capable of scaling to support the process automation needs of businesses today?  Read this whitepaper to learn more.
                                        </div>
                                        <a href="http://content.k2.com/web_70114000002W3Fz" taget="_blank" class="featured-asset__button--primary">Download the whitepaper</a>
                                      </div>
                                    </div>
                                  </div>
                                </section>
                                <section class="one-miniute-video-slice">
                                  <div class="wrapper">
                                    <div class="one-miniute-video-slice__content">
                                      <h4 class="one-miniute-video-slice__title">One-minute Demos</h4>
                                      <p class="one-miniute-video-slice__description">Want to see K2 in action? Click below to learn how easy it can be to build and run business process applications with forms, workflow, data and reports.
                                      </p>
                                      <a href="http://www.k2.com/experience-k2"  class="one-miniute-video-slice__primary-cta">See it live </a>
                                    </div>
                                  </div>
                                </section>
                              </div>
                              <div id="is-not-desktop"></div>
                            </span></singlevalue_control><input type="hidden" name="ctl00$Body$FileName" id="Body_FileName" value="/learn-more" /></span>



            <div class="iphone-widget">
                <div class="iphone-widget__phone-icon">
                    <img src="../img/1/icon-phone.png" alt="Phone Icon" />
                </div>
                <a class="iphone-widget__description" href="tel:8444522777">Contact Sales: <span>844.452.apps</span>

                </a>
                <div class="iphone-widget__close" id="phone-close">
                    <img src="../img/1/icon-close.png" alt="Close" />
                </div>
            </div>


            <footer class="noindex">
                <div class="legal noindex" style="margin-top: 0px !important; background: #eaeaea !important;">
                    <div class="row collapse noindex">
                        <nav>
                            <ul class="right" style="line-height: 62px !important; style: inline-table !important;">
                                <li>
                                    <span class='hide-for-small AvenirRegular' style='font-size: 14px; color: #383838; position: relative; top: -9px;'>CONNECT WITH US:</span>
                                </li>
                                <li>
                                    <a href="http://www.twitter.com/K2onK2" target="_blank" class="sprite twitter"></a>
                                </li>
                                <li>
                                    <a href="http://www.facebook.com/K2workflow?fref=ts" target="_blank" class="sprite facebook"></a>
                                </li>
                                <li>
                                    <a href="https://plus.google.com/u/0/103131923406127720530/posts" target="_blank" class="sprite googleplus"></a>
                                </li>
                                <li>
                                    <a href="http://www.linkedin.com/company/469843?trk=tyah" target="_blank" class="sprite linkedin"></a>
                                </li>
                                <li>
                                    <a href="http://www.youtube.com/channel/UCe_842WPzxlDKgxquIa-eKg" target="_blank" class="sprite k2tv"></a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <div class="row noindex">
                    <div class="column one hide-for-small noindex" style="margin-top: 10px; margin-bottom: 10px;">
                        <img src="../img/k2comv5/logo-small.png" alt='Footer K2 Logo' class="small-logo left" style="position: relative; top: 0px !important;" />
                    </div>
                </div>
                <div class="row noindex">
                    <nav class="column eleven sitemap offset-by-one" style="z-index: 4 !important;">
                        <ul class="row">
                            <li class="column three first ">
                                <span class="footer-headings">About</span>
                                <ul>
                                    <li><a href="http://www.k2.com/company-overview">Company</a></li>
                                    <li><a href="http://www.k2.com/press-releases">News &amp; Press</a></li>
                                    <li><a href="http://www.k2.com/careers">Careers</a></li>
                                    <li><a href="http://associate.k2.com/" target="_blank">K2 Associate Program</a></li>
                                    <li><a data-sl-variant="legal-varient-1" href="http://www.k2.com/legal-information">Legal</a></li>
                                    <li><a href="http://www.k2.com/cookie-policy">Cookie Policy</a></li>
                                </ul>
                                <span class="footer-headings">Contact</span>
                                <ul>
                                    <li class="_InlineForm" targetclass="K2V5DefaultPopup" addroundcorners="false" target="/forms/form_contactus.xml"><a href="http://www.k2.com/contact-us">Contact Us</a></li>
                                    <li><a href="http://www.k2.com/global-contacts">Global Contacts</a></li>
                                    <li><a href="http://www.k2.com/support-offerings/schedule">Support Contacts</a></li>
                                </ul>
                            </li>
                            <li class="column three">
                                <span class="footer-headings">Videos</span>
                                <ul>
                                    <li><a href="http://www.k2.com/resources/webinars">Webinars</a></li>
                                    <li><a href="http://www.k2.com/resources/case-studies">Case Studies</a></li>
                                    <li><a href="http://www.k2.com/resources/product-demos">Demos</a></li>
                                </ul>
                                <span class="footer-headings">Downloads</span>
                                <ul>
                                    <li><a href="http://www.k2.com/resources/downloads">White Papers &amp; PDF's</a></li>
                                </ul>
                            </li>
                            <li class="column three">
                                <span class="footer-headings">Our Community</span>
                                <ul>
                                    <li><a href="http://community.k2.com/" target="_blank">Forums and Community</a></li>
                                    <li><a href="http://www.k2.com/partners/program">Partner Program</a></li>
                                    <li><a href="http://www.k2.com/partners/partnerlist">Find a Partner</a> </li>
                                    <li><a href="http://www.k2.com/technology-partners">Technology Partners</a></li>
                                    <li><a href="http://www.k2.com/k2-insiders">K2 Insiders</a></li>
                                </ul>
                            </li>
                            <li class="column three">
                                <span class="footer-headings">Other Sites</span>
                                <ul>
                                    <li><a href="http://www.appit.com/" target="_blank">K2 Appit</a></li>
                                    <li><a href="http://help.k2.com/" target="_blank">Knowledge Center</a></li>
                                    <li><a href="http://portal.k2.com/" target="_blank">Partner &amp; Customer Portal</a></li>
                                    <li><a href="http://coe.k2.com/" target="_blank">Center of Excellence</a></li>
                                    <li><a href="http://healthcare.k2.com/us" target="_blank">K2 for Healthcare</a></li>
                                    <li><a href="http://legal.k2.com/" target="_blank">K2 for Legal</a></li>
                                    <li><a href="http://sap.k2.com/" target="_blank">K2 and SAP</a></li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                </div>
                <div class="legal noindex">
                    <div class="row collapse noindex">
                        <nav>
                            <ul class="right">
                                <li><a href="http://www.k2.com/privacy-policy">Privacy Policy</a></li>
                                <li><a href="http://www.k2.com/terms-of-use">Terms of Use</a></li>
                                <li class="french-link"><a href="http://www.k2france.com/" target="_blank">K2 France</a></li>
                                <li class="german-link"><a href="http://de.k2.com/">K2 Germany</a></li>
                                <li><a href="http://www.k2.com/copyright" data-reveal-id="Copyright-Modal">Copyright</a></li>
                                <li>
                                    <a href="http://www.k2.com/sourcecode-overview" border='0' style='position: relative; top: 6px'>
                                        <img src='../img/sc_reg_logo.png' alt='SourceCode' />
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <div id="Copyright-Modal" class="reveal-modal placeholder-modal full noindex">
                    <div class="modal-content noindex">
                        <div class="modal-form-wrapper noindex">
                            <div class="row">
                                <div class="offset-by-one nine columns noindex">
                                    <div class="cr-title">Copyright</div>
                                </div>
                                <div class="one columns close-btn noindex">
                                    <a href="#" class="close-reveal-modal StopLink noindex">
                                        <span class="sprite large-close"></span>
                                    </a>
                                </div>
                            </div>
                            <div class="row noindex">
                                <div class="ten columns offset-by-one form-col noindex">
                                    <div class="row-hr noindex">
                                        <div class="hr noindex"></div>
                                    </div>
                                    <span class="_CurrentYear">2013</span> SOURCECODE TECHNOLOGY HOLDINGS, INC. ALL RIGHTS RESERVED. SOURCECODE SOFTWARE PRODUCTS ARE PROTECTED BY ONE OR MORE U.S. PATENTS. OTHER PATENTS PENDING. SOURCECODE, K2, THE FOUR SQUARES LOGO, K2 BLACKPEARL, K2 CONNECT AND K2 SMARTFORMS ARE REGISTERED TRADEMARKS OR TRADEMARKS OF SOURCECODE TECHNOLOGY HOLDINGS, INC. IN THE UNITED STATES AND/OR OTHER COUNTRIES. All other trademarks or product names are property of their respective owners.
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>


        </div>


        <script src="../../code.jquery.com/jquery-1.11.3.min.js"></script>
        <script src="../scripts/K2ComV5/jquery.mobile.custom.min.js" type="text/javascript"></script>
        <script>window.jQuery || document.write('<script src="../scripts/K2ComV5/jquery-1.11.3.min.js"><\/script>')</script>


        <script src="../scripts/K2ComV5/foundation.min3ee2.js?z=10292015.3"></script>


        <script src="../scripts/K2ComV5/K2ComV5_JS.min3ee2.js?z=10292015.3" type="text/javascript"></script>
        <script src="../repository/scripts/sites/iFrame.Sizing3ee2.js?z=10292015.3" type="text/javascript"></script>


        <script src="../Scripts/tiny_mce/jquery.tinymce3ee2.js?z=10292015.3" type="text/javascript"></script>






        <!--<script src="/Scripts/tinymce4/tinymce.min.js?z=10292015.3" type="text/javascript"></script>-->

        <script type="text/javascript">$('body').removeClass('WhiteSite');

        </script>
        <script type="text/javascript">
            _bizo_data_partner_id = "7183";
        </script>
        <script type="text/javascript">
            (function () {
                var s = document.getElementsByTagName("script")[0];
                var b = document.createElement("script");
                b.type = "text/javascript";
                b.async = true;
                b.src = (window.location.protocol === "https:" ? "https://sjs" : "http://js") + ".bizographics.com/insight.min.js";
                s.parentNode.insertBefore(b, s);
            })();
        </script>
        <noscript>
                          <img height="1" width="1" alt="" style="display:none;" src="http://www.bizographics.com/collect/?pid=7183&amp;fmt=gif" />
                        </noscript>
        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
      <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
      <![endif]-->

        <script type="text/javascript" language="javascript">
            if (this.GetElqCustomerGUID) SetCookie("EloquaCustID", GetElqCustomerGUID(), 1, "http://www.k2.com/", "k2.com", false);
            var D = new Date();
            var tzo = (D.getTimezoneOffset() / 60) * (-1);
            SetCookie("UserTimeZoneOffSet", tzo, 1, "http://www.k2.com/", "k2.com", false);
            SetCookie("UserTimeZoneAbbreviation", dateFormat(D, "Z"), 1, "http://www.k2.com/", "k2.com", false);
        </script>


        <div id="image-modal" class="reveal-modal placeholder-modal dark auto">
            <div class="modal-content">
                <img src="#" alt="image" />
                <a class="close-reveal-modal">×</a>
            </div>
        </div>
        <div id="video-modal" class="reveal-modal placeholder-modal dark auto">
            <div class="modal-content">
                <span class='_videoplaceholder'></span>
                <a class="close-reveal-modal">×</a>
            </div>
        </div>
        <div class="reveal-modal placeholder-modal full noindex" id="ThankYou-Contact-Us">
            <div class="modal-content">
                <div class="modal-form-wrapper">
                    <div class="row">
                        <div class="offset-by-one nine columns">
                            <div class="cr-title">Thank You</div>
                            <p>Thank you for your submission. We will be in contact shortly to assist you.</p>
                        </div>
                        <div class="one columns close-btn"></div>
                        <div class="row">
                            <div class="ten columns offset-by-one form-col">
                                <div class="row-hr">
                                    <div class="hr"></div>
                                </div>
                                <div class="row form-row form-field">
                                    <div class="form-btns">
                                        <input class="primary button submit-btn close-reveal-modal" value="OK" reload="" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <div id='jqmContainers' style=''></div>
    <script type="text/javascript">
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-416095-3'], ['_trackPageview'], ['b._setAccount', 'UA-33286204-1'], ['b._trackPageview']);
        (function () {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;

            ga.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'stats.g.doubleclick.net/dc.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();
    </script>

    <script src="../repository/scripts/sites/www.k2.com_body.js"></script>
</body>
</html>
