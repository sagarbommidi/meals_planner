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

  $('.transfer-date-field').datepicker({ 
    dateFormat: 'dd/mm/yy',
    minDate: 0,
    maxDate: +10
  });

  $("#subscribe-submit").click(function(){
    $('#subscription-spinner-button').show();
    $(this).attr("disabled", "true");
    $("#new_subscription").submit();
    return false;
  });

  $("#received-payment-submit").live('click', function(){
    $('#received-payment-spinner-button').show();
    $(this).attr("disabled", "true");
    $("#payment_recieved_form").submit();
    return false;
  });

  $("#borrow-submit").live('click', function(){
    $('#borrow-spinner-button').show();
    $(this).attr("disabled", "true");
    $('#borrow_form').submit();
    return false;
  });

  // $("transfer-button").click(function() {
  //   var html = "";
  //   html += '<div class = "transfer-wrapper">
  //     <input type = "text" class = "transfer-date-field" name ="transfer_date" />
  //     <input type = "submit" class = "btn btn-success" id = "transfer-button" val = "Transfer" />
  //   </div>'
  //   $('#transfer-container').append(html);  
  // });

  $('#all-slots-button').live('click', function(){
    $("#available-slots-container").hide();
    $("#all-slots-container").show();
  });

  $('#available-slots-button').live('click', function(){
    $("#all-slots-container").hide()
    $("#available-slots-container").show();
  });

});

$(function () {
  $("[rel='tooltip']").tooltip();
});
