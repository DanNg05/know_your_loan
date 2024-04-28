import { Controller } from "@hotwired/stimulus"
import { Chart } from "./chart.js";



// Connects to data-controller="chart"
export default class extends Controller {
  connect() {
    console.log("Hello from chartJS")
  }
}

// TODO: Register all Chartjs controllers
const controllers = Object.values(Chartjs).filter(
  chart => chart.id !== undefined
);
