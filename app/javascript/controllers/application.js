
import { Application } from "@hotwired/stimulus"

const application = Application.start()

application.debug = false
window.Stimulus = application

export { application }

function updateBedroomDisplay(element) {
  var bedroomType = $(element).closest('.nested-fields').find('select[name$="[bedroom_type]"]').val();
  var quantity = $(element).closest('.nested-fields').find('select[name$="[quantity]"]').val();

  var displayText = quantity + "x " + bedroomType;
  $(element).closest('.nested-fields').find('.bedroom-display').text(displayText);
}
