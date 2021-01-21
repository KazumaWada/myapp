class PagesController < ApplicationController

   def home
    require 'net/http'
    require 'json'

    @url = 'http://api.openweathermap.org/data/2.5/weather?q=berlin,de&appid=16a5680743eefb3860ffb3112d24ebe9'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)

     #tag_idがセットされていたらTagから関連づけられたpostsを呼び、tag_idの指定がなければ、全ての投稿を表示するよう記述されてい
     @posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : Post.all.order(created_at: :desc)
   end

def about
end

end

