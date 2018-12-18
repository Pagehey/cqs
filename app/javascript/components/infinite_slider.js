if (document.querySelector('.slider')) {
  // Get all the slides
  let slides = $('.slide');

  // Move the last slide before the first so the user is able to immediately go backwards
  slides.first().before(slides.last());

  $('.slider--control').on('click', function() {
    // Get all the slides again
    slides = $('.slide');
    // Register button
    let button = $(this);
    // Register active slide
    let activeSlide = $('.active');
    // Next function
    if (button.attr('id') == 'next') {
      // Move first slide to the end so the user can keep going forward
      slides.last().after(slides.first());
      // Move active class to the right
      activeSlide.removeClass('active').next('.slide').addClass('active');
    }

    // Previous function
    if (button.attr('id') == 'previous') {
      // Move the last slide before the first so the user can keep going backwards
      slides.first().before(slides.last());
      // Move active class to the left
      activeSlide.removeClass('active').prev('.slide').addClass('active');
    }
  });

  let autoSlide = setInterval(()=>{$('.slider--control.slider--right').click()}, 5000)

  $('#infinite--slider').hover(
    ()=>{ clearInterval(autoSlide) },
    ()=>{
      autoSlide = setInterval(()=>{$('.slider--control.slider--right').click()}, 5000)
    })
}

