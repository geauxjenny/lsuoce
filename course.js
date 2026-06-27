(function () {
  /* Course-specific in-page anchor scroll (certificate.js handles shared header/nav) */
  const nav = document.querySelector('.cert-nav');

  function getScrollOffset() {
    const navHeight = nav ? nav.offsetHeight : 0;
    return navHeight + 8;
  }

  function scrollToSection(target) {
    const top = target.getBoundingClientRect().top + window.scrollY - getScrollOffset();
    window.scrollTo({ top: top, behavior: 'smooth' });
  }

  ['#register', '#description', '#preview'].forEach(function (selector) {
    document.querySelectorAll('a[href="' + selector + '"]').forEach(function (link) {
      if (link.classList.contains('cert-nav__link')) return;

      link.addEventListener('click', function (event) {
        const target = document.querySelector(selector);
        if (!target) return;
        event.preventDefault();
        scrollToSection(target);
      });
    });
  });

  /* Course preview carousel */
  const previewCarousel = document.querySelector('[data-course-preview-carousel]');

  if (previewCarousel) {
    const track = previewCarousel.querySelector('[data-course-preview-track]');
    const prevBtn = previewCarousel.querySelector('[data-course-preview-prev]');
    const nextBtn = previewCarousel.querySelector('[data-course-preview-next]');
    const dotsContainer = document.querySelector('[data-course-preview-dots]');
    const viewport = previewCarousel.querySelector('[data-course-preview-viewport]');
    const slides = track ? Array.from(track.querySelectorAll('.course-preview__slide')) : [];
    const isTextCarousel = previewCarousel.hasAttribute('data-course-preview-text');
    const slideNoun = isTextCarousel ? 'Slide' : 'Screenshot';
    let currentIndex = 0;
    let dots = [];

    function buildDots() {
      if (!dotsContainer || !slides.length) return;

      dotsContainer.innerHTML = '';
      dots = slides.map(function (slide, index) {
        const dot = document.createElement('button');
        dot.type = 'button';
        dot.className = 'course-preview__dot';
        dot.setAttribute('role', 'tab');
        const slideLabel = slide.getAttribute('aria-label') || (slideNoun + ' ' + (index + 1));
        dot.setAttribute('aria-label', slideLabel + ' (' + (index + 1) + ' of ' + slides.length + ')');
        dot.addEventListener('click', function () {
          currentIndex = index;
          updateCarousel();
        });
        dotsContainer.appendChild(dot);
        return dot;
      });
    }

    function updateCarousel() {
      if (!track || !slides.length) return;

      track.style.transform = 'translateX(-' + (currentIndex * 100) + '%)';

      if (prevBtn) prevBtn.disabled = currentIndex === 0;
      if (nextBtn) nextBtn.disabled = currentIndex === slides.length - 1;

      dots.forEach(function (dot, index) {
        const isActive = index === currentIndex;
        dot.classList.toggle('is-active', isActive);
        dot.setAttribute('aria-selected', isActive ? 'true' : 'false');
      });
    }

    if (prevBtn) {
      prevBtn.addEventListener('click', function () {
        if (currentIndex === 0) return;
        currentIndex -= 1;
        updateCarousel();
      });
    }

    if (nextBtn) {
      nextBtn.addEventListener('click', function () {
        if (currentIndex >= slides.length - 1) return;
        currentIndex += 1;
        updateCarousel();
      });
    }

    if (viewport) {
      viewport.addEventListener('keydown', function (event) {
        if (event.key === 'ArrowLeft' && currentIndex > 0) {
          event.preventDefault();
          currentIndex -= 1;
          updateCarousel();
        }

        if (event.key === 'ArrowRight' && currentIndex < slides.length - 1) {
          event.preventDefault();
          currentIndex += 1;
          updateCarousel();
        }
      });
    }

    buildDots();
    updateCarousel();
  }

  if (window.LsuCeCart) {
    document.querySelectorAll('[data-add-to-cart]').forEach(function (button) {
      var courseId = button.getAttribute('data-course-id');
      if (courseId && window.LsuCeCart.has(courseId)) {
        window.LsuCeCart.markAdded(button);
      }
    });
  }
})();
