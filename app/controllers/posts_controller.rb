class PostsController < ApplicationController
    before_action :logged_in_user, only: [:new, :create, :destroy, :edit, :update]
    before_action :correct_user,   only: [:destroy, :edit, :update]
    
    impressionist :actions=> [:show]
    
   def index
    redirect_to request.referrer || '/'
    @posts = Post.page(params[:page]).per(5)     
   end

   def show
     @post = Post.find(params[:id])
     @posts = Post.page(params[:page]).per(4)
     # view数(詳細ページを訪れると、カウントされる仕組み。)
      impressionist(@post, nil, unique: [:session_hash])
      @comment = Comment.new
      @comments = @post.comments
      @user = User.find_by(id: @post.user_id)
    end

    def new
        @post=current_user.posts.build if logged_in?
        @comment = Comment.new(post_id: params[:post_id])
    end

    def create
      @post = current_user.posts.build(post_params)
      @user = User.find_by(id: @post.user_id)
        if @post.save
          flash[:success] = "投稿しました！"
          redirect_to root_url || user_path(@user)
          # redirect_to request.referrer || '/'
        else
          render 'posts/new'
        end
    end

    def edit
     @post = Post.find(params[:id])
    end

    def update
     @post = Post.find(params[:id])
     if @post.update(post_params)
      flash[:success]="記事を更新しました。"
      redirect_to @post
     else
      render 'edit'
     end
    end
  
    def destroy
      @post = Post.find(params[:id])
      @post.destroy
      flash[:success] ="削除しました"
      redirect_to request.referrer || root_url
    end  

    def hashtags
      tag = Tag.find_by(name: params[:name])
      @posts = tag.posts
      @tag_name = Tag.find_by(name: params[:name])
      # render template: "pages/home"
    end
   
    def search
      @posts = Post.search(params[:search])
    end


    private

    def post_params
      params.require(:post).permit(:content, :image, :title, :covid, tag_ids: [] )
    end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end
end
