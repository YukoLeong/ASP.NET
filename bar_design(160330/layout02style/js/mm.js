$(function() {
    // global menu
    var w = $(window).width();
    var x = 768;
    if (w >= x) {
        $('.menu_body li').hover(function() {
            $('ul', this).stop(false, true).slideToggle(200);
        });
    } else {
        $(function() {
            $('#all').click(function() {
                $.sidr('close', 'sidr');
            });
        });
    }
    // back to top
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
    // scroll
    $('a[href^=#]').click(function() {
        var speed = 500;
        var href= $(this).attr("href");
        var target = $(href == "#" || href == "" ? 'html' : href);
        var position = target.offset().top;
        $("html, body").animate({scrollTop:position}, speed, "swing");
        return false;
    });
    // fancybox
    $("a.fancybox").fancybox({
        'overlayColor' : '#111111',
        'speedOut' : 80,
        'overlayOpacity' : 0.8,
        'margin' : 100
    });
    // sidr
    $('#simple-menu').sidr( {side:'right'} );
})
