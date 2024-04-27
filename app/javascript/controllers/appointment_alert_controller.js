import { Controller } from "@hotwired/stimulus"
import Swal from "sweetalert2"


// Connects to data-controller="appointment-alert"
export default class extends Controller {
  static targets = ["formSubmit", "date", "message"]
  connect() {
    // console.log("Hello from appointment JS")
  }

  initSweetalert(event) {
    event.preventDefault();
    if (this.dateTarget.value.length === 0 || this.messageTarget.value.length === 0) {
      Swal.fire({
        title: "Missing Input",
        icon: "question",
        text: "Please fill the inputs!"
      })
    }
    else {
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
}
