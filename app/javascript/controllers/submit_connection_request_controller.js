import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="submit-connection-request"
export default class extends Controller {
  static targets = ["submit-button"];
  static values = {
    requesterId: String,
    receiverId: String
  }

  connect() {
    const url = `/users/${this.userIdValue}/connections`;
    console.log(url);
    console.log(this.requesterIdValue);
    console.log(this.receiverIdValue);
  }

  send(event) {
    console.log(this.receiverIdValue);
    fetch(`/users/${this.receiverIdValue}/connections`, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: JSON.stringify({"requester_id": this.requesterIdValue, "receiver_id": this.receiverIdValue})
    })
    .then(response => response.json())
    .then((data) => {
      console.log(data);
    })
  }
}
