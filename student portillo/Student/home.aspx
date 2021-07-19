<%@ Page Language="C#" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="Student_home" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Macao Polytechnic Institute</title>
    <link rel="stylesheet" href="../style.css" type="text/css" media="screen" />

    <!--script type="text/javascript" src="../verify.js"></script-->
    <script type="text/javascript" language="javascript" src="../Scripts/jquery-1.11.1.min.js"></script>
    <script src="Scripts/jquery.zrssfeed.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="../Styles/hover.css"/>
	
    <style type="text/css">
        .change {
            color: #FFFFFF;
        }

            .change:hover {
                color: #FFFFFF;
            }

        .change1 {
            /*color: #FFCC33;*/
            background: #2260B2;
            color: #FFFFFF;
            -webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, .2);
            -moz-box-shadow: 0 1px 1px rgba(0, 0, 0, .2);
            /*box-shadow: 0 1px 1px rgba(0, 0, 0, .2);
            text-shadow: -1px 0px 7px #FFFFFF;*/
        }

            .change1:hover {
                color: Yellow;
            }

        .style1 {
            width: 100%;
        }

        .style2 {
            height: 15px;
        }

        .style8 {
            height: 15px;
            width: 87px;
        }

        .style19 {
            height: 15px;
            width: 385px;
        }

        .style20 {
            height: 15px;
            width: 128px;
        }

        .style22 {
            width: 193px;
        }

        .style23 {
            width: 196px;
        }

        .style24 {
            width: 195px;
        }

        .style26 {
            width: 194px;
        }

        .style28 {
            height: 15px;
            width: 98px;
        }

        .style29 {
            height: 15px;
            width: 95px;
        }

        .style30 {
            height: 15px;
            width: 97px;
        }


        #menu-bar {
            width: 1011px;
            margin: 0px 0px 0px 0px;
            padding: 6px 7px 4px 6px;
            height: 30px;
            line-height: 100%;
            /*border-radius: 15px;
-webkit-border-radius: 15px;*/
            -moz-border-radius: 15px;
            box-shadow: 0px 0px 0px #666666;
            -webkit-box-shadow: 0px 0px 0px #666666;
            -moz-box-shadow: 0px 0px 0px #666666;
            background: #4F87BD;
            /* background: linear-gradient(top,  #424242,  #000000);
background: -ms-linear-gradient(top,  #424242,  #000000);
background: -webkit-gradient(linear, left top, left bottom, from(#424242), to(#000000));
background: -moz-linear-gradient(top,  #424242,  #000000);*/
            border: solid 0px #242424;
            position: relative;
        }

            #menu-bar li {
                margin: 0px 0px 7px 0px;
                padding: 0px 7px 3px 6px;
                float: left;
                position: relative;
                list-style: none;
            }

            #menu-bar a {
                /* font-weight: bold;
font-family: arial;
font-style: normal;*/
                font-size: 12pt;
                /*color: #FFFFFF;*/
                text-decoration: none;
                display: block;
                padding: 5px 13px 6px 13px;
                margin: 0;
                margin-bottom: 7px;
                border-radius: 18px;
                -webkit-border-radius: 18px;
                -moz-border-radius: 18px;
                /* text-shadow: -2px 3px 0px #000000;*/
            }

            #menu-bar li ul li a {
                margin: 0;
            }

            #menu-bar .active a {
                background: #2260B2;
                color: #FFFFFF;
                -webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, .2);
                -moz-box-shadow: 0 1px 1px rgba(0, 0, 0, .2);
                box-shadow: 0 1px 1px rgba(0, 0, 0, .2);
                /* text-shadow: -1px 0px 7px #FFFFFF;*/
            }

            #menu-bar li:hover a {
                background: #2260B2;
                color: #FFFFFF;
                -webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, .2);
                -moz-box-shadow: 0 1px 1px rgba(0, 0, 0, .2);
                box-shadow: 0 1px 1px rgba(0, 0, 0, .2);
                text-shadow: -1px 0px 7px #FFFFFF;
            }

            #menu-bar ul li:hover a, #menu-bar li:hover li a {
                background: none;
                border: none;
                color: #666;
                -box-shadow: none;
                -webkit-box-shadow: none;
                -moz-box-shadow: none;
            }

            #menu-bar li:hover > ul {
                display: block;
            }

            #menu-bar ul {
                background: #FFFFFF;
                /*background: linear-gradient(top,  #FFFFFF,  #CFCFCF);
background: -ms-linear-gradient(top,  #FFFFFF,  #CFCFCF);
background: -webkit-gradient(linear, left top, left bottom, from(#FFFFFF), to(#CFCFCF));
background: -moz-linear-gradient(top,  #FFFFFF,  #CFCFCF);*/
                display: none;
                margin: 0;
                padding: 0;
                width: 120%;
                position: absolute;
                top: 32px;
                left: 0;
                border: solid 1px #B4B4B4;
                border-radius: 10px;
                /*-webkit-border-radius: 10px;
-moz-border-radius: 10px;
-webkit-box-shadow: 2px 2px 3px #222121;
-moz-box-shadow: 2px 2px 3px #222121;
box-shadow: 2px 2px 3px #222121;*/
            }

                #menu-bar ul li {
                    float: none;
                    margin: 0;
                    padding: 0;
                }

                #menu-bar ul a {
                    padding: 10px 0px 10px 15px;
                    color: #424242 !important;
                    font-size: 11pt;
                    font-style: normal;
                    border-radius: 0;
                    /*font-family:arial;*/
                    font-weight: normal;
                    /* text-shadow: 2px 2px 3px #FFFFFF;*/
                }

                    #menu-bar ul a:hover {
                        background: #4F87BD !important;
                        color: #FFFFFF !important;
                        font-size: 12pt;
                        border-radius: 0;
                        -webkit-border-radius: 0;
                        -moz-border-radius: 0;
                        /*text-shadow: 2px 2px 3px #FFFFFF;*/
                    }

                #menu-bar ul li:first-child > a {
                    border-top-left-radius: 10px;
                    -webkit-border-top-left-radius: 10px;
                    -moz-border-radius-topleft: 10px;
                    border-top-right-radius: 10px;
                    -webkit-border-top-right-radius: 10px;
                    -moz-border-radius-topright: 10px;
                }

                #menu-bar ul li:last-child > a {
                    border-bottom-left-radius: 10px;
                    -webkit-border-bottom-left-radius: 10px;
                    -moz-border-radius-bottomleft: 10px;
                    border-bottom-right-radius: 10px;
                    -webkit-border-bottom-right-radius: 10px;
                    -moz-border-radius-bottomright: 10px;
                }

            #menu-bar:after {
                content: ".";
                display: block;
                clear: both;
                visibility: hidden;
                line-height: 0;
                height: 0;
            }

        #menu-bar {
            display: inline-block;
        }

        html[xmlns] #menu-bar {
            display: block;
        }

        * html #menu-bar {
            height: 1%;
        }

        #newMsgPanel {
            width: 370px;
            height: 45px;
            padding-left: 10px;
            border: solid lightblue 2px;
            margin: 3px 3px 8px 30px;    
			display:block;
        }
		#mainContent{
		  width: 62%;
		  float:left;
		}
		#fav{		
			border: solid #CCC 1px;
			border-radius: 14px;
			-moz-border-radius: 14px;
			-webkit-border-radius: 14px;			
			min-height:593px;
			overflow:auto;	
			width: 100%;	
			margin: 0% 0 2% 0;	
			box-shadow: 0px 5px 8px #888;
		}
		#contact{
			min-height: 95px;
			width:100%;			
			overflow:auto;
			border: solid #CCC 1px;
			border-radius: 30px;
			-moz-border-radius: 30px;
			-webkit-border-radius: 30px;
			margin: 2% 13px 2% 0;
			box-shadow: 0px 5px 8px #888;
		}
		
		#notice{	
			width: 35%;			
			float:left;
			min-height: 250px;			
			overflow:auto;		
			border: solid #CCC 1px;
			border-radius: 30px;
			-moz-border-radius: 30px;
			-webkit-border-radius: 30px;
			margin: 0% 0 1% 2%;	
			box-shadow: 0px 5px 8px #888;			
		}
		#news{
			width: 35%;
			float: left;
			height: 350px;
			overflow:hidden;			
			border: solid #CCC 1px;
			border-radius: 30px;
			-moz-border-radius: 30px;
			-webkit-border-radius: 30px;
			margin: 0% 0 1% 2%;	
			box-shadow: 0px 5px 8px #888;
					
		}
		
		h2 {
			margin: 10px 0px 0px 15px;
			color: #FCC20B;
			font-style: italic;
		}

        .btn_size{
            border-radius:5px;
			width:80px;
			border:solid 1px #ffffff;	
			color: #ffffff;		
        }
		
		.btn_size:active {
			background-color: #1397E8 !important;
		}
		
		.btn_size:hover{
			background-color: #1397E8 !important;
		}
		 #lang-panel{
                position: absolute;
                top: 0px;
                margin-left: 9px;
                margin-top: 4px;                
            }
    </style>
 <script src="../Scripts/config.js" type="text/javascript"></script>
 <script>
	onload = function () {	
			//var userLang = navigator.languages ? navigator.languages[0] : (navigator.language || navigator.userLanguage);
			var lang = '<%= Session["CurrentUI"] %>';
			/*
			if (lang=="" && userLang=='zh-TW')
            {
                $('#newsInfo').rssfeed('http://webapps.ipm.edu.mo/mpi_home/news/web_rss.asp?days=100&activity_category=ep&lang=chi', {
                    ssl: true
                });
            } else  
			*/
			
			if (lang=="" )
			{
			 $('#newsInfo').rssfeed('http://webapps.ipm.edu.mo/mpi_home/news/web_rss.asp?days=100&activity_category=ep', {
                        ssl: true
                    });
			}
			else
			if (lang != "" && lang == 'zh-TW') {
                    //loadXMLDoc('web_rss.xml');
                    $('#newsInfo').rssfeed('http://webapps.ipm.edu.mo/mpi_home/news/web_rss.asp?days=100&activity_category=ep&lang=chi', {
                        ssl: true
                    });
                }
                else {
                    $('#newsInfo').rssfeed('http://webapps.ipm.edu.mo/mpi_home/news/web_rss.asp?days=100&activity_category=ep', {
                        ssl: true
                    });
                }
        
	     	       
	      if (document.getElementById("txt_size")!=null)
			setDefaultIconSize(document.getElementById("txt_size").value);
			displayDelay();     
	}
</script>	
</head>
<body>
    <form id="form1" runat="server">
	
        <div id="wrapper">
            <div id="headerStd">			
                <div style="padding-right: 5px; text-align: right; padding-top: 8px;">
                    <asp:Label ID="lb_welcome" runat="server" Text="<%$ Resources:Resource, sip_welcome %>"></asp:Label>,
                    <asp:Label ID="Label2" runat="server" Style="color: blue;"></asp:Label>
                    <asp:Label ID="Label3" runat="server" Style="color: blue;"></asp:Label>
                    |
                    <asp:LinkButton ID="SignOut" runat="server" Text="<%$ Resources:Resource, sip_signout %>" OnClick="SignOut_Click"></asp:LinkButton>
                </div>
			 <div id="lang-panel">
                    <asp:LinkButton ID="lang_zh" runat="server" Text="中文" CommandArgument="zh-TW" OnClick="lang_Click" />
                    <asp:LinkButton ID="lang_en" runat="server" Text="English" CommandArgument="en-US" OnClick="lang_Click" />
                    <br />
                                     
                </div>
				<img src="../images/uat.gif" style="position:absolute;width:100px;height:40px;display:block;  margin-left: 150px;"/>
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/logo_transp_v2003.gif"
                    Style="margin-top: 30px; margin-left: 0px;" OnClick="ImageButton1_Click" />
				
                <div style="padding-top: 114px;">
                    &nbsp;&nbsp; 
                </div>
            </div>

            <div>
                <ul id="menu-bar">
                    <li>
                        <asp:LinkButton ID="MyFavourite" runat="server" Text="<%$ Resources:Resource, sip_home %>"
                            CssClass="change1" OnClick="MyFavourite_Click"></asp:LinkButton>
                    </li>
                    <li>
                        <asp:LinkButton ID="TimeTable" runat="server"  Text="<%$ Resources:Resource, sip_class %>"
                            CssClass="change" OnClick="TimeTable_Click"></asp:LinkButton></li>
                    <!-- <li>
                        <asp:LinkButton ID="StudentRecord" runat="server"
                            CssClass="change" OnClick="StudentRecord_Click">Student Record</asp:LinkButton></li> -->
                    <li>
                        <asp:LinkButton ID="Finance" runat="server" Text="<%$ Resources:Resource, sip_finance %>"
                            CssClass="change" OnClick="Finance_Click"></asp:LinkButton></li>


                    <li>
                        <asp:LinkButton ID="Common" runat="server" OnClick="Common_Click" Text="<%$ Resources:Resource, sip_eServices %>"
                            CssClass="change"></asp:LinkButton></li>
                    <li>
                        <asp:LinkButton ID="ePortfolio" runat="server" CssClass="change" Text="<%$ Resources:Resource, sip_ePortfolio %>"
                            OnClick="ePortfolio_Click"></asp:LinkButton></li>
                    <li>
                        <asp:LinkButton ID="AcademicNavigator" runat="server" CssClass="change" Text="<%$ Resources:Resource, sip_acac_nav %>"
                            OnClick="AcademicNavigator_Click"></asp:LinkButton></li>                  
                </ul>

            </div>
			 
           
		
        

            <div id='content'>
			 <asp:Panel ID="newMsgPanel" runat="server" Visible="False" class="hvr-wobble-vertical">
                <p>
                    <img src="../images/alarm_clock1.png" style="width: 16px; height: 16px; vertical-align: text-bottom;" alt="clock" />
                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:Resource, sip_notif %>"></asp:Label>  <a href="AdvisoryRemark.aspx"><asp:Label ID="Label6" runat="server" Text="<%$ Resources:Resource, sip_here %>"></asp:Label></a>
                </p>
            </asp:Panel>

                <asp:Panel id='seticon' runat="server">
                    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="6">
                        <asp:View ID="View1" runat="server">
                            <asp:Literal ID="Literal2" runat="server"></asp:Literal>
                            <asp:Literal ID="Literal5" runat="server"></asp:Literal>
                            <asp:Literal ID="Literal3" runat="server"></asp:Literal>
                            <asp:Literal ID="Literal9" runat="server"></asp:Literal>
                            <asp:Literal ID="Literal99" runat="server"></asp:Literal>
                            
                         
                        </asp:View>
                        <asp:View ID="View2" runat="server">
                           <%--    <asp:Panel ID="newNumPanel" runat="server" Visible="false">
                            <asp:Label id="msgNum" runat="server" ></asp:Label>
                            </asp:Panel> --%>
                            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                            <asp:Literal ID="Literal4" runat="server"></asp:Literal>
                            <asp:Literal ID="Literal10" runat="server"></asp:Literal>
                            <asp:Literal ID="Literal11" runat="server"></asp:Literal>
                            <asp:Literal ID="Literal123" runat="server"></asp:Literal>
                            <asp:Literal ID="Literal18" runat="server"></asp:Literal>
                            <asp:Literal ID="Literal7" runat="server"></asp:Literal>
                            <asp:Literal ID="Literal8" runat="server"></asp:Literal>
                            <asp:Literal ID="Literal100" runat="server"></asp:Literal>
                            <asp:Literal ID="Literal101" runat="server"></asp:Literal>
                            <asp:Literal ID="Literal19" runat="server"></asp:Literal>
                            <asp:Literal ID="Literal12" runat="server"></asp:Literal>
                            <asp:Literal ID="Literal13" runat="server"></asp:Literal>
                            <asp:Literal ID="Literal36" runat="server"></asp:Literal>
                            <asp:Literal ID="Literal6" runat="server"></asp:Literal>
                            <asp:Literal ID="Literal14" runat="server"></asp:Literal>
                            <asp:Literal ID="Literal15" runat="server"></asp:Literal>
                            <asp:Literal ID="Literal16" runat="server"></asp:Literal>
                            <asp:Literal ID="Literal17" runat="server"></asp:Literal>
                          
                        </asp:View>
                        <asp:View ID="View3" runat="server">


                

                            <asp:Literal ID="Literal41" runat="server"></asp:Literal>   
                           

                            <asp:Literal ID="Literal31" runat="server"></asp:Literal>

                            <asp:Literal ID="Literal32" runat="server"></asp:Literal>

                            

                            <asp:Literal ID="Literal38" runat="server"></asp:Literal>

                         

                            
  
                           <asp:Literal ID="Literal42" runat="server"></asp:Literal>

                        </asp:View>
                        <asp:View ID="View4" runat="server">

                            <asp:Literal ID="Literal22" runat="server"></asp:Literal>

                        </asp:View>
                        <asp:View ID="View5" runat="server">

                            <asp:Literal ID="Literal23" runat="server"></asp:Literal>
                            <asp:Literal ID="Literal223" runat="server"></asp:Literal>
                            <asp:Literal ID="Literal24" runat="server"></asp:Literal>

                            <asp:Literal ID="Literal25" runat="server"></asp:Literal>

                            <asp:Literal ID="Literal34" runat="server"></asp:Literal>

                            <asp:Literal ID="Literal26" runat="server"></asp:Literal>
                           
                           <asp:Literal ID="Literal21" runat="server"></asp:Literal>
                           <asp:Literal ID="Literal20" runat="server"></asp:Literal>
 
 
							<asp:Literal ID="Literal30" runat="server"></asp:Literal>
							<asp:Literal ID="Literal39" runat="server"></asp:Literal>


                        </asp:View>
                        <asp:View ID="View6" runat="server">

                            <asp:Literal ID="Literal27" runat="server"></asp:Literal>

                            <asp:Literal ID="Literal28" runat="server"></asp:Literal>

                            <asp:Literal ID="Literal29" runat="server"></asp:Literal>

							<asp:Literal ID="Literal33" runat="server"></asp:Literal>


                        </asp:View>
                        <asp:View ID="View7" runat="server">
							<div id="mainContent">
							<div id="fav" >
								<h2><asp:Label ID="lb_fav" runat="server" Text="<%$ Resources:Resource, sip_fav %>"></asp:Label></h2>
								<asp:HiddenField id="txt_size" runat="server" />
                                <div style="position:relative;margin-top:-24px;top:0px;float:right;padding-right:100px;">
                                     <button id="btn_small" type="button"  class="btn_size" onclick="btnsmallClick()"><asp:Label ID="lb_btn_small" runat="server" Text="<%$ Resources:Resource, sip_small %>"></asp:Label></button>
                                     <button id="btn_medium" type="button"  class="btn_size" onclick="btnmedClick()"><asp:Label ID="lb_btn_medium" runat="server" Text="<%$ Resources:Resource, sip_medium %>"></asp:Label></button>
                                     <button id="btn_big" type="button"  class="btn_size" onclick="btnbigClick()"><asp:Label ID="lb_btn_big" runat="server" Text="<%$ Resources:Resource, sip_big %>"></asp:Label></button>
                                </div>
								<div style="position:relative;margin-top:-24px;top:0px;float:right;padding-right:8px;">
                                   
								<img src="../images/settings.png" style="width:20px;height:20px;" alt="settings"/><a href='../Student/settings.aspx'><span style="vertical-align:5px;"><asp:Label ID="lb_settings" runat="server" Text="<%$ Resources:Resource, sip_settings %>"></asp:Label></span></a>
								</div>
							
								<div align="center" style=" margin: 14px;"> 								
								<asp:Literal ID="favourites" runat="server"></asp:Literal>		
								</div>								
							</div>
								<div id="contact">
					        <h2><asp:Label ID="lb_contact" runat="server" Text="<%$ Resources:Resource, sip_contacts %>"></asp:Label></h2>
							<div style="padding:5px 5px 5px 15px;font-size:11pt;">
							<ul class="contact" align="left">
							<asp:Label ID="lb_contact_contents" runat="server" Text="<%$ Resources:Resource, sip_contact_contents %>"></asp:Label>
                           </ul>
						</div>
							</div>
							</div>
							
							<div id="notice">
								<h2><asp:Label ID="lb_notices" runat="server" Text="<%$ Resources:Resource, sip_notices %>"></asp:Label></h2>	
								<div style="padding:5px 5px 5px 0px;text-align: left;">
								<!--
								<p>18/5/2015: 學生資訊平台上線. 歡迎各位學生使用!</p>
								-->
								 <div>
                                    <asp:Literal ID="lit_notice" runat="server"></asp:Literal>
                                    </div>
								</div>
							</div>
							<div id="news">
                              
								<h2><asp:Label ID="lb_news" runat="server" Text="<%$ Resources:Resource, sip_news %>"></asp:Label></h2>
								<div style="position: relative;top:0px;text-align:left;"> 
								
	                          <!--   <iframe id="I1" frameborder="no"  scrolling="yes" 	
	                                src="http://172.26.122.66/siweb/mainFrameNews.htm" 
									style="width:500px;height:890px;overflow: hidden;"></iframe> -->
									<div id="maq3" style="overflow:hidden;height:425px;width:100%;">                       
									
									<div id="newsInfo">
									</div>
									
									<div id="m3"></div> 
								</div>	
							</div>
						<script type="text/javascript">
                                    var speed3 = 50;

                                    document.getElementById("m3").innerHTML = document.getElementById("newsInfo").innerHTML;

                                    var MyMar3 = setInterval(Marquee3, speed3);
                                    function Marquee3() {
										
                                        if (maq3.offsetHeight + 104 - maq3.scrollTop <= 0)
										
                                            maq3.scrollTop -= maq3.offsetHeight + 117;
                                        else
                                            maq3.scrollTop++;

                                        console.log('height'+maq3.offsetHeight);
										console.log(maq3.scrollTop);
										 
                                        document.getElementById("maq3").onmouseover = function () {
                                            clearInterval(MyMar3);
                                        }
                                        document.getElementById("maq3").onmouseout = function () {
                                            MyMar3 = setInterval(Marquee3, speed3);
                                        }

                                    }
                                   
                                </script>

                               
								
		            </div>					
							
							
                        </asp:View>

                    </asp:MultiView>
		</asp:Panel>
                </div>
            </div>

            <div>
                <div>
                    <asp:HiddenField ID="index" runat="server" />
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                        ConnectionString="<%$ ConnectionStrings:EPConnectionString %>"
                        SelectCommand="SELECT * FROM [userGroup] WHERE ([id] = @id)">
                        <SelectParameters>
                            <asp:SessionParameter Name="id" SessionField="Role_Type" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                        ConnectionString="<%$ ConnectionStrings:EPConnectionString %>"
                        SelectCommand="SELECT COUNT( *) as new FROM [AdvisoryRemark] WHERE (([status] = @status) AND ([ALUN_NUMERO] = @ALUN_NUMERO)AND ([ALUN_NUMERO_SEQ] = @ALUN_NUMERO_SEQ) )">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="Unread" Name="status" Type="String" />
                            <asp:SessionParameter Name="ALUN_NUMERO" SessionField="ALUN_NUMERO"
                                DefaultValue="" />
                            <asp:SessionParameter Name="ALUN_NUMERO_SEQ" SessionField="ALUN_NUMERO_SEQ" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </div>
            </div>

        
        <div id="footer-home">
            <div id="footer-valid">		
			
<a href="http://172.26.122.66/siweb/email.asp" target="_blank"><img src="../images/webmail.gif" width="103" height="27" border="0" align="absmiddle"></a>

<a href="http://library2.ipm.edu.mo/Webpac2/emsearch.htm" target="_blank"><img src="../images/catalogues.gif" width="162" height="32" border="0" align="absmiddle"></a>

<a href="http://www.ipm.edu.mo/student/info_calendar.html" target="_blank"><img src="../images/calendar-label.gif" width="152" height="33" border="0" align="absmiddle"></a>
  
<a href="http://www.ipm.edu.mo/student/form.html" target="_blank"><img src="../images/forms2download.gif" width="162" height="32" border="0" align="absmiddle"></a>
<a href="http://library.ipm.edu.mo/English/resource/e-resources/e-resources.asp?page=1&sortway=FORMAT_ID,E_TITLE" target="_blank"><img src="../images/e-resource.gif" width="145" height="32" border="0" align="absmiddle"></a>
<a href="http://library.ipm.edu.mo/wisenews.htm" target="_blank"><img src="../images/WiseNewsIcon.jpg" alt="WiseNews covers newspapers, magazines, journals and newswires focusing on the Greater China Area, with 20,000 articles received and processed daily." width="145" height="32" border="0" align="absmiddle"></a>
<br/><br/>
<div style="margin-left:18px;">
                Copyright &copy;
                <script type="text/javascript">
                    var dt = new Date();
                    document.write(dt.getFullYear());
                </script>				
                Macao Polytechnic Institute. All Rights Reserved.    
				<br/>
				<p>    本站最佳瀏覽解析度為   1280*1024</p>
				
	</div>
            </div>
        </div>
    </form>

</body>
</html>
