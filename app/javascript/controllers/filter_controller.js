import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter"
export default class extends Controller {
  static targets = ["filterableElement"]

  connect() {
    this.activate()
  }

  activate(event) {
    // console.log(event.currentTarget)
    const params = new URLSearchParams(document.location.search)
    const tagValue = params.get('tag')
    // params.set('query', event.currentTarget.dataset.tag)
    // document.location.search = `?${params.toString()}`

    this.filterableElementTargets.forEach((filter) => {
      if (filter.dataset.tag === tagValue) {
        filter.classList.add('active')
      }
    });
  }
}
