# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name:  "main-user",
    email: "main@gmail.com",
    year: "1年",
    bio: "hello!",
    password:              "password",
    password_confirmation: "password",
    admin: true,
    activated: true,
    activated_at: Time.zone.now)

#簡単ログインのユーザー
User.create!(name: "簡単ログインしたユーザー",
  email: "smooth_login@example.com",
  year: "3年",
  bio: "hello!私はゲストユーザーです。",
  password:              "password",
  password_confirmation: "password",
  admin: false,
  activated: true,
  activated_at: Time.zone.now)


# 追加のユーザーをまとめて生成する
99.times do 
# name  = Faker::Name.name
# email = "fake-#{n+1}@example.com"
name = Faker::Games::Pokemon.name
email = Faker::Internet.email
avatar = Faker::Avatar.image(slug: "my-own-slug", size: "50x50", format: "jpg") 
password = "password"
User.create!(
      avatar: avatar,
      name:  name,
      email: email,
      year: "5年",
      bio: "hello!hello!hello!hello!",
      password:              password,
      password_confirmation: password,
      activated: true,
      activated_at: Time.zone.now)


#適当にrelationshipを作る。
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

end

# 10.times do
#   content = Faker::Lorem.sentence(word_count: 1000)
#   tag = "移住"
#   users.each { |user| user.posts.create!(content: content) }
#   users.each { |user| user.posts.create!(tag: tag) }
# end