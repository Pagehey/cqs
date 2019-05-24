import flatpickr from "flatpickr";
import { French } from "flatpickr/dist/l10n/fr.js"

flatpickr(".datepicker", {
  altinput: true,
  altFormat: "j F Y",
  dateFormat: "j F Y - h\Hi",
  enableTime: true,
  minDate: 'today',
  time_24hr: true,
  "locale": French
})
