import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["A last gift", "For your dead friend !"],
    typeSpeed: 80,
    loop: true
  });
}

export { loadDynamicBannerText };
