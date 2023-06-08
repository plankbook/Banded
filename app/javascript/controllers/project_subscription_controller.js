import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="project-subscription"
export default class extends Controller {
  static values = { projectId: Number }
  static targets = ["posts"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "ProjectChannel", id: this.projectIdValue },
      { received: data => this.#insertPostAndScrollDown(data) }
    )
    console.log(`Subscribed to the project with the id ${this.projectIdValue}.`)
  }

  #insertPostAndScrollDown(data) {
    this.postsTarget.insertAdjacentHTML("beforeend", data)
    this.postsTarget.scrollTo(0, this.postsTarget.scrollHeight)
  }

  resetForm(event) {
    event.target.reset()
  }

  disconnect() {
    console.log("Unsubscribed from the Project")
    this.channel.unsubscribe()
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }
}
