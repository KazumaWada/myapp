module SessionsHelper
#このsessionはメソッド。ユーザーのブラウザ内の一時cookiesに暗号化済みのユーザーIDが自動で作成されます。
#=ユーザーIDを一時セッションの中に安全に置けるようになった
def log_in(user)
session[:user_id] = user.id
end
#上のIDを別のページで取り出す。そのためには、current_userメソッドを定義して、
#セッションID(session[:user_id])に対応するユーザー名をデータベースから取り出せるようにする。
#User.find(session[:user_id])これだと、ユーザーがログインしていないときに例外が出てしまう。
#User.find_by(id: session[:user_id])これだとnillが返ってこれる。そして、 if session[:user_id]
#と書くと、セッションにユーザーIDが存在しない場合、このコードは単に終了して自動的にnilを返します。
#=falseの場合、例外を出さずにnillを返すためにはどうすればいいかということ。
 
 def current_user
    if session[:user_id]#があれば、
    #@current_userが定義されていれば左で止まる。そうでなければ、右の式に移動する。
    @current_user ||=find_by(id: session[:user_id])
 end
end

 #current_userがnillじゃなければ(!)trueを返す。=current_userがいればtrueを返す。
 def logged_in?
    !current_user.nil?
 end

 def log_out
    #log_inメソッドで作ったIDを削除する。
    session.delete(:user_id)
    #リクエストが来たら。nillにする。
    @current_user = nil
 end





end
