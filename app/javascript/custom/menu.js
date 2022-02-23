let menu_nav = document.querySelector('.dropdown-toggle');
let menu     = document.querySelector('.dropdown-menu')

menu_nav.onclick = function(event) {
  event.preventDefault();
  event.stopPropagation();
  menu.classList.toggle('active');
}