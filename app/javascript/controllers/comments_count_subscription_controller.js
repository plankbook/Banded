import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="comments-count-subscription"
export default class extends Controller {
  static targets = ["count"]
  static values = { postId: Number }

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "CommentsCountChannel", id: this.postIdValue },
      { received: data => this.#updateCommentsCount(data) }
    )
    console.log(`Subscribed to the comments count with the id ${this.postIdValue}.`);
    console.log(this.countTarget);
  }

  #updateCommentsCount(data) {
    this.countTarget.childNodes[1].innerText = `Show ${data} Comments`;
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }
}
