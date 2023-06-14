import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="button"
export default class extends Controller {
  static targets = ["button"]

  connect() {
    console.log("Hello from Button Controller!");
    console.log(this.buttonTarget);
  }

  // disable() {
  //   // console.log(addProjectUserButtonTarget);
  //   // this.addProjectUserButtonTarget.classList.add("submitted");
  //   // this.addProjectUserButtonTarget.preventDefault();
  // }

  disable() {
    // console.dir(this.buttonTarget);
    // const form = new FormData();
    fetch(this.buttonTarget.parentElement.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.buttonTarget.parentElement)
    })
    .then(response => response.json())
    .then((data) => {
      console.log(data);
    })

    this.buttonTarget.disabled = true;
  }
 }
