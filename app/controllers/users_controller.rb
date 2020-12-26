class UsersController < ApplicationController
  # 特定のユーザーを表示する
  def show
    @user=User.find(params[:id])
    #正常に処理が行われると、@user=User.find(1)となる。
  end
  def new
  end
end
