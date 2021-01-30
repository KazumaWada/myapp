#controllerはリクエストが来たら、特定の指示を返す。この特定の指示が書かれている。
class PostsController < ApplicationController
    before_action :logged_in_user, only: [:new, :create, :destroy, :edit, :update]
    before_action :correct_user,   only: [:destroy, :edit, :update]

   def index
    #  @posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : Post.all.order(created_at: :desc) 
    #新しい順は、モデルで設定するか？paginate書いたから。
    @posts = Post.page(params[:page]).per(5)

    # @post = Post.find(params[:id])
     #home画面に投稿を表示するため。
    #  if logged_in?
    #   @post = current_user.posts.build
    #       @contents_feed = current_user.feed.paginate(page: params[:page])
    #  end
     
   end

    def show
      # @posts = Post.all.order(created_at: :desc) 
     @post = Post.find(params[:id])
     @posts = Post.page(params[:page]).per(4)
     # view数(詳細ページを訪れると、カウントされる仕組み。)
      impressionist(@post, nil, unique: [:session_hash])
      @comment = Comment.new
      @comments = @post.comments
      @user = User.find_by(id: @post.user_id)
      @favorite_posts = current_user.favorite_posts
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

  # ユーザーを見つけるだけ。あとはrailsが処理してくれる。
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

    #同じインスタンス変数でも、アクションごとに定義が区別されているから大丈夫。
    def hashtags
      tag = Tag.find_by(name: params[:name])
      @posts = tag.posts
    end
   

    # これを書くと、リロードするたびにview数が増える。コメントアウトすると、一度だけしか反映されない。
    impressionist :actions=> [:show]
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
