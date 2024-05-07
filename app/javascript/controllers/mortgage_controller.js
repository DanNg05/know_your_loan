import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["mortgageForm"];

  connect() {
    console.log("Hello mortgage");
  }

  change() {
    this.mortgageFormTarget.classList.toggle("d-none");
  }
}
