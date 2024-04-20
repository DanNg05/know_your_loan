import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="review-toggle"
export default class extends Controller {
  static targets = ["reviewForm"]
  connect() {
  }

  fire() {
    this.reviewFormTarget.classList.toggle("d-none")
  }
}
