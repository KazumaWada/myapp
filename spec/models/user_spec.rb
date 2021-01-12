require 'rails_helper'
#本当に正しいテストを書いているのか確認するために、toをto_notに変えてみるというやり方がある。
RSpec.describe User, type: :model do

  it "passwordの長さ{ minimum: 6 }, allow_nil: true"
  it "yearの長さvalidates{ maximum: 4 }#5年以上で4文字列分だから。"
  it "bioの長さlength: { maximum: 300 }"

  it "is valid with a name, email, password, year and bio" do
  user = User.new(
    name:  "main-user",
    email: "main@gmail.com",
    password: "thisispassword",
    year: "1年",
    bio: "hello!"
  )
  expect(user).to be_valid
  end

  it "is invalid without a name" do
    user = User.new(name:nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it "is invalid without an email" do
    user = User.new(email:nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is invalid without a year" do
   user = User.new(year:nil)
   user.valid?
   expect(user.errors[:year]).to include("can't be blank")
  end

  it "is invalid without bio" do
    user = User.new(bio:nil)
    user.valid?
    expect(user.errors[:bio]).to include("can't be blank")
  end

  it "is invalid with a duplicate email address" do
    User.create(
      name: "example-user",
      email: "this-is-duplicate@example.com",
      year: "1年",
      bio: "hello!",
      password: "this-is-password"
    )
    user = User.new(
      #nameはuniqueである必要はない。
      name: "example-user",
      email: "this-is-duplicate@example.com",
      year: "1年",
      bio: "hello!",
      password: "this-is-password"
    )
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end
   
end
