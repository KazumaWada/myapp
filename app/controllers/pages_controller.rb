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

    #  @posts = Post.page(params[:page]).per(4)
   



 　newer_posts = Post.order(created_at: 'DESC')
  @newer_posts = Post.page(params[:page]).per(4)

     posts_get_likes = Post.includes(:liked_users).sort {|a,b| b.liked_users.size <=> a.liked_users.size}
    #ここで上のpostsを定義して、@postsに代入している。
     @posts_get_likes = Kaminari.paginate_array(posts_get_likes).page(params[:page]).per(4)

   

     posts_get_views = Post.order(impressions_count: 'DESC')
     @posts_get_views = Kaminari.paginate_array(posts_get_views).page(params[:page]).per(4)




   end 

  def about
  end

end
