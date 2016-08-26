$(document).ready(function() {

	$(".form-wrapper .form-inputs input").each(function() {
		if ($(this).val()) {
			$(this).prev().css({"margin-top": "3px",
	  										"opacity": "1",
	  										"visibility": "visible"});
			if ($(this).is("#product_price")) {
				$(this).css("padding-left", "0.8em");
				$("#price-dollar-sign").css("display", "block");
			}
			if ($(this).is("#product_rebate")) {
				$(this).css("padding-left", "0.8em");
				$("#rebate-dollar-sign").css("display", "block");
			}
		}
	});

	// Adaptive placeholders
  $(".form-wrapper .form-inputs input").focusin(function () {
	  $(this).prev().css({"margin-top": "3px",
	  										"opacity": "1",
	  										"visibility": "visible"});
	  if ($(this).is("#product_price")) {
			$(this).css("padding-left", "0.8em");
			$("#price-dollar-sign").css("display", "block");
		}
		if ($(this).is("#product_rebate")) {
			$(this).css("padding-left", "0.8em");
			$("#rebate-dollar-sign").css("display", "block");
		}
	});

	$(".form-wrapper .form-inputs input").focusout(function () {
  	if (!$(this).val()) {
	  	$(this).prev().css({"margin-top": "8px",
		  										"opacity": "0",
		  										"visibility": "collapse"});
	  	if ($(this).is("#product_price")) {
				$(this).css("padding-left", "0");
				$("#price-dollar-sign").css("display", "none");
			}
			if ($(this).is("#product_rebate")) {
				$(this).css("padding-left", "0");
				$("#rebate-dollar-sign").css("display", "none");
			}
	  }
	});

	$(".alert" ).delay(3000).fadeOut(500);
});