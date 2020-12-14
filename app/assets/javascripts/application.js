// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery3
//= require jquery_ujs
//= require jquery.validate
//= require bootstrap-sprockets
//= require activestorage
//= require turbolinks
//= require bootstrap.min
//= require npm
//= require_tree .

/* Set the width of the sidebar to 250px and the left margin of the page content to 250px */
function openNav() {
  document.getElementById("mySidebar").style.width = "250px";
  document.getElementById("main").style.marginLeft = "250px";
  document.getElementById("main_content").style.marginLeft = "250px";
  document.body.style.backgroundColor = "rgb(120, 81, 77)";
  document.body.style.color = "rgb(82, 72, 71)"
}

/* Set the width of the sidebar to 0 and the left margin of the page content to 0 */
function closeNav() {
  document.getElementById("mySidebar").style.width = "0";
  document.getElementById("main").style.marginLeft = "0";
  document.getElementById("main_content").style.marginLeft = "0";
  document.body.style.backgroundColor = "salmon";
  document.body.style.color = "rgb(53, 54, 67)"
}


function ToggleText(elem){ //toggle text (hide//show) paragraph below element
  $('#'+elem.id+"p").toggle();
}

function SetFontSize(val){ //change size of all text to specific value
  $("*").each(function(i,e){e.style.fontSize = val});
}

function SetPageStyle(val){ //changes style of page
  if(val === 'Normal'){
    $("*").each(function(i,e){e.style.background = "salmon"});
    $("*").each(function(i,e){e.style.color = "rgb(53, 54, 67)"});
  }
  else{
    $("*").each(function(i,e){e.style.background = "rgb(53, 54, 67)"});
    $("*").each(function(i,e){e.style.color = "salmon"});
  }
}

function SetTableStyle(sty){ //changes colours of table
  if(sty === 'Plain'){
    $("td").removeClass("bright")
    $("td").addClass("plain")
  }
  else {
    $("td").removeClass("plain")
    $("td").addClass("bright")
  }
}

function ValidateLocationForm(){ //validates form before sent to server
  $('#LocationForm').validate({
    rules: {
      'location[name]': {required: true}, //ensure these values present
      'location[country]': {required: true},
      'location[street]': {required: true},
      'location[postcode]': {required: true}
    },
    messages: {
      'location[name]': {required: "You must provide the location name"}, //message shown when invalid
      'location[country]': {required: "You must provide a country"},
      'location[street]': {required: "You must provide a street name"},
      'location[postcode]': {required: "You must provide a postcode"}
    }
  });
}

function ValidateEventForm(){ //validates form before sent to server
  $('#EventForm').validate({
    rules: {
      'event[name]': {required: true} //ensure this value present
    },
    messages: {
      'event[name]': {required: "You must provide an event name"} //message shown when invalid
    }
  });
}

function ValidateReviewForm(){ //validates form before sent to server
  $('#ReviewForm').validate({
    rules: {
      'review[rating]': {
        required: true, //ensures this value present
        digits: true, //ensure this value is a digit
        range: [1, 5], //ensures this value between 1-5
      }
    },
    messages: {
      'review[rating]': { //message shown when invalid
        required: "You must provide a rating out of 5",
        digits: "rating must be a whole number out of 5",
        range: "rating must be between 1 and 5"
      }
    }
  });
}

function ValidateTicketForm(){ //validates form before sent to server
  $('#TicketForm').validate({
    rules: {
      'ticket[first_name]': {required: true}, //ensure these values present
      'ticket[last_name]': {required: true},
      'ticket[age]': {
        required: true,
        digits: true, //ensure this value is a digit
        range: [0, 150],  //ensures this value between 1-5
      }
    },
    messages: {
      'ticket[first_name]': {required: "You must provide a first name"}, //message shown when invalid
      'ticket[last_name]': {required: "You must provide a second name"},
      'ticket[age]': {
        required: "You must provide an age",
        digits: "Age must be a whole number",
        range: "rating must be between 0 and 150"
      }
    }
  });
}

function ValidateContactForm(){ //validates form before sent to server
  $('#ContactForm').validate({
    rules: {
      'name': {required: true},  //ensure these values present
      'email': {required: true, email: true},  //ensure valid email
      'message': {required: true},
    },
    messages: {
      'name': {required: "Must provide name"}, //message shown when invalid
      'email': {required: "Must provide email", email: "Must be valid email"},
      'message': {required: "Must provide message"},
    }
  });
}

$(document).ready(function() { //occurs when DOM loaded

  if(document.getElementById('welcome_id')){ //hides paragrams when page initially loaded
    $('#currentp, #venuesp, #accountsp, #accessibilityp').hide();
  }

  if(document.getElementById('LocationForm')){ //validates page when loaded
    ValidateLocationForm();
  }

  if(document.getElementById('EventForm')){
    ValidateEventForm();
  }

  if(document.getElementById('ReviewForm')){
    ValidateReviewForm();
  }

  if(document.getElementById('TicketForm')){
    ValidateTicketForm();
  }


});
