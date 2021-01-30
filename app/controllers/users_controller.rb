class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy, :following, :followers]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
# コントロールの内容は全部コンソールで実行する時のコマンドなのかな
# new=edit, create=edit。イコールではないけど、機能はほぼ同じ。

  #全てのユーザーを表示する。
  def index
    #########userがしたいいね一覧.Rspecでエラーになるから、一時コメントアウト。############
    # @favorite_posts = current_user.favorite_posts
    #########userがしたいいね一覧.Rspecでエラーになるから、一時コメントアウト。############
    @users = User.paginate(page: params[:page])
    
  end

  # 特定のユーザーを表示する
  def show
      #########userがしたいいね一覧.Rspecでエラーになるから、一時コメントアウト。############
  
    #########userがしたいいね一覧.Rspecでエラーになるから、一時コメントアウト。############
    @user=User.find(params[:id])
    #正常に処理が行われると、@user=User.find(1)となる。
    @posts = @user.posts.paginate(page: params[:page])
   @favorite_posts = current_user.favorite_posts

    # view数(詳細ページを訪れると、カウントされる仕組み。)
    # impressionist(@user, nil, unique: [:session_hash])
    
   #これは別にログインしてなくてもよくね？
    # if logged_in?
      # @post  = current_user.posts.build
      # @contents_feed = current_user.feed.paginate(page: params[:page])
    # end

# 　　これなんじゃないかと思ってきたこれは個人のpost。
    # @post = current_user.posts.find_by(id: params[:id])
  end

  #signup
  def new
    @user = User.new
  end


  # resources :usersをroutes.rbファイルに追加すると、自動的にRailsアプリケーションが
  # RESTful URI に応答する。/usersへのPOSTリクエストはcreateアクションに送られます。
 

 #作成したら、プロフィールがすぐに見えるようにしたい。
 #rootでユーザー登録をユーザーアイコンに変えるとか、users/:idに移動させるとか。
  def create
    @user = User.new(user_params)
    if @user.save
      #mailerいらないかな。
      #@user.send_activation_email#user.rb
      #flash[:info] = "Please check your email to activate your account."
      flash[:info] = "ベルリンなうへようこそ！さっそく右上のボタンからログインしよう！ →"
      redirect_to root_url
    else
      render 'new'
    end
  end





  #ユーザーを見つけるだけ。
  def edit
    @user = User.find(params[:id])
  end

  #ユーザーを更新は、updateを使って送信されたparamsハッシュに基いて行う。createと似ている。
  #updateは、createと違い、すでに情報を持っているから、それを探す処理。
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      #成功
      flash[:success]="Updateしました。"
      redirect_to @user
    else
      #失敗
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "削除しました。"
    redirect_to users_url
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end


   private


  def user_params
    params.require(:user).permit(:name, :email, :year, :bio, :avatar, :password,
                                 :password_confirmation)
  end

  #before edit,update make sure 
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end


    # 管理者かどうか確認
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end



end
