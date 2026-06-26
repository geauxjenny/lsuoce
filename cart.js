(function () {
  var STORAGE_KEY = 'lsu-ce-cart';
  var CART_URL =
    'https://ce.lsu.edu/corporate/coursebasket/publicCourseBasket.do?method=load&corporateGroupId=51819353';

  function readCart() {
    try {
      var stored = window.localStorage.getItem(STORAGE_KEY);
      if (!stored) return [];
      var parsed = JSON.parse(stored);
      return Array.isArray(parsed) ? parsed : [];
    } catch (error) {
      return [];
    }
  }

  function writeCart(items) {
    window.localStorage.setItem(STORAGE_KEY, JSON.stringify(items));
    updateCartUi(items.length);
  }

  function updateCartUi(count) {
    var badges = document.querySelectorAll('[data-cart-count]');
    var links = document.querySelectorAll('.cert-site-header__cart');

    badges.forEach(function (badge) {
      badge.textContent = String(count);
      badge.hidden = count === 0;
    });

    links.forEach(function (link) {
      var label =
        count === 1
          ? 'Shopping cart, 1 item'
          : 'Shopping cart, ' + count + ' items';
      link.setAttribute('aria-label', label);
    });
  }

  function addToCart(item) {
    if (!item || !item.id) return false;

    var cart = readCart();
    if (cart.some(function (entry) { return entry.id === item.id; })) {
      return false;
    }

    cart.push({
      id: item.id,
      title: item.title || '',
      price: item.price || 0,
      href: item.href || '',
    });
    writeCart(cart);
    return true;
  }

  function isInCart(id) {
    return readCart().some(function (entry) { return entry.id === id; });
  }

  function markCartButtonAdded(button) {
    if (!button) return;
    button.disabled = true;
    button.classList.add('is-added');
    button.setAttribute(
      'aria-label',
      (button.getAttribute('data-course-title') || 'Course') + ' added to cart'
    );
    button.textContent = 'Added';
  }

  window.LsuCeCart = {
    url: CART_URL,
    read: readCart,
    add: addToCart,
    has: isInCart,
    markAdded: markCartButtonAdded,
    refresh: function () {
      updateCartUi(readCart().length);
    },
  };

  document.addEventListener('click', function (event) {
    var button = event.target.closest('[data-add-to-cart]');
    if (!button || button.disabled) return;

    var added = addToCart({
      id: button.getAttribute('data-course-id'),
      title: button.getAttribute('data-course-title'),
      price: Number(button.getAttribute('data-course-price')) || 0,
      href: button.getAttribute('data-course-href') || '',
    });

    if (added) {
      markCartButtonAdded(button);
    }
  });

  updateCartUi(readCart().length);
})();
