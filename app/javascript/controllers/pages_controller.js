import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="pages"
export default class extends Controller {
  connect() {
   console.log("connetcted to homepage")
  }
  greeting(){
   alert("alert");
  }
}
