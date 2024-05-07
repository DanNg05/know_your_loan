import { Controller } from "@hotwired/stimulus"
import Swal from "sweetalert2"

// Connects to data-controller="review-toggle"
export default class extends Controller {
  static targets = ["reviewForm", "content", "rating", "reviewSubmit"]
  connect() {
    // console.log("Hello there")
  }

  fire() {
    this.reviewFormTarget.classList.toggle("d-none")
  }

  initSweetalert(event) {
    event.preventDefault();
    if (this.contentTarget.value.length === 0 || this.ratingTarget.value.length === 0) {
      Swal.fire({
        title: "Missing Input",
        icon: "question",
        text: "Please fill the inputs!"
      })
    }
    else {
      Swal.fire({
        title: "Your Review",
        icon: "success",
        text: "Your review is successfully created!"
      }).then((result) => {
        /* Read more about isConfirmed, isDenied below */
        if (result.isConfirmed) {
          location.reload();
        }
        this.reviewSubmitTarget.submit()
      })
    }
  }
}
