import "bootstrap";
import "../plugins/flatpickr";
// import "../components/infinite_slider"; //no more used
import "../components/alert";
import { adminStickyBehavior } from "../components/admin-sticky-behavior";
import { bindSweetAlertButton } from '../components/sweet-alerts';
import { animateLogo } from '../components/animate-logo';

adminStickyBehavior();
bindSweetAlertButton();
animateLogo();
