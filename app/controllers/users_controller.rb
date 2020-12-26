class UsersController < ApplicationController
# コントロールの内容は全部コンソールで実行する時のコマンドなのかな


  # 特定のユーザーを表示する
  def show
    @user=User.find(params[:id])
    #正常に処理が行われると、@user=User.find(1)となる。
  end
  def new
    @user = User.new
  end


  # resources :usersをroutes.rbファイルに追加すると（リスト 7.3）自動的にRailsアプリケーションが
  # 表 7.1のRESTful URI に応答するようになったことを思い出してください。
  # 特に、/usersへのPOSTリクエストはcreateアクションに送られます。
  def create
    @user = User.new(user_params) 
    if @user.save
      flash[:success] = "Welcome to ベルリンなう!"
      # 新規登録成功
      redirect_to @user
    else
      # 新規登録失敗
      render 'new'
    end
  end

   private
   def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end
