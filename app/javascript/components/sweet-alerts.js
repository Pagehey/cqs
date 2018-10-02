import swal from 'sweetalert2';

// window est un objet fourni par JS qui represente le browser. On peut donc lui
// assigner des clés (ici, le constructeur swal)
window.sweetAlert = swal

function deleteEventAlert() {
  const swalWithBootstrapButtons = swal.mixin({
    confirmButtonClass: 'btn btn-success',
    cancelButtonClass: 'btn btn-danger',
    buttonsStyling: false,
  })
  const swalWithoutButtons = swal.mixin({
    confirmButtonClass: 'hidden',
    cancelButtonClass: 'hidden',
    buttonsStyling: false,
  })
  swalWithBootstrapButtons({
    title: 'Êtes-vous sûr ?',
    text: "L'événement sera définitivement supprimé !",
    type: 'warning',
    showCancelButton: true,
    confirmButtonText: "Supprimer l'événement",
    cancelButtonText: 'Annuler'
  }).then((result) => {
    if (result.value) {
      swalWithoutButtons(
        'Suppression ...',
        "",
        'success'
      );
      setTimeout(()=>{document.getElementById('btn-delete').click()}, 1500)
    } else if (
      // Read more about handling dismissals
      result.dismiss === swal.DismissReason.cancel
    ) {
      swalWithBootstrapButtons(
        'Annulé',
        "L'événement n'a pas été supprimé.",
        'error'
      )
    }
  })
}

function bindSweetAlertButton() {
  const swalButton = document.getElementById('btn-delete-alert');
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', () => {
      deleteEventAlert();
    });
  }
}

export { bindSweetAlertButton };
