import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="reveal-comments"
export default class extends Controller {
  static targets = ["comments"];

  connect() {
    console.log("Hi from Reveal Comments Stimulus");
  }

  displayComments() {
    this.commentsTarget.classList.remove("d-none");
  }
}
