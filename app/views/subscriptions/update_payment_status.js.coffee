<% content = escape_javascript(render :partial => "admins/subscription_list", :locals => {:subscription_type => @s_type}) %>
$("#stype-container").html('<%= content %>')