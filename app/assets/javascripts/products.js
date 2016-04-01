var ready;
ready = function() {

	var thumbnails = $(".thumbnails").find("img");

  thumbnails.on("click", function(){
  	var thisClass = $(this).attr('class').split(' ')[0];
    thumbnails.removeClass("selected");
    $(this).addClass("selected");
	});
};

$(document).ready(ready);
$(document).on('page:load', ready);