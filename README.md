
   <% if @favorite_posts.any? %>
      <%= render partial: 'posts/likes_posts', locals: { favorite_posts: @favorite_posts, posts: @posts }%>
      <% else %>
      <p class="mt-5">いいねした投稿はまだありません。</p> 
    <% end %>














      <div id="new" class="tab-pane">
   <%# ここから1 %>

   <%# render partial: 'posts/index', locals: { posts: @posts, user: @user, post: @post, newer_posts: @newer_posts } %>
 

<% if @newer_posts.any? %>

 <% @newer_posts.each do |newer_post| %>
 <%= link_to post_path(newer_post), class: 'text-body' do %> 

   <div class="card mt-2">
      <%= image_tag p.image.url, class: 'img-fluid' %>
      <% end %><%# post_path_link %>
      <div class="card-body">
    　<h5 class="card-title"> 
      <%= link_to user_path(newer_post.user) do %>
   
     <% if newer_post.user.avatar? %>
     <%= image_tag newer_post.user.avatar.url, class: "rounded-circle ", width: "40px", height: "40px" %>
     <% else %>
     <%= image_tag "the-main.jpg", class: "rounded-circle", width: "40px", height: "40px" %>
     <% end %>
      <%# link_to p.user.avatar.url, current_user %>
      <%#image_tag p.user.avatar.url, class: "rounded-circle", width: "40px", height: "40px" %>
     <%= newer_post.title %>
      <p><%= newer_post.user.name %></p> 
      <% end %>
      
        <%# render_with_hashtags(p.content) %>
      </h5>
        <p class="card-text">
        <%# ###########いいね###################### %>

<%# ###########いいね###################### %>


       
        <%# link_to posts_hashtag_path(p.tags) do %> 
        <% newer_post.tags.each do |tag| %>
    　　<span><i class="fas fa-tag"><%= tag.name %></i></span>
        <% end %>
        <%# end %>

        <span>
        <i class="fas fa-eye"><%= newer_post.impressions_count %></i>
        </span>

        </p>
      </div><%# card-body %>
    </div><%# card %>
     
    <% end %><%# each %>
  
     <% end %> <%# ifpostsany? %>

       <div class="mt-4">
   <%= paginate @newer_posts %>
   </div>
   <%# ここまで1 %>
    </div>

