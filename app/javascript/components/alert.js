function slideAlert() {
  document.addEventListener('DOMContentLoaded', (event) =>{
    const alert = document.querySelector('.side-alert');

    if (alert) {
      setTimeout(()=>{
        alert.classList.add('alert-slide');
      }, 500);
    }
  });
}

export { slideAlert };
