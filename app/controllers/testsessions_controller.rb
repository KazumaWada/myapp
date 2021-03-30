class TestsessionsController < ApplicationController
    def create
        user=User.find_by(email:"smooth_login@example.com")
        session[:user_id] = user.id
        flash[:success] = "ゲストユーザとしてログインしました！"
        redirect_to request.referrer || root_url
      end
end
