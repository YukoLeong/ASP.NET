$(function () {
    if (! $.browser.safari) {
        $('#jamp_top').click(function () {
            $(this).blur();

            $('html,body').animate({ scrollTop: 0 }, 'normal');

            return false;
        });
    }
});