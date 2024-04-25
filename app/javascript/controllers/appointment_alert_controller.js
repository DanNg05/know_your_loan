import { Controller } from "@hotwired/stimulus"
import Swal from "sweetalert2"


// Connects to data-controller="appointment-alert"
export default class extends Controller {
  static targets = ["formSubmit"]
  connect() {
    console.log("Hello from appointment JS")
  }

  initSweetalert(event) {
    event.preventDefault();

    Swal.fire({
      title: "Your Appointment",
      icon: "success",
      text: "Your appointment is successfully created!"
    }).then((result) => {
      /* Read more about isConfirmed, isDenied below */
      if (result.isConfirmed) {
        location.reload();
      }
      this.formSubmitTarget.submit()
    })
  }
}
