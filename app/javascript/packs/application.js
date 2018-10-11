import "bootstrap";
import "../plugins/flatpickr";
import { slideAlert } from "../components/alert";
import { adminStickyBehavior } from "../components/admin-sticky-behavior";
import { bindSweetAlertButton } from '../components/sweet-alerts';
import { eventShowSizing } from '../components/event-show-sizing';

slideAlert();
adminStickyBehavior();
bindSweetAlertButton();
// eventShowSizing();
