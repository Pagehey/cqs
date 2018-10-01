// Le JS ici donne la même hauteur aux deux colonnes bootstrap sur la page
// d'adminsitration pour que la position sitcky soit fonctionnelle
function adminStickyBehavior() {
  if (window.location.pathname === '/admin/events') {
    const adminEvents         = document.querySelector('.admin-events');
    const adminParticipations = document.querySelector('.participations');
    adminParticipations.style.height = adminEvents.clientHeight + 'px';
  };
}

export { adminStickyBehavior };
