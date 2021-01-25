class Tag < ApplicationRecord
    # has_many :post_tags, dependent: :destroy
    # has_many :posts, through: :post_tags
    has_and_belongs_to_many :posts #tag.postsが可能に。
end
