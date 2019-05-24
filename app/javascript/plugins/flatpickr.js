import flatpickr from "flatpickr";
import { French } from "flatpickr/dist/l10n/fr.js"

flatpickr(".datepicker", {
  altInput: true,
  altFormat: "j F Y - H\\Hi",
  enableTime: true,
  minDate: 'today',
  time_24hr: true,
  "locale": French
})
