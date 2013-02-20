<% if @transfer.valid? %>
<% content = escape_javascript(render :partial => 'transfers/transfers_content') %>
$('#today_transfer').html('<%= content %>')
<% else %>
$('#today_transfer').prepend('<p>Failed to cancel...</p>')
<% end %>