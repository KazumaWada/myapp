class Post < ApplicationRecord
  # 投稿が消されたら、コメントも一緒に消す。
  has_many :comments, dependent: :destroy
  belongs_to :user
  # has_many :post_tags, dependent: :destroy
  has_and_belongs_to_many :tags
  has_many :likes
  #likeした人を取得
  has_many :liked_users, through: :likes, source: :user
  # view数 
  is_impressionable counter_cache: true
  #画像アップロードCarrierWave(imageはカラム。)
  mount_uploader :image, ImageUploader
  #validation
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 5000 }
  validates :title, presence: true, length: { maximum: 30 }
  validates :covid, presence: true

  #search
  def self.search(search)
    if search
      # Post.where(['content LIKE ?', "%#{search}%"])
      Post.where(["content LIKE ? or title Like ?", "%#{search}%", "%#{search}%"])
    else
      Post.all.order(created_at: :desc) 
    end
  end

  #tagのcallback
  after_create do
    post = Post.find_by(id: self.id)
    #post.content内に#があたら、それに続く文字列を取得する。(/#\w+/)は日本語に対応できているか？
     hashtags = self.content.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
     hashtags.uniq.map do |hashtag|
      #すでにあったらそれ。なかったら作る。         #はDBに格納しない。
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
      # <<配列に要素を追加する。
      post.tags << tag
    end
  end
  #tag
  before_update do
    post = Post.find_by(id: self.id)
    #update時に一旦既存のhashtagを消す。そしてまた追加する。
    post.tags.clear
    hashtags = self.content.scan(/#\w+/)
    #hashtags = self.body.scan(/#\w+/)
    #map: hashtags配列に入っている要素を順に実行する。
    hashtags.uniq.map do |hashtag|
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
      post.tags << tag
  end
end

end
