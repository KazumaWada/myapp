class SearchController < ApplicationController
  def search
    # @posts = Post.search(params[:search])
      @posts = Post.search(params[:search])
 end

# def self.search(search)
#   if search
#     Post.where(['content LIKE ?', "%#{search}%"])
#     Post.where(['title LIKE ?', "%#{search}%"])
#   else
#     flash[:success] =　"ヒットしなかったのですべて表示しています。"
#     Post.all.order(created_at: :desc) 
#   end
# end

end