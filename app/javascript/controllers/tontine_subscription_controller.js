import { Controller } from "@hotwired/stimulus"
import {createConsumer } from "@rails/actioncable"

// Connects to data-controller="tontine-subscription"
export default class extends Controller {
  static values = {
    tontineId: Number,
    userId: Number
  }
  static targets = ["messages", "message"]
  
  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "TontineChannel", id: this.tontineIdValue },
      {
        received: (data) => {
          this.#insertMessageAndScrollDown(data.message);
          if (data.author_id != this.userIdValue) this.lastMessage.classList.remove('user-is-author');
        }
      }
    )
    console.log(this.channel);
    this.#scrollToLastMessage();
  }

  get lastMessage() {
    return this.messageTargets[this.messageTargets.length - 1];
  }

  #insertMessageAndScrollDown(message) {
    this.messagesTarget.insertAdjacentHTML("beforeend", message);
    this.#scrollToLastMessage();
  }

  #scrollToLastMessage() {
    // this.messagesTarget.scrollIntoView({ behavior: "smooth", block: "end"});
    // this.messagesTarget.scrollTop = this.lastMessage.offsetTop;
    // console.log(this.messagesTarget);
    // console.log(this.messagesTarget.offsetHeight);
    // console.log(this.lastMessage.offsetTop);
    this.messagesTarget.scrollTo(0, this.lastMessage.offsetTop);
  }

  resetForm(event) {
    event.target.reset();
    window.scrollTo(0,0);
    this.#scrollToLastMessage();
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }
}
