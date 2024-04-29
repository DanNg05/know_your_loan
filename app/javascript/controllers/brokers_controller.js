import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="brokers"
export default class extends Controller {
  static targets = ["list", "brokersMap", "btnView"]
  connect() {
    // console.log("hello from Brokers controller JS")
  }

  initialize() {
    this.currentView = "map"
  }

  showCurrentView() {
    if (this.currentView === "list") {
      this.brokersMapTarget.classList.add("d-none");
      this.listTarget.classList.remove("d-none");
      this.btnViewTarget.innerHTML = "MAP";
    } else {
      this.listTarget.classList.add("d-none");
      this.brokersMapTarget.classList.remove("d-none");
      this.btnViewTarget.innerHTML = "LIST";
    }
  }

  changeView () {
    console.log(this.currentView)
    if (this.currentView === "list") {
      this.currentView = "map"
    } else {
      this.currentView = "list"
    }
    this.showCurrentView()
  };
}
