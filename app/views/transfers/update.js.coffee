<% if @transfer.valid? %>
<% content = escape_javascript(render :partial => 'users/todays_transfers') %>
<% contentnew = escape_javascript(render :partial => 'users/transfer_details') %>
$('#today_transfer').html('<%= content %>')
$('#transfer_container').html('<%= contentnew %>')
<% else %>
$('#today_transfer').prepend('<p>Failed to borrow...</p>')
<% end %>