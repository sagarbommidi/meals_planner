<% content = escape_javascript(render :partial => "holidays/index_list", :locals => {:holidays => @holidays}) %>
$('#holiday-container').html('<%= content %>')