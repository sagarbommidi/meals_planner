<% if @transfer.valid? %>
<% content = escape_javascript(render :partial => 'users/transfer_details') %>
<% contentnew = escape_javascript(render :partial => 'users/todays_transfers') %>
$('#transfer-container').html('<%= content %>')
$('#today_transfer').html('<%= contentnew %>')
<% else %>
$('#update_payment').prepend('<p> Could not receive </p>')
<% end %>