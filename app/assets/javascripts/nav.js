var ready;
ready = function() {

  $(".icon").on("click", function(){
    document.getElementsByClassName("menu")[0].classList.toggle("responsive");
	});
};

$(document).ready(ready);
$(document).on('page:load', ready);