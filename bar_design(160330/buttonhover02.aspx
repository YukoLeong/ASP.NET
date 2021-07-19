<%@ Page Language="C#" AutoEventWireup="true" CodeFile="buttonhover02.aspx.cs" Inherits="buttonhover02" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HoverAlls - Animation and Hover Framework v2.6</title>

    <script type='text/javascript'>if (top !== self) top.location.href = self.location.href;</script>



    <link rel="icon" type="image/ico" href="buttonhover02style/favicon.ico" />
    <link rel="stylesheet" href="buttonhover02style/css/loader.css" />
    <link rel="stylesheet" href="buttonhover02style/css/main.css" />
    <link href="buttonhover02style/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" media="screen" href="buttonhover02style/HoverAlls/css/jquery-HoverAlls-2.5.css" />
    <link rel="stylesheet" href="buttonhover02style/jquery-chameleon-1.2.css" />
    <link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css' />

    <script src="buttonhover02style/js/jquery-1.11.1.min.js"></script>


        <script type="text/javascript" src="buttonhover02style/HoverAlls/js/jquery.HoverAlls-2.5.js"></script>
        <script type="text/javascript" src="buttonhover02style/jquery-chameleon-1.2.js"></script>

        <!-- HoverAlls Function Calls -->
        <script type="text/javascript">
            $(document).ready(function () {
                /* CAPTIONS */
                $('.caption').HoverAlls({
                    "speed": "220,220",
                    "text_speed": "400,200",
                    "opacity": "0,1",
                    "link_control": "false,_blank"
                });

                /* MULTIPLE */
                $('.multiple').HoverAlls({
                    "speed": "220,220",
                    "text_speed": "400,200",
                    "opacity": "0,1",
                    "bg_class": "hv_caption_bg1",
                    "text_class": "hv_caption_txt1",
                    "coords": "0,100||0,75||0,100",
                    "text_coords": "0,50||0,0||0,50",
                    "link_control": "false,_blank"
                });

                /* LIGHTBOXES */
                $('.lightbox').HoverAlls({ "mode": "lightbox" });

                /* PANELS */
                $('.panel').HoverAlls({
                    "speed": "350,500",
                    "opacity": "1,1",
                    "mode": "panel"
                });

                /* TOOLTIPS */
                $('.tooltip').HoverAlls({ "mode": "tooltip" });

                /* TICKERS */
                $('.ticker').HoverAlls({ "mode": "ticker" });

                /* ALERT */
                $('.alert').HoverAlls({ "mode": "alert" });
            });

            // WAIT FOR EVERYTHING TO LOAD
            $(window).load(function () {
                $('body').addClass('loaded').Chameleon({
                    'current_item': 'hoveralls',
                    'json_url': '../Envato/items.json'
                });
                $('#loader-wrapper .load_title').remove();
            });

            /* SMOOTH SCROLL TO ANCHOR */
            $(function () {
                $('a[href*=#]:not([href=#])').on('click', function () {
                    if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
                        var target = $(this.hash);
                        target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
                        if (target.length) { $('html,body').animate({ scrollTop: target.offset().top - 50 }, 1000); return false; };
                    };
                });
            });
		</script>




</head>
<body>
    <form id="form1" runat="server">
        <!--[if lt IE 7]><p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p><![endif]-->

        <!-- ********************************************************************************************************** -->
        <!-- PAGE LOADER																								-->
        <!-- ********************************************************************************************************** -->
        <div id="loader-wrapper">
            <div id="loader"></div>
            <div class="loader-section section-left"></div>
            <div class="loader-section section-right"></div>
            <div class="load_title">loading hoveralls demo<br>
                <span>build 2.6</span></div>
        </div>



        <!-- HEADER GRAPHICS -->
        <div id="header">
            <div id="headercenter">
                <div id="version">v2.6</div>
                <div id="title">
                    HoverAlls<br />
                </div>
            </div>
        </div>
        <div class="title_wrapper">
            <div class="featureheadertop">
                <h1>
                    <a href="#captionsmark" id="scrolltoCaptions">Captions.</a>&nbsp;&nbsp; 
	    
                    <a href="#lightboxesmark" id="scrolltoLightboxes">Lightboxes.</a>&nbsp;&nbsp; 
	    
                    <a href="#lightboxesmark" id="scrolltoTooltips">Tooltips.</a>&nbsp;&nbsp; 
		   
                    <a href="#panelsmark" id="scrolltoPanels">Panels.</a>&nbsp;&nbsp; 
    	
                    <a href="#panelsmark" id="scrolltoScrollers">Scrollers.</a>
                </h1>
            </div>
        </div>

        <!-- CTA Bar - Set "white", "accent" or "dark" -->
        <div class="home-cta-bar-container accent">
            <div class="maincontent">
                <div class="home-cta-bar">
                    <div class="text">
                        The lightweight effects framework for all your mouse adventures.
					
                    </div>
                    <div class="home-cta-bar-button">
                        <a class="button transparent" href="http://codecanyon.net/item/hoveralls-hover-effects-framework/1367456?ref=Crusader12"><i class="fa fa-desktop"></i>Purchase HoverAlls</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- END CTA Bar -->
        <div class="maincontent">



            <!-- INTRO TEXT -->
            <div id="introbox">
                <p class="intro">
                    <span class="opener">Simplicity.</span> Adding animation effects to your pages has never been easier or faster. 
With HoverAlls you can create ToolTips, Scrollers, News Tickers, Captions, Lightboxes, Sliding Panels, Alerts and much more - <strong>all by using 
the same methods and settings</strong>. HoverAlls is extremely flexible, allowing you to <strong>write HTML however you feel comfortable</strong>.
Without the need for a specific structure, HoverAlls removes the possibility of wasting time trying to make sense of plugin naming conventions,
or lengthy CSS. No knowledge of Javascript, CSS3 or jQuery is required and separate walkthroughs and tutorials are provided for each type of animation effect.</p>
            </div>





            <div class="featureheader" id="captionsmark">
                <h1 style="float: left;">Captions, Galleries & Navigation</h1>
                <div id="code1" class="alert"
                    data-hoveralls='{
			"speed":"1550,1200",
			"text_class":"hv_lightbox_txt5",
			"overlay_class":"hv_lightbox_overlay5",
			"coords":"0,0||0,0||0,0",
			"text_coords":"5,5||5,5||5,5",
			"opacity":"0,1", 
			"target_container":"hv_lightbox_bg5",
			"overlay_speed":"700,800",
			"html_mode":"#lightbox5html"
    	}'>
                    Image Usage
                </div>
            </div>




            <!-- CAPTIONS -->
            <div class="effect">
                <img src="buttonhover02style/img/mouse1.png" class="caption" alt="Highly Customizable" rel="http://codecanyon.net/item/hoveralls-v13/1367456?ref=Crusader12"
                    data-hoveralls='{
			"bg_class":"hv_caption_bg1",        
            "text_class":"hv_caption_txt1",
			"coords":"0,100||0,75||0,100",
			"text_coords":"0,50||0,0||0,50"}' />
            </div>

            <div class="effect">
                <img src="buttonhover02style/img/mouse2.png" class="caption" alt="Simple, Easy and Fast" rel="http://codecanyon.net/item/hoveralls-v13/1367456?ref=Crusader12"
                    data-hoveralls='{
			"bg_class":"hv_caption_bg2",        
            "text_class":"hv_caption_txt2",
			"coords":"0,-100||0,0||0,-100",       	
			"text_coords":"0,-50||0,0||0,-50"}' />
            </div>

            <div class="effect">
                <img src="buttonhover02style/img/mouse3.png" class="caption" alt="There's no need to change the way you write HTML or CSS. HoverAlls is flexible, and works around your code." rel="http://codecanyon.net/item/hoveralls-v13/1367456?ref=Crusader12"
                    data-hoveralls='{
    		"bg_class":"hv_caption_bg3",
			"text_class":"hv_caption_txt3",
            "coords":"100,0||0,0||100,0",
			"text_coords":"100,0||0,0||100,0"}' />
            </div>

            <div class="effect">
                <img src="buttonhover02style/img/mouse4.png" class="caption" alt="HoverAlls comes with minimal code. You don't have to make sense of long stylesheets or odd naming conventions. " rel="http://codecanyon.net/item/hoveralls-v13/1367456?ref=Crusader12"
                    data-hoveralls='{
        	"bg_class":"hv_caption_bg4",
			"text_class":"hv_caption_txt4",
			"coords":"-100,0||0,0||-100,0",
			"text_coords":"-100,0||0,0||-100,0",
			"link_control":"true,_blank"}' />
            </div>

            <div class="clear"></div>
            <div id="breaker"></div>

            <div class="effect">
                <img src="buttonhover02style/img/mouse7.png" class="caption" alt="Animate Text" rel="http://codecanyon.net/item/hoveralls-v13/1367456?ref=Crusader12"
                    data-hoveralls='{
			"coords":"100,65||10,65||100,65",
			"text_coords":"100,0||10,0||100,0",
            "speed":"250,200",
            "text_speed":"500,150",
			"bg_class":"hv_caption_bg5",
			"text_class":"hv_caption_txt5",
			"container_class":"hv_caption_cont5",
			"link_control":"false,_blank"}' />
            </div>

            <div class="effect">
                <img src="buttonhover02style/img/mouse6.png" class="caption" rel="http://codecanyon.net/item/hoveralls-v13/1367456?ref=Crusader12"
                    data-hoveralls='{
			"bg_class":"hv_caption_bg6",
			"opacity":"0,1",
            "speed":"500,500"}' />
            </div>

            <div class="effect">
                <img src="buttonhover02style/img/mouse8.png" class="caption" rel="http://codecanyon.net/item/hoveralls-v13/1367456?ref=Crusader12"
                    data-hoveralls='{
			"bg_class":"hv_caption_bg7", 
			"coords":"0,50||0,10||0,50",
			"opacity":"1,0",
            "speed":"500,500",
			"link_control":"true,_blank"}' />
            </div>

            <div class="effect">
                <img src="buttonhover02style/img/mouse5.png" class="caption" alt="A sophisticated, yet simple Coordinates System allows you to set animation points." rel="http://codecanyon.net/item/hoveralls-v13/1367456?ref=Crusader12"
                    data-hoveralls='{
			"coords":"100,100||-140,-140||-300,-300",
			"text_coords":"50,50||10,10||-150,-150",
			"speed":"350,500",
			"text_speed":"500,500",
			"bg_class":"hv_caption_bg8",
			"text_class":"hv_caption_txt8",
            "passthrough":true}' />
            </div>

            <div class="clear"></div>
            <div id="breaker"></div>

            <div class="effect">
                <img src="buttonhover02style/img/mouse9.png" class="caption" alt="Perfect Segues" rel="http://codecanyon.net/item/hoveralls-v13/1367456?ref=Crusader12"
                    data-hoveralls='{
        	"speed":"300,600",
            "text_speed":"250,600",
        	"coords":"0,0||0,0||0,0",
			"text_coords":"0,-20||0,70||0,120",
			"text_opacity":"0,1",
			"bg_class":"hv_caption_bg9",            
			"text_class":"hv_caption_txt9",
            "passthrough":true}' />
            </div>

            <div class="effect">
                <img src="buttonhover02style/img/mouse11.png" class="caption" rel="http://codecanyon.net/item/hoveralls-v13/1367456?ref=Crusader12"
                    data-hoveralls='{
			"coords":"-100,100||-5,5||-100,100",
			"bg_class":"hv_caption_bg10",
			"opacity":"0,1"}' />
            </div>

            <div class="effect">
                <img src="buttonhover02style/img/mouse10.png" class="caption" alt="Full Screen" rel="http://codecanyon.net/item/hoveralls-v13/1367456?ref=Crusader12"
                    data-hoveralls='{
        	"speed":"150,150",
            "text_speed":"250,250",
			"opacity":"1,0.85",
			"text_opacity":"0,1",
        	"bg_class":"hv_caption_bg11",            
			"text_class":"hv_caption_txt11",
			"coords":"-50,5||0,5||-50,5",
			"text_coords":"100,11||30,11||100,11"}' />
            </div>

            <div class="effect">
                <img src="buttonhover02style/img/mouse12.png" class="caption" alt="View Image" rel="http://codecanyon.net/item/hoveralls-v13/1367456?ref=Crusader12"
                    data-hoveralls='{
        	"coords":"0,0||0,0||0,0",
			"text_coords":"47,100||47,87||47,100",            
			"opacity":"0,0.95",
			"bg_class":"hv_caption_bg12",
			"text_class":"hv_caption_txt12", 
            "text_opacity":"1,1"}' />
            </div>

            <div class="clear"></div>



            <!-- COORDINATES -->
            <div id="introbox">
                <p class="intro"><span class="opener">Coordinates.</span> A simple coordinates system makes creating complex Animation Paths easy. A single HoverAlls setting allows you to define the Start, End and Return Positions. <strong>( "coords" : " StartX, StartY || EndX, EndY || ReturnX, ReturnY " )</strong>. With specific coordinates, you are in full control over where the animation occurs. You can also define an Animation Path for the Text Element using the "text_coords" setting - the exact same way.</p>
            </div>
            <div class="featureheader" id="captionsmark">
                <h1 style="width: 100%;">Build it all the same way... using your HTML and your CSS</h1>
            </div>

            <div class="effect">
                <img src="buttonhover02style/img/mouse1.png" class="multiple" alt="Image"/>
            </div>

            <div class="effect">
                <img src="buttonhover02style/img/mouse2.png" class="multiple" alt="Image with Link" rel="http://codecanyon.net/item/hoveralls-v13/1367456?ref=Crusader12"/>
            </div>

            <div class="effect">
                <div style="width: 230px; height: 215px; background-image: url('buttonhover02style/img/mouse3.png');" class="multiple">
                    <p class="hv_text">DIV</p>
                </div>
            </div>

            <div class="effect">
                <div style="width: 230px; height: 215px; background-image: url('buttonhover02style/img/mouse6.png');" class="multiple">
                    <p class="hv_text">DIV with Link</p>
                    <a href="http://www.codecanyon.net/" class="hv_link"></a>
                </div>
            </div>

            <div class="clear"></div>


            <!-- CLASSES -->
            <div id="introbox">
                <p class="intro">
                    <span class="opener">Classes.</span>
                    Easily setup and configure animation effects on multiple elements at once - then use the data-HoverAlls attribute to customize 
        each effect individually. The two left elements above are images and the two right are DIVs with background images. Weighing 
        in under 10K, HoverAlls may possibly be lighter than writing animation-specific CSS.
                </p>
            </div>


            <!-- LIGHTBOXES -->
            <div class="featureheader" id="lightboxesmark" style="margin-top: 60px;">
                <h1 style="float: left;">Lightboxes, Alerts, Popups & Tooltips</h1>
                <div id="code2" class="alert"
                    data-hoveralls='{
			"speed":"1550,1200",
			"coords":"0,0||0,0||0,0",
			"text_coords":"5,5||5,5||5,5",
			"opacity":"0,1", 
			"target_container":"hv_lightbox_bg6",
			"text_class":"hv_lightbox_txt6",
			"overlay_class":"hv_lightbox_overlay6",
            "overlay_speed":"700,800",
			"html_mode":"#lightbox6html"}'>
                    Injecting HTML
	
                </div>
            </div>

            <div class="effect">
                <img src="buttonhover02style/img/mouse13a.png" class="lightbox"
                    data-hoveralls='{
			"text_class":"lightboxText1",
			"target_container":"hv_lightbox_bg1",
			"overlay_class":"hv_lightbox_overlay1",
			"link_control":"true,_blank",
			"coords":"-20,-50||5,10||-20,-50",
			"text_coords":"5,-100||4,5||5,-100",
			"opacity":"0,1", 
			"speed":"1200,500",
            "text_speed":"500,2000",
            "overlay_speed":"500,1000",
            "text_effect":"linear,linear",
			"html_mode":"#lightbox1html"}' />
            </div>

            <div class="effect">
                <img src="buttonhover02style/img/mouse14a.png" class="lightbox"
                    data-hoveralls='{
			"target_container":"hv_lightbox_bg2",
			"html_mode":"#lightbox2html",
			"text_class":"hv_lightbox_txt2",
			"overlay_class":"hv_lightbox_overlay2",
			"coords":"-100,150||30,20||-100,150",
			"text_coords":"35,-100||32,27||35,-100",
			"opacity":"0,1",
            "speed":"800,800",
            "text_speed":"1000,200",
            "overlay_speed":"300,300"}' />
            </div>

            <div class="effect">
                <img src="buttonhover02style/img/mouse15a.png" class="lightbox"
                    data-hoveralls='{
			"overlay_class":"hv_lightbox_overlay1",
			"link_control":"true,_blank",
			"coords":"20,-100||20,30||20,-100",
			"text_coords":"100,15||47,5||100,15",
			"opacity":"0,1",
			"text_opacity":"0,1",
			"overlay_speed":"800,1000",	
			"target_container":"hv_lightbox_bg3",
			"html_mode":"#lightbox3html",
            "speed":"1000,1000",
            "text_speed":"1000,1000",
            "center_lightbox":"true,false"}' />
            </div>

            <div class="effect">
                <img src="buttonhover02style/img/mouse16a.png" class="alert" alt="Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor" rel="http://codecanyon.net/item/hoveralls-v13/1367456?ref=Crusader12"
                    data-hoveralls='{
			"target_container":"hv_lightbox_bg4",
			"overlay_class":"hv_lightbox_overlay2",
            "coords":"0,-100||0,0||0,-100",
            "text_coords":"0,20||0,20||0,20",
			"html_mode":"#lightbox4html"}' />
            </div>

            <div class="clear"></div>
            <div id="breaker"></div>

            <div class="effect">
                <img src="buttonhover02style/img/mouse7.png" class="tooltip" alt="Making Tooltips has never been easier, now there's no excuse to leave them out." rel="http://codecanyon.net/item/hoveralls-v13/1367456?ref=Crusader12"
                    data-hoveralls='{
        	"speed":"500,250",
			"coords":"10,20||50,-20||10,20",
			"bg_class":"hv_tooltip_bg1",
			"text_class":"hv_tooltip_txt1"}' />
            </div>

            <div class="effect">
                <img src="buttonhover02style/img/mouse3.png" class="tooltip" alt="Make every tooltip unique." rel="http://codecanyon.net/item/hoveralls-v13/1367456?ref=Crusader12"
                    data-hoveralls='{
	        "coords":"-7.5,-5||-7.5,73||-7.5,-5",
			"bg_class":"hv_tooltip_bg2",
			"text_class":"hv_tooltip_txt2",
			"link_control":"true,_blank"}' />
            </div>

            <div class="effect">
                <img src="buttonhover02style/img/mouse9.png" class="tooltip" alt="Woah. This looks pretty cool, but I'm still watching out for that cat." rel="http://codecanyon.net/item/hoveralls-v13/1367456?ref=Crusader12"
                    data-hoveralls='{
			"coords":"0,50||85,-10||0,50",
			"text_coords":"100,0||-1000,0||100,0",
            "text_speed":"300,250",
            "text_effect":"linear,linear",
			"bg_class":"hv_tooltip_bg3",
			"text_class":"hv_tooltip_txt3",
			"ticker_count":3,    
			"text_speed":"15000,250"}' />
            </div>

            <div class="effect">
                <img src="buttonhover02style/img/mouse4.png" class="tooltip" rel="http://codecanyon.net/item/hoveralls-v13/1367456?ref=Crusader12"
                    data-hoveralls='{
			"coords":"-45,20||-45,3||-45,20",
            "bg_class":"hv_tooltip_bg4",
			"html_mode":"#tooltipHTML4"}' />
            </div>

            <div class="clear"></div>

            <!-- TARGET CONTAINERS -->
            <div id="introbox">
                <p class="intro">
                    <span class="opener">Target Containers.</span>A powerful feature of HoverAlls is the ability to 
		select your Target Container. HoverAlls effects don't need to occur on the object being hovered, touched or clicked. 
		The Target Container setting lets you select where the animation occurs. 
		Additionally, the HTML Mode setting allows for injecting your own custom HTML into any HoverAlls effect - and optionally animate it.
                </p>
            </div>


            <!-- SLIDERS, TICKERS, SCROLLERS -->
            <div class="featureheader" id="panelsmark">
                <h1>Sliding Panels, Scrollers, & Tickers</h1>
            </div>

            <div class="effect">
                <img src="buttonhover02style/img/mouse4.png" class="panel" alt="This is a basic example of a sliding panel using a quick HoverAlls setting." rel="http://codecanyon.net/item/hoveralls-v13/1367456?ref=Crusader12"
                    data-hoveralls='{
			"coords":"0,-20||0,0||0,-20",
			"text_coords":"0,-100||0,0.5||0,-100",
			"text_class":"hv_panel_txt1",
            "target_container":"hv_panel_bg1"}' />
            </div>

            <div class="effect">
                <img src="buttonhover02style/img/mouse10a.png" class="panel"
                    data-hoveralls='{
			"speed":"250,250",
			"coords":"-20,25||-2,25||-20,25",
			"opacity":"0,1", 
			"target_container":"hv_panel_bg2",
			"html_mode":"#hoverfollow", 				
			"on_click":true}' />
            </div>

            <div id="slidingpanel3html">
                <p class="hv_text">
                    <span class="title">Sliding Panels.</span><br>
                    <span class="subtitle">Quickly build Login Panels, Tours, Social Media Panels, etc.</span><br>
                    <br>
                    <span>You can place your text <span style="font-style: italic">the same as any other HoverAlls effect</span>, or you can opt to use the HTML Mode setting. Using this setting allows you to build your Sliding Panel by writing HTML however you like, wherever you like. Pass the ID of your code to the setting to have HoverAlls automatically move your HTML into the animation container.</span>
                </p>
                <a href="http://www.codecanyon.net/" target="_blank" class="hv_link"></a>
            </div>

            <div class="effect">
                <img src="buttonhover02style/img/mouse12.png" class="panel" alt="Creating Sliding Panels is easy - and done the exact same way as everything else. HoverAlls gives you complete control over the position, movement, timing, transitions, style and much more.  " rel="http://codecanyon.net/item/hoveralls-v13/1367456?ref=Crusader12"
                    data-hoveralls='{
        	"speed":"500,500",
            "text_speed":"1000,1000",
			"coords":"10,-100||10,-5||10,-100",
			"text_coords":"0,-200||0,22||0,-200",
			"text_class":"hv_panel_txt3",
			"target_container":"hv_panel_bg3",
			"opacity":"1,1", 
			"html_mode":"#slidingpanel3html"}' />
            </div>

            <div class="effect">
                <img src="buttonhover02style/img/mouse1a.png" class="panel" alt="Lorem ipsum dolor sit"
                    data-hoveralls='{
			"speed":"500,400",
            "text_speed":"1200,200",
			"coords":"0,-100||0,0||0,-100",
			"text_coords":"0,-80||0,0||0,-80",	
			"opacity":"0.5,1",
			"on_click":true,
			"html_mode":"#html5inject", 
			"target_container":"hv_panel_bg4", 
			"link_control":"true,_blank",
			"text_opacity":"0,1", 
			"overlay":true}' />
            </div>

            <div class="clear"></div>
            <div id="breaker"></div>

            <div class="effect">
                <img src="buttonhover02style/img/mouse3.png" class="ticker" alt="Easily make scrollers inside your lightboxes, captions, tooltips and target containers." rel="http://codecanyon.net/item/hoveralls-v13/1367456?ref=Crusader12"
                    data-hoveralls='{
			"bg_class":"hv_ticker_bg1",
			"text_class":"hv_ticker_txt1",
			"opacity":"0,1",
			"coords":"0,100||0,80||0,100",
			"text_coords":"100,0||-1500,0||100,0",
			"text_speed":"50000,500",
            "text_effect":"linear,linear"}' />
            </div>

            <div class="effect">
                <img src="buttonhover02style/img/mouse2.png" class="ticker" alt="HoverAlls" rel="http://codecanyon.net/item/hoveralls-v13/1367456?ref=Crusader12"
                    data-hoveralls='{
			"bg_class":"hv_ticker_bg2",
			"text_class":"hv_ticker_txt2",
			"opacity":"0,0.5",
			"coords":"0,0||0,0||0,0",
			"text_coords":"100,12||-500,12||100,12",
			"text_speed":"20000,600",
            "text_effect":"linear,linear"}' />
            </div>

            <div class="effect">
                <img src="buttonhover02style/img/mouse11.png" class="ticker" alt="Position and style your scroller however you like." rel="http://codecanyon.net/item/hoveralls-v13/1367456?ref=Crusader12"
                    data-hoveralls='{
			"speed":"350,250",
			"bg_class":"hv_ticker_bg3",
			"text_class":"hv_ticker_txt3",
			"opacity":"0,1",
			"coords":"100,10||20,10||100,10",
			"text_coords":"100,0||-500,0||100,0",
			"text_speed":"15000,600",
            "text_effect":"linear,linear"}' />
            </div>

            <div class="effect">
                <img src="buttonhover02style/img/mouse8.png" class="ticker" alt="This example uses a scroller inside a target div. This can be called on page load and is ideal for news, articles, announcements, etc."
                    data-hoveralls='{
			"text_class":"hv_ticker_txt4",
			"bg_class":"hv_ticker_bg4",
			"opacity":"1,1",
			"coords":"0,0||0,0||0,0",
			"text_coords":"99,0||0,0||99,0",
			"text_speed":"17000,600",
            "text_effect":"linear,linear",
			"target_container":"scrolltarget", 
			"ticker_count":3  }' />
            </div>

            <div class="clear"></div>
            <div class="scrolltarget"></div>
            <div class="clear"></div>

            <!-- EVENTS -->
            <div id="introbox">
                <p class="intro">
                    <span class="opener">Powerful.</span>
                    Any HoverAlls effect can be triggered by <em>Click</em>, <em>Touch</em>, <em>Hover</em>, <em>Page Load</em> or when <em>Scrolled</em>
                    to a specific element - for unparalleled animation flexibility. All effects and events have been optimized for mobile devices.
	    Version 2.6 adds new features including chainable 2D/3D animations and text crawlers.
                </p>
            </div>

            <div class="featureheader" style="margin-top: 55px; margin-bottom: 20px;">
                <h1>30 Simple Settings</h1>
            </div>

            <div class="effect">
                <img src="buttonhover02style/img/mousescroll.png" class="panel" alt="Trigger any type of HoverAlls effect on Scroll" rel="http://codecanyon.net/item/hoveralls-v13/1367456?ref=Crusader12"
                    data-hoveralls='{
			"coords":"0,-20||0,0||0,-20",
			"text_coords":"0,-100||0,0.5||0,-100",
			"text_class":"hv_panel_txt1",
            "target_container":"hv_panel_bg1",
            "on_scroll":true}'>
            </div>

            <div class="effect">
                <img src="buttonhover02style/img/mouse3.png" class="caption" alt="Now with HoverAlls 2.6 you can Flip, Rotate, Scale or Skew any type of effect using easy settings." rel="http://codecanyon.net/item/hoveralls-v13/1367456?ref=Crusader12"
                    data-hoveralls='{
    		"bg_class":"hv_caption_bg3",
			"text_class":"hv_caption_txt3",
            "coords":"0,0||0,0||0,0",
			"text_coords":"100,0||0,0||100,0",
            "flip":"0,0||0,90",
            "opacity":"1,1"}'>
            </div>

            <div class="effect">
                <img src="buttonhover02style/img/mouse2.png" class="caption" alt="Only 10k" rel="http://codecanyon.net/item/hoveralls-v13/1367456?ref=Crusader12"
                    data-hoveralls='{
			"bg_class":"hv_caption_bg13",        
            "text_class":"hv_caption_txt13",
			"coords":"80,-40||10,10||80,-40",
			"text_coords":"0,-40||2,-2||0,-40",
            "text_speed":"1000,200",
            "rotate":"0||0",
            "text_flip":"0,0||0,180",
            "opacity":"1,1"}'>
            </div>


            <div class="effect">
                <img src="buttonhover02style/img/mouse7.png" class="tooltip" alt="a long time ago, in a galaxy far, far away..." rel="http://codecanyon.net/item/hoveralls-v13/1367456?ref=Crusader12"
                    data-hoveralls='{
        	"speed":"500,250",
			"coords":"10,20||50,-20||10,20",
            "text_coords":"0,70||0,-110||0,70",
            "text_speed":"8000,0",
            "text_effect":"linear,linear",
			"bg_class":"hv_tooltip_bg5",
			"text_class":"hv_tooltip_txt4",
            "rotate":"0||90",
            "flip":"30,0||0,90",
            "text_opacity":"1,1"}'>
            </div>

            <div class="clear"></div>


            <!-- PRESETS -->
            <div id="introbox">
                <p class="intro">
                    <span class="opener">Design Faster.</span>
                    <strong>HoverAlls is built to decrease production time by making the approach to every obstacle the same.</strong> Version 2.6 is a completely re-written free upgrade, introducing some exciting new features as well as full hardware acceleration, responsive animations and a 55% file reduction - possibly making HoverAlls the lightest all-in-one solution.
                </p>
            </div>
            <%--<div class="clear"></div>--%>
        </div>

        <%--<div class="clear"></div>--%>

        <!-- FOOTER -->


<%--        <div id="footer">
            <div class="bottomshadow">
                <p>Tested on real-world devices for actual performance metrics</p>
            </div>

            <div id="footercenter">
                <div id="endtext">
                    <p class="support">Support</p>
                    <p class="intro">
                        HoverAlls has been rigorously tested in multiple environments using jQuery 1.7.1+. 
    Interactive documentation is included <em>(plus a little introduction to jQuery for those that are interested)</em>. 
    Each demo on this page is provided as a simple HTML example for the easist approach possible.
	Support questions and feature requests will be answered as soon as possible. 
	No knowledge of Javascript or jQuery is necessary, however basic HTML and CSS experience is recommended. 
    Please rate this plugin and provide feedback for features in the next version. Mice photos courtesy of: <a href="http://www.istockphoto.com/user_view.php?id=2015267" target="_blank">Pakhnyushchyy</a>. Cat photo courtesy of: <a href="http://us.fotolia.com/p/3504" target="_blank">Eric Isselee</a>.
                    </p>
                </div>
                <div id="footermouse"></div>
            </div>
        </div>--%>


        <!-- /FOOTER -->
        <!-- HTML INJECTIONS GO DOWN AT THE BOTTOM TO AVOID FLASHING ON LOAD -->
        <!-- CODE EXAMPLE 1 -->
        <div id="lightbox5html">
            <div class="imagesheader"></div>
            <p class="hv_text">
                <span>Below is a demonstration of how to implement HoverAlls on an image. 
    This is the exact same way to build any other HoverAlls effect &#8212; <em>just change the HoverAlls settings to tell HoverAlls what you want</em>.</span><br />
                <br />
                <span class="codethick">1. HTML</span><br />
                <br>
                <span class="showcode">&lt;img src="../to/image.jpg" <span style="background-color: #e1f2ff">alt="Your Caption Text"</span>
                    <span style="background-color: #feffe1;">rel="http://www.yourlink.com"</span>
                    <span style="background-color: #e1ffec;">class="caption"</span> /&gt;</span><br />
                <br>
                Use the ALT attribute to quickly insert your text and the REL attribute for your link.<br />
                <br />

                <span class="codethick">2. Call HoverAlls</span><br />
                <br>
                <span class="showcode">$('<span>.caption</span>').HoverAlls({<br />
                    <span style="color: #a1a1a1; margin-left: 30px;">// Sets Animation Path of Container (in %)</span><br>
                    <span class="hv_codesetting">"coords" : "StartX,StartY || EndX,EndY || ReturnX,ReturnY",</span><br>
                    <span style="color: #a1a1a1; margin-left: 30px;">// Sets Animation Path of Text (in %)</span><br>
                    <span class="hv_codesetting">"text_coords" : "StartX,StartY || EndX,EndY || ReturnX,ReturnY",</span><br>
                    <span style="color: #a1a1a1; margin-left: 30px;">// Dynamically Assign Class ".myCaption" to Caption Background</span><br>
                    <span class="hv_codesetting">"bg_class" : "myCaption",</span><br>
                    <span style="color: #a1a1a1; margin-left: 30px;">// Dyanically Assign Class ".myCaptionText" to Caption Text</span><br>
                    <span class="hv_codesetting">"text_class" : "myCaptionText"</span><br>
                    });</span><br />
            </p>
        </div>


        <div id="lightbox1html">
            <p class="hv_text">
                <span class="title">Lightboxes</span><br>
                <br>
                <span class="sub">Creating a Popup is as simple as creating a Caption - and done the same way...</span><br>
                <br>
                <span>There are additional settings available when creating Modals, Lightboxes or Alerts. This basic modal is positioned using the Coordinates System <span style="font-style: italic">(like any other HoverAlls effect)</span>. Rather than being centered on the screen, it's positioned according to the Start, End and Return Coordinates. If you like, you can use a simple setting to center the modal on screen, but still keep control over the starting position.</span>
            </p>
            <a class="hv_link" href="http://codecanyon.net/item/hoveralls-v13/1367456?ref=Crusader12" target="_blank"></a>
        </div>

        <div id="lightbox2html">
            <p class="hv_text"><span class="pure">Extreme</span><br />
                Customization.</p>
            <a href="http://codecanyon.net/item/hoveralls-v13/1367456?ref=Crusader12" class="hv_link" target="_blank"></a>
        </div>

        <div id="lightbox3html">
            <p class="hv_text"></p>
        </div>

        <div id="lightbox4html">
            <p class="hv_text close_alert">Run away!</p>
        </div>

        <div id="tooltipHTML4">
            <div id="map"></div>
            <div class="maptext">Write a block of HTML and pass the container's ID to <a href="http://codecanyon.net/item/hoveralls-v21/1367456?ref=Crusader12" target="_blank">HoverAlls</a> to automatically inject it into your HoverAlls effect. You can also animate the HTML after injecting it into the effect.</div>
        </div>


        <div id="html5inject">
            <div class="html5image divheader"></div>
            <p class="hv_text">
                <span class="htmlinjectheader">HTML Mode</span><br />
                This setting will move a block of code into the animation container, 
        	where you can then use the normal HoverAlls Text Animation Settings to manipulate it. 
	        In this example, the effect is defined as a Sliding Panel. 
    	    A separate DIV <em>(containing this text and the HTML5 Logo)</em> is added anywhere on the page. 
        	Supplying the ID of this DIV to the HTML Mode setting automatically moves it into the animation container.<br>
            </p>
            <a class="close_panel" href="#">Close</a>
            <a href="http://www.codecanyon.net/" class="hv_link"></a>
        </div>

        <div id="hoverfollow">
            <div class="innerwrapper">
                <div class="facebook"></div>
                <div class="linkedin"></div>
                <div class="stumbleupon"></div>
                <div class="twitter"></div>
                <div class="youtube"></div>
                <div class="digg"></div>
                <div class="delicious"></div>
            </div>
        </div>



        <!-- CODE EXAMPLE 2 -->
        <div id="lightbox6html">
            <div class="imagesheader"></div>
            <p class="hv_text">
                <span>Optionally write HTML anywhere on the page, then inject it into any HoverAlls Animation for advanced effects. Quickly add text and links using the <em>"hv_link"</em> or <em>"hv_text"</em> classes as shown below.</span><br />
                <br />
                <span class="codethick">1. HTML</span><br />
                <br>
                <span class="showcode">&lt;div <span>id="injectHTML"</span>&gt;<br />
                    <span style="margin-left: 30px">&lt;p class="hv_text"&gt; Animate this text too! &lt;/p&gt;</span><br />
                    <span style="margin-left: 30px">&lt;a class="hv_link" href="http://www.yourlink.com"&gt; Link &lt;/a&gt;</span><br />
                    &lt;/div&gt;</span><br />
                <br />
                <br>

                <span class="codethick">2. Call HoverAlls</span><br />
                <br>
                <span class="showcode">$('<span>.panel</span>').HoverAlls({<br />
                    <span style="color: #a1a1a1; margin-left: 30px;">// Define Animation as a Sliding Panel</span><br>
                    <span class="hv_codesetting">"mode" : "panel",</span><br>
                    <span style="color: #a1a1a1; margin-left: 30px;">// Sets Animation Path (in %)</span><br>
                    <span class="hv_codesetting">"coords" : "StartX,StartY || EndX,EndY || ReturnX,ReturnY",</span><br>
                    <span style="color: #a1a1a1; margin-left: 30px;">// Move the Above HTML into the Sliding Panel</span><br>
                    <span class="hv_codesetting">"html_mode" : "#injectHTML"</span><br>
                    });</span><br />
                <br>
                Turn this into a Tooltip using <span style="font-style: italic;">("mode" : "tooltip")</span>. 
              Effortlessly convert the HoverAlls Text into a Scroller (inside any effect) by simply adding ("ticker_mode":true)
            </p>

        </div>


    </form>
</body>
</html>
