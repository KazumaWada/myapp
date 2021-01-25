module PostsHelper
    def render_with_hashtags(content)
        #ハッシュタグの文字を、gsubを使って、wordに変える。
        content.gsub(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/){|word| link_to word, "/posts/hashtag/#{word.delete('#')}"}.html_safe
    end
end
