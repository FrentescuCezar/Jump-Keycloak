(() => {
  const form = document.querySelector('#kc-form-login');
  if (!form) return;

  const submit = form.querySelector('input[type="submit"]');
  form.addEventListener('submit', () => {
    if (submit) {
      submit.dataset.loading = 'true';
      submit.style.opacity = '0.6';
    }
  });

  const rememberLabel = document.querySelector('[data-remember-copy]');
  if (rememberLabel) {
    const now = new Date();
    rememberLabel.textContent = `${rememberLabel.textContent} · ${now.toLocaleDateString(undefined, {
      weekday: 'short',
      month: 'short',
      day: 'numeric'
    })}`;
  }
})();
