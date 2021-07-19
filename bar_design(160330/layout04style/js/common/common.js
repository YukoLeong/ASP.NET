// JavaScript Document
function SwitchLang(charsetID){
	var url = window.location.toString();
	var isStaticURL = false;
	var langPaths = new Array("en", "zh", "pt");
	var oldLangPath = "";

	// Check url type (is static page or dynamic page)
	for (i=0; i < langPaths.length; i++){
		if (url.indexOf("/"+langPaths[i]+"/") != -1){
			oldLangPath = "/"+langPaths[i]+"/";
			isStaticURL = true;
			break;
		}
	}

	if (isStaticURL){
		var path;
		path = window.location.href;
		window.location = path.replace(oldLangPath, "/"+langPaths[charsetID - 1]+"/");
	}else{
		if (url.indexOf("lang=") != -1){
			window.location = 
				url.replace(/lang=\d/, "lang="+charsetID);
		}
	}
}

function checkCurrentlang(){
	var url = window.location.toString();
	var langPaths = new Array("en", "zh", "pt");
	var curLangPath = "";

	// Check url type (is static page or dynamic page)
	for (i=0; i < langPaths.length; i++){
		if (url.indexOf("/"+langPaths[i]+"/") != -1){
			curLangPath = langPaths[i];
			break;
		}
	}
	return curLangPath;
}


/* FontSize */
var currFontSize = getCookie('MPI_pagesizes');
currFontSize = currFontSize.replace("=","");
if(currFontSize==''){currFontSize = "large";}
var sizeKeyWords = [
	{classname:'small', caption:'Small'},
	{classname:'middle', caption: 'Mid'}, 
	{classname:'large', caption: 'Large'}
];
function loadFontSize() {
	var currFontSize = getCookie('MPI_pagesizes');
	currFontSize = currFontSize.replace("=","");
	if(currFontSize==''){currFontSize = "large";}
	var index=1;
	for(var i in sizeKeyWords){
		if(sizeKeyWords[i].classname==currFontSize){	index=i;	break;	}
	}
	changeFontSize(parseInt(index)+1);
}

function changeFontSize(index, isPageStart){
	//console.log(index);
	if(! isPageStart){
		for(var i in sizeKeyWords){
			var ClassName = sizeKeyWords[i].classname;
			if(i==index-1){
				$('#size_control').addClass(''+ClassName+'_size');
				$('.fontsize').children('a.'+ClassName).addClass('selected');
			}else{
				$('#size_control').removeClass(''+ClassName+'_size');
				$('.fontsize').children('a.'+ClassName).removeClass('selected');
			}
		}
	}
	setCookie('MPI_pagesizes', sizeKeyWords[index-1].classname, 365);
	if($('#cal_event_wrap').length > 0){
		genCalEventDetails();
	}
	//if($('#news_wrap').length > 0){
	//	$('#news_wrap .news').jScrollPane({			
	//			verticalDragMinHeight: 30,
	//			verticalDragMaxHeight: 30	
	//	});			
	//}
	
}

function getCookie(c_name) {
	if (document.cookie.length>0) {
		c_start=document.cookie.indexOf(c_name + "=");
		if (c_start!=-1) { 
			c_start=c_start + c_name.length+1;
			c_end=document.cookie.indexOf(";",c_start);
			if (c_end==-1) c_end=document.cookie.length;
				return unescape(document.cookie.substring(c_start,c_end));
		} 
	}
	return "";
}

function setCookie(c_name,value,expiredays) {
	var exdate=new Date();
	exdate.setDate(exdate.getDate()+expiredays);
	deleteCookie(c_name);
	document.cookie=c_name+ "=" +escape(value)+((expiredays==null) ? "" : ";expires="+exdate.toGMTString()+";path=/");
}

function deleteCookie(c_name) {
	if (getCookie(c_name))	document.cookie = c_name + "=;expires=Thu, 01-Jan-1970 00:00:01 GMT;path=/";
}





/*************************Home scrolling content*****************************/
var $bl;
var	$th;
var	blW;
var	blSW ; 
var	wDiff ;
var	mPadd  = 60; 
var	damp   = 20; 
var	mX     = 0; 
var	mX2    = 0; 
var	posX   = 0;
var	mmAA  ; 
var	mmAAr ;


function loadHomeMainVis(){	
	$('#mainvis').animate({
			left: 0
		}, 2000, function(){
			homeMainVisInit();				

	
		});
	
		$('#mainvis_bg').animate({opacity:0}, 2000, function(){$(this).hide();});	
		$('#container_bg').animate({
				opacity:1
		}, 2000);	
		
		if($('#mainvis .mainvis_nav > ul > li .mainvis_subnav').length > 0){
			//console.log($('#mainvis .mainvis_nav > ul > li .mainvis_subnav').length );
			$('#mainvis .mainvis_nav > ul > li .mainvis_subnav').each(function(){
					$(this).hover(function() {
						$( this ).parent().addClass( "selected" );
					}, function() {
						$( this ).parent().removeClass( "selected" );
					});
			});
		}
}
function homeMainVisInit(){
	homeScrollParaInit();
	$("#mainvis_container").bind('mousemove',	scrollMainMouseMove);
	
	setInterval(function(){
		posX += (mX2 - posX) / damp;
		$th.css({left: -posX*wDiff });
	}, 10);	
}

function scrollMainMouseMove(e) {
	mX = e.pageX - this.offsetLeft;
	mX2 = Math.min( Math.max(0, mX-mPadd), mmAA ) * mmAAr;
	
	//bg 
	var x = e.pageX - $(window).width()/2;
	var bgX = x / 200;
	var $bg = $('#container_bg');
	$bg.css({'background-position':50+bgX+'% ' + '0'});	

}
var updatePosX = false;
function updateVisualMove(){
	if(updatePosX) {
		mx = $("#mainvis_container").css('width') - $("#mainvis_container").offsetLeft;
		mX2 = Math.min( Math.max(0, mX-mPadd), mmAA ) * mmAAr;
		updatePosX = false;
	}	
}

function homeScrollParaInit(){
	$('#mainvis_container').css('width',$('#mainvis_zone').width());
	$bl    = $("#mainvis_container");
	$th    = $("#mainvis");
	var thLeft = $th.css('left');
	$th.css('left',0);
	blW    = $bl.outerWidth();
	blSW   = $bl[0].scrollWidth;
	$th.css('left',thLeft);
	//console.log('thLeft '+thLeft);
	wDiff  = (blSW/blW)-1; 
  mmAA   = blW-(mPadd*2);
  mmAAr  = (blW/mmAA);   
}


function homeBottomVisInit(){
	var carousel = $('#highlights_wrap .highlights .jcarousel').jcarousel({
			wrap: 'circular',
			animation: {
				duration: 1000,
				easing:   'linear'
		}
	}).jcarouselAutoscroll({
			interval: 3000
	});
	$('#highlights_wrap .highlights').bind('mouseenter',function() {
			$('#highlights_wrap .jcarousel').jcarouselAutoscroll('stop');
	}).bind('mouseleave',function() {
			$('#highlights_wrap .jcarousel').jcarouselAutoscroll('start');
	}); 
	$('#highlights_wrap .jcarousel-control-prev')
	.on('jcarouselcontrol:active', function() {
			$(this).removeClass('inactive');
	})
	.on('jcarouselcontrol:inactive', function() {
			$(this).addClass('inactive');
	})
	.jcarouselControl({
			target: '-=1',
			carousel: carousel
	});

	$('#highlights_wrap .jcarousel-control-next')
	.on('jcarouselcontrol:active', function() {
			$(this).removeClass('inactive');
	})
	.on('jcarouselcontrol:inactive', function() {
			$(this).addClass('inactive');
	})
	.jcarouselControl({
			target: '+=1',
			carousel: carousel
	});

	$('#promobanner_wrap .promobanner_group').cycle({
			timeout: 4000,
			pause: 1,
			width: 300,
			height: 60,
			fit: 1
	});
	//$('#news_wrap .news').jScrollPane({			
	//		verticalDragMinHeight: 30,
	//		verticalDragMaxHeight: 30	
	//});						
}

var open_calWrap = false;
function animateCalWrap(){
	if(!timeout_initcal) { clearTimeout(timeout_initcal); return;	}
	resumeCurrentMonth();
	if(open_calWrap){
		$('#activ_cal_wrap').animate({
			right: -170
		}, 500, function() {
			open_calWrap = false;
			$('.btn_activ_cal').removeClass('active');
		});
	}else{
		initEventCalendar();
		$('#activ_cal_wrap').animate({
			right: 0
		}, 500, function() {
			open_calWrap = true;
			$('.btn_activ_cal').addClass('active');
		});	
	}
	$('#cal_wrapper').mouseleave(function(){
		if(open_calWrap = true){
			$('#activ_cal_wrap').animate({
				right: -170
			}, 500, function() {
				open_calWrap = false;
				$('.btn_activ_cal').removeClass('active');
			});
		
		}
	});
	
	
		
 }
 
function closeSubNav(){
	$('.btn_subnav_wrap .btn_subnav').removeClass('opend');
	$('#subnav').stop().slideUp(800);
}
function openSubNav(){
	$('#subnav').stop().slideDown(800);
	$('.btn_subnav_wrap .btn_subnav').addClass('opend');
	timeout = setTimeout(closeSubNav, 4000);
}

function fixSubNavAlignment() {
	$.each($('#subnav_zone #subnav > ul > li'), function(i,elem){
		if(i%3 == 0){
			$(this).addClass('fix');
		}
	});
}
 
 
function genCalEventDetails(_index){
	var calDetail = _index === undefined ? $('#cal_event_wrap .cal_detail') : $('#cal_event_wrap .cal_detail:eq('+_index+')');
	$.each(calDetail, function(){
		var carousel = $(this).find('.jcarousel').jcarousel({
				vertical: true
		});
		$(this).find('.jcarousel-control-prev')
		.on('jcarouselcontrol:active', function() {
				$(this).removeClass('inactive');
		})
		.on('jcarouselcontrol:inactive', function() {
				$(this).addClass('inactive');
		})
		.jcarouselControl({
				target: '-=1',
				carousel: carousel
		});

		$(this).find('.jcarousel-control-next')
		.on('jcarouselcontrol:active', function() {
				$(this).removeClass('inactive');
		})
		.on('jcarouselcontrol:inactive', function() {
				$(this).addClass('inactive');
		})
		.jcarouselControl({
				target: '+=1',
				carousel: carousel
		});
	});
}

function homeCalendarInit(){
	reInitCalendar();
	$('#cal_event_wrap .btn_back').click(function(){
		$('#cal_wrap').animate({
			right:0
		}, 500);																										
		$('#cal_event_wrap').animate({
			right:-170
		}, 500);
	});		
	
	timeout_initcal = setTimeout(function(){		
		$('#activ_cal_wrap .btn_activ_cal').click();					
	}, 2000);	
}

function reInitCalendar(){
    $.each($('#cal_wrap .cal_day li.event'),function(index, elem){
        $(this).click(function(){
            $('#cal_wrap').animate({
                right:170
            }, 500, function(){
            });
            $('#cal_event_wrap .event_date, #cal_event_wrap .cal_detail').hide(0);
            $('#cal_event_wrap .event_date:eq('+index+'), #cal_event_wrap .cal_detail:eq('+index+')').show(0);
            
            $('#cal_event_wrap').show(function(){genCalEventDetails(index);}).animate({
                right:0
            }, 500);
        });    
    });
		$('#cal_wrap').animate({
			right:0
		}, 0);
		$('#cal_event_wrap').animate({
			right:-170
		}, 0);
}

function setAdminPulldownMenu(){
	var pulldownHeight_admission = $('#toolbar_pulldown .pulldown.nav_admission').height();
	var pulldownHeight_admin = $('#toolbar_pulldown .pulldown.nav_admin').height();
	 $('#toolbar_pulldown .pulldown').css({'height' : 0 });	
 
 	$('#nav_admission').bind({
		click:function(){
			$(this).addClass('active');
			if(open_calWrap &&  $('#activ_cal_wrap .btn_activ_cal').length > 0){
				 $('#activ_cal_wrap .btn_activ_cal').click(); //close the cal_wrap @ homepage
					if(timeout_cal) clearTimeout(timeout_cal);
			}			
			$('#toolbar_pulldown .pulldown.nav_admission').show();			
			$('#toolbar_pulldown .pulldown.nav_admission').stop().animate({
				height: pulldownHeight_admission,
				paddingTop: 0,
				paddingBottom: 20
				}, 500); 			
		},
		mouseleave:function(){
			$(this).removeClass('active');
			$('#toolbar_pulldown .pulldown.nav_admission').stop().animate({
				height: 0,
				paddingTop: 0,
				paddingBottom: 0
				}, 500, function() {
					$(this).css({
					'display': 'none'
					});
			}); 
		}
	});
	
	$('#nav_admin').bind({
		click:function(){
			$(this).addClass('active');
			if(open_calWrap &&  $('#activ_cal_wrap .btn_activ_cal').length > 0){
				 $('#activ_cal_wrap .btn_activ_cal').click(); //close the cal_wrap @ homepage
					if(timeout_cal) clearTimeout(timeout_cal);
			}			
			$('#toolbar_pulldown .pulldown.nav_admin').show();			
			$('#toolbar_pulldown .pulldown.nav_admin').stop().animate({
				height: pulldownHeight_admin,
				paddingTop: 0,
				paddingBottom: 20
				}, 500); 			
		},
		mouseleave:function(){
			$(this).removeClass('active');
			$('#toolbar_pulldown .pulldown.nav_admin').stop().animate({
				height: 0,
				paddingTop: 0,
				paddingBottom: 0
				}, 500, function() {
					$(this).css({
					'display': 'none'
					});
			}); 
			
			console.log('sss'+pulldownHeight_admin);
		}
	});
	
	
	
	$('#toolbar_pulldown .pulldown.nav_admin').mouseenter(function(){
		$('#nav_admin').click();
	});
	$('#toolbar_pulldown .pulldown.nav_admin').mouseleave(function(){
		$('#nav_admin').mouseleave();	
	});		
	$('#toolbar_pulldown .pulldown.nav_admission').mouseenter(function(){
		$('#nav_admission').click();
	});
	$('#toolbar_pulldown .pulldown.nav_admission').mouseleave(function(){
		$('#nav_admission').mouseleave();	
	});	
}
function setPulldownMenu(){
 //set init height for submenu pulldown
	var pulldownContainer = '#nav';
	var pulldownNum = $(pulldownContainer).children().index();
	var pulldownHeight = new Array();
	for (i=0; i<=pulldownNum; i++) {
		var pulldown_class = $('#nav' + ' > li:eq(' + i +')').attr('class');
		$pulldown = $('#pulldown_container' + ' > #' + pulldown_class);	
		if($pulldown.length > 0) pulldownHeight.push($pulldown.height());
		else pulldownHeight.push(0);
		$pulldown.css({'height' : 0 });		
		//if(typeof console != "undefined") console.log(pulldownHeight);		
	} 
	
	var curnav;
	$('#nav li a').each(function(i){
		$(this).bind({
			click: function() {			
				curnav = $(this).parent().attr('class');
				$(this).addClass('active');
				if($('ul', '#pulldown_container #'+curnav).length > 0){
					if(open_calWrap &&  $('#activ_cal_wrap .btn_activ_cal').length > 0){
						 $('#activ_cal_wrap .btn_activ_cal').click(); //close the cal_wrap @ homepage
						  if(timeout_cal) clearTimeout(timeout_cal);
					}
					$('#pulldown_container #'+curnav).show();
					
					$('#pulldown_container #'+curnav).stop().animate({
						height: pulldownHeight[$('#nav li.'+curnav).index()],
						paddingTop: 0,
						paddingBottom: 20
						}, 500); 
				}
		 },
			mouseleave: function() {
				$(this).removeClass('active');			
				$('#pulldown_container #'+curnav).stop().animate({
					height: 0,
					paddingTop: 0,
					paddingBottom: 0
					}, 500, function() {
						$(this).css({
						'display': 'none'
						});
				}); 
		 }
		});
	});
	
	
	
	$('#nav_wrap .pulldown').mouseenter(function(){
		$('a', '#nav li.'+curnav).click();
	});
	$('#nav_wrap .pulldown').mouseleave(function(){
		$('a', '#nav li.'+curnav).mouseleave();	
	});	
	$('.btn_menuclose').click(function(){
		$('a', '#nav li.'+curnav).mouseleave();	
	});
	
			
}

function gaddr( user, don ) {
 var sig = "&#64;";
 var adr = user + sig + don;
 document.write("<" + "a" + " " + "href=" + "m" + "ail" + "to:" + adr + ">" + adr + "<\/a>");
}


function moveRightEdge() {
try{
	var yMenuFrom, yMenuTo, yOffset, timeoutNextCheck;
	yMenuFrom   = parseInt($('.btn_backtop').css('bottom'));
	top_distance=(($("body").scrollTop()||$("html").scrollTop())+($(window).height()-40-$('.btn_backtop').height()));
	var top_dis_min =  ($('#content').offset().top) + 270;//314;
	
	if (top_distance < top_dis_min){	
		top_distance=top_dis_min; 
 }
	
	yMenuTo = ($(document).height()-top_distance - $('#footer_zone').height()) - 45;
	if (yMenuTo < 40)
		yMenuTo=40;
	timeoutNextCheck = 1000;
	if (yMenuFrom != yMenuTo) {
		yOffset = Math.ceil(Math.abs(yMenuTo - yMenuFrom) / 20);
		if (yMenuTo < yMenuFrom)
			yOffset = -yOffset;
		$('.btn_backtop').css('bottom',parseInt($('.btn_backtop').css('bottom')) + yOffset);
		timeoutNextCheck = 10;
	}
	setTimeout ("moveRightEdge()", timeoutNextCheck);
}catch(error){
}
}


///////////////////////////Calendar////////////////////////////////
var currentLang = '';
var monthAry=new Array();
if(currentLang == 'zh'){
monthAry = [ "1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月" ];
dayNamesAry = [ '日','一','二','三', '四','五','六' ];
}else if(currentLang == 'pt'){
monthAry = [ "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" ];	
dayNamesAry = [ 'Sun','Mon','Tue','Wed', 'Thu','Fri','Sat' ];
}else {
monthAry = [ "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" ];	
dayNamesAry = [ 'Sun','Mon','Tue','Wed', 'Thu','Fri','Sat' ];
}
function initEventCalendar(){
	if($("#mainCalendar").length>0){
		$eventCalendarObject = $("#mainCalendar").eventCalendar({
			eventsjson: '../js/en/activities_list.js', // link to events json
			monthNames:monthAry,
			dayNamesShort: dayNamesAry,
			showDayAsWeeks: true,
			startWeekOnMonday: false,
			showDayNameInCalendar: true,
			showDescription: true,
			onlyOneDescription: true,
			openEventInNewWindow: false,
			eventsScrollable: true,				
			jsonDateFormat: 'human',
			moveSpeed: 500,	// speed of month move when you clic on a new date
			moveOpacity: 0.15, // month and events fadeOut to this opacity
			jsonData: "", 	// to load and inline json (not ajax calls)
			cacheJson: true	// if true plugin get a json only first time and after plugin filter events
		});
	}	
}


/* topbar social links : START */
function shareToFaceBook(){
    var url = location.href;
    window.open('http://www.facebook.com/sharer.php?u='+encodeURIComponent(url),'sharer','toolbar=0,status=0,width=980,height=590');
    return false;
}
 
function shareToTwitter(){
    var url = location.href;
    window.open('http://twitter.com/share?url='+encodeURIComponent(url),'sharer','toolbar=0,status=0,width=630,height=320');
    return false;
}
 
function shareToWeibo(){
    var url = location.href;
    window.open('http://v.t.sina.com.cn/share/share.php?url='+encodeURIComponent(url),'sharer','toolbar=0,status=0,width=630,height=320');
    return false;
}
/* topbar social links : END */