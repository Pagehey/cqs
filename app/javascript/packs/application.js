import "bootstrap";
import "../plugins/flatpickr";
import "../plugins/custom_functions";
import "../components/agenda_slider";
import "../components/alert";
import { adminStickyBehavior } from "../components/admin-sticky-behavior";
import { bindSweetAlertButton } from '../components/sweet-alerts';
import { eventShowSizing } from '../components/event-show-sizing';
import { animateLogo } from '../components/animate-logo';

adminStickyBehavior();
bindSweetAlertButton();
animateLogo();
// eventShowSizing();
