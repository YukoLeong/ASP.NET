/*********************************************************************************************/
// $Chameleon v1.2 || Crusader 12 || Exclusive to CodeCanyon
/*********************************************************************************************/	
(function($){
var Chameleon={
	// REFERENCE
	REF:{
		menu_open:false						// CURRENT MENU STATE
	},
	
	defaults:{
		json_url:'Chameleon/js/items.json', // LINK TO .JSON FILE
		more_text:'More from Crusader12',	// TEXT NEXT TO BUTTON
		li_color:'#FFF',					// SUBMENU LIST BACKGROUND COLOR
		current_item:false,					// CURRENT DEMO ITEM NAME
		show_price:false,					// SHOW ITEM PRICE
		show_description:false,				// SHOW ITEM DESCRIPTION
		show_thumb:true,					// SHOW ITEM THUMBNAIL
		show_version:true,					// SHOW ITEM VERSION NUMBER
		desc_pos:2,							// 1 (IN MENU) 2 (UNDER PREVIEW IMAGE)
		author_url:'http://codecanyon.net/user/Crusader12',	// LINK TO PROFILE PAGE
		extra_button_url:false,				// EXTRA BUTTON LINK
		extra_button_text:'Includes 70 GraphicRiver Items!',	// EXTRA BUTTON TEXT
		limit:9 							// NUMBER OF ITEMS TO LIMIT TO
		
	},	

/***********************************************************************************************/
// INITIALIZE
/***********************************************************************************************/
init:function(options){
	return this.each(function(i){
		// MERGE USER DATA WITH DEFAULTS
		var	$this=$(this), o=options,	
			mergedData=$.extend({}, Chameleon.defaults, o),
			ChameleonD=$this.data('chameleon'),
			cD=ChameleonD!=undefined ? ChameleonD : false;
			$.data($this, $.extend({}, mergedData, !cD ? {} : cD||{}));
		$this.data('chameleon',$.data($this));
		var coD=$this.data('chameleon'),
			$itemsLI='';
		
		// INSERT SWITCHMENU
		$('body').prepend('<div id="cham_switcher"><div class="cham_left"><p class="cham_author">'+coD.more_text+'</p><div id="cham_preview"></div><div id="cham_menu" class="cham_menuwrapper"></div></div><div class="cham_right"></div>');
		
		var menu='<button class="cham_trigger">Open Menu</button><ul class="cham_menu">',
			images=[];

			
		// LOAD JSON FILE
		$.getJSON(coD.json_url+'?'+new Date().getTime(), function(jD){
			for(var i=0, l=Math.max(jD.length,coD.limit.pF()); i<l; i++){
				var color=Chameleon.hex2RGB(jD[i].color),
					thumb=coD.show_thumb ? '<img class="cham_thumb" src="'+jD[i].thumb_url+'">' : '',
					desc=coD.desc_pos.pF()===1 & coD.show_description ? '<span class="cham_sub_name" style="background-color:rgba('+color.r+','+color.g+','+color.b+',1);">'+jD[i].description+'</span>' : '',
					price=coD.show_price ? '<span class="cham_price">'+jD[i].price+'</span>' : '',
					version=coD.show_version ? '<div class="cham_version">'+jD[i].version+'</div>' : '';

				// STORE ALL LARGE PREVIEW IMAGE INTO ARRAY
				images.push(jD[i].preview_url);
				
				// BUILD MENU BASED OFF OF JSON DATA (JD)
				if(coD.current_item.toString().toLowerCase().removeWS()!==jD[i].name.toString().toLowerCase().removeWS()){
					$itemsLI+='<li data-cham_bg="'+jD[i].preview_url+'" data-chamcolor="'+jD[i].color+'" data-cham-pos="'+coD.desc_pos.pF()+'" data-cham_r_color="'+coD.li_color+'"><a href="'+jD[i].demo_url+'">'+thumb+'<p class="cham_name">'+jD[i].name+price+desc+version+'</p></a></li>';
				}else{
					var extraButton=coD.extra_button_url ? '<a href="'+coD.extra_button_url+' target="_blank">'+coD.extra_button_text+'</a>' : '',
						currentItemInfo='<p class="cham_right_text" data-chamcolor="'+jD[i].color+'"><span class="cham_top_ver">version: '+jD[i].version+'</span>'+extraButton+'<a href="'+coD.author_url+'" target="_blank" class="cham_support">Free Support</a><a class="cham_purchase" href="'+jD[i].purchase_url+'">Purchase '+jD[i].name+'</a></p>';	
				};
			};
			
			// PRELOAD IMAGES
			Chameleon.preL_Images(images);

			// ADD THE LIST ITEMS AND END OF HTML
			$itemsLI+='</ul>';
			$('#cham_switcher').find('.cham_menuwrapper').append(menu+$itemsLI).end().find('.cham_right').append(currentItemInfo);
			
			// ANIMATE INTO VIEW
			setTimeout(function(){ $([$('#cham_switcher')[0],$('p.cham_author')[0],$('div.cham_right')[0]]).css('top',0); },1000);
			
			// LOOP THROUGH LI ELEMENTS AND SETUP HOVER COLOR
			$('.cham_menuwrapper').find('ul.cham_menu li')
			.on('mouseenter',function(){
				var $this=$(this),
					color=Chameleon.hex2RGB($this.data('chamcolor'));
										
				$this.add($this.find('a')).css({'background':'rgba('+color.r+','+color.g+','+color.b+',1)'})
				.end().find('div.cham_pointer').css('visibility','visible');
				
				$this.find('p.cham_name').css('color','#FFF');

				$('#cham_preview').html('<img src="'+$this.data('cham_bg')+'">');
				if(!$('#cham_preview').hasClass('cham_visible')) $('#cham_preview').addClass('cham_visible');					
			
			// RETURN TO SET LIST COLOR ON MOUSE EXIT
			}).on('mouseleave',function(){
				var $this=$(this);
				$this.add($this.find('a')).css('background',$this.data('cham_r_color'))
				.end().find('div.cham_pointer').css('visibility','hidden');
				
				$this.find('p.cham_name').css('color','#6d6e79');
			});
			
			
			// CLOSE EVERYTHING WHEN CLICKING ELSEWHERE
			$(document).off('click.Chameleon').on('click.Chameleon',function(e){
				var $button=$('button.cham_trigger');
				if($button.hasClass('dl-active')){
					$('button.cham_trigger').click();
					$('#cham_preview').html(' ').removeClass('cham_visible');
				};
			});

			// USE ITEM COLOR WHEN HOVERING PURCHASE BUTTONS
			$('div.cham_right').find('a').on('mouseenter',function(){
				$(this).css('background-color',$(this).parents('p:first').data('chamcolor'));				
			}).on('mouseleave',function(){
				$(this).css('background-color','#4c4a54');
			});

			// LOAD MENU (MUST USE TIMEOUT)
			Chameleon.setupMenu($('#cham_menu'));
		});
	});
},


/***********************************************************************************************/
// PRELOAD IMAGES
/***********************************************************************************************/
preL_Images:function(arrayOfImages){
    $(arrayOfImages).each(function(){
        $('<img/>')[0].src=this;
    });
},


/***********************************************************************************************/
// CONVERTS HEX TO RGB
/***********************************************************************************************/
hex2RGB:function(hex){
    var result=/^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex);
    return result?{
        r: parseInt(result[1], 16),
        g: parseInt(result[2], 16),
        b: parseInt(result[3], 16)
    }:null;
},



/***********************************************************************************************/
// MENU RESET
/***********************************************************************************************/
resetMenu:function(){
	var REF=Chameleon.REF;
	REF.$menu.removeClass('dl-subview');
	REF.$menuitems.removeClass('dl-subview dl-subviewopen');
},

/***********************************************************************************************/
// MENU OPEN
/***********************************************************************************************/
openMenu:function(){
	var REF=Chameleon.REF;
	$('body').off('click.dlmenu').on('click.dlmenu',function(){ 
		Chameleon.closeMenu(); 
	});
	
	REF.$menu.addClass('cham_menuopen cham_menu-toggle').on(REF.transEndEventName, function(){
		$(this).removeClass('cham_menu-toggle');
	});
	
	REF.$trigger.addClass('dl-active');
	REF.menu_open=true;
},

/***********************************************************************************************/
// MENU CLOSE
/***********************************************************************************************/
closeMenu:function(){ 
	var REF=Chameleon.REF;
	if(REF.menu_open){ 
		var onTransitionEndFn=function(){
			REF.$menu.off(REF.transEndEventName);
			Chameleon.resetMenu();
		};			
		REF.$menu.removeClass('cham_menuopen');
		REF.$menu.addClass('cham_menu-toggle');
		REF.$trigger.removeClass('dl-active');
		if(REF.supportTransitions){ REF.$menu.on(REF.transEndEventName,onTransitionEndFn);
		}else{ onTransitionEndFn.call(); }
		REF.menu_open=false;
		$('#cham_preview').html(' ').removeClass('cham_visible');	
	};
},

/***********************************************************************************************/
// MENU SETUP
/***********************************************************************************************/
setupMenu:function($el){
	var REF=Chameleon.REF,
		Modernizr=window.Modernizr, 
		$body=$('body');

	REF.menu_open=false;		
	REF.$trigger=$el.find('button.cham_trigger');
	REF.$menu=$el.find('ul.cham_menu');
	REF.$menuitems=REF.$menu.find('li:not(.dl-back)');
	REF.animationClasses={classin:'dl-animate-in-1',classout:'dl-animate-out-1'};
	REF.onLevelClick=function(el,name){return false;};
	REF.onLinkClick=function(el,ev){return false;};

	$el.find('ul.cham_submenu').prepend('<li class="dl-back"><a href="#">back</a></li>');
	REF.$back=REF.$menu.find('li.dl-back');
	REF.animEndEventNames={'WebkitAnimation' : 'webkitAnimationEnd', 'OAnimation' : 'oAnimationEnd', 'msAnimation' : 'MSAnimationEnd', 'animation' : 'animationend'};
	REF.transEndEventNames={'WebkitTransition' : 'webkitTransitionEnd','MozTransition' : 'transitionend','OTransition' : 'oTransitionEnd','msTransition' : 'MSTransitionEnd','transition' : 'transitionend'};
	REF.animEndEventName=REF.animEndEventNames[Modernizr.prefixed('animation')]+'.dlmenu';
	REF.transEndEventName=REF.transEndEventNames[Modernizr.prefixed( 'transition' ) ] + '.dlmenu',
	REF.supportAnimations=Modernizr.cssanimations,
	REF.supportTransitions=Modernizr.csstransitions;

	$('#cham_switcher').on('click',function(e){
		var $tar=e.target;
		if($tar===$('.cham_trigger')[0]){
			if(Chameleon.REF.menu_open){ Chameleon.closeMenu();
			}else{ Chameleon.openMenu(); };
			return false;
		};
		e.stopPropagation();
	});
			
	REF.$menuitems.on('click.dlmenu',function(e){
		e.stopPropagation();
		var $item=$(this),
			$submenu=$item.children('ul.cham_submenu'),
			REF=Chameleon.REF;
			
		if($submenu.length > 0){
			var $flyin=$submenu.clone().css('opacity',0).insertAfter(REF.$menu),
				onAnimationEndFn=function(){
					REF.$menu.off(animEndEventName).removeClass(REF.animationClasses.classout).addClass('dl-subview');
					$item.addClass('dl-subviewopen').parents('.dl-subviewopen:first').removeClass('dl-subviewopen').addClass('dl-subview');
					$flyin.remove();
				};

				setTimeout(function(){
					$flyin.addClass(REF.animationClasses.classin);
					REF.$menu.addClass(REF.animationClasses.classout);
					if(REF.supportAnimations){ REF.$menu.on(REF.animEndEventName,onAnimationEndFn);
					}else{ onAnimationEndFn.call(); }
						REF.onLevelClick($item, $item.children('a:first').text());
				});
				return false;
		}else{ 
			REF.onLinkClick($item,e); 
		};
	});
	
	REF.$back.on('click.dlmenu',function(e){
		var $this=$(this),
			REF=Chameleon.REF,
			$submenu=$this.parents( 'ul.cham_submenu:first'),
			$item=$submenu.parent(),
			$flyin=$submenu.clone().insertAfter(REF.$menu);
		var onAnimationEndFn=function(){
			REF.$menu.off(REF.animEndEventName).removeClass(REF.animationClasses.classin);
			$flyin.remove();
		};

		setTimeout(function(){
			$flyin.addClass(REF.animationClasses.classout);
			REF.$menu.addClass(REF.animationClasses.classin);
			if(REF.supportAnimations){ REF.$menu.on(REF.animEndEventName,onAnimationEndFn);
			}else{ onAnimationEndFn.call(); }
			$item.removeClass('dl-subviewopen');
			var $subview=$this.parents('.dl-subview:first');
			if( $subview.is('li')){ $subview.addClass('dl-subviewopen'); }
			$subview.removeClass('dl-subview');
		});
		return false;
	});
}};


/***********************************************************************************************/
// PLUGIN DEFINITION
/***********************************************************************************************/
$.fn.Chameleon=function(method,options){
	if(Chameleon[method]){ return Chameleon[method].apply(this,Array.prototype.slice.call(arguments,1));
	}else if(typeof method==='object'||!method){ return Chameleon.init.apply(this,arguments);
	}else{ $.error('Method '+method+' does not exist'); }
}})(jQuery);

/* EXTEND NATIVE CLASSES */
String.prototype.removeWS=function(){return this.toString().replace(/\s/g, '');};
String.prototype.pF=function(){return parseFloat(this);};
Number.prototype.pF=function(){return parseFloat(this);};
String.prototype.sP=function(splitter,key){return this.toString().split(splitter)[key];};
String.prototype.isB=function(){return this.toString()=="true"?true:false;};
Boolean.prototype.isB=function(){return (this==true)?true:false;};


/* Modernizr 2.6.2 (Custom Build) | MIT & BSD Build: http://modernizr.com/download/#-cssanimations-csstransitions-touch-shiv-cssclasses-prefixed-teststyles-testprop-testallprops-prefixes-domprefixes-load */
if(!window.Modernizr){window.Modernizr=function(a,b,c){function z(a){j.cssText=a}function A(a,b){return z(m.join(a+";")+(b||""))}function B(a,b){return typeof a===b}function C(a,b){return!!~(""+a).indexOf(b)}function D(a,b){for(var d in a){var e=a[d];if(!C(e,"-")&&j[e]!==c)return b=="pfx"?e:!0}return!1}function E(a,b,d){for(var e in a){var f=b[a[e]];if(f!==c)return d===!1?a[e]:B(f,"function")?f.bind(d||b):f}return!1}function F(a,b,c){var d=a.charAt(0).toUpperCase()+a.slice(1),e=(a+" "+o.join(d+" ")+d).split(" ");return B(b,"string")||B(b,"undefined")?D(e,b):(e=(a+" "+p.join(d+" ")+d).split(" "),E(e,b,c))}var d="2.6.2",e={},f=!0,g=b.documentElement,h="modernizr",i=b.createElement(h),j=i.style,k,l={}.toString,m=" -webkit- -moz- -o- -ms- ".split(" "),n="Webkit Moz O ms",o=n.split(" "),p=n.toLowerCase().split(" "),q={},r={},s={},t=[],u=t.slice,v,w=function(a,c,d,e){var f,i,j,k,l=b.createElement("div"),m=b.body,n=m||b.createElement("body");if(parseInt(d,10))while(d--)j=b.createElement("div"),j.id=e?e[d]:h+(d+1),l.appendChild(j);return f=["&#173;",'<style id="s',h,'">',a,"</style>"].join(""),l.id=h,(m?l:n).innerHTML+=f,n.appendChild(l),m||(n.style.background="",n.style.overflow="hidden",k=g.style.overflow,g.style.overflow="hidden",g.appendChild(n)),i=c(l,a),m?l.parentNode.removeChild(l):(n.parentNode.removeChild(n),g.style.overflow=k),!!i},x={}.hasOwnProperty,y;!B(x,"undefined")&&!B(x.call,"undefined")?y=function(a,b){return x.call(a,b)}:y=function(a,b){return b in a&&B(a.constructor.prototype[b],"undefined")},Function.prototype.bind||(Function.prototype.bind=function(b){var c=this;if(typeof c!="function")throw new TypeError;var d=u.call(arguments,1),e=function(){if(this instanceof e){var a=function(){};a.prototype=c.prototype;var f=new a,g=c.apply(f,d.concat(u.call(arguments)));return Object(g)===g?g:f}return c.apply(b,d.concat(u.call(arguments)))};return e}),q.touch=function(){var c;return"ontouchstart"in a||a.DocumentTouch&&b instanceof DocumentTouch?c=!0:w(["@media (",m.join("touch-enabled),("),h,")","{#modernizr{top:9px;position:absolute}}"].join(""),function(a){c=a.offsetTop===9}),c},q.cssanimations=function(){return F("animationName")},q.csstransitions=function(){return F("transition")};for(var G in q)y(q,G)&&(v=G.toLowerCase(),e[v]=q[G](),t.push((e[v]?"":"no-")+v));return e.addTest=function(a,b){if(typeof a=="object")for(var d in a)y(a,d)&&e.addTest(d,a[d]);else{a=a.toLowerCase();if(e[a]!==c)return e;b=typeof b=="function"?b():b,typeof f!="undefined"&&f&&(g.className+=" "+(b?"":"no-")+a),e[a]=b}return e},z(""),i=k=null,function(a,b){function k(a,b){var c=a.createElement("p"),d=a.getElementsByTagName("head")[0]||a.documentElement;return c.innerHTML="x<style>"+b+"</style>",d.insertBefore(c.lastChild,d.firstChild)}function l(){var a=r.elements;return typeof a=="string"?a.split(" "):a}function m(a){var b=i[a[g]];return b||(b={},h++,a[g]=h,i[h]=b),b}function n(a,c,f){c||(c=b);if(j)return c.createElement(a);f||(f=m(c));var g;return f.cache[a]?g=f.cache[a].cloneNode():e.test(a)?g=(f.cache[a]=f.createElem(a)).cloneNode():g=f.createElem(a),g.canHaveChildren&&!d.test(a)?f.frag.appendChild(g):g}function o(a,c){a||(a=b);if(j)return a.createDocumentFragment();c=c||m(a);var d=c.frag.cloneNode(),e=0,f=l(),g=f.length;for(;e<g;e++)d.createElement(f[e]);return d}function p(a,b){b.cache||(b.cache={},b.createElem=a.createElement,b.createFrag=a.createDocumentFragment,b.frag=b.createFrag()),a.createElement=function(c){return r.shivMethods?n(c,a,b):b.createElem(c)},a.createDocumentFragment=Function("h,f","return function(){var n=f.cloneNode(),c=n.createElement;h.shivMethods&&("+l().join().replace(/\w+/g,function(a){return b.createElem(a),b.frag.createElement(a),'c("'+a+'")'})+");return n}")(r,b.frag)}function q(a){a||(a=b);var c=m(a);return r.shivCSS&&!f&&!c.hasCSS&&(c.hasCSS=!!k(a,"article,aside,figcaption,figure,footer,header,hgroup,nav,section{display:block}mark{background:#FF0;color:#000}")),j||p(a,c),a}var c=a.html5||{},d=/^<|^(?:button|map|select|textarea|object|iframe|option|optgroup)$/i,e=/^(?:a|b|code|div|fieldset|h1|h2|h3|h4|h5|h6|i|label|li|ol|p|q|span|strong|style|table|tbody|td|th|tr|ul)$/i,f,g="_html5shiv",h=0,i={},j;(function(){try{var a=b.createElement("a");a.innerHTML="<xyz></xyz>",f="hidden"in a,j=a.childNodes.length==1||function(){b.createElement("a");var a=b.createDocumentFragment();return typeof a.cloneNode=="undefined"||typeof a.createDocumentFragment=="undefined"||typeof a.createElement=="undefined"}()}catch(c){f=!0,j=!0}})();var r={elements:c.elements||"abbr article aside audio bdi canvas data datalist details figcaption figure footer header hgroup mark meter nav output progress section summary time video",shivCSS:c.shivCSS!==!1,supportsUnknownElements:j,shivMethods:c.shivMethods!==!1,type:"default",shivDocument:q,createElement:n,createDocumentFragment:o};a.html5=r,q(b)}(this,b),e._version=d,e._prefixes=m,e._domPrefixes=p,e._cssomPrefixes=o,e.testProp=function(a){return D([a])},e.testAllProps=F,e.testStyles=w,e.prefixed=function(a,b,c){return b?F(a,b,c):F(a,"pfx")},g.className=g.className.replace(/(^|\s)no-js(\s|$)/,"$1$2")+(f?" js "+t.join(" "):""),e}(this,this.document),function(a,b,c){function d(a){return"[object Function]"==o.call(a)}function e(a){return"string"==typeof a}function f(){}function g(a){return!a||"loaded"==a||"complete"==a||"uninitialized"==a}function h(){var a=p.shift();q=1,a?a.t?m(function(){("c"==a.t?B.injectCss:B.injectJs)(a.s,0,a.a,a.x,a.e,1)},0):(a(),h()):q=0}function i(a,c,d,e,f,i,j){function k(b){if(!o&&g(l.readyState)&&(u.r=o=1,!q&&h(),l.onload=l.onreadystatechange=null,b)){"img"!=a&&m(function(){t.removeChild(l)},50);for(var d in y[c])y[c].hasOwnProperty(d)&&y[c][d].onload()}}var j=j||B.errorTimeout,l=b.createElement(a),o=0,r=0,u={t:d,s:c,e:f,a:i,x:j};1===y[c]&&(r=1,y[c]=[]),"object"==a?l.data=c:(l.src=c,l.type=a),l.width=l.height="0",l.onerror=l.onload=l.onreadystatechange=function(){k.call(this,r)},p.splice(e,0,u),"img"!=a&&(r||2===y[c]?(t.insertBefore(l,s?null:n),m(k,j)):y[c].push(l))}function j(a,b,c,d,f){return q=0,b=b||"j",e(a)?i("c"==b?v:u,a,b,this.i++,c,d,f):(p.splice(this.i++,0,a),1==p.length&&h()),this}function k(){var a=B;return a.loader={load:j,i:0},a}var l=b.documentElement,m=a.setTimeout,n=b.getElementsByTagName("script")[0],o={}.toString,p=[],q=0,r="MozAppearance"in l.style,s=r&&!!b.createRange().compareNode,t=s?l:n.parentNode,l=a.opera&&"[object Opera]"==o.call(a.opera),l=!!b.attachEvent&&!l,u=r?"object":l?"script":"img",v=l?"script":u,w=Array.isArray||function(a){return"[object Array]"==o.call(a)},x=[],y={},z={timeout:function(a,b){return b.length&&(a.timeout=b[0]),a}},A,B;B=function(a){function b(a){var a=a.split("!"),b=x.length,c=a.pop(),d=a.length,c={url:c,origUrl:c,prefixes:a},e,f,g;for(f=0;f<d;f++)g=a[f].split("="),(e=z[g.shift()])&&(c=e(c,g));for(f=0;f<b;f++)c=x[f](c);return c}function g(a,e,f,g,h){var i=b(a),j=i.autoCallback;i.url.split(".").pop().split("?").shift(),i.bypass||(e&&(e=d(e)?e:e[a]||e[g]||e[a.split("/").pop().split("?")[0]]),i.instead?i.instead(a,e,f,g,h):(y[i.url]?i.noexec=!0:y[i.url]=1,f.load(i.url,i.forceCSS||!i.forceJS&&"css"==i.url.split(".").pop().split("?").shift()?"c":c,i.noexec,i.attrs,i.timeout),(d(e)||d(j))&&f.load(function(){k(),e&&e(i.origUrl,h,g),j&&j(i.origUrl,h,g),y[i.url]=2})))}function h(a,b){function c(a,c){if(a){if(e(a))c||(j=function(){var a=[].slice.call(arguments);k.apply(this,a),l()}),g(a,j,b,0,h);else if(Object(a)===a)for(n in m=function(){var b=0,c;for(c in a)a.hasOwnProperty(c)&&b++;return b}(),a)a.hasOwnProperty(n)&&(!c&&!--m&&(d(j)?j=function(){var a=[].slice.call(arguments);k.apply(this,a),l()}:j[n]=function(a){return function(){var b=[].slice.call(arguments);a&&a.apply(this,b),l()}}(k[n])),g(a[n],j,b,n,h))}else!c&&l()}var h=!!a.test,i=a.load||a.both,j=a.callback||f,k=j,l=a.complete||f,m,n;c(h?a.yep:a.nope,!!i),i&&c(i)}var i,j,l=this.yepnope.loader;if(e(a))g(a,0,l,0);else if(w(a))for(i=0;i<a.length;i++)j=a[i],e(j)?g(j,0,l,0):w(j)?B(j):Object(j)===j&&h(j,l);else Object(a)===a&&h(a,l)},B.addPrefix=function(a,b){z[a]=b},B.addFilter=function(a){x.push(a)},B.errorTimeout=1e4,null==b.readyState&&b.addEventListener&&(b.readyState="loading",b.addEventListener("DOMContentLoaded",A=function(){b.removeEventListener("DOMContentLoaded",A,0),b.readyState="complete"},0)),a.yepnope=k(),a.yepnope.executeStack=h,a.yepnope.injectJs=function(a,c,d,e,i,j){var k=b.createElement("script"),l,o,e=e||B.errorTimeout;k.src=a;for(o in d)k.setAttribute(o,d[o]);c=j?h:c||f,k.onreadystatechange=k.onload=function(){!l&&g(k.readyState)&&(l=1,c(),k.onload=k.onreadystatechange=null)},m(function(){l||(l=1,c(1))},e),i?k.onload():n.parentNode.insertBefore(k,n)},a.yepnope.injectCss=function(a,c,d,e,g,i){var e=b.createElement("link"),j,c=i?h:c||f;e.href=a,e.rel="stylesheet",e.type="text/css";for(j in d)e.setAttribute(j,d[j]);g||(n.parentNode.insertBefore(e,n),m(c,0))}}(this,document),Modernizr.load=function(){yepnope.apply(window,[].slice.call(arguments,0))};};

