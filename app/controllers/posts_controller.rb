#controllerはリクエストが来たら、特定の指示を返す。この特定の指示が書かれている。
class PostsController < ApplicationController
    before_action :logged_in_user, only: [:new, :create, :destroy, :edit, :update]
    before_action :correct_user,   only: [:destroy, :edit, :update]

    # これを書くと、リロードするたびにview数が増える。コメントアウトすると、一度だけしか反映されない。
    # impressionist :actions=> [:show]


   #posts/1ではなく、user/1/post/1とかの方が良く無い？？「投稿詳細　router」ググる。
   def index
    # @posts = @user.posts.paginate(page: params[:page])
    @post = Post.find(params[:id])
    @posts = Post.all.order(created_at: :desc)
     #home画面に投稿を表示するため。
     if logged_in?
      @post = current_user.posts.build
        #個人の投稿の塊。ランダムな人の投稿の塊ではない。
          @contents_feed = current_user.feed.paginate(page: params[:page])
     end
     
   end

    def show
      # @posts = Post.all.order(created_at: :desc) 
     @post = Post.find(params[:id])
     # view数(詳細ページを訪れると、カウントされる仕組み。)
      impressionist(@post, nil, unique: [:session_hash])
      @comment = Comment.new
      @comments = @post.comments
      @user = User.find_by(id: @post.user_id)
    end

    def new
        @post=current_user.posts.build if logged_in?
        @comment = Comment.new(post_id: params[:post_id])
        # これじゃダメなの??
        # @post = Post.new
    end

    def create
        @post = current_user.posts.build(post_params)
        # binding.pry
        if @post.save
          # flash[:success] = render_to_string(:partial => "shared/check_my_post")
          flash[:success] = "投稿しました！"#ここに、「投稿を見に行く」とかがあったらいいかも。
          #ここをuser/:idに。
          redirect_to root_url
        else
          #失敗した場合に壊れてしまわないように、@を置いておく。
         @contents_feed = current_user.feed.paginate(page: params[:page])
          render 'posts/new'
        end
      end




  # ユーザーを見つけるだけ。
  # def edit
  #   @user = User.find(params[:id])
  # end

  # ユーザーを更新は、updateを使って送信されたparamsハッシュに基いて行う。createと似ている。
  # updateは、createと違い、すでに情報を持っているから、それを探す処理。
  # def update
  #   @user = User.find(params[:id])
  #   if @user.update(user_params)
      
  #     flash[:success]="Updateしました。"
  #     redirect_to @user
  #   else
  #     render 'edit'
  #   end
  # end

  
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
      @post.destroy
      flash[:success] ="post deleted"
                  #一つ前のurlを返す。元に戻すurlが見つからなかった場合、users/:id。
      # redirect_to request.referrer || root_url
      # redirect_to request.referrer　これはエラーなし。
      #ホームにする。東欧したものがすぐ観れるのはhomeもusers/:idも変わらないから。
      redirect_to request.referrer || root_url
    end  

    # そのうち作る。def edit
    # end

    private

    def post_params
      params.require(:post).permit(:content, :image, :title, :tag, :covid )
    end


    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end

end
