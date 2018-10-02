import flatpickr from "flatpickr";
import { French } from "flatpickr/dist/l10n/fr.js"

flatpickr(".datepicker", {
  altinput: true,
  altFormat: "j F Y",
  dateFormat: "j F Y, h:i",
  enableTime: true,
  minDate: 'today',
  "locale": French
})
