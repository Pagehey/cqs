function animateLogo() {
  const logoDiv = document.querySelector('.logo-home');
  const logoImg = document.querySelector('.logo');
  const navbar  = document.querySelector('.navbar-cqs');
  if (logoDiv) {
    document.addEventListener('scroll', (event)=>{
      if (window.scrollY > 0  && window.innerWidth > 767 ) {
        logoDiv.classList.remove('navbar-logo-down');
        logoImg.classList.remove('logo-big');
        navbar.classList.remove('navbar-cqs-centered');
      } else if (window.scrollY === 0) {
        logoDiv.classList.add('navbar-logo-down');
        logoImg.classList.add('logo-big');
        navbar.classList.add('navbar-cqs-centered');
      }
    })
  }
}

export { animateLogo };
