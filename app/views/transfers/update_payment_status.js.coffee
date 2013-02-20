<% if @transfer.valid? %>
<% contentnew = escape_javascript(render :partial => 'transfers/transfers_content') %>
$('#today_transfer').html('<%= contentnew %>')
<% else %>
$('#update_payment').prepend('<p> Could not receive </p>')
<% end %>