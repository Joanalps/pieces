import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter"
export default class extends Controller {
  static targets = ["filterableElement"]

  connect() {
    this.activate()
  }

  activate(event) {
    const params = new URLSearchParams(document.location.search)
    const tagValue = params.get('tag')

    this.filterableElementTargets.forEach((filter) => {
      if (filter.dataset.tag === tagValue) {
        filter.classList.add('active')
      }
    });
  }
}
