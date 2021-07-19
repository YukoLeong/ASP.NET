var timeout;
var timeout_cal;
var timeout_initcal;
var init_calWrap = true;
var currentLang = checkCurrentlang();

$(document).ready(function(){
	if($('#mainvis_container').length > 0){				
		homeBottomVisInit();
		$('#mainvis .mainvis_txt').css('visibility', 'visible');
		$('#mainvis .mainvis_nav').css('visibility', 'visible');		
		loadHomeMainVis();	
		//homeMainVisInit();	
		
	}
	try{
		var menuCloseBtn ='';

		if (currentLang == 'en'){
		menuCloseBtn += '<a class="btn_menuclose">Close</a>';
		}
		if (currentLang == 'zh'){
		menuCloseBtn += '<a class="btn_menuclose">關閉</a>';
		}
		if (currentLang == 'pt'){
		menuCloseBtn += '<a class="btn_menuclose">Fechar</a>';
		}
		
		$('.pulldown_body').append(menuCloseBtn);
		
	}catch(err){}
	if($('#activ_cal_wrap').length > 0){		
		 $('#activ_cal_wrap .btn_activ_cal').bind('click', animateCalWrap);
			homeCalendarInit();	
			
			$('#cal_wrapper').mouseenter(function(){ 
				init_calWrap=false; 
				if(timeout_initcal) clearTimeout(timeout_initcal);
			});					
		}		
	
	if($('#nav').length > 0){ setPulldownMenu();}
	if($('#nav_admin').length > 0){ 
		setAdminPulldownMenu();
		$('#toolbar_pulldown .pulldown_container .pulldown.nav_admin ul.clearfix > li').each(function(i,elem){		
			if(i%3 == 0){
				$(this).addClass('fix');
			}				
		 });
		$('#toolbar_pulldown .pulldown_container .pulldown.nav_admission ul.clearfix > li').each(function(i,elem){		
			if(i%3 == 0){
				$(this).addClass('fix');
			}				
		 });		 
	
	}


	if($('#mainvis_zone .btn_subnav_wrap').length > 0){
		fixSubNavAlignment();
		$('#mainvis_zone .btn_subnav_wrap .btn_subnav').click(function(){
			clearTimeout(timeout);
			if($('.btn_subnav_wrap .btn_subnav').hasClass('opend')) $('.btn_subnav_wrap .btn_subnav').removeClass('opend');
			else $('.btn_subnav_wrap .btn_subnav').addClass('opend');
		
			$('#subnav').stop().slideToggle(800, function() {	
				if($("#subnav").css('display') == 'none'){
					$("#subnav").hide();
				}
				else{ 
					$("#subnav").show();
				}
			});
			return false;
		});
		
		//$('#subnav').hover(function(){ clearTimeout(timeout); })
		//timeout = setTimeout(openSubNav, 500);
		$(document).ready(function(){
			//$("#subnav").show();
			//$('.btn_subnav_wrap .btn_subnav').addClass('opend');
			
		});
	}
	
	if($('#pulldown_container .pulldown ul').length > 0){
		var pulldown_len = $('#pulldown_container .pulldown').length;
		 $('#pulldown_container .pulldown').each(function(k){
				var pullID = $('#pulldown_container .pulldown:nth-child('+(k+1)+')').attr('id');
				$.each($('#'+pullID+' ul.clearfix > li'), function(i,elem){
					if(i%3 == 0){
						$(this).addClass('fix');
					}
				});					
		 });
	}
	
	if($('#content ul.two_items').length > 0){
/*		$.each($('#content ul.two_items > li'), function(i,elem){
			if(i%2 == 0){
				$(this).addClass('fix');
			}
		});	*/
		$.each($('#content ul.two_items'), function(i, elem){
				$.each($('li',this), function(k, elememt){
						if(k%2 == 0) $(this).addClass('fix');
				});
		});
	}
	
	if($('#sitemap ul').length > 0){
		$.each($('#sitemap > ul'), function(i, elem){
				$.each($('> li',this), function(k, elememt){
						if(k%3 == 0) $(this).addClass('fix');
				});
		});
	}
	
	if($('#page_directory').length > 0){
		$.each($('#page_directory .directory_blk'), function(i, elem){
				$.each($('.directory_item',this), function(k, elememt){
						if(k%4 == 0) $(this).addClass('fix');
				});
		});
	}	
	
	if($('#content table.colorTable').length > 0){
		$('#content table.colorTable tr:last-child').addClass('last_row');
	}
	
	if($('#content table.colorTable').hasClass('programme')){
		$.each($('#content table.programme tr.heading'), function(i,elem){
			if(i == 0){
				$(this).addClass('no_border');
			}
		});
	}

	if($('#campusMap table.colorTable').hasClass('mapTable')){
		$('#campusMap table.colorTable.mapTable tr:nth-child(odd)').addClass('oddRow');
	}
	
	if($('#news_events_container table.colorTable').hasClass('news_events')){
		$('#news_events_container table.colorTable.news_events tr:nth-child(odd)').addClass('oddRow');
	}
	
	if($('#highlight_container table.colorTable').length > 0){
		$('#highlight_container table.colorTable tr:nth-child(odd)').addClass('oddRow');
	}	
	
	if($('#mapSelection.map_index').length > 0){
		$('#mapSelection .mapItem').css('opacity',1);		
		$.each($('#mapSelection .mapItem'), function(i,elem){																			 																									
			$(this).hover(function(){
				$('#mapSelection .mapItem').css('opacity',.5);
				$('#mapSelection .mapItem').css('background-color','#f4fcfe');
			}, function(){
				$('#mapSelection .mapItem').css('opacity', 1);
				$('#mapSelection .mapItem').css('background-color','none');
			});
		});		
	}
	
	if($('#mapSelection .mapItem').hasClass('selected')){
		$.each($('#mapSelection .mapItem'), function(i,elem){																		 																									
			$(this).hover(function(){
				$('#mapSelection .mapItem').css('background-color','#ddf6f8');
			}, function(){
				$('#mapSelection .mapItem').css('background-color','none');
			});
		});		
	}	
	
	/* if($('#calendarContainer').length > 0) 	{
		initEventCalendar();
		var showHeight = $('#showCalendar').css('height');
		$('#showActivities').css('height', showHeight);
	}	 */
try{
    $('.share_nav .fb').bind('click', shareToFaceBook);
    $('.share_nav .tw').bind('click', shareToTwitter);
    $('.share_nav .sn').bind('click', shareToWeibo);
}catch(err){}


 try{
	//$('ul.toolbar_right').children('li').not('.fontsize').hover(function(){
	$('ul.toolbar_right').children('li:not([class=fontsize]):not([class=btn_fb])').hover(function(){
	$(this).addClass('active');
	$(this).children('div').stop().slideDown(200);
	}, function() {
	$(this).removeClass('active');
	$(this).children('div').stop().slideUp(200);
	});
	}catch(err){} 
	
	loadFontSize();
	
	if($('.btn_backtop').length > 0) moveRightEdge();


	if (typeof $.fancybox != 'undefined'){			/*
			 *  Simple image gallery. Uses default settings
			 */

			$('.fancybox').fancybox({
					'titlePosition'  : 'inside',
					'padding' : 10
			});
			
			//$('.reportcover.fancybox').fancybox({'titlePosition'  : 'inside'});

			/*
			 *  Different effects
			 */

			// Change title type, overlay closing speed
			$(".fancybox-effects-a").fancybox({
				helpers: {
					title : {
						type : 'outside'
					},
					overlay : {
						speedOut : 0
					}
				}
			});

			// Disable opening and closing animations, change title type
			$(".fancybox-effects-b").fancybox({
				openEffect  : 'none',
				closeEffect	: 'none',

				helpers : {
					title : {
						type : 'over'
					}
				}
			});

			// Set custom style, close if clicked, change title type and overlay color
			$(".fancybox-effects-c").fancybox({
				wrapCSS    : 'fancybox-custom',
				closeClick : true,

				openEffect : 'none',

				helpers : {
					title : {
						type : 'inside'
					},
					overlay : {
						css : {
							'background' : 'rgba(238,238,238,0.85)'
						}
					}
				}
			});

			// Remove padding, set opening and closing animations, close if clicked and disable overlay
			$(".fancybox-effects-d").fancybox({
				padding: 0,

				openEffect : 'elastic',
				openSpeed  : 150,

				closeEffect : 'elastic',
				closeSpeed  : 150,

				closeClick : true,

				helpers : {
					overlay : null
				}
			});

			/*
			 *  Button helper. Disable animations, hide close button, change title type and content
			 */

			$('.fancybox-buttons').fancybox({
				openEffect  : 'none',
				closeEffect : 'none',

				prevEffect : 'none',
				nextEffect : 'none',

				closeBtn  : false,

				helpers : {
					title : {
						type : 'inside'
					},
					buttons	: {}
				},

				afterLoad : function() {
					this.title = 'Image ' + (this.index + 1) + ' of ' + this.group.length + (this.title ? ' - ' + this.title : '');
				}
			});


			/*
			 *  Thumbnail helper. Disable animations, hide close button, arrows and slide to next gallery item if clicked
			 */

			$('.fancybox-thumbs').fancybox({
				prevEffect : 'none',
				nextEffect : 'none',

				closeBtn  : false,
				arrows    : false,
				nextClick : true,

				helpers : {
					thumbs : {
						width  : 50,
						height : 50
					}
				}
			});

			/*
			 *  Media helper. Group items, disable animations, hide arrows, enable media and button helpers.
			*/
			$('.fancybox-media')
				.attr('rel', 'media-gallery')
				.fancybox({
					openEffect : 'none',
					closeEffect : 'none',
					prevEffect : 'none',
					nextEffect : 'none',

					arrows : false,
					helpers : {
						media : {},
						buttons : {}
					}
				});

			/*
			 *  Open manually
			 */

			$("#fancybox-manual-a").click(function() {
				$.fancybox.open('1_b.jpg');
			});

			$("#fancybox-manual-b").click(function() {
				$.fancybox.open({
					href : 'iframe.html',
					type : 'iframe',
					padding : 5
				});
			});

			$("#fancybox-manual-c").click(function() {
				$.fancybox.open([
					{
						href : '1_b.jpg',
						title : 'My title'
					}, {
						href : '2_b.jpg',
						title : '2nd title'
					}, {
						href : '3_b.jpg'
					}
				], {
					helpers : {
						thumbs : {
							width: 75,
							height: 50
						}
					}
				});
			});

	};

});	


$( window ).resize(function() {	
	if(this.resizeTO) clearTimeout(this.resizeTO);
	this.resizeTO = setTimeout(function() {
			$(this).trigger('resizeend');
	}, 10);
		
});	

$(window).bind('resizeend', function() {
	if($('#mainvis_container').length > 0){				
		updatePosX = true;
		updateVisualMove();
		homeScrollParaInit();
	}	
});
