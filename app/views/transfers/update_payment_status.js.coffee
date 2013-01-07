<% if @transfer.valid? %>
<% content = escape_javascript(render :partial => 'users/transfer_details') %>
$('#transfer-container').html('<%= content %>')
<% else %>
$('#transfer-container').prepend('<p> Did not receive </p>')
<% end %>