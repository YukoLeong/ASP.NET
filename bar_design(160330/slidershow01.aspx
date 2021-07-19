﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="slidershow01.aspx.cs" Inherits="slidershow01" %>

<!DOCTYPE html>

<%--don't know why can not work..--%>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sliding Header Grid Layout (Multi)</title>
    <link rel="shortcut icon" href="http://tympanus.net/Tutorials/favicon.ico" />
    <link rel="stylesheet" type="text/css" href="slidershow01style/css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="slidershow01style/css/demo.css" />
    <link rel="stylesheet" type="text/css" href="slidershow01style/css/layout-multi.css" />
    <script src="slidershow01style/js/modernizr.custom.js"></script>


</head>
<body>
    <form id="form1" runat="server">
        <svg class="hidden">
            <g id="icon-grid">
                <rect x="32.5" y="5.5" width="22" height="22" />
                <rect x="4.5" y="5.5" width="22" height="22" />
                <rect x="32.5" y="33.5" width="22" height="22" />
                <rect x="4.5" y="33.5" width="22" height="22" />
            </g>
            <g id="icon-cross">
                <line x1="4.5" y1="55.5" x2="54.953" y2="5.046" />
                <line x1="54.953" y1="55.5" x2="4.5" y2="5.047" />
            </g>
        </svg>
        <nav class="thumb-nav">
            <a data-container="container-1" class="thumb-nav__item" href="#">
                <img src="slidershow01style/img/thumbs/thumb1.png" alt="thumb01" /><span>1</span></a>
            <a data-container="container-2" class="thumb-nav__item" href="#">
                <img src="slidershow01style/img/thumbs/thumb2.png" alt="thumb02" /><span>2</span></a>
            <a data-container="container-3" class="thumb-nav__item" href="#">
                <img src="slidershow01style/img/thumbs/thumb3.png" alt="thumb03" /><span>3</span></a>
        </nav>
        <div id="container-1" class="container theme-1">
            <header class="intro">
                <img class="intro__image" src="slidershow01style/img/header01.jpg" alt="Lava" />
                <div class="intro__content">
                    <h1 class="intro__title">Essential Feelings</h1>
                    <div class="intro__subtitle">
                        <div class="codrops-links">
                            <a class="codrops-icon codrops-icon--prev" href="http://tympanus.net/Development/ElasticSVGElements/" title="Previous Demo"><span>Previous Demo</span></a>
                            <a class="codrops-icon codrops-icon--drop" href="http://tympanus.net/codrops/?p=21934" title="Back to the a"><span>Back to the Codrops a</span></a>
                        </div>
                        <div class="intro__description">
                            A multi-panel layout with intro headers and image grids. Photo courtesy of <a href="http://instagram.com/danrubin/">Dan Rubin</a>.
						
                            <div class="demos">

                                <a class="demos__item" href="slidershow01style/index.html">Simple</a>
                                <a class="demos__item demos__item--current" href="slidershow01style/layout-multi.html">Multi</a>
                            </div>
                        </div>
                        <button class="trigger">
                            <svg width="100%" height="100%" viewBox="0 0 60 60" preserveAspectRatio="none">
                                <use class="icon icon--grid" xlink:href="#icon-grid" />
                                <use class="icon icon--cross" xlink:href="#icon-cross" />
                            </svg>
                            <span>Toggle content</span>
                        </button>
                    </div>
                </div>
                <!-- /intro__content -->
            </header>
            <!-- /intro -->
            <section class="items-wrap">
                <a href="#" class="item">
                    <img class="item__image" src="slidershow01style/img/item01.jpg" alt="item01" />
                    <h2 class="item__title">Magnificence</h2>
                </a>
                <a href="#" class="item">
                    <img class="item__image" src="slidershow01style/img/item02.jpg" alt="item02" />
                    <h2 class="item__title">Electrifying</h2>
                </a>
                <a href="#" class="item">
                    <img class="item__image" src="slidershow01style/img/item03.jpg" alt="item03" />
                    <h2 class="item__title">Dynamic</h2>
                </a>
                <a href="#" class="item">
                    <img class="item__image" src="slidershow01style/img/item04.jpg" alt="item04" />
                    <h2 class="item__title">Crucial</h2>
                </a>
                <a href="#" class="item">
                    <img class="item__image" src="slidershow01style/img/item05.jpg" alt="item05" />
                    <h2 class="item__title">Awe-inspiring</h2>
                </a>
                <a href="#" class="item">
                    <img class="item__image" src="slidershow01style/img/item06.jpg" alt="item06" />
                    <h2 class="item__title">Serene</h2>
                </a>
                <a href="#" class="item">
                    <img class="item__image" src="slidershow01style/img/item07.jpg" alt="item07" />
                    <h2 class="item__title">Vulnerable</h2>
                </a>
                <a href="#" class="item">
                    <img class="item__image" src="slidershow01style/img/item08.jpg" alt="item08" />
                    <h2 class="item__title">Bountiful</h2>
                </a>
                <a href="#" class="item">
                    <img class="item__image" src="slidershow01style/img/item09.jpg" alt="item09" />
                    <h2 class="item__title">Endangered</h2>
                </a>
                <a href="#" class="item">
                    <img class="item__image" src="slidershow01style/img/item10.jpg" alt="item10" />
                    <h2 class="item__title">Beautiful</h2>
                </a>
                <a href="#" class="item">
                    <img class="item__image" src="slidershow01style/img/item11.jpg" alt="item11" />
                    <h2 class="item__title">Inspiring</h2>
                </a>
                <a href="#" class="item">
                    <img class="item__image" src="slidershow01style/img/item12.jpg" alt="item12" />
                    <h2 class="item__title">Refreshing</h2>
                </a>
            </section>
            <section class="related">
                <p>If you enjoyed this demo you might also like:</p>
                <a href="http://tympanus.net/Development/DraggableDualViewSlideshow/">Draggable Dual-View Slideshow</a><br />
                <a href="http://tympanus.net/Tutorials/PagePreloadingEffect/">Page Preloading Effect</a>
            </section>
        </div>
        <!-- /container -->
        <div id="container-2" class="container theme-2">
            <header class="intro">
                <img class="intro__image" src="slidershow01style/img/header02.jpg" alt="Road" />
                <div class="intro__content">
                    <h1 class="intro__title">Common Paths</h1>
                    <div class="intro__subtitle">
                        <div class="codrops-links">
                            <a class="codrops-icon codrops-icon--prev" href="http://tympanus.net/Development/ElasticSVGElements/" title="Previous Demo"><span>Previous Demo</span></a>
                            <a class="codrops-icon codrops-icon--drop" href="http://tympanus.net/codrops/?p=21934" title="Back to the a"><span>Back to the Codrops a</span></a>
                        </div>
                        <div class="intro__description">
                            A multi-panel layout with intro headers and image grids. Photo courtesy of <a href="http://instagram.com/danrubin/">Dan Rubin</a>.
						
                            <div class="demos">

                                <a class="demos__item" href="slidershow01style/index.html">Simple</a>
                                <a class="demos__item demos__item--current" href="slidershow01style/layout-multi.html">Multi</a>
                            </div>
                        </div>
                        <button class="trigger">
                            <svg width="100%" height="100%" viewBox="0 0 60 60" preserveAspectRatio="none">
                                <use class="icon icon--grid" xlink:href="#icon-grid" />
                                <use class="icon icon--cross" xlink:href="#icon-cross" />
                            </svg>
                            <span>Toggle content</span>
                        </button>
                    </div>
                </div>
                <!-- /intro__content -->
            </header>
            <!-- /intro -->
            <section class="items-wrap">
                <a href="#" class="item">
                    <img class="item__image" src="slidershow01style/img/item06.jpg" alt="item06" />
                    <h2 class="item__title">Serene</h2>
                </a>
                <a href="#" class="item">
                    <img class="item__image" src="slidershow01style/img/item08.jpg" alt="item08" />
                    <h2 class="item__title">Bountiful</h2>
                </a>
                <a href="#" class="item">
                    <img class="item__image" src="slidershow01style/img/item09.jpg" alt="item09" />
                    <h2 class="item__title">Endangered</h2>
                </a>
                <a href="#" class="item">
                    <img class="item__image" src="slidershow01style/img/item10.jpg" alt="item10" />
                    <h2 class="item__title">Beautiful</h2>
                </a>
                <a href="#" class="item">
                    <img class="item__image" src="slidershow01style/img/item07.jpg" alt="item07" />
                    <h2 class="item__title">Vulnerable</h2>
                </a>
                <a href="#" class="item">
                    <img class="item__image" src="slidershow01style/img/item11.jpg" alt="item11" />
                    <h2 class="item__title">Inspiring</h2>
                </a>
                <a href="#" class="item">
                    <img class="item__image" src="slidershow01style/img/item12.jpg" alt="item12" />
                    <h2 class="item__title">Refreshing</h2>
                </a>
                <a href="#" class="item">
                    <img class="item__image" src="slidershow01style/img/item01.jpg" alt="item01" />
                    <h2 class="item__title">Magnificence</h2>
                </a>
                <a href="#" class="item">
                    <img class="item__image" src="slidershow01style/img/item02.jpg" alt="item02" />
                    <h2 class="item__title">Electrifying</h2>
                </a>
                <a href="#" class="item">
                    <img class="item__image" src="slidershow01style/img/item03.jpg" alt="item03" />
                    <h2 class="item__title">Dynamic</h2>
                </a>
                <a href="#" class="item">
                    <img class="item__image" src="slidershow01style/img/item04.jpg" alt="item04" />
                    <h2 class="item__title">Crucial</h2>
                </a>
                <a href="#" class="item">
                    <img class="item__image" src="slidershow01style/img/item05.jpg" alt="item05" />
                    <h2 class="item__title">Awe-inspiring</h2>
                </a>
            </section>
            <section class="related">
                <p>If you enjoyed this demo you might also like:</p>
                <a href="http://tympanus.net/Development/ArticleIntroEffects/">Inspiration for Article Intro Effects</a><br />
                <a href="http://tympanus.net/Development/3DGridEffect/">3D Grid Effect</a>
            </section>
        </div>
        <!-- /container -->
        <div id="container-3" class="container">
            <header class="intro">
                <img class="intro__image" src="slidershow01style/img/header03.jpg" alt="Glacier" />
                <div class="intro__content">
                    <h1 class="intro__title">On Serenity</h1>
                    <div class="intro__subtitle">
                        <div class="codrops-links">
                            <a class="codrops-icon codrops-icon--prev" href="http://tympanus.net/Development/ElasticSVGElements/" title="Previous Demo"><span>Previous Demo</span></a>
                            <a class="codrops-icon codrops-icon--drop" href="http://tympanus.net/codrops/?p=21934" title="Back to the a"><span>Back to the Codrops a</span></a>
                        </div>
                        <div class="intro__description">
                            A multi-panel layout with intro headers and image grids. Photo courtesy of <a href="http://instagram.com/danrubin/">Dan Rubin</a>.
						
                            <div class="demos">

                                <a class="demos__item" href="slidershow01style/index.html">Simple</a>
                                <a class="demos__item demos__item--current" href="slidershow01style/layout-multi.html">Multi</a>
                            </div>
                        </div>
                        <button class="trigger">
                            <svg width="100%" height="100%" viewBox="0 0 60 60" preserveAspectRatio="none">
                                <use class="icon icon--grid" xlink:href="#icon-grid" />
                                <use class="icon icon--cross" xlink:href="#icon-cross" />
                            </svg>
                            <span>Toggle content</span>
                        </button>
                    </div>
                </div>
                <!-- /intro__content -->
            </header>
            <!-- /intro -->
            <section class="items-wrap">
                <a href="#" class="item">
                    <img class="item__image" src="slidershow01style/img/item11.jpg" alt="item11" />
                    <h2 class="item__title">Inspiring</h2>
                </a>
                <a href="#" class="item">
                    <img class="item__image" src="slidershow01style/img/item10.jpg" alt="item10" />
                    <h2 class="item__title">Beautiful</h2>
                </a>
                <a href="#" class="item">
                    <img class="item__image" src="slidershow01style/img/item07.jpg" alt="item07" />
                    <h2 class="item__title">Vulnerable</h2>
                </a>
                <a href="#" class="item">
                    <img class="item__image" src="slidershow01style/img/item04.jpg" alt="item04" />
                    <h2 class="item__title">Crucial</h2>
                </a>
                <a href="#" class="item">
                    <img class="item__image" src="slidershow01style/img/item01.jpg" alt="item01" />
                    <h2 class="item__title">Magnificence</h2>
                </a>
                <a href="#" class="item">
                    <img class="item__image" src="slidershow01style/img/item05.jpg" alt="item05" />
                    <h2 class="item__title">Awe-inspiring</h2>
                </a>
                <a href="#" class="item">
                    <img class="item__image" src="slidershow01style/img/item06.jpg" alt="item06" />
                    <h2 class="item__title">Serene</h2>
                </a>
                <a href="#" class="item">
                    <img class="item__image" src="slidershow01style/img/item08.jpg" alt="item08" />
                    <h2 class="item__title">Bountiful</h2>
                </a>
                <a href="#" class="item">
                    <img class="item__image" src="slidershow01style/img/item09.jpg" alt="item09" />
                    <h2 class="item__title">Endangered</h2>
                </a>
                <a href="#" class="item">
                    <img class="item__image" src="slidershow01style/img/item02.jpg" alt="item02" />
                    <h2 class="item__title">Electrifying</h2>
                </a>
                <a href="#" class="item">
                    <img class="item__image" src="slidershow01style/img/item12.jpg" alt="item12" />
                    <h2 class="item__title">Refreshing</h2>
                </a>
                <a href="#" class="item">
                    <img class="item__image" src="slidershow01style/img/item03.jpg" alt="item03" />
                    <h2 class="item__title">Dynamic</h2>
                </a>
            </section>
            <section class="related">
                <p>If you enjoyed this demo you might also like:</p>
                <a href="http://tympanus.net/Development/MorphingSearch/">Morphing Search</a><br />
                <a href="http://tympanus.net/Development/TripleViewLayout/">Sliding Triple View Layout</a>
            </section>
        </div>
        <!-- /container -->
    <script src="slidershow01style/js/classie.js"></script>

    <script type="text/javascript">
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-7243260-2']);
        _gaq.push(['_trackPageview']);
        (function () {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();
</script>

    <script>
        (function () {
            // For Demo purposes only
            var hasad = true;

            var support = { animations: Modernizr.cssanimations },
                animEndEventNames = { 'WebkitAnimation': 'webkitAnimationEnd', 'OAnimation': 'oAnimationEnd', 'msAnimation': 'MSAnimationEnd', 'animation': 'animationend' },
                animEndEventName = animEndEventNames[Modernizr.prefixed('animation')],
                onEndAnimation = function (el, callback) {
                    var onEndCallbackFn = function (ev) {
                        if (support.animations) {
                            if (ev.target != this) return;
                            this.removeEventListener(animEndEventName, onEndCallbackFn);
                        }
                        if (callback && typeof callback === 'function') { callback.call(); }
                    };
                    if (support.animations) {
                        el.addEventListener(animEndEventName, onEndCallbackFn);
                    }
                    else {
                        onEndCallbackFn();
                    }
                };

            var containers = [].slice.call(document.querySelectorAll('.container')),
                containersCount = containers.length,
                nav = document.querySelector('nav.thumb-nav'),
                pageTriggers = [].slice.call(nav.children),
                isAnimating = false, current = 0;

            function init() {
                resetScroll();
                // disable scrolling
                window.addEventListener('scroll', noscroll);
                // set current page trigger
                classie.add(pageTriggers[current], 'thumb-nav__item--current');
                // set current container
                classie.add(containers[current], 'container--current');
                // initialize events
                initEvents();
            }

            function initEvents() {
                // slideshow navigation
                pageTriggers.forEach(function (pageTrigger) {
                    pageTrigger.addEventListener('click', function (ev) {
                        ev.preventDefault();
                        navigate(this);
                    });
                });

                // open each container's content area when clicking on the respective trigger button
                containers.forEach(function (container) {
                    container.querySelector('button.trigger').addEventListener('click', function () {
                        toggleContent(container, this);
                    });
                });

                // keyboard navigation events
                document.addEventListener('keydown', function (ev) {
                    var keyCode = ev.keyCode || ev.which,
                        isContainerOpen = containers[current].getAttribute('data-open') == 'open';

                    switch (keyCode) {
                        // left key
                        case 37:
                            if (current > 0 && !isContainerOpen) {
                                navigate(pageTriggers[current - 1]);
                            }
                            break;
                            // right key
                        case 39:
                            if (current < containersCount - 1 && !isContainerOpen) {
                                navigate(pageTriggers[current + 1]);
                            }
                            break;
                    }
                });
            }

            function navigate(pageTrigger) {
                var oldcurrent = current,
                    newcurrent = pageTriggers.indexOf(pageTrigger);

                if (isAnimating || oldcurrent === newcurrent) return;
                isAnimating = true;

                // reset scroll
                allowScroll();
                resetScroll();
                preventScroll();

                var currentPageTrigger = pageTriggers[current],
                    nextContainer = document.getElementById(pageTrigger.getAttribute('data-container')),
                    currentContainer = containers[current],
                    dir = newcurrent > oldcurrent ? 'left' : 'right';

                classie.remove(currentPageTrigger, 'thumb-nav__item--current');
                classie.add(pageTrigger, 'thumb-nav__item--current');

                // update current
                current = newcurrent;

                // add animation classes
                classie.add(nextContainer, dir === 'left' ? 'container--animInRight' : 'container--animInLeft');
                classie.add(currentContainer, dir === 'left' ? 'container--animOutLeft' : 'container--animOutRight');

                onEndAnimation(currentContainer, function () {
                    // clear animation classes
                    classie.remove(currentContainer, dir === 'left' ? 'container--animOutLeft' : 'container--animOutRight');
                    classie.remove(nextContainer, dir === 'left' ? 'container--animInRight' : 'container--animInLeft');

                    // clear current class / set current class
                    classie.remove(currentContainer, 'container--current');
                    classie.add(nextContainer, 'container--current');

                    isAnimating = false;
                });
            }

            // show content section
            function toggleContent(container, trigger) {
                if (classie.has(container, 'container--open')) {
                    classie.remove(container, 'container--open');
                    classie.remove(trigger, 'trigger--active');
                    classie.remove(nav, 'thumb-nav--hide');
                    container.setAttribute('data-open', '');
                    preventScroll();
                }
                else {
                    classie.add(container, 'container--open');
                    classie.add(trigger, 'trigger--active');
                    classie.add(nav, 'thumb-nav--hide');
                    container.setAttribute('data-open', 'open');
                    allowScroll();

                    // For Demo purposes only
                    if (hasad) {
                        hasad = false;
                        var ad = document.getElementById('cdawrap');
                        if (ad) document.body.removeChild(ad);
                    }
                }
            }

            // scroll functions
            function resetScroll() { document.body.scrollTop = document.documentElement.scrollTop = 0; }
            function preventScroll() { window.addEventListener('scroll', noscroll); }
            function allowScroll() { window.removeEventListener('scroll', noscroll); }
            function noscroll() {
                window.scrollTo(0, 0);
            }

            init();

            // For Demo purposes only (prevent jump on click)
            [].slice.call(document.querySelectorAll('.items-wrap a')).forEach(function (el) { el.onclick = function () { return false; } });
        })();
		</script>


    <!-- For the demo ad only -->
    <script src="slidershow01style/js/demoad.js"></script>

    </form>
</body>
</html>
