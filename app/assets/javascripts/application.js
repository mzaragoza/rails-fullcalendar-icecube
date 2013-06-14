//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require jquery.ui.all
//= require jquery-minicolors
//= require jquery-minicolors-simple_form
//= require jquery.timepicker
//= require datepair
//= require fullcalendar
//= require underscore
//= require backbone

$(function() {
  $( ".datepicker" ).datepicker({
    dateFormat: "yy-mm-dd"
  });
  $( ".timepicker" ).timepicker({ 'timeFormat': 'h:i A' });
});
