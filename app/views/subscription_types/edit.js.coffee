$('.stype-row').show()
$('.stype-form').hide()
$('#stype-row-<%= @stype.id %>').hide()
$('#stype-<%= @stype.id %>-form').show()
$('#date-field-<%= @stype.id %>').datepicker({
  dateFormat: 'dd-mm-yy'
});