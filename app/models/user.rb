class User < ApplicationRecord
    before_save { email.downcase! }
    validates :name,  presence: true, length: { maximum: 20 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 100 },
              format: { with: VALID_EMAIL_REGEX },
              uniqueness: true
     #User作成で、passwordとpassword_confirmation,authenticateが使える。DBテーブルにはないが。
     has_secure_password
     #password min 6
     validates :password, presence: true, length: { minimum: 6 }

     #<%= User.digest('password') %>
     def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                      BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end
end
