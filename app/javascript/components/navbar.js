const initUpdateNavbarOnScroll = () => {
  const logo = document.querySelector('.logo');
  const navbar = document.querySelector('.navbar-lewagon');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY <= 0) {
        navbar.classList.add('navbar-white');
      } else {
        navbar.classList.remove('navbar-white')
      };
      if (window.scrollY >= window.innerHeight/2) {
        logo.classList.add('collapse');
      } else {
        logo.classList.remove('collapse');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
