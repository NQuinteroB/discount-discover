import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-in-favs"
export default class extends Controller {
  static targets = ["heart"]
  static values = { favoriting: Boolean }
  connect() {
    console.log("hola")
  }

  next() {
    console.log("clicked")
    if (this.favoritingValue) {
      console.log(this.heartTarget)
      this.heartTarget.classList.add("active-heart")
      this.heartTarget.classList.remove("inactive-heart")
    } else {
      console.log(this.heartTarget)
      this.heartTarget.classList.add("inactive-heart")
      this.heartTarget.classList.remove("active-heart")
    }
  }
}
