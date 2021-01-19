class PagesController < ApplicationController

   def home
     @posts = Post.all.order(created_at: :desc) 
    #  @user = @posts.user(params[:id])
    #  binding.pry 
    
     
     
   #   @user=User.find(params[:id])
    #  @post = Post.find(params[:id])
     
    #  @comment = Post.comment(params[:id])
  
  
    #   if logged_in?
    #  @post = current_user.posts.build
    # end
   end

def about
end

end

