class FavoritesController < ApplicationController

    def create
        favorite = Favorite.new
        favorite.user_id = current_user.id #ログインユーザーのidを格納している。
        favorite.post_id = params[:post_id]#いいねしたpostのidを取得。
      if favorite.save 
        redirect_to request.referrer || root_url
        flash[:success] = "「役に立った」を押しました！"
      else
        redirect_to request.referrer || root_url
        flash[:success] = "いいねがなぜかできません。"
      end  
    end

    def destroy
      Favorite.find_by(params[:post_id]).destroy#paramsだから、method:deleteから飛んで、ここに格納される。
      flash[:success] = "「役に立った」をはずしました。"
      redirect_to request.referrer || root_url
    end
end
