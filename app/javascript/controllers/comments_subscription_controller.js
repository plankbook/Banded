import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="comments-subscription"
export default class extends Controller {
  static values = { postId: Number }
  static targets = ["comments"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "CommentsChannel", id: this.postIdValue },
      { received: data => this.#insertCommentAndScrollDown(data) }
    )
    console.log(`Subscribe to the Projects-Comments with the id ${this.postIdValue}.`);
  }

  #insertCommentAndScrollDown(data) {
    this.commentsTarget.insertAdjacentHTML("afterbegin", data)
    this.commentsTarget.scrollTo(0, this.commentsTarget.scrollHeight)
  }

  resetForm(event) {
    event.target.reset()
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }
}
