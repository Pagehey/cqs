import "bootstrap";
import "../plugins/flatpickr";
import { slideAlert } from "../components/alert";
import { adminStickyBehavior } from "../components/admin-sticky-behavior";
import { bindSweetAlertButton } from '../components/sweet-alerts';

slideAlert();
adminStickyBehavior();
bindSweetAlertButton();
