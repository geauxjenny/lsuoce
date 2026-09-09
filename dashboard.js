(function () {
  'use strict';

  var nav = document.querySelector('[data-portal-nav]');
  var toggle = document.querySelector('[data-portal-nav-toggle]');

  if (nav && toggle) {
    toggle.addEventListener('click', function () {
      var isOpen = nav.classList.toggle('is-open');
      toggle.setAttribute('aria-expanded', isOpen ? 'true' : 'false');
    });
  }

  document.querySelectorAll('[data-notice-dismiss]').forEach(function (button) {
    button.addEventListener('click', function () {
      var notice = button.closest('[data-notice]');
      if (notice) notice.hidden = true;
    });
  });
})();
