// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require bootstrap
//= require_tree .

$(document).ready(function(){
  $('.date-field').datepicker({
    dateFormat: 'dd/mm/yy'
  });

  $("#subscribe-submit").click(function(){
    $(this).attr("disabled", "true");
    $('#subscription-spinner-button').show();
  })

  $("#received-payment-submit").live('click', function(){
    $('#received-payment-spinner-button').show();
    $(this).attr("disabled", "true");
  })

  $("#borrow-submit").live('click', function(){
    $('#borrow-spinner-button').show();
    $(this).attr("disabled", "true");
    console.log("returned false;");
  })

});

$(function () {
  $("[rel='tooltip']").tooltip();
});

// $('#transfer-container').ajaxStart(function() {
//   $('#transfer-button').disable();  
//   $('#spinner-icon').show();
//   _.delay(function(msg) { console.log(msg); }, 5000, 'Hello');
// });
// $('#transfer-container').ajaxComplete(function() {
//   $('#spinner-icon').hide();
// });

// $('#subscription-container').ajaxStart(function() {
//   alert("calling");
//   return false;
//   $('#transfer-button').disable();  
//   $('#spinner-icon').show();
//   _.delay(function(msg) { console.log(msg); }, 5000, 'Hello');
// });
// $('#subscription-container').ajaxComplete(function() {
//   $('#spinner-icon').hide();
// });

