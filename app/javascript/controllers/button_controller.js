import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="button"
export default class extends Controller {
  static targets = ["addProjectUserButton"]

  connect() {
    console.log("Hello from Button Controller!");
    console.log(this.addProjectUserButtonTarget);
  }

  disable() {
    this.addProjectUserButtonTarget.disabled = true;
  }
}
