$('#transfer-button').hide()
<% contentnew = escape_javascript(render :partial => 'transfers/transfers_content') %>
$('#today_transfer').html('<%= contentnew %>')