<%@ Page Language="C#" AutoEventWireup="true" CodeFile="layout01ppp.aspx.cs" Inherits="layout01ppp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="layout01ppstyle/cfm/css/normalizeee0f.css?23789456" rel="stylesheet" />
    <link href="layout01ppstyle/cfm/css/standardee0f.css?23789456" rel="stylesheet" />
    <link href="layout01ppstyle/cfm/css/responsive59bc.css?23574662" rel="stylesheet" />
    <link href="layout01ppstyle/cfm/js/mmenufd1a.css?23181697" rel="stylesheet" />
    <%--<link href="layout01ppstyle/cfm/js/fancybox/jquery.fancybox-1.3.4.css" rel="stylesheet" type="text/css" media="screen" />--%>
    <link href='http://fonts.googleapis.com/css?family=Courgette' rel='stylesheet' type='text/css' />

   <%-- <link rel="stylesheet" href="layout01ppstyle/cfm/js/fontawesome/css/font-awesome.css" />--%>
    <script type="text/javascript" src="layout01ppstyle/ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
   <%-- <script type="text/javascript" src="layout01ppstyle/cfm/js/page_link_scroll/jquery.easingscroll.js"></script>--%>
    <script type="text/javascript" src="layout01ppstyle/cfm/js/css_browser_selector.js"></script>
    <%--<script type="text/javascript" src="layout01ppstyle/cfm/js/jquery.mmenu.min.js"></script>--%>
<%--    <script type="text/javascript" src="layout01ppstyle/cfm/js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>--%>
    <script type="text/javascript" src="layout01ppstyle/cfm/js/jquery.champagne.min.js"></script>

    <style>
        body{
            /*background-image: url("layout50style/body_bg.gif");*/
            
        }
        .showcase{
            /*width:2041px;*/
            max-width:2041px;
        }

    </style>



    <script type="text/javascript">
        $(function () {

            //slider js
            function extra_hide() {
                $(".header_bg").hide();
                $(".desk_msg").hide();
            }


            var w = $(window).width();
            var w_m = 768;
            if (w > w_m) {

                $(".topbtn_dtm").hover(
                    function () {
                        if ($(".topimg1").css("display") == "none") {
                            $(".topimg").fadeOut(350);
                            $(".topimg1").fadeIn(350);
                            $(".topbtn_title").not(this.children).css("color", "#ffffff");
                            $(this).children(".topbtn_title").css("color", "#f29556");

                            $(".topbtn_icon").not(this.children).removeClass("topbtn_icon_on");
                            $(this).children(".topbtn_icon").addClass("topbtn_icon_on");

                            $(".topbtn_arrow").not(this.children).animate({ top: "10px" }, 200);
                            $(this).children(".topbtn_arrow").animate({ top: "-10px" }, 200);
                            $(".siteid").removeClass("site_id_bk");
                            $(".siteid").addClass("site_id_wht");
                            $(".gmenu").removeClass("gmenu_bk");
                            $(".gmenu").addClass("gmenu_wht");
                            extra_hide();
                        }
                    },
                    function () {
                    });

                $(".topbtn_fxbgm").hover(
                    function () {
                        if ($(".topimg2").css("display") == "none") {
                            $(".topimg").fadeOut(350);
                            $(".topimg2").fadeIn(350);
                            $(".topbtn_title").not(this.children).css("color", "#ffffff");
                            $(this).children(".topbtn_title").css("color", "#cfc63a");

                            $(".topbtn_icon").not(this.children).removeClass("topbtn_icon_on");
                            $(this).children(".topbtn_icon").addClass("topbtn_icon_on");

                            $(".topbtn_arrow").not(this.children).animate({ top: "10px" }, 200);
                            $(this).children(".topbtn_arrow").animate({ top: "-10px" }, 200);
                            $(".siteid").removeClass("site_id_wht");
                            $(".siteid").addClass("site_id_bk");
                            $(".gmenu").removeClass("gmenu_wht");
                            $(".gmenu").addClass("gmenu_bk");
                            extra_hide();
                        }
                    },
                    function () {

                    });

                //$(".topbtn_mobile").hover(
                //    function () {
                //        if ($(".topimg3").css("display") == "none") {
                //            $(".topimg").fadeOut(350);
                //            $(".topimg3").fadeIn(350);
                //            $(".topbtn_title").not(this.children).css("color", "#ffffff");
                //            $(this).children(".topbtn_title").css("color", "#88c538");

                //            $(".topbtn_icon").not(this.children).removeClass("topbtn_icon_on");
                //            $(this).children(".topbtn_icon").addClass("topbtn_icon_on");

                //            $(".topbtn_arrow").not(this.children).animate({ top: "10px" }, 200);
                //            $(this).children(".topbtn_arrow").animate({ top: "-10px" }, 200);
                //            $(".siteid").removeClass("site_id_wht");
                //            $(".siteid").addClass("site_id_bk");
                //            $(".gmenu").removeClass("gmenu_wht");
                //            $(".gmenu").addClass("gmenu_bk");
                //            extra_hide();
                //        }
                //    },
                //    function () {

                //    });

                //$(".topbtn_character").hover(
                //    function () {
                //        if ($(".topimg4").css("display") == "none") {
                //            $(".topimg").fadeOut(350);
                //            $(".topimg4").fadeIn(350);
                //            $(".topbtn_title").not(this.children).css("color", "#ffffff");
                //            $(this).children(".topbtn_title").css("color", "#6abfc4");

                //            $(".topbtn_icon").not(this.children).removeClass("topbtn_icon_on");
                //            $(this).children(".topbtn_icon").addClass("topbtn_icon_on");

                //            $(".topbtn_arrow").not(this.children).animate({ top: "10px" }, 200);
                //            $(this).children(".topbtn_arrow").animate({ top: "-10px" }, 200);
                //            $(".siteid").removeClass("site_id_bk");
                //            $(".siteid").addClass("site_id_wht");
                //            $(".gmenu").removeClass("gmenu_bk");
                //            $(".gmenu").addClass("gmenu_wht");
                //            extra_hide();
                //        }
                //    },
                //    function () {

                //    });

                $(".topbtn_extra").hover(
                    function () {
                        if ($(".topimg5").css("display") == "none") {
                            $(".topimg").fadeOut(350);
                            $(".topimg5").fadeIn(350);
                            $(".topbtn_title").not(this.children).css("color", "#ffffff");
                            $(this).children(".topbtn_title").css("color", "#e98a1b");
                            $(".topbtn_arrow").not(this.children).animate({ top: "10px" }, 200);
                            $(this).children(".topbtn_arrow").animate({ top: "-10px" }, 200);
                            $(".siteid").removeClass("site_id_bk");
                            $(".siteid").addClass("site_id_wht");
                            $(".gmenu").removeClass("gmenu_bk");
                            $(".gmenu").addClass("gmenu_wht");
                        }

                        //$(".topbtn").addClass("topbtn_on");
                        //$(this).addClass("topbtn_extra_on");
                        //$(".extra_hidden").fadeIn(200);


                        $("ul.champagne").champagne({
                            //beginning_delay: 1000,
                            delay_between: 300,
                            duration: 200,
                            onFinish: function () {
                                //$(".desk_msg").fadeIn(500);
                            }
                        });

                        $(".header_bg").delay(500).fadeIn(2000);
                        $(".desk_msg").delay(500).fadeIn(1000);
                    },
                    function () {
                        $(".topbtn").removeClass("topbtn_on");
                        $(this).removeClass("topbtn_extra_on");
                        $(".extra_hidden").hide();
                    });

                $(".subcont").hover(
                    function () {
                        if ($(".topimg0").css("display") == "none") {
                            $(".topimg").fadeOut(250);
                            $(".topimg0").fadeIn(250);
                            $(".topbtn_title").css("color", "#ffffff");

                            $(".topbtn_icon").removeClass("topbtn_icon_on");

                            $(".topbtn_arrow").animate({ top: "10px" }, 200);
                            $(".siteid").removeClass("site_id_wht");
                            $(".siteid").addClass("site_id_bk");
                            $(".gmenu").removeClass("gmenu_wht");
                            $(".gmenu").addClass("gmenu_bk");
                            extra_hide();
                        }
                    },
                    function () {

                    });
            }

        });
    </script>

</head>
<body topmargin="0" leftmargin="0" marginheight="0" marginwidth="0">
    <form id="form1" runat="server">

        <ul class="gmenu gmenu_bk" id="gmenu">
            <li><a href="slider02.aspx">TOP</a></li>
<%--            <li><a class="" href="login01.aspx">中文</a></li>
            <li><a class="" href="login01.aspx">English</a></li>
            <li><a class="" href="login01.aspx">Português</a>&nbsp;&nbsp;&nbsp;</li>--%>
            

            <li><a href="?lang=en" runat="server" id="linkEnglish">
                <asp:Literal ID="Literal1" runat="server" Text="English" /></a></li>
            <li><a href="?lang=zh" runat="server" id="linkChinese">
                <asp:Literal ID="Literal2" runat="server" Text="中文" /></a>&nbsp;&nbsp;&nbsp;</li>
           
            <li style="font-family:'Microsoft JhengHei';font-size:18px;font-weight:bold"><asp:Label ID="NameLabel" runat="server" Text=""></asp:Label></li>

            <asp:Label ID="Label1" runat="server" Text="Label">帳號:</asp:Label>
            <asp:TextBox ID="AccountBox" runat="server"></asp:TextBox>
            <asp:Label ID="Label2" runat="server" Text="Label">密碼:</asp:Label>
            <asp:TextBox ID="PasswordBox" runat="server" TextMode="Password"></asp:TextBox>
            

            <li><asp:LinkButton ID="LoginButton" runat="server" OnClick="LoginButton_Click" ><asp:Label ID="LoginLabel" runat="server" Text="<%$Resources:chienvh.language, miku02%>"></asp:Label></asp:LinkButton></li>
            <li><a class="" href="login01.aspx"><asp:Label ID="RegisterLabel" runat="server" Text="<%$Resources:chienvh.language, miku03%>"></asp:Label></a></li>
            <li><asp:LinkButton ID="LogoutButton" runat="server" OnClick="LogoutButton_Click" ><asp:Label ID="Label12" runat="server" Text="Log out"></asp:Label></asp:LinkButton></li>

        </ul>


	<div class="wrapper">
		<div class="maincont">
			<a href="http://www.ipm.edu.mo/en/index.php" class="siteid site_id_bk" title="mpicp">
			</a>
			<a class="gmenu_icon" href="#gmenu"><i class="icon-reorder"></i></a>
			<div class="topimg topimg0">
					<p style="font-family:'Microsoft JhengHei';margin-top:200px;font-size:31px;color:white;text-align:center";>
                        <%--歡迎來到理工學院企業招聘系統--%>
                        <asp:Label ID="Label3" runat="server" Text="<%$Resources:chienvh.language, miku01%>"></asp:Label>
                    </p>


			</div>
			<div class="topimg topimg_fixed">

			</div>

            
			<a href="layout01pppage02.aspx" class="topimg topimg1">
				<div class="topimg_inner topimg_inner1">
					<div class="topimg_icon"></div>
					<div class="topimg_copy"><asp:Label ID="Label8" runat="server" Text="<%$Resources:chienvh.language, mess1_1%>"></asp:Label></div>
					<p class="topimg_desc" style="font-family:'Microsoft JhengHei'"><asp:Label ID="Label9" runat="server" Text="<%$Resources:chienvh.language, mess1_2%>"></asp:Label>
                    </p>
				</div>
			</a>

			<a href="#" class="topimg topimg2">
				<div class="topimg_inner topimg_inner2">
					<div class="topimg_icon"></div>
					<div class="topimg_copy"><asp:Label ID="Label10" runat="server" Text="<%$Resources:chienvh.language, mess2_1%>"></asp:Label></div>
					<p class="topimg_desc" style="font-family:'Microsoft JhengHei'"><asp:Label ID="Label11" runat="server" Text="<%$Resources:chienvh.language, mess2_2%>"></asp:Label>
                    </p>
				</div>
			</a>

			<a href="#" class="topimg topimg5">

                				<div class="desk_msg"><div class="desk_msg_inner font_courgette">MPI NEWS</div></div>
				<div class="header_bg"></div>
				
				<ul class="deskthumbox champagne">
					<li><div class="deskthum" style="background-image:url(layout01ppstyle/cfm/images/desk/250_001.jpg);"></div></li>
					<li><div class="deskthum" style="background-image:url(layout01ppstyle/cfm/images/desk/250_002.jpg);"></div></li>
					<li><div class="deskthum" style="background-image:url(layout01ppstyle/cfm/images/desk/250_003.jpg);"></div></li>
					<li><div class="deskthum" style="background-image:url(layout01ppstyle/cfm/images/desk/250_004.jpg);"></div></li>
					<li><div class="deskthum" style="background-image:url(layout01ppstyle/cfm/images/desk/250_005.jpg);"></div></li>
					<li><div class="deskthum" style="background-image:url(layout01ppstyle/cfm/images/desk/250_006.jpg);"></div></li>
					<li><div class="deskthum" style="background-image:url(layout01ppstyle/cfm/images/desk/250_007.jpg);"></div></li>
					<li><div class="deskthum" style="background-image:url(layout01ppstyle/cfm/images/desk/250_008.jpg);"></div></li>
					<li><div class="deskthum" style="background-image:url(layout01ppstyle/cfm/images/desk/250_009.jpg);"></div></li>
					<li><div class="deskthum" style="background-image:url(layout01ppstyle/cfm/images/desk/250_010.jpg);"></div></li>
					<li><div class="deskthum" style="background-image:url(layout01ppstyle/cfm/images/desk/250_011.jpg);"></div></li>
					<li><div class="deskthum" style="background-image:url(layout01ppstyle/cfm/images/desk/250_012.jpg);"></div></li>
					<li><div class="deskthum" style="background-image:url(layout01ppstyle/cfm/images/desk/250_013.jpg);"></div></li>
					<li><div class="deskthum" style="background-image:url(layout01ppstyle/cfm/images/desk/250_014.jpg);"></div></li>
					<li><div class="deskthum" style="background-image:url(layout01ppstyle/cfm/images/desk/250_015.jpg);"></div></li>
					<li><div class="deskthum" style="background-image:url(layout01ppstyle/cfm/images/desk/250_016.jpg);"></div></li>
					<li><div class="deskthum" style="background-image:url(layout01ppstyle/cfm/images/desk/250_017.jpg);"></div></li>
					<li><div class="deskthum" style="background-image:url(layout01ppstyle/cfm/images/desk/250_018.jpg);"></div></li>
					<li><div class="deskthum" style="background-image:url(layout01ppstyle/cfm/images/desk/250_019.jpg);"></div></li>
					<li><div class="deskthum" style="background-image:url(layout01ppstyle/cfm/images/desk/250_020.jpg);"></div></li>
				</ul>

			</a>

		</div>
		
		<div class="showcase">
            <%--企業招聘連結--%>
            <asp:LinkButton ID="LinkButton1" runat="server" class="topbtn topbtn_dtm" OnClick="LinkButton1_Click">
				<div class="topbtn_title" style="font-size:17px; font-family:Microsoft JhengHei;"><asp:Label ID="Label4" runat="server" Text="<%$Resources:chienvh.language, miku04%>"></asp:Label></div>
				<p class="topbtn_desc">


				</p>
				<div class="topbtn_icon"></div>
				<div class="topbtn_arrow"></div>
            </asp:LinkButton>


            <asp:LinkButton ID="LinkButton2" runat="server" class="topbtn topbtn_fxbgm" OnClick="LinkButton2_Click">
                <div class="topbtn_title" style="font-size:17px; font-family:Microsoft JhengHei;"><asp:Label ID="Label5" runat="server" Text="<%$Resources:chienvh.language, miku05%>"></asp:Label></div>
				<p class="topbtn_desc">


				</p>
				<div class="topbtn_icon"></div>
				<div class="topbtn_arrow"></div>
            </asp:LinkButton>


			<a href="http://www.ipm.edu.mo/student_corner/en/calendar.php" class="topbtn topbtn_extra">
				<div style="font-size:17px; font-family:Microsoft JhengHei;" class="topbtn_title">MPI NEWS</div>
				<div class="topbtn_desc"></div>
				<div class="topbtn_icon"></div>

			</a>
		</div>
		
		<div class="subcont">
			
	</div>
	<%--<div class="backtotop"><i class="icon-chevron-up"></i></div>--%>

    </form>
</body>
</html>