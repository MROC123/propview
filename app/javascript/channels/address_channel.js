import consumer from "./consumer"

const AddressChannel = consumer.subscriptions.create("AddressChannel", {
  connected() {
    console.log("Connected to AddressChannel")
  },

  disconnected() {
    console.log("Disconnected from AddressChannel")
  },

  received(data) {
    const addressInput = document.getElementById('property_address');
    const addressResults = document.getElementById('address_search_results');

    if (addressResults) {
      addressResults.innerHTML = '';
      addressResults.style.display = 'block';
      data.addresses.forEach(address => {
        const li = document.createElement('li');
        li.textContent = address.label;
        li.className = 'dropdown-item';
        li.addEventListener('click', function () {
          addressInput.value = address.value;
          addressResults.style.display = 'none';
        });
        addressResults.appendChild(li);
      });
    }
  },

  search(term) {
    this.perform("search", { term: term });
  }
});

export default AddressChannel;
