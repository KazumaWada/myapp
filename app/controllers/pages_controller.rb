class PagesController < ApplicationController

   def home
    @posts = Post.all.order(created_at: :desc)

     #home画面に投稿を表示するため。
      if logged_in?
     @post = current_user.posts.build
       #個人の投稿の塊。ランダムな人の投稿の塊ではない。
         @contents_feed = current_user.feed.paginate(page: params[:page])
    end
   end

def about
end

end

