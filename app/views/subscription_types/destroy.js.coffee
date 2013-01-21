<% content = escape_javascript(render :partial => 'subscription_types/index_list', :locals => {:stypes => @stypes}) %>
$('#stype-container').html('<%= content %>')
