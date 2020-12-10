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
//= require_tree .

/* Set the width of the sidebar to 250px and the left margin of the page content to 250px */
function openNav() {
  document.getElementById("mySidebar").style.width = "250px";
  document.getElementById("main").style.marginLeft = "250px";
  document.getElementById("main_content").style.marginLeft = "250px";
  document.body.style.backgroundColor = "rgb(120, 81, 77)";
  document.body.style.color = "rgb(82, 72, 71)"
  document.h1.style.color = "rgb(82, 72, 71)"


}

/* Set the width of the sidebar to 0 and the left margin of the page content to 0 */
function closeNav() {
  document.getElementById("mySidebar").style.width = "0";
  document.getElementById("main").style.marginLeft = "0";
  document.getElementById("main_content").style.marginLeft = "0";
  document.body.style.backgroundColor = "salmon";
  document.body.style.color = "rgb(53, 54, 67)"
}

function ToggleText(elem){
  $('#'+elem.id+"p").toggle();
}

function SetFontSize(val){
  $("*").each(function(i,e){e.style.fontSize = val});
}

function SetPageStyle(val){
  if(val === 'Normal'){
    $("*").each(function(i,e){e.style.background = "salmon"});
    $("*").each(function(i,e){e.style.color = "rgb(53, 54, 67)"});
  }
  else{
    $("*").each(function(i,e){e.style.background = "rgb(53, 54, 67)"});
    $("*").each(function(i,e){e.style.color = "salmon"});
  }
}

function ValidateLocationForm(){
  $('#LocationForm').validate({
    rules: {
      'location[name]': {required: true},
      'location[country]': {required: true},
      'location[street]': {required: true},
      'location[postcode]': {required: true}
    },
    messages: {
      'location[name]': {required: "You must provide the location name"},
      'location[country]': {required: "You must provide a country"},
      'location[street]': {required: "You must provide a street name"},
      'location[postcode]': {required: "You must provide a postcode"}
    }
  });
}

function ValidateEventForm(){
  $('#EventForm').validate({
    rules: {
      'event[name]': {required: true}
    },
    messages: {
      'event[name]': {required: "You must provide an event name"}
    }
  });
}

function ValidateReviewForm(){
  $('#ReviewForm').validate({
    rules: {
      'review[rating]': {
        required: true,
        digits: true,
        range: [1, 5],
      }
    },
    messages: {
      'review[rating]': {
        required: "You must provide a rating out of 5",
        digits: "rating must be a whole number out of 5",
        range: "rating must be between 1 and 5"
      }
    }
  });
}

function ValidateTicketForm(){
  $('#TicketForm').validate({
    rules: {
      'ticket[first_name]': {required: true},
      'ticket[last_name]': {required: true},
      'ticket[age]': {
        required: true,
        digits: true,
        range: [0, 150],
      }
    },
    messages: {
      'ticket[first_name]': {required: "You must provide a first name"},
      'ticket[last_name]': {required: "You must provide a second name"},
      'ticket[age]': {
        required: "You must provide an age",
        digits: "age must be a whole number",
        range: "rating must be between 0 and 150"
      }
    }
  });
}

$(document).ready(function() {

  if(document.getElementById('welcome_id')){
    $('#currentp, #venuesp, #accountsp, #accessibilityp').hide();
  }

  if(document.getElementById('LocationForm')){
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

  $('[data-js-hide-link]').click(function(event){
    $(this).parents('li').hide();
    event.preventDefault();
  });
});
