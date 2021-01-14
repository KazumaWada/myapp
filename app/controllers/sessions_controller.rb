class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
    #ユーザーが有効である場合にのみログインできるようにログイン方法を変更する必要がある。
    if user.activated?#user.rb
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_back_or user
    else
      message  = "Account not activated. "
      message += "Check your email for the activation link."
      flash[:warning] = message
      redirect_to root_url
    end
    else 
    flash.now[:danger] = '正しく認証されませんでした。'
     # render 'pages/home'これにするとhomeページへ行く。
     render 'new'
  end
end
  def destroy
    #sessions_helper
    log_out
    flash[:success] = "ログアウトしました！"
    redirect_to root_url
    
  end
end
