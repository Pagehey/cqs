function animateLogo() {
  const logoDiv = document.querySelector('.logo-home');
  const logoImg = document.querySelector('.logo');
  if (logoDiv) {
    document.addEventListener('scroll', (event)=>{
      if (window.scrollY > 0  && window.innerWidth > 767 && window.innerHeight > 699) {
        logoDiv.classList.remove('navbar-logo-down');
        logoImg.classList.remove('logo-big');
      } else if (window.scrollY === 0) {
        logoDiv.classList.add('navbar-logo-down');
        logoImg.classList.add('logo-big');
      }
    })
  }
}

export { animateLogo };
