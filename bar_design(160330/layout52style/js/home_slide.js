$(function() {
// OPACITY OF BUTTON SET TO 100%
$(".slide_img").css("opacity","1.0");
 
// ON MOUSE OVER
$(".slide_img").hover(function () {
 // SET OPACITY TO 60%
$(this).stop().animate({
opacity: 0.6
}, "slow");
},
 
// ON MOUSE OUT
function () {
 // SET OPACITY BACK TO 100%
$(this).stop().animate({
opacity: 1.0
}, "slow");
});
});

// jQuery simple image slideshow
function slideSwitch() {
    var $active = $('#slideshow DIV.active');

    if ( $active.length == 0 ) $active = $('#slideshow DIV:last');

    // use this to pull the images in the order they appear in the markup
    var $next =  $active.next().length ? $active.next()
        : $('#slideshow DIV:first');

    // uncomment the 3 lines below to pull the images in random order
    
    // var $sibs  = $active.siblings();
    // var rndNum = Math.floor(Math.random() * $sibs.length );
    // var $next  = $( $sibs[ rndNum ] );


    $active.addClass('last-active');

    $next.css({opacity: 0.0})
        .addClass('active')
        .animate({opacity: 1.0}, 1000, function() {
            $active.removeClass('active last-active');
        });
}

$(function() {
    setInterval( "slideSwitch()", 5000 );
});