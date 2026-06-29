(function () {
  var catalog = document.querySelector('[data-courses-catalog]');
  if (!catalog) return;

  var searchInput = catalog.querySelector('[data-courses-search]');
  var sortSelect = catalog.querySelector('[data-courses-sort]');
  var clearButton = catalog.querySelector('[data-courses-clear]');
  var countEl = catalog.querySelector('[data-courses-count]');
  var emptyState = catalog.querySelector('[data-courses-empty]');
  var grid = catalog.querySelector('[data-courses-grid]');
  var cards = grid ? Array.from(grid.querySelectorAll('.courses-card')) : [];
  var filterInputs = Array.from(catalog.querySelectorAll('[data-courses-filter]'));
  var filtersPanel = catalog.querySelector('[data-courses-filters]');
  var filtersToggle = catalog.querySelector('[data-courses-filters-toggle]');
  var filtersBody = catalog.querySelector('[data-courses-filters-body]');
  var mobileFiltersQuery = window.matchMedia('(max-width: 1023px)');

  function isMobileFilters() {
    return mobileFiltersQuery.matches;
  }

  function setFiltersOpen(open) {
    if (!filtersPanel || !filtersToggle || !filtersBody) return;
    filtersToggle.setAttribute('aria-expanded', open ? 'true' : 'false');
    filtersPanel.classList.toggle('is-open', open);
    filtersBody.classList.toggle('is-open', open);
  }

  function initFiltersCollapse() {
    setFiltersOpen(!isMobileFilters());
  }

  function getActiveFilters(name) {
    return filterInputs
      .filter(function (input) {
        return input.name === name && input.checked;
      })
      .map(function (input) {
        return input.value;
      });
  }

  function cardMatches(card) {
    var query = searchInput ? searchInput.value.trim().toLowerCase() : '';
    var subjects = getActiveFilters('subject');

    if (query) {
      var haystack = (
        (card.getAttribute('data-title') || '') +
        ' ' +
        (card.getAttribute('data-code') || '')
      ).toLowerCase();
      if (haystack.indexOf(query) === -1) return false;
    }

    if (subjects.length && subjects.indexOf(card.getAttribute('data-subject')) === -1) {
      return false;
    }

    return true;
  }

  function sortCards(visibleCards) {
    var sortValue = sortSelect ? sortSelect.value : 'az';
    return visibleCards.sort(function (a, b) {
      var codeA = a.getAttribute('data-code') || '';
      var codeB = b.getAttribute('data-code') || '';
      if (codeA === 'MATH 1029') return -1;
      if (codeB === 'MATH 1029') return 1;

      var titleA = (a.getAttribute('data-title') || '').toLowerCase();
      var titleB = (b.getAttribute('data-title') || '').toLowerCase();
      if (sortValue === 'za') return titleB.localeCompare(titleA);
      return titleA.localeCompare(titleB);
    });
  }

  function updateCatalog() {
    var visibleCards = cards.filter(cardMatches);
    sortCards(visibleCards);

    cards.forEach(function (card) {
      card.classList.add('is-hidden');
    });

    visibleCards.forEach(function (card) {
      card.classList.remove('is-hidden');
      grid.appendChild(card);
    });

    if (countEl) {
      countEl.textContent =
        visibleCards.length +
        (visibleCards.length === 1 ? ' course' : ' courses');
    }

    if (emptyState) {
      emptyState.classList.toggle('is-visible', visibleCards.length === 0);
    }
  }

  function clearFilters() {
    if (searchInput) searchInput.value = '';
    filterInputs.forEach(function (input) {
      input.checked = false;
    });
    if (sortSelect) sortSelect.value = 'az';
    updateCatalog();
  }

  function syncCartButtons() {
    if (!window.LsuCeCart) return;

    catalog.querySelectorAll('[data-add-to-cart]').forEach(function (button) {
      var courseId = button.getAttribute('data-course-id');
      if (courseId && window.LsuCeCart.has(courseId)) {
        window.LsuCeCart.markAdded(button);
      }
    });
  }

  filterInputs.forEach(function (input) {
    input.addEventListener('change', updateCatalog);
  });

  if (searchInput) {
    searchInput.addEventListener('input', updateCatalog);
  }

  if (sortSelect) {
    sortSelect.addEventListener('change', updateCatalog);
  }

  if (clearButton) {
    clearButton.addEventListener('click', clearFilters);
  }

  if (filtersToggle) {
    filtersToggle.addEventListener('click', function () {
      if (!isMobileFilters()) return;
      setFiltersOpen(filtersToggle.getAttribute('aria-expanded') !== 'true');
    });
  }

  if (mobileFiltersQuery.addEventListener) {
    mobileFiltersQuery.addEventListener('change', initFiltersCollapse);
  } else if (mobileFiltersQuery.addListener) {
    mobileFiltersQuery.addListener(initFiltersCollapse);
  }

  initFiltersCollapse();
  syncCartButtons();
  updateCatalog();
})();
