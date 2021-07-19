var scroll_interval;
var firstBlind = true;
var direction = 'up';
var scrollSpeed = 70;
$(document).ready(function(){
	zmsLoadRollingBanner();
});
function zmsLoadRollingBanner(xmlDoc, divID){
	var divID = 'news';
	rollingBanner(xmlDoc, divID);
	

}

function rollingBanner(xmlDoc, divID){
	var scroll=false;
	var childLength = new Object();
	var total_width = new Object();
	var shownObj = new Object();
	var totalImg = new Object();
	childLength[divID] = $('#'+divID).find('li').length;
	total_width[divID] = 0;
	totalImg[divID] = 0;
	 var imageLoaded = function() {
		totalImg[divID] ++;
		if(totalImg[divID] == childLength[divID]){
			for (var i=0; i<childLength[divID]; i++){
				total_width[divID] += $('#'+divID).find('li').eq(i).height();
				scroll=true;	
			}

			if(scroll){
				clearInterval(scroll_interval);
				scroll_interval = setInterval('scrollAni("'+divID+'")', scrollSpeed);
				blindEffect(xmlDoc, divID);
			} 
		}
    }
	// run it first, in case imageLoaded with problem
	if (location.href.indexOf("?print=1") >= 0 
		|| location.href.indexOf("&print=1") >= 0) {
	}else{
		clearInterval(scroll_interval);
		scroll_interval = setInterval('scrollAni("'+divID+'")', scrollSpeed);
		blindEffect(xmlDoc, divID);
	}
	// set width by default
	//$('#'+divID).children('.banner').css('width', '692px');
	
	$('#'+divID).find('img').each(function() {
        var tmpImg = new Image();
        tmpImg.onload = imageLoaded;
		var src = $(this).attr('src');
		$(this).attr('src', '');
        tmpImg.src = src;
        $(this).attr('src', tmpImg.src);
    });
		
}

function scrollAni(divID){
	
	var leftPos = parseInt($('#'+divID).children('.banner').css('margin-top'));
	var child_no = $('#'+divID).find('li').length - 1;
	if(direction=='up'){
	
		if (Math.abs(leftPos)>=$('#'+divID).find('li').eq(0).outerHeight(true)){
			$('#'+divID).children('.banner').append($('#'+divID).find('li').eq(0).clone());
			$('#'+divID).find('li').eq(0).remove();
			$('#'+divID).children('.banner').css('margin-top', '0px');
		}else{
			banner_left_var = leftPos;
			$('#'+divID).children('.banner').css('margin-top', (leftPos-1)+'px');
		}
	}else if(direction=='down'){
		if (leftPos >= 0){
			var fin_leftPos = $('#'+divID).find('li').eq(child_no).outerHeight(true);
			$('#'+divID).children('.banner').prepend($('#'+divID).find('li').eq(child_no).clone());
			$('#'+divID).find('li').eq(child_no+1).remove();
			
			$('#'+divID).children('.banner').css('margin-top', - fin_leftPos +'px');
		}else{
			$('#'+divID).children('.banner').css('margin-top', (leftPos+1)+'px');
		} 
	}
}
var reloadImg = false;
function blindEffect(xmlDoc, divID){
	$('#'+divID).attr('tabindex', 0);
	$('#'+divID).hover(
		function(){
			clearInterval(scroll_interval);
		}, function(){
			clearInterval(scroll_interval);
			scroll_interval = setInterval('scrollAni("'+divID+'")', scrollSpeed);
	});
	
	$('#a_up').hover(
		function(){
			direction = 'up';
			clearInterval(scroll_interval);
			scroll_interval = setInterval('scrollAni("'+divID+'")', scrollSpeed);
		}, function(){
	});
	
	$('#a_down').hover(
		function(){
			direction = 'down';
			clearInterval(scroll_interval);
			scroll_interval = setInterval('scrollAni("'+divID+'")', scrollSpeed);
		}, function(){
	});
	
	$('#'+divID).find('li').focusin(function(){
		clearInterval(scroll_interval);
		reloadImg = true;
	});
	
	$(document).focusin(function (e)
	{
		var container = $('#'+divID);
		if(reloadImg){
			if (container.has(e.target).length === 0)
			{
				//if(reloadImg){
				document.getElementById(divID).innerHTML = '';
				zmsLoadRollingBanner(xmlDoc, divID);
				reloadImg = false;
				//}
			}
		}
	});
	/* $('#'+divID).focuslost(function() {
		document.getElementById(divID).innerHTML = '';
		zmsLoadRollingBanner(xmlDoc, divID);
	}); */
}
