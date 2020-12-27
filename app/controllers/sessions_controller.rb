class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
    #sessions_helper
    log_in user
    redirect_to user
    else 
    flash.now[:danger] = '正しく認証されませんでした。'
     # render 'pages/home'これにするとhomeページへ行く。
     render 'new'
  end
end
  def delete
    #sessions_helper
    log_out
    redirect_to root_url
  end
end
