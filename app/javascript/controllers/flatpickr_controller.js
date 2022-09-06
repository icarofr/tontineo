import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"

// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = ['paymentDayInput']

  connect() {
    console.log('hi from flatpickr');
    console.log(this.paymentDayInputTarget);
    flatpickr(this.paymentDayInputTarget)
  }
}
