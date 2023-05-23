import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="submit-connection-request"
export default class extends Controller {
  static targets = ["submit-button"];
  static values = {
    userId: String
  };

  connect() {
    console.log(this.element);
    console.log(this.userIdValue);
    const url = `/users/${this.userIdValue}/connections`;
    console.log(url);
  }

  send(event) {
    console.log(event);
    fetch(`/users/${this.userIdValue}/connections`)
      .then(console.log(response));
  }
}
