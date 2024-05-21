// import { Application } from "@hotwired/stimulus"
// import { Autocomplete } from "stimulus-autocomplete"

// const application = Application.start()
// application.register('autocomplete', Autocomplete)

// document.addEventListener('turbo:load', () => {
//   const managerInput = document.getElementById('property_manager_name');

//   if (managerInput) {
//     new Autocomplete(managerInput);
//   }
// });

// export { application }

import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
