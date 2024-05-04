import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["mortgageForm"];

  connect() {
    // console.log("Hello edit mortgage")
  }

  change() {
    this.mortgageFormTarget.classList.toggle("d-none");
  }

  updateMortgage(event) {
    event.preventDefault(); // Prevents the default form submission behavior
    console.log("Update Mortgage button clicked"); // Debugging statement
    const form = event.target.closest('form');
    const formData = new FormData(form);

    // Your AJAX code to submit the form data asynchronously

    // Recalculate loan amount, monthly repayment, and monthly cashflow
    var calculateCashflowButton = document.querySelector('input[type="submit"][value="Calculate Cashflow"]');
    var propertyValueField = document.getElementById('property_value');
    var totalEquityField = document.getElementById('total_equity');
    var interestRateField = document.getElementById('interest_rate');
    var rentalIncomeField = document.getElementById('rental_income');
    var maintenanceFundField = document.getElementById('maintenance_fund');
    var otherExpensesField = document.getElementById('other_expenses');
    var loanAmountField = document.getElementById('mortgage_loan_amount');
    var monthlyRepaymentField = document.getElementById('monthly_repayment_amount');
    var monthlyCashflowField = document.getElementById('monthly_cashflow_amount');

    // Add event listener to the "Calculate Cashflow" button
    calculateCashflowButton.addEventListener('click', function(event) {
      console.log("Calculate Cashflow button clicked");

      // Retrieve input values
      var propertyValue = parseFloat(propertyValueField.value);
      var totalEquity = parseFloat(totalEquityField.value);
      var interestRate = parseFloat(interestRateField.value);
      var rentalIncome = parseFloat(rentalIncomeField.value);
      var maintenanceFund = parseFloat(maintenanceFundField.value);
      var otherExpenses = parseFloat(otherExpensesField.value);

      // Calculate loan amount
      var loanAmount = propertyValue - totalEquity;
      console.log("Loan Amount:", loanAmount);
      loanAmountField.value = loanAmount.toFixed(2);

      // Calculate monthly repayment
      var monthlyInterestRate = interestRate / 100 / 12;
      var loanTermInMonths = 30 * 12; // Assuming a 30-year loan term
      var monthlyRepayment = (loanAmount * monthlyInterestRate) / (1 - Math.pow(1 + monthlyInterestRate, -loanTermInMonths));
      console.log("Monthly Repayment:", monthlyRepayment);
      monthlyRepaymentField.value = monthlyRepayment.toFixed(2);

      // Calculate monthly cashflow
      var monthlyCashflow = rentalIncome - maintenanceFund - otherExpenses - monthlyRepayment;
      console.log("Monthly Cashflow:", monthlyCashflow);
      monthlyCashflowField.value = monthlyCashflow.toFixed(2);
    });
  }

}

