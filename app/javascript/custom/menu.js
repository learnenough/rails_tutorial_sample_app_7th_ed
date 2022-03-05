// Menu manipulation

// Add toggle listeners to listen for clicks.
document.addEventListener("turbo:load", function() {
  let dropdown = document.querySelector("#dropdown-toggle");
  dropdown.addEventListener("click", function(event) {
    event.preventDefault();
    event.stopPropagation();
    let menu = document.querySelector("#dropdown-menu")
    menu.classList.toggle("active");
  });

  let hamburger = document.querySelector("#hamburger");
  hamburger.addEventListener("click", function(event) {
    event.preventDefault();
    event.stopPropagation();
    let menu = document.querySelector("#navbar-menu");
    menu.classList.toggle("collapse");
  });
});
