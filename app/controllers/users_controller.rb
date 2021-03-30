class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy, :following, :followers]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def index
    @users = User.paginate(page: params[:page])
  end

  # 特定のユーザーを表示する
  def show
    @user=User.find(params[:id])
    @posts = @user.posts.paginate(page: params[:page])
    @smooth_login_user = User.find_by(email: "smooth_login@example.com")
    @newer_posts = @user.posts.order(created_at: 'DESC')
  end

  # rails-ujsで実装したので、コメントアウト。
  # def smooth
  #   flash[:danger] = "ゲストユーザーは編集できません。"
  #   redirect_to request.referrer || 'users/1'
  # end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:info] = "ベルリンなうへようこそ！さっそく右上のボタンからログインしよう！ →"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

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

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

end
