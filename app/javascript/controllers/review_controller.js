import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="review"
export default class extends Controller {
  static targets = ['ratingInput'];

  connect() {
    console.log("is it connecting?")
  }

  setRating(event) {
    event.preventDefault();
  }

}
