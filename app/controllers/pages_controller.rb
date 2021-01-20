class PagesController < ApplicationController

   def home
     @posts = Post.all.order(created_at: :desc) 
   #   @post = Post.find_by(id: params[:id])
   # @post = Post.find_by(id: params[:id])
   
   # @user = User.find_by(id: @post.user_id)
   # binding.pry
     
   #  @user=User.find(params[:id])
   #  @post = Post.find(params[:id])
   #  @post  = current_user.posts.build
  
   #  @user = @post.user.find_by(params[:id])
      
     
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

