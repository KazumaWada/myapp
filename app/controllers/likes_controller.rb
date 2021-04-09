class LikesController < ApplicationController
    before_action :post_params
  
    def create
      Like.create(user_id: current_user.id, post_id: params[:id])
      # redirect_to request.referrer || root_url
      # flash[:success] = "likeしました！"
    end
  
    def destroy
      Like.find_by(user_id: current_user.id, post_id: params[:id]).destroy
      # redirect_to request.referrer || root_url
      # flash[:danger] = "unlikeしました！"
    end
  
    private
  
    def post_params
      @post = Post.find(params[:id])
    end
  end
  
