import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"
import { French } from "flatpickr/dist/l10n/fr.js"
import monthSelectPlugin from "flatpickr/dist/plugins/monthSelect";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = ['monthPickr']

  connect() {
    flatpickr(this.monthPickrTarget, {
      disableMobile: true,
      altInput: true,
      altFormat: 'm/y',
      locale: French,
      plugins: [
        new monthSelectPlugin({
          shorthand: true, //defaults to false
          dateFormat: "y/m", //defaults to "F Y"
          // altFormat: "m/Y", //defaults to "F Y"
        })
      ]
    })
    // flatpickr(this.datePickrTarget, {
    //   disableMobile: true,
    //   altInput: true,
    //   locale: French
    // })
  }
}
