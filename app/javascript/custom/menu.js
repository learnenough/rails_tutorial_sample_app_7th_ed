// Functions for manipulating menus.

// Returns true if we should toggle the element with the given label.
function should_toggle(event, label) {
  return event.target.classList.contains(label);
}

// Toggle the element with the given selector.
function toggle(event, selector, attribute) {
  // Stop the click from going through.      
  event.preventDefault();
  event.stopPropagation();
  // Toggle the required menu attribute.
  let menu = document.querySelector(selector);
  menu.classList.toggle(attribute);
}

// Defines a listener to toggle menus.
function toggle_listener(event) {
  // Main dropdown menu
  if (should_toggle(event, 'dropdown-toggle')) {
    toggle(event, '.dropdown-menu', 'active');
  }
  
  // Mobile menu
  if(should_toggle(event, 'navbar-toggle') ) {
    toggle(event, '#example-navbar-collapse', 'collapse');
  }
}

// Add the toggle listener to listen for clicks.
document.addEventListener('click', function (event) {
  toggle_listener(event);
});
