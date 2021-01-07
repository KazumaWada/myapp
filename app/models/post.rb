class Post < ApplicationRecord
  belongs_to :user
  #画像アップロードCarrierWave(imageはカラム。)
  mount_uploader :image, ImageUploader
  #rails6リッチテキスト
  has_rich_text :content
  #rails active_storage:installによって可能に。
  has_many_attached :image
  validates :user_id, presence: true
  # validates :content, presence: true, length: { maximum: 5000 }
  # validates :title, presence: true, length: { maximum: 30 }
  # validates :tag, presence: true, length: { maximum: 10 }
　# /post/newで投稿を作ると、user.rbのこれ↓が機能しなかったから。
  default_scope -> { order(created_at: :desc) }
  #画像サイズの制限
  validates :image,   content_type: { in: %w[image/jpeg image/gif image/png],
    message: "must be a valid image format" },
size:         { less_than: 5.megabytes,
    message: "should be less than 5MB" }

   #画像サイズが1000*1000を超えないように。
    def display_image
      image.variant(resize_to_limit: [1000, 1000])
    end
end
