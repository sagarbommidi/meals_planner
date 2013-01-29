<% if @transfer.valid? %>
<% content = escape_javascript(render :partial => 'users/todays_transfers') %>
$('#today_transfer').html('<%= content %>')
<% else %>
$('#today_transfer').prepend('<p>Failed to borrow...</p>')
<% end %>