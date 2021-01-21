class PagesController < ApplicationController

   def home
     #tag_idがセットされていたらTagから関連づけられたpostsを呼び、tag_idの指定がなければ、全ての投稿を表示するよう記述されてい
     @posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : Post.all.order(created_at: :desc) 
   end

def about
end

end

