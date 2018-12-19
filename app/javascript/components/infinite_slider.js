if (document.querySelector('.slider')) {
  let   slides          = getSlides();
  const slidesNumber    = slides.length;
  const slidesContainer = document.querySelector('.slider');

  // if (slidesNumber > 2) { slides[2].classList.add('before-last-right') };

  // let lastSlide       = slides[slidesNumber - 1].cloneNode(true);
  // let beforeLastSlide = slides[slidesNumber - 2].cloneNode(true);

  // [lastSlide, beforeLastSlide].forEach(slide => {
  //   slide.classList.remove('before-last-right')
  // });

  // beforeLastSlide.classList.add('before-last-left');

  // slidesContainer.prepend(lastSlide);
  // slidesContainer.prepend(beforeLastSlide);

  let slidesArray = Array.from(slides);

  slidesArray.reverse().forEach((slide, index) => {
    let newSlide = slide.cloneNode(true);
    newSlide.classList.remove('active');
    console.log(newSlide)
    slidesContainer.prepend(newSlide);
  })

  getSlides()[0].classList.add('before-last-left')
  getSlides()[getSlides().length -1].classList.add('before-last-right')

  function previous() {
    let currentSlides = getSlides()
    let slideToMove   = currentSlides[currentSlides.length - 1].cloneNode(true)
    let activeSlide   = document.querySelector('.slide.active')

    slideToMove.classList.remove('before-last-right')
    slideToMove.classList.add('before-last-left')
    slidesContainer.prepend(slideToMove)

    currentSlides[currentSlides.length - 1].remove()
    getSlides()[getSlides().length - 1].classList.add('before-last-right')
    getSlides()[1].classList.remove('before-last-left')

    activeSlide.classList.remove('active')
    activeSlide.nextSibling.classList.remove('right-sibling')
    activeSlide.classList.add('right-sibling')

    activeSlide.previousSibling.classList.add('active')
  };

  function next() {
    let currentSlides = getSlides()
    let slideToMove = currentSlides[0].cloneNode(true)
    let activeSlide = document.querySelector('.slide.active')

    slideToMove.classList.remove('before-last-left')
    slideToMove.classList.add('before-last-right')
    slidesContainer.appendChild(slideToMove)

    currentSlides[0].remove()
    currentSlides[0].classList.add('before-last-left')

    activeSlide.classList.remove('active')

    activeSlide.nextSibling.classList.add('active')
    activeSlide.nextSibling.nextSibling.classList.remove('before-last-right')
  };

  function getSlides() {
    return document.querySelectorAll('.slide')
  };

  setInterval(()=> { previous() }, 2000);
  // setTimeout(()=> { previous() }, 2000);
  // setInterval(()=> { next() }, 2000);
};
