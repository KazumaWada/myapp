class Comment < ApplicationRecord
    belongs_to :post, optional: true
    validates :comment,  presence: true, length: { maximum: 1000 }
end
