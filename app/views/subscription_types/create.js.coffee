<% if @s_type.valid? %>
$('#addSubType').modal("hide")
$('#sub-type-errors').html('').hide()
<% content = escape_javascript(render :partial => 'subscription_types/index_list', :locals => {:stypes => @stypes}) %>
$('#stype-container').html('<%= content %>')
<% else %>
error_message = "<ul>"
  <% @s_type.errors.full_messages.each do |msg| %>
error_message +=  "<li><%= msg %></li>"
  <% end %>
error_message += "</ul>"
$('#sub-type-errors').html(error_message).show()
<% end %>