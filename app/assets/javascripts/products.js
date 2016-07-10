$(document).ready(function() {
  var thumbnails = $(".thumbnails").find("img");

  thumbnails.on("click", function(){
    thumbnails.removeClass("selected");
    $(this).addClass("selected");
	});
});