import "bootstrap";
import "../plugins/flatpickr";
import "../components/infinite_slider";
import "../components/alert";
import { adminStickyBehavior } from "../components/admin-sticky-behavior";
import { bindSweetAlertButton } from '../components/sweet-alerts';
import { eventShowSizing } from '../components/event-show-sizing';
import { animateLogo } from '../components/animate-logo';

adminStickyBehavior();
bindSweetAlertButton();
animateLogo();
// eventShowSizing();
