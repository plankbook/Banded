import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="update-notifications"
export default class extends Controller {
  static values = { userId: Number }
  static targets = ["notifications", "notificationsCount"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "NotificationsChannel", id: this.userIdValue },
      { received: data => {
        console.log(data);
        this.updateNotifications(data.notification);
        this.updateUnreadCount(data.unread_count);
        }
      }
    )
    console.dir(this.notificationsCountTarget);
  }

  updateNotifications(html) {
    this.notificationsTarget.insertAdjacentHTML("afterbegin", html);
  }

  updateUnreadCount(count) {
    this.notificationsCountTarget.innerText = count >= 9 ? "9+" : count;
  }
}
