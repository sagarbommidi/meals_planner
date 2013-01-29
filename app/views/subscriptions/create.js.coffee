<% content = escape_javascript(render :partial => 'users/subscription_status') %>
$('#subscription-container').html('<%= content %>')