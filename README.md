 <% if current_user.liked_by?(post.id) %>
  <td><%= link_to 'いいねじゃない', destroy_like_path(post), method: :DELETE, remote: true %><%= post.likes.count %></td>
  <% else %>
  <td><%= link_to 'いいね', create_like_path(post), method: :POST, remote: true %><%= post.likes.count %></td>
  <% end %>

