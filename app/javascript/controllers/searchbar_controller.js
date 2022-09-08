import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="searchbar"
export default class extends Controller {
  connect() {
  }

  updateSearchbar() {
    if (window.scrollY >= 240) {
      this.element.classList.add("when-sticky")
    } else {
      this.element.classList.remove("when-sticky")
    }
  }
}
