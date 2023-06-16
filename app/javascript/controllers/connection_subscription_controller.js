import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="chatroom-subscription"
export default class extends Controller {
  static values = { connectionId: Number, currentUserId: Number, currentUserPhoto: String }
  static targets = ["messages"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "ConnectionChannel", id: this.connectionIdValue },
      { received: data => this.#insertMessageAndScrollDown(data) }
    )
    console.log(`Subscribed to the connection with the id ${this.connectionIdValue}.`)
    console.log(this.currentUserPhotoValue);
  }

  resetForm(event) {
    event.target.reset()
  }

  #insertMessageAndScrollDown(data) {
    const currentUserIsSender = this.currentUserIdValue === data.sender_id
    const messageElement = this.#buildMessageElement(currentUserIsSender, data.message, data.sender_photo)
    this.messagesTarget.insertAdjacentHTML("beforeend", messageElement)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }

  #buildMessageElement(currentUserIsSender, message, sender_photo) {
    return `
      <div class="message-row d-flex ${this.#justifyClass(currentUserIsSender)}">
        <div class='chat-avatar'>
          <img class="avatar" src="http://res.cloudinary.com/duqmhxedj/image/upload/v1/development/${sender_photo}">
        </div>
        <div class="${this.#userStyleClass(currentUserIsSender)}">
          ${message}
        </div>
      </div>
    `
  }

  #justifyClass(currentUserIsSender) {
    return currentUserIsSender ? "justify-content-end" : "justify-content-start"
  }

  #userStyleClass(currentUserIsSender) {
    return currentUserIsSender ? "sender-style" : "receiver-style"
  }

  disconnect() {
    console.log("Unsubscribed from the Connection")
    this.channel.unsubscribe()
  }
}
