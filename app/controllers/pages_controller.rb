class PagesController < ApplicationController

   def home
    @posts = Post.all.order(created_at: :desc)

  
      if logged_in?
     @post = current_user.posts.build
      # @contents_feed = current_user.feed.paginate(page: params[:page])
    end
   end

def about
end

end

