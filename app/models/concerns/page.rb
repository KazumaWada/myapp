class Page < ApplicationRecord
    # キーワード 'extend ActiveSupport::Concern'
    extend Post::Models
    extend User::Models

    def liked_by?(post_get_like)
        likes.where(post_id: post_get_like).exists?
    end
end