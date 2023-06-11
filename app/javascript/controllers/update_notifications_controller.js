import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="update-notifications"
export default class extends Controller {
  static targets = ["notifications", "notificationsCount"]

  connect() {
    console.log("Hello from Update Notifications Controller!");
    console.log(this.notificationsTarget);
    console.log(this.notificationsCountTarget);
  }

  updateCount(event) {
    console.log(event);
    console.log(this.notificationsTarget);
  }
}
