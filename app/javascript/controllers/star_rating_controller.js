import { Controller } from "@hotwired/stimulus"
import StarRating from "star-rating.js/dist/star-rating.js"


// Connects to data-controller="star-rating"
export default class extends Controller {
  connect() {
    console.log('hello')
    new StarRating(this.element)
  }
}
