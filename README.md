  <span>
  <%# そもそもpost_get_lkeが定義されていないから、ここをみても意味がない %>
  <%# liked_byは定義されているかもしれないけど、引数がhome独特だから、それが定義されていないのかも %>

  <% if current_user.liked_by?(post_get_like.id) %>

  <td>
  <%= link_to destroy_like_path(post_get_like), method: :DELETE, remote: true do %>
  <i class="fas fa-heart"></i>
  <% end %><%= post_get_like.likes.count %>
  </td>

  <% else %>

  <td>
  <%= link_to create_like_path(post_get_like), method: :POST, remote: true do %>
  <i class="far fa-heart"></i>
  <% end %><%= post_get_like.likes.count %>
  </td>

  <% end %> 
 </span>
--------------------------------------------
follow一覧
 <div class="text-left mt-4">
  <h4><%= @user.name %>の<%= @title %>一覧</h4>
  <% if @users.any? %>
    <%= image_tag @user.avatar.url, class: "rounded-circle ", width: "80px", height: "80px" %>
    <%= render @users %>
    <% else %>
    まだ<%= @title %>がいません。
  <% end %>
</div>


 