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

  private
  # ログインしていなかったら、rootに戻すメソッド。
   def logged_in_user
     unless logged_in?# ログインしていなければ↓
       redirect_to login_url
     end
   end


end
