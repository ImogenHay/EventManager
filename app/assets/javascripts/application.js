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
//= require bootstrap-sprockets
//= require jquery3
//= require jquery_ujs
//= require activestorage
//= require turbolinks
//= require_tree .


function ToggleText(elem){
  $('#'+elem.id+"p").toggle();
}

$(document).ready(function() {

  if(document.getElementById('welcome_id')){
    $('#currentp, #venuesp, #accountsp').hide();
  }


  $('[data-js-hide-link]').click(function(event){
    $(this).parents('li').hide();
    event.preventDefault();
  });
});
