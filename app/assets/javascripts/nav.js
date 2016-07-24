$(document).ready(function() {

	// fade in .navbar
	$(function() {
		$(window).scroll(function () {
            // set distance user needs to scroll before we fadeIn navbar
			if ($(this).scrollTop() > 0) {
				// $('.nav').css('position', 'fixed');
				// $('.nav').fadeIn();
				$('.nav-fixed').css({'border-bottom': '1px solid #D0D0D0',
											 'box-shadow': '0px 1px 2px #D0D0D0'});
			} else {
				// $('.nav').css('position', 'static');
				$('.nav-fixed').css({'box-shadow': 'none',
											 'border-bottom': 'none'});
			}
		});
	});
});