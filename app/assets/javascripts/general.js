$(document).ready(function(){
	
	// fade in .navbar
	$(function() {
		$(window).scroll(function () {
            // set distance user needs to scroll before we fadeIn navbar
			if ($(this).scrollTop() > 0) {
				// $('.nav').css('position', 'fixed');
				// $('.nav').fadeIn();
				$('.nav').css({'border-bottom': '1px solid #E8E8E8',
											 'box-shadow': '0px 1px 3px #E8E8E8'});
			} else {
				// $('.nav').css('position', 'static');
				$('.nav').css({'box-shadow': 'none',
											 'border-bottom': '1px solid white'});
			}
		});

	
	});

});