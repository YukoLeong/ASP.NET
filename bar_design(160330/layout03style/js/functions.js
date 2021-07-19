jQuery(function($){

		$('.backtotop').hide();
		$('.backtotop').click(function() {
			$('body,html').animate({
				scrollTop:0
			})
			return false
		});
		$(window).scroll(function() {
			if ($(this).scrollTop() > 500) {
				$('.backtotop').fadeIn();
			} else {
				$('.backtotop').fadeOut();
			}
		});


		if ($(window).width() >= 640){
			$("a[href*='#']:not(.gmenu_icon)").easingScroll({
				easing: "easeOutQuad",
				duration: 400
			});
		}
		
		$(".gmenu").not(".ie8 .gmenu").mmenu({slidingSubmenus:false});
		
		$('.past').click(function () {
			$('.pastmenu').toggleClass("open");
		});
		$(document).click(function(event) {
			if (!$.contains($(".pastmenu")[0], event.target)) {
				$('.pastmenu').removeClass("open");
			}
		});
	
	
	//viewport
	if(navigator.userAgent.indexOf('iPad') > -1){
		jQuery("head").append(jQuery('<meta name="viewport" content="width=1280">'));
	}
	else{
		jQuery('head').append('<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no">');
	}

});



$(function(){
	if ($(window).width() >= 640){
		$(".fixed_height1").tile();
	}
});
$(window).resize(function(){
	if ($(window).width() >= 640){
		$(".fixed_height1").tile();
	}
});



$(function(){
	$(".same_height").tile(3);
});
$(window).resize(function(){
	$(".same_height").tile(3);
});



$(function(){
	$(".same_height2").tile();
});
$(window).resize(function(){
	$(".same_height2").tile();
});



$(function(){
	$(".same_height1").tile();
});
$(window).resize(function(){
	$(".same_height1").tile();
});



$(function() {
	$(".mapbtnno, .maplist").click(function(){
		classname = $(this).attr('class');
		map_no = classname.substr(15, 2);
		$(".map_inner" + map_no).fadeIn(500);
		$(".map_inner").not(".map_inner" + map_no).hide();
		$(".maplist" + map_no).addClass("maplist_on");
		$(".maplist").not(".maplist" + map_no).removeClass("maplist_on");
	});
});



$(function(){
	if ($(window).width() >= 640){
		$(".top_menu").tile(3);
	}
});
$(window).resize(function(){
	if ($(window).width() >= 640){
		$(".top_menu").tile(3);
	}
});





