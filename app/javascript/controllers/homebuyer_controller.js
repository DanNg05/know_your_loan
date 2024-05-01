import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="homebuyer"
export default class extends Controller {
  connect() {
    console.log('hello from homebuyer controller')
  }
}
