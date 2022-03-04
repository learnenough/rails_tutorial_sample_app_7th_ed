// Functions for manipulating menus.

// Add the toggle listener to listen for clicks.
document.addEventListener('click', function(event) {
  // Main dropdown menu
  if (event.target.classList.contains('dropdown-toggle')) {
    // Stop the click from going through.
    event.preventDefault();
    event.stopPropagation();
    // Toggle the required menu attribute.
    let menu = document.querySelector('.dropdown-menu');
    menu.classList.toggle('active');
  }
  // Mobile menu
  if (event.target.classList.contains('navbar-toggle')) {
    // Stop the click from going through.
    event.preventDefault();
    event.stopPropagation();
    // Toggle the required menu attribute.
    let menu = document.querySelector('#example-navbar-collapse');
    menu.classList.toggle('collapse');
  }
});
