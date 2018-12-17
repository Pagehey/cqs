if (document.getElementById('agenda-slider')) {
  const slider             = document.querySelector('.cqs--slider')
  const sliderItems        = document.querySelectorAll('.slider--item')
  const sliderControlLeft  = document.querySelector('.slider--control.slider--left')
  const sliderControlRight = document.querySelector('.slider--control.slider--right')

  let   sliderIndex        = 1

  moveSlider()
  activateControls(sliderControlLeft, sliderControlRight)

  console.log(slider)
  console.log(sliderItems)


  function moveSlider() {
    sliderItems.forEach((item, index)=>{
      if(index == sliderIndex - 1) {
        item.style.left = '-100%'
      } else if (index == sliderIndex) {
        item.style.left = '0%'
      } else if (index == sliderIndex + 1) {
        item.style.left = '100%'
      } else if (index == sliderIndex + 2) {
        item.style.left = '200%'
      }
    })
  }

  function activateControls(left, right) {
    left.addEventListener('click', event => {
      sliderIndex--
      moveSlider()
    })
    right.addEventListener('click', event => {
      sliderIndex++
      moveSlider()
    })
  }
}

