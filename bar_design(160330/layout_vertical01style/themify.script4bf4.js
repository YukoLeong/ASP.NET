// open external links in new window in bbpress
// <![CDATA[
jQuery(document).ready(function($){
    $('.bbp-reply-content a').each(function(){
        if( $(this).attr('href') && 0 != $(this).attr('href').indexOf('#') ) {
            $(this).attr('target', '_blank');
        }
    });
});
// ]]>

(function($){

	/////////////////////////////////////////////
	// jQuery functions
	/////////////////////////////////////////////
	$.fn.fixedHeader = function(options){
		var defaults = {
				fixedClass: 'fixed-header'
			},
			settings = $.extend({}, defaults, options);

		return this.each(function(){
			var $this = $(this),
				$parent = $this.parent(),
				thisHeight = $this.height(),
				$window = $(window),
				$body = $('body'),
				resizeId;

			function onResize(){
				thisHeight = $this.height();
			}

			function onScroll(){
				var scrollTop = $window.scrollTop(),
					$headerwrap = $('#headerwrap'),
					$promoBar = $('.promo-bar'),
					$promoBarWrap = $('.promo-bar-wrap'),
					$promoToggle = $('.promo-toggle');
				if(scrollTop > thisHeight) {
					$this.addClass(settings.fixedClass);
					$parent.css('padding-top', thisHeight);
					$body.addClass('fixed-header-on');
					$promoToggle.stop().fadeOut(150);
					if ( $promoBar.length > 0 && $promoBarWrap.is(':visible') ) {
						if ( $promoBarWrap.hasClass('open') ) {
							$promoBar.css('top', -$promoBar.height() - 1);
							$promoBarWrap.css('top', -$promoBar.height());
							$headerwrap.css('top', '0');
						}
					}
				} else {
					$this.removeClass(settings.fixedClass);
					$parent.css('padding-top', '');
					$body.removeClass('fixed-header-on');
					$promoToggle.stop().fadeIn(150);
					if ( $promoBarWrap.hasClass('open') ) {
						$promoBar.css('top', '0');
						$promoBarWrap.css('top', '0');
						if ( $promoBar.length > 0 && $promoBarWrap.is(':visible') ) {
							$headerwrap.css('top', $promoBar.height());
						}
					}
				}
			};

			$window.on('scroll.fixedHeader', onScroll)
			.on('resize', function(){
				clearTimeout(resizeId);
				resizeId = setTimeout(onResize, 500);
			});
		});
	};

	// Parallax Header
	$.fn.parallaxHeader = function(options) {
		var defaults = {
				parallaxClass: 'parallax-header'
			},
			settings = $.extend({}, defaults, options);

		return this.each(function(){
			var $this = $(this),
				$window = $(window), $body = $('body'),
				$relativeSection = $this.nextAll('.section').first(),
				resizeId, headerH, lastScrollPoint;

			function updateDimension(){
				var $promoBar = $('.promo-bar'),
					$promoBarWrap = $('.promo-bar-wrap'),
					headerH = $promoBarWrap.length > 0 && $promoBarWrap.hasClass('open') ? $('#headerwrap').height() + $promoBarWrap.height() : $('#headerwrap').height();
				$this.css('top', headerH);
				$relativeSection.css('marginTop', $this.height());
			}

			function transition($obj) {
				var scrollTop = $window.scrollTop(),
					activePoint = Math.ceil($window.height() / 2),
					n, tolerance = Math.ceil($obj.height() + headerH);

				if ( scrollTop > activePoint ) {
					n = Math.ceil( scrollTop + (lastScrollPoint - scrollTop) / 2);
				} else {
					n = Math.ceil(scrollTop);
					lastScrollPoint = scrollTop;
				}

				$obj.css({
					'-webkit-transform' : 'translateY(-'+n+'px)',
					'-moz-transform' : 'translateY(-'+n+'px)',
					'-o-transform' : 'translateY(-'+n+'px)',
					'-ms-transform' : 'translateY(-'+n+'px)',
					'transform' : 'translateY(-'+n+'px)'
				});

				if($window.scrollTop() > tolerance){
					$obj.hide();
				} else {
					$obj.show();
				}
			};

			$relativeSection.css('marginTop', $this.height()); // on ready
			$window.load(updateDimension);
			$('.promo-bar').on('promoClosed', updateDimension);

			$window.on('scroll', function(){
				transition($this);
			}).on('touchmove.touchScroll', function(){
				transition($this);
			}).on('resize', function(){
				clearTimeout(resizeId);
				resizeId = setTimeout(updateDimension, 500);
			}).on('orientationchange', updateDimension);
		});
	};

	function addSocialButtons($context){
		if( typeof $context === 'undefined' ) $context = $('#content');
		// Social share
		if( $('.social-share', $context).length > 0 ){
			$('.twitter-share', $context).sharrre({
				share : {
					twitter : true
				},
				template : '<a class="box" href="#"><div class="share"><i class="fa fa-twitter"></i></div><div class="count" href="#">{total}</div></a>',
				enableHover : false,
				click : function(api, options) {
					api.simulateClick();
					api.openPopup('twitter');
				}
			});
			$('.facebook-share', $context).sharrre({
				share : {
					facebook : true
				},
				template : '<a class="box" href="#"><div class="share"><i class="fa fa-facebook"></i></div><div class="count" href="#">{total}</div></a>',
				enableHover : false,
				click : function(api, options) {
					api.simulateClick();
					api.openPopup('facebook');
				}
			});
			$('.googleplus-share', $context).sharrre({
				share: {
					googlePlus: true
				},
				template: '<a class="box" href="#"><div class="share"><i class="fa fa-google-plus"></i></div><div class="count" href="#">{total}</div></a>',
				enableHover: false,
				urlCurl: themifyScript.sharrrephp,
				click: function(api, options){
					api.simulateClick();
					api.openPopup('googlePlus');
				}
			});
		}
	}

	// function to get url/src type
	function _getFileType(itemSrc){
		var extension = itemSrc.substr( (itemSrc.lastIndexOf('.') +1) );

		if (itemSrc.match(/youtube\.com\/watch/i) || itemSrc.match(/youtu\.be/i)
			|| itemSrc.match(/vimeo\.com/i) || itemSrc.match(/\b.mov\b/i)
			|| itemSrc.match(/\b.swf\b/i) || itemSrc.match(/\biframe=true\b/i) ) {
			return 'iframe';
		} else if ( extension == 'jpg' || extension == 'png' || extension == 'gif' ) {
			return 'image';
		} else if(itemSrc.match(/\bajax=true\b/i)){
			return 'ajax';
		}else if(itemSrc.match(/\bcustom=true\b/i)){
			return 'custom';
		}else if(itemSrc.substr(0,1) == '#'){
			return 'inline';
		}else{
			return 'iframe';
		};
	};

	// Set browser url hash
	function setHash(hash) {
		if(history.pushState) {
			history.pushState(null, null, hash);
		} else {
			location.hash = hash;
		}
	};

	// Scroll to
	function themeScrollTo(offset, speed){
		speed = speed || 800;
		offset = Math.ceil(offset - 100);
		$('body,html').animate({ scrollTop: offset }, speed);
	};

	// Save cookie and value
	function themifySetCookie( name, value) {
		var today = new Date(), expire = new Date(), days = 30;
		if ( null == days || 0 == days ) {
			days = 1;
		}
		expire.setTime( today.getTime() + ( 3600000*24*days ) );
		document.cookie = name + "=" + escape( value ) + " ; path=/; expires=" + expire.toGMTString();
	}
	// Get cookie value
	function themifyGetCookie(name) {
		name = name + "=";
		var ca = document.cookie.split(';');
		for(var i=0; i < ca.length; i++) {
			var c = ca[i];
			while (' ' == c.charAt(0)) c = c.substring(1,c.length);
			if (0 == c.indexOf(name)) return c.substring(name.length,c.length);	}
		return null;
	}

	/////////////////////////////////////////////
	// Document Ready Function
	/////////////////////////////////////////////
	$(document).ready(function(){
		var $body = $('body'), $headerwrap = $('#headerwrap');

		/////////////////////////////////////////////
		// BB Press link target
		/////////////////////////////////////////////
		$('.threadpost p a', '#pagewrap').not('.poststuff a').attr('target', '_blank');

		/////////////////////////////////////////////
		// <select> Wrapper
		/////////////////////////////////////////////
		$("select").wrap("<div class='selectwrapper'></div>");
		$(".selectwrapper").focus(function() { $(this).toggleClass("clicked"); });

		/////////////////////////////////////////////
		// Checkbox Unsubscribe
		/////////////////////////////////////////////
		$("#unsubscribe").click(function() { $(this).toggleClass("clicked"); });

		/////////////////////////////////////////////
		// HTML5 placeholder fallback
		/////////////////////////////////////////////
		$('[placeholder]').focus(function() {
		  var input = $(this);
		  if (input.val() == input.attr('placeholder')) {
		    input.val('');
		    input.removeClass('placeholder');
		  }
		}).blur(function() {
		  var input = $(this);
		  if (input.val() == '' || input.val() == input.attr('placeholder')) {
		    input.addClass('placeholder');
		    input.val(input.attr('placeholder'));
		  }
		}).blur();
		$('[placeholder]').parents('form').submit(function() {
		  $(this).find('[placeholder]').each(function() {
		    var input = $(this);
		    if (input.val() == input.attr('placeholder')) {
			 input.val('');
		    }
		  })
		});

		/////////////////////////////////////////////
		// Scroll to top
		/////////////////////////////////////////////
		$('.back-top a').click(function () {
			$('body,html').animate({
				scrollTop: 0
			}, 800);
			return false;
		});

		/////////////////////////////////////////////
		// Slider	 							
		/////////////////////////////////////////////
		jQuery(window).load(function(){
			var $postSlider = jQuery('#showcase-slider');
			if($postSlider.length > 0){
				$postSlider.find('.slides').carouFredSel({
					responsive: true,
					prev: '#showcase-slider .carousel-prev',
					next: '#showcase-slider .carousel-next',
					width: '100%',
					pagination: false,
					infinite: true,
					swipe: true,
					scroll: {
						items: 1,
						duration: 300
					},
					auto: {
						play : false,
						timeoutDuration: 0
					},
					items: {
						width: 647
					},
					onCreate : function (){
						$postSlider.css( {
							'height': 'auto',
							'visibility' : 'visible'
						});
					}
				});
			}
		});

		/////////////////////////////////////////////
		// Boxed content same height
		/////////////////////////////////////////////
		function resizeHeight(){
			var sliderImage = $( '#showcase-slider .slide-image' );
			var boxed = $( '.boxed:last-child' );
			$('#showcase-slider .carousel-nav-wrap').css('height', sliderImage.outerHeight());
			$('.boxed').css('min-height', boxed.outerHeight(true));
		};
		 $(window).resize(function() {
			resizeHeight();
		}).trigger('resize');

		/////////////////////////////////////////////
		// Toggle main nav on mobile
		/////////////////////////////////////////////
		$('#menu-icon').sidr({
			name: 'sidr',
			side: 'right'
		}).on('click touchend', function(){
			$('body').addClass('slide-menu-on');
		});
		$('#menu-icon-close').sidr({
			name: 'sidr',
			side: 'right'
		}).on('click touchstart', function(){
			$('body').removeClass('slide-menu-on');
		});

	    // Reset slide nav width
	    $(window).resize(function(){
			var viewport = $(window).width();
			if (viewport > 780) {
				$('body').css({'width': '', 'position' : '', 'right' : ''});
			}
		});

		/////////////////////////////////////////////
		// Buy now button toggle
		/////////////////////////////////////////////
		closetimer = 0;
		$('.buy-box h3').mouseover(function() {
		clearTimeout(closetimer);
		if ($(this).hasClass('hovered')) {
		  $(this).removeClass('hovered');
		  $('.buy-options').slideDown(500);
		}
		else {
		  $('.buy-box h3').removeClass();
		  $('.buy-options:visible').slideUp(500);
		  $(this).addClass('hovered');
		  $('.buy-options').slideDown(500);
		}
		return false;
		});

		$('.buy-box h3, .buy-options').hover(
		function() {
		  clearTimeout(closetimer);
		},
		function() {
		  closetimer = window.setTimeout(function() {
		    $('.buy-box h3').removeClass('hovered');
		    $('.buy-options').slideUp(500);
		  }, 1000);
		});

		/////////////////////////////////////////////
		// Buy now button toggle
		/////////////////////////////////////////////
		$(".note .close").click(function(){
			$(this).parent(".note").animate({ opacity: "hide" }, "slow");
		});


		/////////////////////////////////////////////
		// Lightbox - add .zoom
		/////////////////////////////////////////////
		$(".lightbox-icon").append('<span class="zoom"></span>');


		/////////////////////////////////////////////
		// Theme list frame
		/////////////////////////////////////////////
		$(".theme-post .theme-image, #showcase-slider .slide-image").prepend('<span class="theme-frame"><span class="dot"></span><span class="dot"></span><span class="dot"></span></span>');

		/////////////////////////////////////////////
		// Select box style	- plugin
		/////////////////////////////////////////////
		if(typeof $.fn.selectbox !== 'undefined'){
			$("#select-theme").selectbox();
			$("#select-bonus").selectbox();
		}

		/////////////////////////////////////////////
		// Fixed Header
		/////////////////////////////////////////////
		if('undefined' !== $.fn.fixedHeader){
			$('#headerwrap').fixedHeader();
		}

		// Only enable parallax and animation on desktop
		if ( 'undefined' !== typeof themifyScript ) {
			// Parallax Header
			if('undefined' !== $.fn.parallaxHeader && !themifyScript.is_mobile){
				$('.parallax-header').parallaxHeader();
			}
		}

		// On scrolling animation
		$('.fly-in, .fade-in, .slide-up').on('inview', function(event, isInView, visiblePartX, visiblePartY) {
			if (isInView) {
				if($(this).hasClass('animated')) return;
				$(this).addClass('animated');

				// FadeIn & SlideUp
				if($(this).hasClass('slide-up') || $(this).hasClass('fade-in')){
					var duration = $(this).hasClass('slide-up') ? 100 : 500;
					$(this).find('li').each(function(i){
						var $this = $(this);
						setTimeout(function(){
							$this.addClass('animate-up');
						}, i * duration);
					});
				}
			} else {
				// element has gone out of viewport
				$(this).removeClass('animated').find('li').removeClass('animate-up');
			}
		});

		// Section bg color cycling
		$('.animated-bg').each(function(){
			var $this = $(this),
				colors = ['#ec008c', '#00bcc3', '#5fb26a', '#fc7331'];

			setInterval(function(){
				var color = colors.shift();
				colors.push(color);
				$this.animate({backgroundColor: color}, 2000);
			},4000);
		});

		// Magnific Popup
		$body.on('click', 'a.lightbox', function(e){
			e.preventDefault();
			var $this = $(this),
				href = $this.prop('href'),
				type = _getFileType(href);
			$.magnificPopup.open({
				items: { src: href },
				type: type
			}, 0);
		});

		// ScrollTo
		$body.on('click', 'a.scroll-to', function(e){
			var hash = $(this).prop('hash');
			if ( 'undefined' !== typeof hash && hash.indexOf('#') != -1 && $(hash).length > 0 ) {
				var offset = $(hash).offset().top;
				themeScrollTo(offset);
				e.preventDefault();
			}
		});

		// Private Message
		$('#post-form-private-container label').click(function(){
			$('#post-private-data').slideToggle();
		});

		// Multi form selector
		var $multiForm = $('.multiforms');
		if ( $multiForm.length > 0 ) {
			var $multiSelectors = $multiForm.find('.multi-selectors'),
				$multiOptions = $multiSelectors.find('input[type=radio]'),
				$forms = $multiForm.find('.multi-form');
			$multiSelectors.on('click', 'input[type=radio]', function(){
				var form = $(this).data('form');
				$forms.filter(':visible').slideUp();
				$multiForm.find('.' + form + '-form').slideDown();
			});
		}

		// Promo Bar
		if ( $('.promo-bar-wrap').length > 0 ) {
			var PromoBar = {
				$bar: null,
				$barWrap: null,

				init: function(){
					this.$bar = $('.promo-bar');
					this.$barWrap = $('.promo-bar-wrap');
					if( ! PromoBar.isPromoClosed() ) {
						this.$bar.css({
							'display': 'block',
							'top': '0'
						});
						this.$barWrap.removeClass('closed').addClass('open').css('height', '');
						this.setDimensions();
					} else {
						this.$bar.css({
							'display': 'block',
							'top': - this.$bar.height() - 1
						});
					}
					this.$barWrap.removeClass('init');
					this.onResize();
					this.attachToggle();
				},

				setDimensions: function(){
					var proH = this.$bar.height();
					if ( this.$barWrap.hasClass('open') ){
						$body.css('marginTop', proH);
						$headerwrap.css('top', proH);
					} else {
						$body.css('marginTop', '');
						$headerwrap.css('top', '0');
					}
				},

				onResize: function() {
					var resizeId;
					$(window).resize(function(){
						clearTimeout(resizeId);
						resizeId = setTimeout(function(){
							PromoBar.setDimensions();
						}, 500);
					});
				},

				isPromoClosed: function() {
					var promoState = themifyGetCookie('promostate');
					return typeof promoState != 'undefined' && promoState !== null && 'promoopen' != promoState;
				},

				attachToggle: function() {
					var $bar = this.$bar,
						$barWrap = this.$barWrap;
					$barWrap.on('click', '.close', function(e){
						e.preventDefault();
						var $toggle = $(this);
						$toggle.fadeOut(100);
						if( PromoBar.isPromoClosed() ) {
							$barWrap.css('height', '');
							$bar.show().stop().animate( { 'top': '0' },
							150, function(){
								$barWrap.removeClass('closed').addClass('open');
								$toggle.fadeIn();
								themifySetCookie('promostate', 'promoopen');
								$bar.trigger('promoOpen');
								PromoBar.setDimensions();
							});
						} else {
							$bar.stop().animate( { 'top': - $bar.height() - 1 },
							150, function(){
								$body.css('marginTop', '0');
								$headerwrap.css('top', '0');
								$barWrap.removeClass('open').addClass('closed');
								$toggle.fadeIn();
								themifySetCookie('promostate', 'promoclosed');
								$bar.trigger('promoClosed');
							});
						}
					});
				}
			};
			PromoBar.init();

			// Adjust header wrap position if there's a promo bar
			var $promoBar = $('.promo-bar');
			if ( $('.promo-bar-wrap').hasClass('open') ) {
				$('#headerwrap').css('top', $promoBar.height());
			}
		}

	});

	$(window).load(function(){
		var $body = $('body'), $headerwrap = $('#headerwrap');

		// Lightbox / Fullscreen initialization ///////////
		if(typeof ThemifyGallery !== 'undefined'){ ThemifyGallery.init({'context': $(themifyScript.lightboxContext)}); }

		// Add Social Buttons
		addSocialButtons('#footerwrap');

		// Separate amember download list in: plugins, addons and themes
		var $listProduct = $('.list.product');
		if ( $listProduct.length > 0 ) {
			var $themifyPlugins = $('<ul class="themify-plugins list product">'),
				$themifyAddons = $('<ul class="themify-addons list product">'),
				$themifyPTBAddons = $('<ul class="themify-ptbaddons list product">'),
				$themifyThemes = $('<ul class="themify-themes list product">');

			$themifyPlugins.insertBefore($listProduct);
			$themifyPTBAddons.insertBefore($listProduct);
			$themifyAddons.insertBefore($listProduct);
			$themifyThemes.insertBefore($listProduct);

			$listProduct.find('li').each(function(){
				var $self = $(this), $label = $self.find('a:first');
				if ( $label.length > 0 ) {
					var text = $self.text().trim();
					if ( text.indexOf('Plugin') != -1 ) {
						$themifyPlugins.append( $self );
					} else if ( text.indexOf('PTB') != -1 ) {
						$themifyPTBAddons.append( $self );
					} else if ( text.indexOf('Addon') != -1 ) {
						$themifyAddons.append( $self );
					} else {
						$themifyThemes.append( $self );
					}
				}
			});
			
			if ( $themifyPlugins.find('li').length > 0 ) {
				$('<h5 class="themify-plugins">Plugins</h5>').insertBefore($themifyPlugins);
			}
			if ( $themifyPTBAddons.find('li').length > 0 ) {
				$('<h5 class="themify-ptbaddons">PTB Add-Ons</h5>').insertBefore($themifyPTBAddons);
			}
			if ( $themifyAddons.find('li').length > 0 ) {
				$('<h5 class="themify-addons">Add-Ons</h5>').insertBefore($themifyAddons);
			}
			if ( $themifyThemes.find('li').length > 0 ) {
				$('<h5 class="themify-themes">Themes</h5>').insertBefore($themifyThemes);
			}

			var $free = $('.themify-themes.list').find('a:contains(Free)').parent(),
				$freeThemes = $('<ul class="themify-themes list product free" />').append( $free );

			$('.themify-themes.list').after( $freeThemes );
			$('<h5 class="themify-themes">Free Themes</h5>').insertBefore( $freeThemes );

			$('.themify-themes.list').find('a:contains(Photoshop)').parent().addClass('psd');
		}

		// Blog Category
		if ( $('.blog-category').length > 0 ) {
			$('.blog-category ul li').each(function(){
				$(this).prepend('<span />');
			});
		}

		// Docs
		var docsNav = [];
		$('#content .docs h3').each(function(){
			var anchorId = $(this).prop('id'),
				title = $(this).text();
			if ( '' !== anchorId ) {
				var data = { anchor: '#' + anchorId, title: title };
				docsNav.push(data);
			}
		});
		if ( docsNav.length > 0 ) {
			var template = $('#docs-navigation').html();
  			$('#sidebar .sidebar-inner').html(_.template(template,{items:docsNav}));

  			// Apply nicescroll to desktop
  			if ( !themifyScript.is_mobile && 'undefined' !== typeof $.fn.niceScroll ) {
	  			$('#sidebar .sidebar-inner').niceScroll(); // apply nice scroll

	  			$(window).on('scroll', function(){
	  				didScroll = true;
	  			});
	  			setInterval(function(){
	  				if ( didScroll ) {
	  					didScroll = false;
	  					$('#sidebar .sidebar-inner .toc').getNiceScroll().resize();
	  				}
	  			}, 500);
  			}
		}

		// Doc navigation
		$body.on('click', '.toc li a', function(e){
			e.preventDefault();
			var anchor = $(this).prop('hash');
			if ( $(anchor).length > 0 ) {
				setHash(anchor);
				var offset = parseInt( $(anchor).offset().top );
				themeScrollTo(offset);
			}
		});

		// scroll to anchor when window load
		if ( window.location.hash && $(window.location.hash).length > 0 ) {
			var offset = parseInt( $(window.location.hash).offset().top );
			themeScrollTo(offset);
		}

		/////////////////////////////////////////////
		// jSticky - plugin
		/////////////////////////////////////////////
		if(typeof $.fn.sticky !== 'undefined'){
			var $el = $('.fixed-sidebar #sidebar .sidebar-inner');
			$el.sticky({
				topSpacing: 100, // Space between element and top of the viewport
				stopper: '#footerwrap, .section'
			});
		}

	});
})(jQuery);