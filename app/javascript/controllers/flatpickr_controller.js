import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

// Connects to data-controller="flatpickr"
export default class extends Controller {
  static target = ['startMonthInput', 'paymentDayInputTarget']

  connect() {
    flatpickr(this.startMonthInputTarget)
  }
}
