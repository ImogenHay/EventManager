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
      'location[postcode]': {required: true},

    },
    messages: {
      'location[name]': {required: "You must provide the location name"},
      'location[country]': {required: "You must provide a country"},
      'location[street]': {required: "You must provide a street name"},
      'location[postcode]': {required: "You must provide a postcode"},
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


  $('[data-js-hide-link]').click(function(event){
    $(this).parents('li').hide();
    event.preventDefault();
  });
});
