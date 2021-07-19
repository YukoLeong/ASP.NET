/* =
	jquery.eventCalendar.js
	version: 0.54
	date: 18-04-2013
	author:
		Jaime Fernandez (@vissit)
	company:
		Paradigma Tecnologico (@paradigmate)

	amendment:
	append arrow first for initial
	search "amend for scsha"
*/

;$.fn.eventCalendar = function(options){

	var eventsOpts = $.extend({}, $.fn.eventCalendar.defaults, options);
	
	var runAfterAnimateTimeout;
	
	var todaySign = 'Today';

	// define global vars for the function
	var flags = {
		wrap: "",
		directionLeftMove: "300",
		eventsJson: {}
	}

	// each eventCalendar will execute this function
	this.each(function(){

		flags.wrap = $(this);
		flags.wrap.addClass('eventCalendar-wrap').append("<div class='eventsCalendar-list-wrap'><p class='eventsCalendar-subtitle'></p><span class='eventsCalendar-loading'>loading...</span><div class='eventsCalendar-list-content'><ul class='eventsCalendar-list'></ul></div></div>");

		if (eventsOpts.eventsScrollable) {
			flags.wrap.find('.eventsCalendar-list-content').addClass('scrollable');
		}

		setCalendarWidth();
		$(window).resize(function(){
			setCalendarWidth();
		});
		//flags.directionLeftMove = flags.wrap.width();

		// show current month
		dateSlider("current");

		getEvents(eventsOpts.eventsLimit,false,false,false,false);

		changeMonth();
		
		//showMessageBox();
		showEvents();
		
		
		/*
		flags.wrap.on('click','.eventsCalendar-day a',function(e){
		//flags.wrap.find('.eventsCalendar-day a').live('click',function(e){
			e.preventDefault();
			var year = flags.wrap.attr('data-current-year'),
				month = flags.wrap.attr('data-current-month'),
				day = $(this).parent().attr('rel');

			getEvents(false, year, month,day, "day");
		});
		*/
		flags.wrap.on('click','.monthTitle', function(e){
		//flags.wrap.find('.monthTitle').live('click',function(e){
			e.preventDefault();
			var year = flags.wrap.attr('data-current-year'),
				month = flags.wrap.attr('data-current-month');

			//getEvents(eventsOpts.eventsLimit, year, month,false, "month");
		})



	});

	// show event description
	flags.wrap.find('.eventsCalendar-list').on('click','.eventTitle',function(e){
	//flags.wrap.find('.eventsCalendar-list .eventTitle').live('click',function(e){
		if(!eventsOpts.showDescription) {
			e.preventDefault();
			var desc = $(this).parent().find('.eventDesc');

			if (!desc.find('a').size()) {
				var eventUrl = $(this).attr('href');
				var eventTarget = $(this).attr('target');

				// create a button to go to event url
				desc.append('<a href="' + eventUrl + '" target="'+eventTarget+'" class="bt">'+eventsOpts.txt_GoToEventUrl+'</a>')
			}

			if (desc.is(':visible')) {
				desc.slideUp();
			} else {
				if(eventsOpts.onlyOneDescription) {
					flags.wrap.find('.eventDesc').slideUp();
				}
				desc.slideDown();
			}

		}
	});

	function sortJson(a, b){
		return a.date.toLowerCase() > b.date.toLowerCase() ? 1 : -1;
	};

	function dateSlider(show, _year, _month) {
		var $eventsCalendarSlider = $("<div class='eventsCalendar-slider'></div>"),
			$eventsCalendarMonthWrap = $("<div class='eventsCalendar-monthWrap'></div>"),
			//amend for scsha
			//$eventsCalendarTitle = $("<div class='eventsCalendar-currentTitle'><a href='#' class='monthTitle'></a></div>"),
			$eventsCalendarTitle = $("<div class='eventsCalendar-currentTitle'><span href='#' class='monthTitle'></span></div>"),
			$eventsCalendarArrows = $("<a href='#' class='arrow prev'><span>" + eventsOpts.txt_prev + "</span></a><a href='#' class='arrow next'><span>" + eventsOpts.txt_next + "</span></a>");
			$eventsCalendarDaysList = $("<ul class='eventsCalendar-daysList clearfix'></ul>"),
			date = new Date();

		// if current show current month & day
		if (show === "current") {
			day = date.getDate();
			$eventsCalendarSlider.append($eventsCalendarArrows);

		}
		if (!flags.wrap.find('.eventsCalendar-slider').size()) {
			flags.wrap.prepend($eventsCalendarSlider);
			$eventsCalendarSlider.append($eventsCalendarMonthWrap);
		} else {
			flags.wrap.find('.eventsCalendar-slider').append($eventsCalendarMonthWrap);
		}

		flags.wrap.find('.eventsCalendar-monthWrap.currentMonth').removeClass('currentMonth').addClass('oldMonth');
		$eventsCalendarMonthWrap.addClass('currentMonth').append($eventsCalendarTitle, $eventsCalendarDaysList);



		// if current show current month & day
		if (show === "current") {
			//day = date.getDate();
			//$eventsCalendarSlider.append($eventsCalendarArrows);

		} else {
			date = new Date(flags.wrap.attr('data-current-year'),flags.wrap.attr('data-current-month'),1,0,0,0); // current visible month
			day = 0; // not show current day in days list

			moveOfMonth = 1;
			if (show === "prev") {
				moveOfMonth = -1;
			}
			date.setMonth( date.getMonth() + moveOfMonth );

			var tmpDate = new Date();
			if (date.getMonth() === tmpDate.getMonth()) {
				day = tmpDate.getDate();
			}

		}

		// get date portions
		var year = date.getFullYear(), // year of the events
			currentYear = (new Date).getFullYear(), // current year
			month = date.getMonth(); // 0-11
			
			//_year, _month
			
			if(_year){
				year = _year;
			}
			if(_month || _month==0){
				month = _month;
			}
		var monthToShow = month + 1;

		flags.wrap.attr('data-current-month',month)
			.attr('data-current-year',year);

		if (show != "current") {
			// month change
			getEvents(eventsOpts.eventsLimit, year, month,false, show);
		}

		if(currentLang == 'zh'){
		eventsOpts.monthNames = [ "1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月" ];
		eventsOpts.dayNamesShort = [ '日','一','二','三', '四','五','六' ];
		todaySign = '今天';
		}else if(currentLang == 'pt'){
		eventsOpts.monthNames = [ "Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro" ];	
		eventsOpts.dayNamesShort = [ 'Domingo','Segunda','Terça','Quarta', 'Quinta','Sexta','Sábado' ];
		todaySign = 'Today';
		}else {
		eventsOpts.monthNames = [ "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" ];
		eventsOpts.dayNamesShort = [ 'Sun','Mon','Tue','Wed', 'Thu','Fri','Sat' ];
		todaySign = 'Today';
		}
		
		
				
		// add current date info
		// diff lang setting
		if(currentLang == 'zh'){
			$eventsCalendarTitle.find('.monthTitle').html(year + "年 " + eventsOpts.monthNames[month]);
		}else if(currentLang == 'pt'){
			$eventsCalendarTitle.find('.monthTitle').html(eventsOpts.monthNames[month] + " " + year);
		}else{
			$eventsCalendarTitle.find('.monthTitle').html(eventsOpts.monthNames[month] + " " + year);
		}
		// print all month days
		var daysOnTheMonth = 32 - new Date(year, month, 32).getDate();
		var daysList = [];
		var suffixBox = 42;
		if (eventsOpts.showDayAsWeeks) {
			$eventsCalendarDaysList.addClass('showAsWeek');

			// show day name in top of calendar
			if (eventsOpts.showDayNameInCalendar) {
				$eventsCalendarDaysList.addClass('showDayNames');

				var i = 0;
				// if week start on monday
				if (eventsOpts.startWeekOnMonday) {
					i = 1;
				}

				for (; i < 7; i++) {
					//amend for scsha
					//daysList.push('<li class="eventsCalendar-day-header">'+eventsOpts.dayNamesShort[i]+'</li>');
					if(i === 0){
						daysList.push('<li class="eventsCalendar-day-header eventsCalendar-day-sunday">'+eventsOpts.dayNamesShort[i]+'</li>');
					}else{
						daysList.push('<li class="eventsCalendar-day-header">'+eventsOpts.dayNamesShort[i]+'</li>');
					}

					if (i === 6 && eventsOpts.startWeekOnMonday) {
						// print sunday header
						//amend for scsha
						daysList.push('<li class="eventsCalendar-day-header">'+eventsOpts.dayNamesShort[0]+'</li>');
					}

				}
			}

			dt=new Date(year, month, 01);
			var weekDay = dt.getDay(); // day of the week where month starts

			if (eventsOpts.startWeekOnMonday) {
				weekDay = dt.getDay() - 1;
			}
			if (weekDay < 0) { weekDay = 6; } // if -1 is because day starts on sunday(0) and week starts on monday
			for (i = weekDay; i > 0; i--) {
				if(i===weekDay){
					daysList.push('<li class="eventsCalendar-day eventsCalendar-day-sunday empty"></li>');
				}else{
					daysList.push('<li class="eventsCalendar-day empty"></li>');
				}
				suffixBox--;
			}
		}
		for (dayCount = 1; dayCount <= daysOnTheMonth; dayCount++) {
			var dayClass = "";
			
			var todayClass = "";
			if (day > 0 && dayCount === day && year === currentYear) {
				todayClass = " today";
			}
			//amend for scsha
			//daysList.push('<li id="dayList_' + dayCount + '" rel="'+dayCount+'" class="eventsCalendar-day '+dayClass+'"><a href="#">' + dayCount + '</a></li>');
			if((dayCount+weekDay)%7===1){
				daysList.push('<li id="dayList_' + dayCount + '" rel="'+dayCount+'" class="eventsCalendar-day eventsCalendar-day-sunday '+dayClass+todayClass+'"><span>' + dayCount + '</span></li>');
			}else{
				var dayClass =(dayCount+weekDay)%7-1;
				if(dayClass < 0 ){
					dayClass = 6;
				}
				daysList.push('<li id="dayList_' + dayCount + '" rel="'+dayCount+'" class="eventsCalendar-day '+eventsOpts.dayNamesClass[dayClass]+todayClass+'"><span>' + dayCount + '</span></li>');
			}
			suffixBox--;
		}
		for (i = 0; i < suffixBox; i++) {
			//if(suffixBox-i===7 || suffixBox-i===14){
				if((suffixBox-i)%7 === 0){
				daysList.push('<li class="eventsCalendar-day eventsCalendar-day-sunday empty"></li>');
			}else{
				daysList.push('<li class="eventsCalendar-day empty"></li>');
			}
		}
		$eventsCalendarDaysList.append(daysList.join(''));
		var browser = getInternetExplorerVersion();
		if (browser > -1){
			if (browser >= 9.0){
				adjustH = 8;
			}else if (browser == 8.0){
				adjustH = 7;
			}else{
				adjustH = 2;
			}
		}else{
			adjustH = 6;
		}
		$eventsCalendarSlider.css('height',$eventsCalendarMonthWrap.height()+adjustH+'px');
	}
	
function getInternetExplorerVersion()
// Returns the version of Internet Explorer or a -1
// (indicating the use of another browser).
{
    var rv = -1; // Return value assumes failure.
    if (navigator.appName == 'Microsoft Internet Explorer')
    {
        var ua = navigator.userAgent;
        var re  = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");
    if (re.exec(ua) != null)
        rv = parseFloat( RegExp.$1 );
    }
    return rv;
}

	function num_abbrev_str(num) {
		var len = num.length, last_char = num.charAt(len - 1), abbrev
		if (len === 2 && num.charAt(0) === '1') {
			abbrev = 'th'
		} else {
			if (last_char === '1') {
				abbrev = 'st'
			} else if (last_char === '2') {
				abbrev = 'nd'
			} else if (last_char === '3') {
				abbrev = 'rd'
			} else {
				abbrev = 'th'
			}
		}
		return num + abbrev
	}

	function getEvents(_limit, _year, _month, _day, direction) {
		var limit = _limit || 0;
		var year = _year || '';
		var day = _day || '';

	
		flags.wrap.find('.currentMonth .eventsCalendar-daysList .today').not(':has(".isToday")').append('<div class="isToday">'+todaySign+'</div>');

		// to avoid problem with january (month = 0)

		if (typeof _month != 'undefined' && _month) {
			var month = _month;
		} else {
			var month = '';
		}

		//var month = month || '';
		flags.wrap.find('.eventsCalendar-loading').fadeIn();

		if (eventsOpts.jsonData) {
			// user send a json in the plugin params
			eventsOpts.cacheJson = true;

			flags.eventsJson = eventsOpts.jsonData;
			getEventsData(flags.eventsJson, limit, year, month, day, direction);

		} else if (!eventsOpts.cacheJson || !direction) {
			// first load: load json and save it to future filters
			$.getJSON(eventsOpts.eventsjson + "?limit="+limit+"&year="+year+"&month="+month+"&day="+day, function(data) {
				flags.eventsJson = data; // save data to future filters
				getEventsData(flags.eventsJson, limit, year, month, day, direction);
			}).error(function(xhr, ajaxOptions, thrownError) {
				showError("error getting json: ");
			});
		} else {
			// filter previus saved json
			getEventsData(flags.eventsJson, limit, year, month, day, direction);
						
		}

		if (day > '') {
			flags.wrap.find('.current').removeClass('current');
			flags.wrap.find('#dayList_'+day).addClass('current');
		}
	}

	
	function getEventsData(data, limit, year, month, day, direction){
		
		directionLeftMove = "-=" + flags.directionLeftMove;
		eventContentHeight = "auto";

		subtitle = flags.wrap.find('.eventsCalendar-list-wrap .eventsCalendar-subtitle')
		if (!direction) {
			// first load
			subtitle.html(eventsOpts.txt_NextEvents);
			eventContentHeight = "auto";
			directionLeftMove = "-=0";
		} else {
			if (day != '') {
				subtitle.html(eventsOpts.txt_SpecificEvents_prev + eventsOpts.monthNames[month] + " " + num_abbrev_str(day) + " " + eventsOpts.txt_SpecificEvents_after);
			} else {
				subtitle.html(eventsOpts.txt_SpecificEvents_prev + eventsOpts.monthNames[month] + " " + eventsOpts.txt_SpecificEvents_after);
			}

			if (direction === 'prev') {
				directionLeftMove = "+=" + flags.directionLeftMove;
			} else if (direction === 'day' || direction === 'month') {
				directionLeftMove = "+=0";
				eventContentHeight = 0;
			}
		}
		
		function runAfterAnimate(){
			flags.wrap.find('.eventsCalendar-list').css({'left':0, 'height': 'auto'}).hide();
			//wrap.find('.eventsCalendar-list li').fadeIn();

			var events = [];

			data = $(data).sort(sortJson); // sort event by dates

			// each event
			if (data.length) {

				// show or hide event description
				var eventDescClass = '';
				if(!eventsOpts.showDescription) {
					eventDescClass = 'hidden';
				}
				var eventLinkTarget = "_self";
				if(eventsOpts.openEventInNewWindow) {
					eventLinkTarget = '_target';
				}

				var i = 0;
				
				var month=new Array();
				if(currentLang == 'zh'){
				month = [ "1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月" ];
				}else if(currentLang == 'pt'){
				month = [ "Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro" ];	
				}else {
				month = [ "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" ];	
				}

				$.each(data, function(key, event) {
					if (eventsOpts.jsonDateFormat == 'human') {
						var thisEventDate;
						var eventData = event.description;
						var eventDateTime = event.date.split(" "),
							eventDate = eventDateTime[0].split("-"),
							//eventTime = eventDateTime[1].split(":"),
							eventYear = eventDate[0],
							eventMonth = parseInt(eventDate[1],10) - 1,
							eventDay = parseInt(eventDate[2],10),
							//eventMonthToShow = eventMonth,
							eventMonthToShow = parseInt(eventMonth,10) + 1,
						//	eventHour = eventTime[0],
						//	eventMinute = eventTime[1],
						//	eventSeconds = eventTime[2],
							//eventDate = new Date(eventYear, eventMonth, eventDay, eventHour, eventMinute, eventSeconds);
							eventDate = new Date(eventYear, eventMonth, eventDay);
							if(currentLang == 'zh' ){
							thisEventDate =  eventDate.getFullYear()+'年' + month[eventDate.getMonth()] +''+eventDate.getDate() +'日';
							}else if(currentLang == 'pt' ){
								thisEventDate = eventDate.getDate() +' '+ month[eventDate.getMonth()] +' '+ eventDate.getFullYear();								
							}else{
								thisEventDate = eventDate.getDate() +' '+ month[eventDate.getMonth()] +' '+ eventDate.getFullYear();								
						}
					} else {
						var eventDate = new Date(parseInt(event.date,10)),
							eventYear = eventDate.getFullYear(),
							eventMonth = eventDate.getMonth(),
							eventDay = eventDate.getDate(),
							eventMonthToShow = eventMonth + 1,
							eventHour = eventDate.getHours(),
							eventMinute = eventDate.getMinutes();

					}

					if (parseInt(eventMinute,10) <= 9) {
						eventMinute = "0" + parseInt(eventMinute,10);
					}


					if (limit === 0 || limit > i) {
						// if month or day exist then only show matched events

						if ((month === false || month == eventMonth)
								&& (day == '' || day == eventDay)
								&& (year == '' || year == eventYear) // get only events of current year
							) {
								// if initial load then load only future events
								if (month === false && eventDate < new Date()) {

								} else {
									eventStringDate = eventDay + "/" + eventMonthToShow + "/" + eventYear;
									if (event.url) {
										var eventTitle = '<a href="'+event.url+'" target="' + eventLinkTarget + '" class="eventTitle">' + event.title + '</a>';
									} else {
										var eventTitle = '<span class="eventTitle">'+event.title+'</span>';
									}
									events.push('<li id="' + key + '" class="'+event.type+'"><time datetime="'+eventDate+'"><em>' + eventStringDate + '</em><small>'+eventHour+":"+eventMinute+'</small></time>'+eventTitle+'<p class="eventDesc ' + eventDescClass + '">' + event.description + '</p></li>');
									i++;
								}
						}
					}

					// add mark in the dayList to the days with events
					if (eventYear == flags.wrap.attr('data-current-year') && eventMonth == flags.wrap.attr('data-current-month')) {
						flags.wrap.find('.currentMonth .eventsCalendar-daysList #dayList_' + parseInt(eventDay,10)).addClass('dayWithEvents');
						flags.wrap.find('.currentMonth .eventsCalendar-daysList #dayList_' + parseInt(eventDay,10)).addClass(event.type);

					//	flags.wrap.find('.currentMonth .eventsCalendar-daysList #dayList_' + parseInt(eventDay,10) + ' a').attr('tabindex', '');

						var eventDataLists = '';
						var eventTitle = event.url ? '<a href="'+event.url+'" target="' + eventLinkTarget + '" class="eventTitle">' + eventData + '</a>' : eventData;
						var dateRecord = '<p class="date">'+thisEventDate+'</p>';
						var eventRecord = '<p class="'+event.type+'">'+eventTitle+'</p>';	
						eventDataLists = eventDataLists + dateRecord;
						eventDataLists = eventDataLists + eventRecord;
						var events_box = '<div class="events_box">'+eventDataLists+'</div>';
						
						var key_Lists = '';
						var keyItem = '<span class="'+event.type+'"></span>';
						var key_Lists = key_Lists + keyItem;
						var key_box = '<div class="key_box">'+key_Lists+'</div>';					
						
						flags.wrap.find('.currentMonth .eventsCalendar-daysList #dayList_' + parseInt(eventDay,10)+' div.key_box').append(keyItem);
						flags.wrap.find('.currentMonth .eventsCalendar-daysList #dayList_' + parseInt(eventDay,10)).not(':has(".key_box")').append(key_box);
						
						flags.wrap.find('.currentMonth .eventsCalendar-daysList #dayList_' + parseInt(eventDay,10)+' div.events_box').append(eventRecord);
						flags.wrap.find('.currentMonth .eventsCalendar-daysList #dayList_' + parseInt(eventDay,10)).not(':has(".events_box")').append(events_box);
						
						var outline = '<div class="outline"></div>';
						flags.wrap.find('.currentMonth .eventsCalendar-daysList #dayList_' + parseInt(eventDay,10)).not(':has(".outline")').append(outline);
						
						//flags.wrap.find('.currentMonth .eventsCalendar-daysList .today').not(':has(".isToday")').append('<div class="isToday">Today</div>');
/*						flags.wrap.find('.currentMonth .eventsCalendar-daysList #dayList_' + parseInt(eventDay,10)+' div.events_box').append(eventRecord);
						flags.wrap.find('.currentMonth .eventsCalendar-daysList #dayList_' + parseInt(eventDay,10)).not(':has(div)').append(events_box);*/						
					}

				});
			}
			// there is no events on this period
			if (!events.length) {
				events.push('<li class="eventsCalendar-noEvents"><p>' + eventsOpts.txt_noEvents + '</p></li>');
			}
			flags.wrap.find('.eventsCalendar-loading').hide();

			flags.wrap.find('.eventsCalendar-list')
				.html(events.join(''));

			flags.wrap.find('.eventsCalendar-list').animate({
				opacity: 1,
				height: "toggle"
			}, eventsOpts.moveSpeed);
		}
		
		flags.wrap.find('.eventsCalendar-list').animate({
			opacity: eventsOpts.moveOpacity,
			left: directionLeftMove,
			height: eventContentHeight
		}, eventsOpts.moveSpeed, function() {
			/* flags.wrap.find('.eventsCalendar-list').css({'left':0, 'height': 'auto'}).hide();
			//wrap.find('.eventsCalendar-list li').fadeIn();

			var events = [];

			data = $(data).sort(sortJson); // sort event by dates

			// each event
			if (data.length) {

				// show or hide event description
				var eventDescClass = '';
				if(!eventsOpts.showDescription) {
					eventDescClass = 'hidden';
				}
				var eventLinkTarget = "_self";
				if(eventsOpts.openEventInNewWindow) {
					eventLinkTarget = '_target';
				}

				var i = 0;
				$.each(data, function(key, event) {
					if (eventsOpts.jsonDateFormat == 'human') {
						var eventData = event.description;
						var eventDateTime = event.date.split(" "),
							eventDate = eventDateTime[0].split("-"),
							eventTime = eventDateTime[1].split(":"),
							eventYear = eventDate[0],
							eventMonth = parseInt(eventDate[1],10) - 1,
							eventDay = parseInt(eventDate[2],10),
							//eventMonthToShow = eventMonth,
							eventMonthToShow = parseInt(eventMonth,10) + 1,
							eventHour = eventTime[0],
							eventMinute = eventTime[1],
							eventSeconds = eventTime[2],
							eventDate = new Date(eventYear, eventMonth, eventDay, eventHour, eventMinute, eventSeconds);
					} else {
						var eventDate = new Date(parseInt(event.date,10)),
							eventYear = eventDate.getFullYear(),
							eventMonth = eventDate.getMonth(),
							eventDay = eventDate.getDate(),
							eventMonthToShow = eventMonth + 1,
							eventHour = eventDate.getHours(),
							eventMinute = eventDate.getMinutes();

					}

					if (parseInt(eventMinute,10) <= 9) {
						eventMinute = "0" + parseInt(eventMinute,10);
					}


					if (limit === 0 || limit > i) {
						// if month or day exist then only show matched events

						if ((month === false || month == eventMonth)
								&& (day == '' || day == eventDay)
								&& (year == '' || year == eventYear) // get only events of current year
							) {
								// if initial load then load only future events
								if (month === false && eventDate < new Date()) {

								} else {
									eventStringDate = eventDay + "/" + eventMonthToShow + "/" + eventYear;
									if (event.url) {
										var eventTitle = '<a href="'+event.url+'" target="' + eventLinkTarget + '" class="eventTitle">' + event.title + '</a>';
									} else {
										var eventTitle = '<span class="eventTitle">'+event.title+'</span>';
									}
									events.push('<li id="' + key + '" class="'+event.type+'"><time datetime="'+eventDate+'"><em>' + eventStringDate + '</em><small>'+eventHour+":"+eventMinute+'</small></time>'+eventTitle+'<p class="eventDesc ' + eventDescClass + '">' + event.description + '</p></li>');
									i++;
								}
						}
					}

					// add mark in the dayList to the days with events
					if (eventYear == flags.wrap.attr('data-current-year') && eventMonth == flags.wrap.attr('data-current-month')) {
						flags.wrap.find('.currentMonth .eventsCalendar-daysList #dayList_' + parseInt(eventDay,10)).addClass('dayWithEvents');
						
						//amend for scsha
						flags.wrap.find('.currentMonth .eventsCalendar-daysList #dayList_' + parseInt(eventDay,10) + ' a').attr('tabindex', '');
						var eventDataTable = '<table cellpadding="0" cellspacing="0" width="100%">'
						var eventRecord = '<tr><th style="width:32%;">'+ eventHour +':'+eventMinute+'</th><td>'+eventData+'</td></tr>';
						eventDataTable = eventDataTable + eventRecord;
						eventDataTable = eventDataTable +'</table>';
						var message_box = '<div class="message_box"><div class="message">'+eventDataTable+'</div></div>';
						flags.wrap.find('.currentMonth .eventsCalendar-daysList #dayList_' + parseInt(eventDay,10)+' div.message_box div table').append(eventRecord);
						flags.wrap.find('.currentMonth .eventsCalendar-daysList #dayList_' + parseInt(eventDay,10)).not(':has(div)').append(message_box);
						
					}

				});
			}
			// there is no events on this period
			if (!events.length) {
				events.push('<li class="eventsCalendar-noEvents"><p>' + eventsOpts.txt_noEvents + '</p></li>');
			}
			flags.wrap.find('.eventsCalendar-loading').hide();

			flags.wrap.find('.eventsCalendar-list')
				.html(events.join(''));

			flags.wrap.find('.eventsCalendar-list').animate({
				opacity: 1,
				height: "toggle"
			}, eventsOpts.moveSpeed); */


		});
		clearTimeout(runAfterAnimateTimeout);
		runAfterAnimateTimeout=setTimeout(function(){runAfterAnimate();});
		setCalendarWidth();
	}

	function changeMonth() {
		flags.wrap.find('.arrow').click(function(e){
			e.preventDefault();

			if ($(this).hasClass('next')) {
				dateSlider("next");
				var lastMonthMove = '-=' + flags.directionLeftMove;

			} else {
				dateSlider("prev");
				var lastMonthMove = '+=' + flags.directionLeftMove;
			}

			flags.wrap.find('.eventsCalendar-monthWrap.oldMonth').animate({
				opacity: eventsOpts.moveOpacity,
				left: lastMonthMove
			}, eventsOpts.moveSpeed, function() {
				flags.wrap.find('.eventsCalendar-monthWrap.oldMonth').remove();
			});
			//showMessageBox();
			showEvents();
		});
	}
	
	function showEvents(){		
	$('#activitiesList').html('');
		flags.wrap.find('.currentMonth .eventsCalendar-daysList .eventsCalendar-day').each(function(e){
			$(this).click(function(e){
				if ($(this).hasClass('dayWithEvents')){
					$('.currentMonth .eventsCalendar-daysList .eventsCalendar-day.selected').removeClass('selected');
					$(this).addClass('selected');
					var eventsdata = $('.events_box', this).html();					
					$('#activitiesList').html('');	
					$('#activitiesList').html(eventsdata);
				}else{
					//$('#eventsList').html('');	
				}				
			});
		});
	}
	
	function showMessageBox(){
		var outerElement=flags.wrap.find('.currentMonth');
		flags.wrap.find('.currentMonth .eventsCalendar-daysList .eventsCalendar-day').each(function(e){
			var updatedPosition=false;
			$(this).hover(function(e){
				if ($(this).hasClass('dayWithEvents')){
					var cell = $(this);
					var message_box = cell.children('div');
					var message = message_box.children();
					var data = message.children();
					message_box.css('display','block');	
					//message.css('width',message.children().width());
					//alert(message.children().width());
					if(!updatedPosition){
						message_box.css('left',(message_box.parent('li').offset().left-outerElement.offset().left)+'px');
						message_box.css('top',(message_box.parent('li').children('span').offset().top-outerElement.offset().top+message_box.parent('li').children('span').height())+'px');
						var positionMessageRightBound = message.offset().left + message.width();
						var positionMessageBottomBound = message.offset().top + message.height();
						var positionOuterRightBound = outerElement.offset().left+outerElement.width() - 9;
						var positionOuterBottomBound = outerElement.offset().top+outerElement.height();
						var positionChange = positionMessageRightBound-positionOuterRightBound+33;
						var positionChanged=false;
						if(positionMessageRightBound>positionOuterRightBound){
							message_box.css('left','auto');
							message_box.css('right','9px');
							message_box.css('background-position',positionChange+'px top');

							positionChanged=true;
						}
						if(positionMessageBottomBound>positionOuterBottomBound){
							message_box.addClass('arrow_down');
							var positionTop=message_box.offset().top-outerElement.offset().top-message_box.height()-message_box.parent('li').outerHeight(true)+6;
							message_box.css('top',positionTop+'px');
							if(positionChanged){
								message_box.css('background-position',positionChange+'px bottom' );
							}
						}
						updatedPosition=true;
					}
				}
				
			},
			function () {
				if ($(this).hasClass('dayWithEvents')){
					$(this).children('div').css('display','none');
				}
			});
		});
	}


	function showError(msg) {
		flags.wrap.find('.eventsCalendar-list-wrap').html("<span class='eventsCalendar-loading error'>"+msg+" " +eventsOpts.eventsjson+"</span>");
	}

	function setCalendarWidth(){
		// resize calendar width on window resize
		flags.directionLeftMove = flags.wrap.width();
		flags.wrap.find('.eventsCalendar-monthWrap').width(flags.wrap.width() + 'px');

		flags.wrap.find('.eventsCalendar-list-wrap').width(flags.wrap.width() + 'px');

	}
	
	/**
	 * customized function
	 * _show: false | 'next' | 'prev' | 'current'
	 * _year: yyyy full year
	 * _month: 0-11
	 */
	function jumpToMonth(_show, _year, _month) {
		var curr_m = flags.wrap.attr('data-current-month');
		var curr_y = flags.wrap.attr('data-current-year');
		var show = _show;
		if(!show){
			try{
				if(Number(_year) == Number(curr_y) && Number(_month) == Number(curr_m)){
					return;
				}
				if(Number(_year) < Number(curr_y)){
					show = 'prev';
				}else{
					if(Number(_month) < Number(curr_m)){
						show = 'prev';
					}else{
						show = 'next';
					}
				}
			}catch(err){}
		}
		
		if (show == ('next')) {
			dateSlider("next", _year, _month);
			var lastMonthMove = '-=' + flags.directionLeftMove;

		} else {
			dateSlider("prev", _year, _month);
			var lastMonthMove = '+=' + flags.directionLeftMove;
		}

		flags.wrap.find('.eventsCalendar-monthWrap.oldMonth').animate({
			opacity: eventsOpts.moveOpacity,
			left: lastMonthMove
		}, eventsOpts.moveSpeed, function() {
			flags.wrap.find('.eventsCalendar-monthWrap.oldMonth').remove();
		});
		//showMessageBox();
		showEvents();
	}
	
	this.jumpToMonth = jumpToMonth;
	return this;
};


// define the parameters with the default values of the function
$.fn.eventCalendar.defaults = {
    eventsjson: 'js/events.json',
	eventsLimit: 4,
	monthNames: [ "January", "February", "March", "April", "May", "June",
		"July", "August", "September", "October", "November", "December" ],
	dayNames: [ 'Sunday','Monday','Tuesday','Wednesday',
		'Thursday','Friday','Saturday' ],
	dayNamesShort: [ 'Sun','Mon','Tue','Wed', 'Thu','Fri','Sat' ],
	dayNamesClass: [ 'sun','mon','tue','wed', 'thu','fri','sat' ],
	txt_noEvents: "There are no events in this period",
	txt_SpecificEvents_prev: "",
	txt_SpecificEvents_after: "events:",
	txt_next: "next",
	txt_prev: "prev",
	txt_NextEvents: "Next events:",
	txt_GoToEventUrl: "See the event",
	showDayAsWeeks: true,
	startWeekOnMonday: true,
	showDayNameInCalendar: true,
	showDescription: false,
	onlyOneDescription: true,
	openEventInNewWindow: false,
	eventsScrollable: false,
	jsonDateFormat: 'timestamp', // you can use also "human" 'YYYY-MM-DD HH:MM:SS'
	moveSpeed: 500,	// speed of month move when you clic on a new date
	moveOpacity: 0.15, // month and events fadeOut to this opacity
	jsonData: "", 	// to load and inline json (not ajax calls)
	cacheJson: true	// if true plugin get a json only first time and after plugin filter events
					// if false plugin get a new json on each date change
};

