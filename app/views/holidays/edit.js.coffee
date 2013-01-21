$('.holiday-row').show()
$('.holiday-form').hide()
$('#holiday-row-<%= @holiday.id %>').hide()
$('#holiday-<%= @holiday.id %>-form').show()
$('#date-field-<%= @holiday.id %>').datepicker({
  dateFormat: 'dd-mm-yy'
});