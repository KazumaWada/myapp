class Page < ApplicationRecord
    # キーワード 'extend ActiveSupport::Concern'
    extend Post::Models
end