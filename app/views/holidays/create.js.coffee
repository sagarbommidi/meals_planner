<% if @holiday.valid? %>
$('#addHoliday').modal("hide")
$('#holiday-errors').html('').hide()
<% content = escape_javascript(render :partial => 'holidays/index_list', :locals => {:holidays => @holidays}) %>
$('#holiday-container').html('<%= content %>')
<% else %>
error_message = "<ul>"
  <% @holiday.errors.full_messages.each do |msg| %>
error_message +=  "<li><%= msg %></li>"
  <% end %>
error_message += "</ul>"
$('#holiday-errors').html(error_message).show()
<% end %>