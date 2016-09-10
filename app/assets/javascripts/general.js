/* When the user clicks on the button, 
toggle between hiding and showing the dropdown content */
function headerDropdown() {
  document.getElementById("header-dropdown").classList.toggle("show");
}

function dashDropdown(id) {

  var idName = "dash-dropdown-" + id

  var dropdowns = document.getElementsByClassName("dash-dropdown");
  var i;
  for (i = 0; i < dropdowns.length; i++) {
    var openDropdown = dropdowns[i];
    if (openDropdown.classList.contains('show') && openDropdown.id != idName) {
      openDropdown.classList.toggle('show');
    }
  }

  document.getElementById(idName).classList.toggle("show");
}

// Close the dropdown menu if the user clicks outside of it
window.onclick = function(event) {
  // Close header dropdown
  if (!event.target.matches('#header-dropdown-btn') && !event.target.matches('#header-dropdown-btn i')) {
    var headerDropdown =  document.getElementById("header-dropdown");
    if (headerDropdown) {
      headerDropdown.classList.remove("show");
    }
  }
  // Close dash dropdown unless you click on a dash dropdown button
  if (!event.target.matches('.dash-dropdown-btn i')) {

    var dropdowns = document.getElementsByClassName("dash-dropdown");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}