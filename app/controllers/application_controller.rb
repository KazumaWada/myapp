class ApplicationController < ActionController::Base
    include SessionsHelper

  #userのupdate,editとpostで使用 
  def logged_in_user
    #session_helper
    unless logged_in?
      store_location
      flash[:danger]="ログインしてください"
      redirect_to login_url
    end
  end

end
