class CommentsController < ApplicationController

    def new
        @comment = Comment.new
    end      

    def create
        @comment = Comment.new(comment_params)
        if @comment.save
         flash[:success] = 'コメントが送信されました。'
         redirect_to root_url
        else
            render 'new'
        end
    end

      private


  def comment_params
    params.require(:comment).permit(:comment, :post_id)
  end
end
