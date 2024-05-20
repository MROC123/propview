import { Application } from "@hotwired/stimulus"
import { Autocomplete } from "stimulus-autocomplete"
import AddressChannel from "/channels/address_channel"

const application = Application.start()
application.register('autocomplete', Autocomplete)

document.addEventListener('turbo:load', () => {
  const managerInput = document.getElementById('property_manager_name');
  if (managerInput) {
    new Autocomplete(managerInput);
  }

  const addressInput = document.getElementById('property_address');
  const addressResults = document.getElementById('address_search_results');
  if (addressInput) {
    addressInput.addEventListener('input', function () {
      const term = this.value;
      if (term.length > 2) {
        AddressChannel.search(term);
      } else {
        addressResults.style.display = 'none';
      }
    });

    document.addEventListener('click', function (event) {
      if (!addressResults.contains(event.target) && event.target !== addressInput) {
        addressResults.style.display = 'none';
      }
    });
  }
});

export { application };
