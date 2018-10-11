function eventShowSizing() {
  const description = document.querySelector('.event-show-description')
  const participation = document.querySelector('.event-show-participation')
  if (description) {
    description.style.height = participation.clientHeight + 'px'
  };
}

export { eventShowSizing };
