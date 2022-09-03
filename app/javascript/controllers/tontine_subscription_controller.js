  import { Controller } from "@hotwired/stimulus"
import {createConsumer } from "@rails/actioncable"

// Connects to data-controller="tontine-subscription"
export default class extends Controller {
  static values = { tontineId: Number}
  static targets = ["messages"]
  
  connect() {
       this.channel = createConsumer().subscriptions.create(
      { channel: "TontineChannel", id: this.tontineIdValue },
      { received: data => this.messagesTarget.insertAdjacentHTML("beforeend", data) }
    )
    console.log(`Subscribed to the tontine with the id ${this.tontineIdValue}.`)
  }

  #insertMessageAndScrollDown(data) {
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }

  resetForm(event) {
    event.target.reset()
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }
}
