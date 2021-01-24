class PagesController < ApplicationController

   def home
    require 'net/http'
    require 'json'

    #@url = 'http://api.openweathermap.org/data/2.5/weather?q=berlin,de&appid=16a5680743eefb3860ffb3112d24ebe9'
    @url = 'http://api.openweathermap.org/data/2.5/weather?q=berlin,de&units=metric&lang=ja&appid=16a5680743eefb3860ffb3112d24ebe9'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)

    @news_url= "http://newsapi.org/v2/top-headlines?country=de&apiKey=ca353a3264a64acf94e34b80c70202cb"
    @news_uri = URI(@news_url)
    @response = Net::HTTP.get(@news_uri)
    @news_output = JSON.parse(@response)
   

     #tag_idがセットされていたらTagから関連づけられたpostsを呼び、tag_idの指定がなければ、全ての投稿を表示するよう記述されてい
     @posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : Post.all.order(created_at: :desc)
     @search_posts = Post.all.order(created_at: :desc)
   end

def about

   @news_url= "http://newsapi.org/v2/top-headlines?country=de&apiKey=ca353a3264a64acf94e34b80c70202cb"
   @news_uri = URI(@news_url)
   @response = Net::HTTP.get(@news_uri)
   @news_output = JSON.parse(@response)



   require 'net/http'
   require 'json'

   @url = 'http://api.openweathermap.org/data/2.5/weather?q=berlin,de&lang=ja&appid=16a5680743eefb3860ffb3112d24ebe9'
   @uri = URI(@url)
   @response = Net::HTTP.get(@uri)
   @output = JSON.parse(@response)




end

end
