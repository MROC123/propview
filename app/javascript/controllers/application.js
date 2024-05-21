import { Application } from "@hotwired/stimulus"
import { Autocomplete } from "stimulus-autocomplete"

const application = Application.start()
application.register('autocomplete', Autocomplete)

document.addEventListener('turbo:load', () => {
  const managerInput = document.getElementById('property_manager_name');

  if (managerInput) {
    new Autocomplete(managerInput);
  }
});

export { application }

document.addEventListener('turbo:load', () => {
  var dropdownElementList = [].slice.call(document.querySelectorAll('.dropdown-toggle'))
  var dropdownList = dropdownElementList.map(function (dropdownToggleEl) {
    return new bootstrap.Dropdown(dropdownToggleEl)
  })
})
