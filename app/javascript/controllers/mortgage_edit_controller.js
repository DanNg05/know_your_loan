import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="mortgage-edit"
export default class extends Controller {
  static targets = ["mortgageForm"]
  connect() {
    // console.log("Hello edit mortgage")
  }

  change () {
    this.mortgageFormTarget.classList.toggle("d-none")
  }
}
