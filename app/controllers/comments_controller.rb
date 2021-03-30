class CommentsController < ApplicationController

    def create
       @post = Post.find(params[:post_id])
       #build=new。慣習的にbuildを使っている。
       @comment = @post.comments.build(comment_params)
       @comment.user_id = current_user.id
       if @comment.save
        flash[:success] = "コメントしました！"
        redirect_to request.referrer || root_url
       end
    end

    def destroy
      @comment = Comment.find(params[:id])
      @comment.destroy
      flash[:success] = "コメントを削除しました！"
      redirect_to request.referrer || root_url
    end

      private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end
end
