var ready;
ready = function() {

  $(function() {
	  $('.alert').delay(2500).fadeOut(1000);
	});
};

$(document).ready(ready);
$(document).on('page:load', ready);