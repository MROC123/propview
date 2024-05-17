import { Application } from "@hotwired/stimulus";
import "controllers";
import "@popperjs/core";
import "bootstrap";
import $ from "jquery";
import "jquery-ui-dist/jquery-ui";

const application = Application.start();
window.Stimulus = application;

$(document).ready(function () {
  $(document).on("turbo:load", function () {
    const managerNameInput = document.getElementById('property_manager_name');
    const newManagerFields = document.getElementById('new-manager-fields');
    const managerIdInput = document.getElementById('property_manager_id');

    if (managerNameInput) {
      $(managerNameInput).autocomplete({
        source: '/managers/search',
        select: function (event, ui) {
          managerIdInput.value = ui.item.value;
          newManagerFields.style.display = 'none';
        }
      });

      managerNameInput.addEventListener('keypress', function (event) {
        if (event.key === 'Enter' && managerIdInput.value === "") {
          event.preventDefault();
          newManagerFields.style.display = 'block';
        }
      });
    }
  });
});

export { application };
