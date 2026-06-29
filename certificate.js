(function () {
  const siteHeader = document.querySelector('.cert-site-header');
  const browsePanel = document.querySelector('#cert-browse-panel');
  const browseToggles = document.querySelectorAll('[data-browse-toggle]');
  const browseButton = document.querySelector('.cert-site-header__browse');
  const nav = document.querySelector('.cert-nav');
  const navLinks = document.querySelectorAll('.cert-nav__link');
  const enrollBarLinks = document.querySelectorAll('.cert-enroll-bar__link');

  function positionBrowsePanel() {
    if (!browsePanel || !siteHeader) return;

    if (!window.matchMedia('(min-width: 768px)').matches || !browseButton) {
      browsePanel.style.left = '';
      browsePanel.style.width = '';
      return;
    }

    const bar = siteHeader.querySelector('.cert-site-header__bar');
    const inlineEnd = bar
      ? parseFloat(getComputedStyle(bar).paddingRight) || 0
      : 0;
    const headerRect = siteHeader.getBoundingClientRect();
    const browseRect = browseButton.getBoundingClientRect();
    const left = browseRect.left - headerRect.left;
    const width = Math.min(680, window.innerWidth - browseRect.left - inlineEnd);

    browsePanel.style.left = left + 'px';
    browsePanel.style.width = Math.max(width, 280) + 'px';
  }

  function setSiteHeaderHeight() {
    if (!siteHeader) return;
    const bar = siteHeader.querySelector('.cert-site-header__bar');
    const height = bar ? bar.offsetHeight : siteHeader.offsetHeight;
    document.documentElement.style.setProperty(
      '--cert-site-header-height',
      height + 'px'
    );
  }

  function setStickyOffsets() {
    setSiteHeaderHeight();
    const navHeight = nav ? nav.offsetHeight : 0;
    document.documentElement.style.setProperty('--cert-nav-height', navHeight + 'px');
    document.documentElement.style.setProperty(
      '--cert-sticky-top',
      (navHeight + 16) + 'px'
    );
  }

  function isBrowseOpen() {
    return siteHeader && siteHeader.classList.contains('is-browse-open');
  }

  function setBrowseOpen(open) {
    if (!siteHeader || !browsePanel) return;

    siteHeader.classList.toggle('is-browse-open', open);
    browsePanel.hidden = !open;
    browseToggles.forEach(function (toggle) {
      toggle.setAttribute('aria-expanded', open ? 'true' : 'false');
    });

    if (open) {
      window.setTimeout(function () {
        positionBrowsePanel();
        setStickyOffsets();
      }, 0);
    } else {
      browsePanel.style.left = '';
      browsePanel.style.width = '';
      setStickyOffsets();
    }
  }

  function closeBrowsePanel() {
    if (isBrowseOpen()) setBrowseOpen(false);
  }

  if (siteHeader && browsePanel && browseToggles.length) {
    browseToggles.forEach(function (toggle) {
      toggle.addEventListener('click', function () {
        setBrowseOpen(!isBrowseOpen());
      });
    });

    document.addEventListener('click', function (event) {
      if (!isBrowseOpen()) return;
      if (siteHeader.contains(event.target)) return;
      closeBrowsePanel();
    });

    document.addEventListener('keydown', function (event) {
      if (event.key === 'Escape') closeBrowsePanel();
    });

    browsePanel.querySelectorAll('a[href^="#"]').forEach(function (link) {
      link.addEventListener('click', closeBrowsePanel);
    });
  }

  window.addEventListener('resize', function () {
    positionBrowsePanel();
    setStickyOffsets();
  });
  positionBrowsePanel();
  setStickyOffsets();

  /* Top CTA bar — show after scrolling past quick facts */
  const factsBar = document.querySelector('.cert-facts');
  const topEnrollBar = document.querySelector('.cert-enroll-bar--top');

  if (factsBar && topEnrollBar) {
    const factsObserver = new IntersectionObserver(
      function (entries) {
        entries.forEach(function (entry) {
          const pastFacts = !entry.isIntersecting && entry.boundingClientRect.top < 0;
          topEnrollBar.classList.toggle('is-visible', pastFacts);
          topEnrollBar.setAttribute('aria-hidden', pastFacts ? 'false' : 'true');
        });
      },
      { threshold: 0 }
    );

    factsObserver.observe(factsBar);
  }

  const anchorLinks = Array.from(navLinks).concat(Array.from(enrollBarLinks));
  const sections = Array.from(
    new Set(
      anchorLinks
        .map(function (link) {
          const id = link.getAttribute('href');
          if (!id || id.charAt(0) !== '#') return null;
          return document.querySelector(id);
        })
        .filter(Boolean)
    )
  );

  function setActiveAnchorLink(id) {
    const href = '#' + id;
    anchorLinks.forEach(function (link) {
      link.classList.toggle('is-active', link.getAttribute('href') === href);
    });
  }

  /* Sticky nav shadow */
  window.addEventListener('scroll', function () {
    if (!nav) return;
    nav.classList.toggle('is-scrolled', window.scrollY > 10);
  }, { passive: true });

  /* Active section highlighting */
  if (sections.length && anchorLinks.length) {
    const observer = new IntersectionObserver(
      function (entries) {
        entries.forEach(function (entry) {
          if (!entry.isIntersecting) return;
          setActiveAnchorLink(entry.target.id);
        });
      },
      { rootMargin: '-40% 0px -50% 0px', threshold: 0 }
    );

    sections.forEach(function (section) {
      observer.observe(section);
    });
  }

  function getScrollOffset() {
    const navHeight = nav ? nav.offsetHeight : 0;
    if (navHeight) return navHeight + 8;

    if (topEnrollBar && topEnrollBar.classList.contains('is-visible')) {
      return topEnrollBar.offsetHeight + 8;
    }

    return 8;
  }

  function scrollToSection(target) {
    const top = target.getBoundingClientRect().top + window.scrollY - getScrollOffset();
    window.scrollTo({ top: top, behavior: 'smooth' });
  }

  /* Smooth scroll offset for sticky nav */
  anchorLinks.forEach(function (link) {
    link.addEventListener('click', function (event) {
      const href = link.getAttribute('href');
      if (!href || href.charAt(0) !== '#') return;
      const target = document.querySelector(href);
      if (!target) return;
      event.preventDefault();
      scrollToSection(target);
    });
  });

  ['#request-info', '#cohorts'].forEach(function (selector) {
    document.querySelectorAll('a[href="' + selector + '"]').forEach(function (link) {
      if (link.classList.contains('cert-nav__link') || link.classList.contains('cert-enroll-bar__link')) return;

      link.addEventListener('click', function (event) {
        const target = document.querySelector(selector);
        if (!target) return;
        event.preventDefault();
        scrollToSection(target);
      });
    });
  });

  /* Syllabus download modal */
  const syllabusModal = document.querySelector('#syllabus-modal');
  const syllabusModalDialog = syllabusModal && syllabusModal.querySelector('.cert-modal__dialog');
  const syllabusOpeners = document.querySelectorAll('[data-syllabus-modal-open]');
  const syllabusClosers = syllabusModal && syllabusModal.querySelectorAll('[data-syllabus-modal-close]');
  const syllabusForm = syllabusModal && syllabusModal.querySelector('.cert-syllabus-modal__form');
  let syllabusModalTrigger = null;

  function getSyllabusModalFocusables() {
    if (!syllabusModalDialog) return [];
    return Array.from(
      syllabusModalDialog.querySelectorAll(
        'button:not([disabled]), [href], input:not([disabled]), select:not([disabled]), textarea:not([disabled]), [tabindex]:not([tabindex="-1"])'
      )
    ).filter(function (el) {
      return el.offsetParent !== null || el === syllabusModalDialog.querySelector('.cert-modal__close');
    });
  }

  function openSyllabusModal(trigger) {
    if (!syllabusModal) return;
    syllabusModalTrigger = trigger || null;
    syllabusModal.hidden = false;
    document.body.classList.add('cert-modal-open');
    window.setTimeout(function () {
      const firstInput = syllabusModal.querySelector('input:not([type="checkbox"])');
      if (firstInput) firstInput.focus();
    }, 50);
  }

  function closeSyllabusModal() {
    if (!syllabusModal) return;
    syllabusModal.hidden = true;
    document.body.classList.remove('cert-modal-open');
    if (syllabusModalTrigger) syllabusModalTrigger.focus();
    syllabusModalTrigger = null;
  }

  syllabusOpeners.forEach(function (button) {
    button.addEventListener('click', function () {
      openSyllabusModal(button);
    });
  });

  if (syllabusClosers) {
    syllabusClosers.forEach(function (el) {
      el.addEventListener('click', closeSyllabusModal);
    });
  }

  document.addEventListener('keydown', function (event) {
    if (!syllabusModal || syllabusModal.hidden) return;

    if (event.key === 'Escape') {
      closeSyllabusModal();
      return;
    }

    if (event.key !== 'Tab' || !syllabusModalDialog) return;

    const focusables = getSyllabusModalFocusables();
    if (!focusables.length) return;

    const first = focusables[0];
    const last = focusables[focusables.length - 1];

    if (event.shiftKey && document.activeElement === first) {
      event.preventDefault();
      last.focus();
    } else if (!event.shiftKey && document.activeElement === last) {
      event.preventDefault();
      first.focus();
    }
  });

  /* Static forms — prevent submission in prototype */
  const rfiForm = document.querySelector('.cert-form');
  if (rfiForm) {
    rfiForm.addEventListener('submit', function (event) {
      event.preventDefault();
      alert('This is a static prototype. Form submission is not connected.');
    });
  }

  if (syllabusForm) {
    syllabusForm.addEventListener('submit', function (event) {
      event.preventDefault();
      alert('This is a static prototype. The syllabus download is not connected.');
      closeSyllabusModal();
    });
  }

  /* Admissions countdown */
  const countdowns = document.querySelectorAll('[data-countdown-deadline]');

  function padTwo(value) {
    return String(value).padStart(2, '0');
  }

  function initCountdown(root) {
    const deadlineStr = root.getAttribute('data-countdown-deadline');
    if (!deadlineStr) return;

    const deadline = new Date(deadlineStr);
    if (Number.isNaN(deadline.getTime())) return;

    const parts = {
      days: root.querySelector('[data-countdown-part="days"]'),
      hours: root.querySelector('[data-countdown-part="hours"]'),
      minutes: root.querySelector('[data-countdown-part="minutes"]'),
      seconds: root.querySelector('[data-countdown-part="seconds"]'),
    };
    const units = root.querySelector('.cert-countdown__units');
    const ended = root.querySelector('.cert-countdown__ended');
    function showEnded() {
      root.classList.add('is-ended');
      if (units) units.hidden = true;
      if (ended) ended.hidden = false;
      root.setAttribute('aria-label', 'Application period has ended');
    }

    function tick() {
      const remaining = deadline.getTime() - Date.now();

      if (remaining <= 0) {
        showEnded();
        return false;
      }

      const totalSeconds = Math.floor(remaining / 1000);
      const days = Math.floor(totalSeconds / 86400);
      const hours = Math.floor((totalSeconds % 86400) / 3600);
      const minutes = Math.floor((totalSeconds % 3600) / 60);
      const seconds = totalSeconds % 60;

      if (parts.days) parts.days.textContent = String(days);
      if (parts.hours) parts.hours.textContent = padTwo(hours);
      if (parts.minutes) parts.minutes.textContent = padTwo(minutes);
      if (parts.seconds) parts.seconds.textContent = padTwo(seconds);

      root.setAttribute(
        'aria-label',
        days + ' days, ' + hours + ' hours, ' + minutes + ' minutes, and ' + seconds + ' seconds until applications close'
      );
      return true;
    }

    if (!tick()) return;

    const intervalId = window.setInterval(function () {
      if (!tick()) window.clearInterval(intervalId);
    }, 1000);
  }

  countdowns.forEach(initCountdown);

  /* Testimonials slider (matches CE home page) */
  const testimonialsSlider = document.getElementById('testimonialsSlider');
  const tPrevBtn = document.querySelector('.testimonials-slider-btn-prev');
  const tNextBtn = document.querySelector('.testimonials-slider-btn-next');
  const tControls = document.querySelector('.testimonials-slider-controls');

  if (testimonialsSlider && tPrevBtn && tNextBtn && tControls) {
    let tScrollPosition = 0;

    function tCheckOverflow() {
      const hasOverflow = testimonialsSlider.scrollWidth > testimonialsSlider.clientWidth;
      tControls.classList.toggle('visible', hasOverflow);
    }

    function tUpdateButtons() {
      const maxScroll = testimonialsSlider.scrollWidth - testimonialsSlider.clientWidth;
      const isAtStart = tScrollPosition <= 0;
      const isAtEnd = tScrollPosition >= maxScroll - 1;

      tPrevBtn.disabled = isAtStart;
      tNextBtn.disabled = isAtEnd;

      const prevImg = tPrevBtn.querySelector('img');
      if (prevImg) {
        prevImg.src = isAtStart
          ? 'images/prev-inactive.svg'
          : 'images/prev-active-dark-bg.svg';
      }

      const nextImg = tNextBtn.querySelector('img');
      if (nextImg) {
        nextImg.src = isAtEnd
          ? 'images/next-inactive.svg'
          : 'images/next-active-dark-bg.svg';
      }
    }

    tPrevBtn.addEventListener('click', function () {
      const cardWidth = testimonialsSlider.querySelector('.testimonial')?.offsetWidth || 320;
      tScrollPosition = Math.max(0, tScrollPosition - (cardWidth + 24));
      testimonialsSlider.scrollTo({
        left: tScrollPosition,
        behavior: 'smooth',
      });
      window.setTimeout(tUpdateButtons, 300);
    });

    tNextBtn.addEventListener('click', function () {
      const cardWidth = testimonialsSlider.querySelector('.testimonial')?.offsetWidth || 320;
      tScrollPosition = Math.min(
        testimonialsSlider.scrollWidth - testimonialsSlider.clientWidth,
        tScrollPosition + (cardWidth + 24)
      );
      testimonialsSlider.scrollTo({
        left: tScrollPosition,
        behavior: 'smooth',
      });
      window.setTimeout(tUpdateButtons, 300);
    });

    testimonialsSlider.addEventListener('scroll', function () {
      tScrollPosition = testimonialsSlider.scrollLeft;
      tUpdateButtons();
    });

    window.addEventListener('resize', function () {
      tUpdateButtons();
      tCheckOverflow();
    });

    window.setTimeout(function () {
      tCheckOverflow();
      tUpdateButtons();
    }, 100);
  }
})();
