<% if @transfer.valid? %>
<% content = escape_javascript(render :partial => 'users/transfer_details') %>
$('#update_payment').html('<%= content %>')
<% else %>
$('#update_payment').prepend('<p> Could not receive </p>')
<% end %>