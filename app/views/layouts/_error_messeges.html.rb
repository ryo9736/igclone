<% if @post.errors.any? %>
<div class="alert alert-warning">
  <ul>
    <% @post.errors.full_messages.each do |msg| %>
     <li>
     <%= msg %>
     </li>
    <% end %>
   </ul>
</div>
<% end %>