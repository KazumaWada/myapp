class PagesController < ApplicationController

   def home
     @posts = Post.all.order(created_at: :desc) 
    #  @post = Post.find(params[:id])
     
    #  @comment = Post.comment(params[:id])
  
  
    #   if logged_in?
    #  @post = current_user.posts.build
    # end
   end

def about
end

end

