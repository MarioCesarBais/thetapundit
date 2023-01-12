// app/javascript/components/banner.js
import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Mude o tom de sua vida:", "DNA: Básico e Avançado, Digging, Constelação Familiar"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
