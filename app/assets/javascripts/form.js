$(document).ready(function() {

  $(".form-wrapper .form-inputs input").focusin(function () {
	  $(this).prev().css({"margin-top": "3px",
	  										"opacity": "1",
	  										"visibility": "visible"});
	});

	$(".form-wrapper .form-inputs input").focusout(function () {
  	if (!$(this).val()) {
	  	$(this).prev().css({"margin-top": "8px",
		  										"opacity": "0",
		  										"visibility": "collapse"});
	  }
	});
});