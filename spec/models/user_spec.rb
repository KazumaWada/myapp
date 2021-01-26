require 'rails_helper'
#本当に正しいテストを書いているのか確認するために、toをto_notに変えてみるというやり方がある。
RSpec.describe User, type: :model do

  # ここからfactory
  let(:user) { FactoryBot.create(:user) }

  describe User do 
    #  有効なfactoryか？
    it "has a valid factory" do 
      expect(user).to be_valid
    end
  end

  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_length_of(:name).is_at_most(100) }

  it { is_expected.to validate_presence_of :email }
  #it { is_expected.to validate_uniqueness_of(:email).case_insensitive } ・・・(*)
  it { is_expected.to validate_length_of(:email).is_at_most(200) }

  it { is_expected.to validate_presence_of :password }
  it { is_expected.to validate_length_of(:password).is_at_least(6) }
  
  it { is_expected.to validate_presence_of :year }
  it { is_expected.to validate_length_of(:year).is_at_most(4) }

  it { is_expected.to validate_presence_of :bio }
  it { is_expected.to validate_length_of(:bio).is_at_most(300) }

  it "is invalid with a duplicate email adress" do 
    FactoryBot.create(:user, email: "aaron@example.com")
    user = FactoryBot.build(:user, email: "aaron@example.com")
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end

#emailの有効性
describe "email validation with proper address form" do
   #無効な場合
   it "is invalid address form" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. 
      foo@bar_baz.com foo@bar+baz.com]
      invalid_addresses.each do |invalid_address|
        user.email = invalid_address
        expect(user).to_not be_valid
      end
    end
    #有効な場合
    it "is valid addressnform" do
      valid_adresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      valid_adresses.each do |valid_adress|
        user.email = valid_adress
        expect(user).to be_valid
      end
    end
end# describe "email validation with proper address form" do


end












  # ここまでfactoryboy


  # it "is valid with a name, email, password, year and bio" do
  # user = User.new(
  #   name:  "main-user",
  #   email: "main@gmail.com",
  #   password: "thisispassword",
  #   year: "1年",
  #   bio: "hello!"
  # )
  # expect(user).to be_valid
  # end

  # it "is invalid without a name" do
  #   user = User.new(name:nil)
  #   user.valid?
  #   expect(user.errors[:name]).to include("can't be blank")
  # end

  # it "is invalid without an email" do
  #   user = User.new(email:nil)
  #   user.valid?
  #   expect(user.errors[:email]).to include("can't be blank")
  # end

  # it "is invalid without a year" do
  #  user = User.new(year:nil)
  #  user.valid?
  #  expect(user.errors[:year]).to include("can't be blank")
  # end

  # it "is invalid without bio" do
  #   user = User.new(bio:nil)
  #   user.valid?
  #   expect(user.errors[:bio]).to include("can't be blank")
  # end

  # it "is invalid with a duplicate email address" do
  #   User.create(
  #     name: "example-user",
  #     email: "this-is-duplicate@example.com",
  #     year: "1年",
  #     bio: "hello!",
  #     password: "this-is-password"
  #   )
  #   user = User.new(
  #     #nameはuniqueである必要はない。
  #     name: "example-user",
  #     email: "this-is-duplicate@example.com",
  #     year: "1年",
  #     bio: "hello!",
  #     password: "this-is-password"
  #   )
  #   user.valid?
  #   expect(user.errors[:email]).to include("has already been taken")
  # end
   

