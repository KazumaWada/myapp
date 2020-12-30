class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    default_scope -> { order(created_at: :desc) }
    attr_accessor :remember_token, :activation_token
    before_save   :downcase_email
    before_create :create_activation_digest
    validates :name,  presence: true, length: { maximum: 100 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 200 },
              format: { with: VALID_EMAIL_REGEX },
              uniqueness: true
     #User作成で、passwordとpassword_confirmation,authenticateが使える。DBテーブルにはないが。
     has_secure_password
     #password min 6, パスワードが空でも、updateできるようにする。
     validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

     #<%= User.digest('password') %>
     def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                      BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end


    #undefined method `new_token' for
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def session_token
    remember_digest || remember
  end

  # mailerのトークンとダイジェストが一致したか？
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  #アカウントを有効化
  def activate
    update_attribute(:activated,    true)
    update_attribute(:activated_at, Time.zone.now)
  end
  #アカウント有効のメールを送信する
  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end


  #全てのユーザーがfeedを持つから。(まだ完全ではない。)
  def feed
    Post.where("user_id = ?", id)#=posts
  end



    private

        def downcase_email
            self.email = email.downcase
        end
    # 有効化トークンとダイジェストを作成および代入。ユーザーが作られる前にそのトークンとダイジェストが必要だから。
     def create_activation_digest
        self.activation_token  = User.new_token
        self.activation_digest = User.digest(activation_token)
    end
end
