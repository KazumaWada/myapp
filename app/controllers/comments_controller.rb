class CommentsController < ApplicationController

    def create
       #コメントする対象を指定
       @post = Post.find(params[:post_id])
       #build=new。慣習的にbuildを使っている。
       @comment = @post.comments.build(comment_params)
       @comment.user_id = current_user.id
       if @comment.save
        # render :index#
        flash[:success] = "コメントしました！"
        redirect_to request.referrer || root_url#これでworkするが、非同期ではなくなるlol
        # render :index
       end
    end

    def destroy
      @comment = Comment.find(params[:id])
      @comment.destroy
        # recder :index
        flash[:success] = "コメントを削除しました！"
        redirect_to request.referrer || root_url
      
    end

      private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end
end
