if (document.querySelector('.slider')) {
  const   infiniteSlider  = document.getElementById('infinite--slider')
  const   initialSlides   = getSlides();
  let     currentSlides   = getSlides();
  const   slidesContainer = document.querySelector('.slider');

  initialize();

  function initialize() {
    if (initialSlides.length > 1) {
      getSlides().reverse().forEach((slide, index) => {
        let newSlide = slide.cloneNode(true)
        if (index != 0) newSlide.classList.add('far-left');
        slidesContainer.prepend(newSlide);
        if (index <= initialSlides.length - 3) slide.classList.add('far-right');
      })
    }
    if (initialSlides.length == 2) {
      initialSlides.forEach((slide, index) => {
        let newSlide = slide.cloneNode(true)
        newSlide.classList.add('far-right');
        slidesContainer.appendChild(newSlide);
      })
    }
    if (initialSlides.length == 1) {
      document.querySelector('.slider--right').remove()
      document.querySelector('.slider--left') .remove()
    } else {
      document.querySelector('.slider--right').addEventListener('click', ()=>{next()})
      document.querySelector('.slider--left') .addEventListener('click', ()=>{previous()})
    }
    initialSlides[0].classList.add('active')
    currentSlides = getSlides();
    document.addEventListener('DOMContentLoaded', ()=>{slidesContainer.classList.add('initialized')})
  }

  function previous() {
    let slideToMove   = getSlides('last')
    let activeSlide   = document.querySelector('.slide.active')

    slideToMove.classList.replace('far-right', 'far-left')
    slidesContainer.prepend(slideToMove)

    activeSlide.classList.remove('active')

    activeSlide.previousSibling.classList.add('active');
    activeSlide.nextSibling.classList.add('far-right')
    document.querySelector('.slide.active').previousSibling.classList.remove('far-left');
  };

  function next() {
    let slideToMove = getSlides('first')
    let activeSlide = document.querySelector('.slide.active')

    slideToMove.classList.replace('far-left', 'far-right')
    slidesContainer.appendChild(slideToMove)

    activeSlide.classList.remove('active')

    activeSlide.nextSibling.classList.add('active')
    activeSlide.previousSibling.classList.add('far-left')
    document.querySelector('.slide.active').nextSibling.classList.remove('far-right')
  };

  function getSlides(index = null) {
    const slides =  Array.from(document.querySelectorAll('.slide'))
    if (index == 'first') {
      return slides[0]
    } else if (index == 'last') {
      return slides[slides.length - 1]
    } else {
      return slides
    }
  };

  let autoNext = setInterval(()=>{next()}, 3000);
  infiniteSlider.addEventListener('mouseenter', ()=>{ clearInterval(autoNext) });
  infiniteSlider.addEventListener('mouseleave', ()=>{ autoNext = setInterval(()=>{next()}, 3000) });
};
