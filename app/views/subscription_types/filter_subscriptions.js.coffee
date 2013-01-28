<% content = escape_javascript(render :partial => "admins/subscription_list", :locals => {:subscription_type => @s_type}) %>
console.log(123)
$("#stype-container").html('<%= content %>')