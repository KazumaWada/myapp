class Page < ApplicationRecord
    # キーワード 'extend ActiveSupport::Concern'
    extend Post::Models
    extend User::Models
    extend Tag::Models
end