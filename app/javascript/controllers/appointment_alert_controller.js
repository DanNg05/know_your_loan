import { Controller } from "@hotwired/stimulus"
import Swal from "sweetalert2"


// Connects to data-controller="appointment-alert"
export default class extends Controller {
  static targets = ["formSubmit", "date", "message", "mortgageForm", "propertyValue", "totalEquity", "rentalIncome", "maintenanceFund", "otherExpenses", "mortgageForm1", "propertyValue1", "totalEquity1", "rentalIncome1", "maintenanceFund1", "otherExpenses1"]
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

  mortgageFormFire (event) {
    event.preventDefault();
    if (this.propertyValueTarget.value.length === 0 || this.totalEquityTarget.value.length === 0 || this.rentalIncomeTarget.value.length === 0 || this.maintenanceFundTarget.value.length === 0 || this.otherExpensesTarget.value.length === 0) {
      Swal.fire({
        title: "Missing Input",
        icon: "question",
        text: "Please fill the inputs!"
      })
    }
    else {
      Swal.fire({
        title: "Your Mortgage",
        icon: "success",
        text: "Your mortgage is successfully created!"
      }).then((result) => {
        /* Read more about isConfirmed, isDenied below */
        if (result.isConfirmed) {
          location.reload();
        }
        this.mortgageFormTarget.submit()
      })
    }
  }

  mortgageEditFormFire (event) {
    event.preventDefault();
    if (this.propertyValue1Target.value.length === 0 || this.totalEquity1Target.value.length === 0 || this.rentalIncome1Target.value.length === 0 || this.maintenanceFund1Target.value.length === 0 || this.otherExpenses1Target.value.length === 0) {
      Swal.fire({
        title: "Missing Input",
        icon: "question",
        text: "Please fill the inputs!"
      })
    }
    else {
      Swal.fire({
        title: "Your Mortgage",
        icon: "success",
        text: "Your mortgage is successfully edited!"
      }).then((result) => {
        /* Read more about isConfirmed, isDenied below */
        if (result.isConfirmed) {
          location.reload();
        }
        this.mortgageForm1Target.submit()
      })
    }
  }
}
