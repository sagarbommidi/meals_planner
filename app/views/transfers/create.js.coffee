<% content = escape_javascript(render :partial => 'users/transfer_details') %>
$('#transfer-container').html('<%= content %>')
<% contentnew = escape_javascript(render :partial => 'users/todays_transfers') %>
$('#today_transfer').html('<%= contentnew %>')