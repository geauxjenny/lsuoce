(function () {
  const form = document.getElementById('paralegal-application');
  if (!form) return;

  const panels = Array.from(form.querySelectorAll('[data-app-panel]'));
  const startBtn = document.getElementById('app-start');
  const backBtn = document.getElementById('app-back');
  const nextBtn = document.getElementById('app-next');
  const payBtn = document.getElementById('app-pay');
  const shell = document.querySelector('.cert-app-shell');
  const progressItems = Array.from(document.querySelectorAll('[data-app-progress]'));
  const progressAside = document.querySelector('.cert-app-progress');
  const progressBar = document.querySelector('[data-app-progress-bar]');
  const progressPercent = document.querySelector('[data-app-progress-percent]');
  const progressBarTrack = document.querySelector('.cert-app-progress__bar');
  const cohortAside = document.querySelector('.cert-app-workspace__aside');
  const workspace = document.getElementById('cert-app-workspace');
  const overviewFacts = document.getElementById('app-overview-facts');
  const stepNav = document.querySelector('[data-app-nav]');

  const TOTAL_STEPS = 6;
  let currentStep = 0;

  function showPanel(step) {
    currentStep = step;

    panels.forEach(function (panel) {
      const panelStep = Number(panel.getAttribute('data-app-panel'));
      panel.classList.toggle('is-active', panelStep === step);
      panel.hidden = panelStep !== step;
    });

    if (shell) shell.hidden = step === 0;

    if (overviewFacts) overviewFacts.hidden = step !== 0;

    if (progressAside) progressAside.hidden = step === 7;
    if (workspace) workspace.classList.toggle('cert-app-workspace--overview', step === 0);
    if (cohortAside) cohortAside.hidden = step === 0 || step === 7;

    if (step === 7) {
      if (backBtn) backBtn.hidden = true;
      if (nextBtn) nextBtn.hidden = true;
      if (payBtn) payBtn.hidden = true;
      if (stepNav) stepNav.hidden = true;
    } else {
      if (backBtn) backBtn.hidden = step < 1;
      if (nextBtn) nextBtn.hidden = step === 6 || step === 0;
      if (payBtn) payBtn.hidden = step !== 6;
      if (stepNav) stepNav.hidden = step === 0;
    }

    updateProgress(step);
    updateActionButtons();
    window.scrollTo({ top: 0, behavior: 'smooth' });
  }

  function updateProgress(step) {
    if (step === 0) {
      progressItems.forEach(function (item) {
        item.classList.remove('is-active', 'is-complete');
        item.setAttribute('aria-current', 'false');
      });

      if (progressBar) progressBar.style.width = '0%';
      if (progressPercent) progressPercent.textContent = '0';
      if (progressBarTrack) progressBarTrack.setAttribute('aria-valuenow', '0');
      return;
    }

    if (step < 1 || step > TOTAL_STEPS) return;

    const percent = Math.round((step / TOTAL_STEPS) * 100);

    progressItems.forEach(function (item, index) {
      const itemStep = index + 1;
      item.classList.toggle('is-active', itemStep === step);
      item.classList.toggle('is-complete', itemStep < step);
      item.setAttribute('aria-current', itemStep === step ? 'step' : 'false');
    });

    if (progressBar) progressBar.style.width = percent + '%';
    if (progressPercent) progressPercent.textContent = String(percent);
    if (progressBarTrack) progressBarTrack.setAttribute('aria-valuenow', String(percent));
  }

  function clearErrors(panel) {
    panel.querySelectorAll('.is-invalid').forEach(function (el) {
      el.classList.remove('is-invalid');
    });
    panel.querySelectorAll('.cert-form__error').forEach(function (el) {
      el.remove();
    });
  }

  function markInvalid(field, message) {
    const wrapper = field.closest('.cert-form__field') || field.closest('.cert-app-upload');
    if (!wrapper) return false;
    wrapper.classList.add('is-invalid');
    if (message && !wrapper.querySelector('.cert-form__error')) {
      const error = document.createElement('p');
      error.className = 'cert-form__error';
      error.textContent = message;
      wrapper.appendChild(error);
    }
    return false;
  }

  function getStepValidation(step, showErrors) {
    const panel = form.querySelector('[data-app-panel="' + step + '"]');
    if (!panel) return true;

    if (showErrors) clearErrors(panel);

    let valid = true;
    const checkedRadioGroups = new Set();

    panel.querySelectorAll('[required]').forEach(function (field) {
      let fieldValid = true;
      let message = '';

      if (field.type === 'file') {
        if (!field.files || !field.files.length) {
          fieldValid = false;
          message = 'Please upload a file to continue.';
        }
      } else if (field.type === 'radio') {
        if (checkedRadioGroups.has(field.name)) return;
        checkedRadioGroups.add(field.name);
        const group = panel.querySelectorAll('[name="' + field.name + '"]');
        const checked = Array.from(group).some(function (radio) {
          return radio.checked;
        });
        if (!checked) {
          fieldValid = false;
          message = 'Please select an option.';
        }
      } else if (field.type === 'checkbox') {
        if (!field.checked) {
          fieldValid = false;
          message = 'This confirmation is required.';
        }
      } else if (!field.value.trim()) {
        fieldValid = false;
        message = 'This field is required.';
      } else if (field.type === 'email' && !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(field.value)) {
        fieldValid = false;
        message = 'Enter a valid email address.';
      }

      if (!fieldValid) {
        valid = false;
        if (showErrors) markInvalid(field, message);
      }
    });

    return valid;
  }

  function isStepValid(step) {
    return getStepValidation(step, false);
  }

  function validateStep(step) {
    return getStepValidation(step, true);
  }

  function updateActionButtons() {
    if (currentStep < 1 || currentStep > TOTAL_STEPS) return;

    const stepIsValid = isStepValid(currentStep);

    if (nextBtn && !nextBtn.hidden) {
      nextBtn.disabled = !stepIsValid;
    }

    if (payBtn && !payBtn.hidden) {
      payBtn.disabled = !stepIsValid;
    }
  }

  function populateReview() {
    const data = new FormData(form);
    const map = {
      'review-name': [data.get('legal_name')],
      'review-email': [data.get('email')],
      'review-phone': [data.get('phone')],
      'review-address': [
        data.get('address_line1'),
        data.get('address_city') + ', ' + data.get('address_state') + ' ' + data.get('address_zip')
      ],
      'review-race': [data.get('race')],
      'review-ethnicity': [data.get('ethnicity')],
      'review-gender': [data.get('gender')],
      'review-va': [data.get('va_benefits') === 'yes' ? 'Yes' : 'No'],
      'review-employer': [data.get('employer') || 'Not provided'],
      'review-requirements': [data.get('meets_requirements') === 'yes' ? 'Yes' : 'No'],
      'review-exceptional': [data.get('exceptional_student') === 'yes' ? 'Yes' : 'No']
    };

    Object.keys(map).forEach(function (id) {
      const el = document.getElementById(id);
      if (el) {
        el.textContent = map[id].filter(Boolean).join('\n') || '—';
      }
    });

    const transcriptInput = form.querySelector('#transcript-upload');
    const statementInput = form.querySelector('#statement-upload');
    const filesList = document.getElementById('review-files');

    if (filesList) {
      filesList.innerHTML = '';
      [
        { input: transcriptInput, label: 'Official transcript' },
        { input: statementInput, label: 'Letter of intent' }
      ].forEach(function (item) {
        if (item.input && item.input.files && item.input.files[0]) {
          const li = document.createElement('li');
          li.textContent = item.label + ': ' + item.input.files[0].name;
          filesList.appendChild(li);
        }
      });
    }
  }

  function bindFileUploads() {
    form.querySelectorAll('.cert-app-upload').forEach(function (upload) {
      const input = upload.querySelector('input[type="file"]');
      const zone = upload.querySelector('.cert-app-upload__zone');
      const filename = upload.querySelector('.cert-app-upload__filename');
      const prompt = upload.querySelector('.cert-app-upload__prompt');

      if (!input || !zone) return;

      function updateFileDisplay() {
        const file = input.files && input.files[0];
        if (file) {
          zone.classList.add('has-file');
          if (filename) {
            filename.textContent = file.name;
            filename.hidden = false;
          }
          if (prompt) prompt.hidden = true;
        } else {
          zone.classList.remove('has-file');
          if (filename) filename.hidden = true;
          if (prompt) prompt.hidden = false;
        }
        updateActionButtons();
      }

      input.addEventListener('change', updateFileDisplay);

      zone.addEventListener('dragover', function (event) {
        event.preventDefault();
        zone.classList.add('is-dragover');
      });

      zone.addEventListener('dragleave', function () {
        zone.classList.remove('is-dragover');
      });

      zone.addEventListener('drop', function (event) {
        event.preventDefault();
        zone.classList.remove('is-dragover');
        if (event.dataTransfer.files.length) {
          input.files = event.dataTransfer.files;
          updateFileDisplay();
        }
      });
    });
  }

  function bindReviewEdits() {
    form.querySelectorAll('[data-app-goto]').forEach(function (link) {
      link.addEventListener('click', function (event) {
        event.preventDefault();
        showPanel(Number(link.getAttribute('data-app-goto')));
      });
    });
  }

  if (startBtn) {
    startBtn.addEventListener('click', function () {
      showPanel(1);
    });
  }

  if (backBtn) {
    backBtn.addEventListener('click', function () {
      if (currentStep > 1) showPanel(currentStep - 1);
      else showPanel(0);
    });
  }

  if (nextBtn) {
    nextBtn.addEventListener('click', function () {
      if (!validateStep(currentStep)) return;

      if (currentStep === 5) populateReview();

      if (currentStep < 6) showPanel(currentStep + 1);
    });
  }

  if (payBtn) {
    payBtn.addEventListener('click', function () {
      if (!validateStep(6)) return;

      payBtn.disabled = true;
      payBtn.textContent = 'Processing…';

      window.setTimeout(function () {
        showPanel(7);
        payBtn.disabled = false;
        payBtn.textContent = 'Pay $40 and submit';
      }, 1200);
    });
  }

  form.addEventListener('input', updateActionButtons);
  form.addEventListener('change', updateActionButtons);

  form.addEventListener('submit', function (event) {
    event.preventDefault();
  });

  bindFileUploads();
  bindReviewEdits();
  showPanel(0);
})();
