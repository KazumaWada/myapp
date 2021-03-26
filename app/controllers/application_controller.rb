class ApplicationController < ActionController::Base
    include SessionsHelper

  # 例外処理
  # rescue_from ActiveRecord::RecordNotFound, with: :render_404
  # rescue_from ActionController::RoutingError, with: :render_404

  # def render_404
  #   render template: 'static_pages/error', status: 404, layout: 'application', content_type: 'text/html'
  # end


  #userのupdate,editとpostで使用 
  def logged_in_user
    #session_helper
    unless logged_in?
      store_location
      redirect_to login_url
    end
  end

  private
  # ログインしていなかったら、rootに戻すメソッド。
   def logged_in_user
     unless logged_in?# ログインしていなければ↓
       redirect_to login_url
       flash[:danger]="ログインしてください"
     end
   end


end
