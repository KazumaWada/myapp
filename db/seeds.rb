# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

name = Faker::Name.name
email = Faker::Internet.email
User.create!(name:  "main-user",
    email: "main@gmail.com",
    avatar: File.open(Rails.root.join('app', 'assets', 'images', 'faker-img-1.png')),
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
  avatar: File.open(Rails.root.join('app', 'assets', 'images', 'faker-img-10.png')),
  year: "3年",
  bio: "hello!私はゲストユーザーです。",
  password:              "password",
  password_confirmation: "password",
  admin: false,
  activated: true,
  activated_at: Time.zone.now)


#Userは、決してDRYな書き方ではないが、faker::avatarのgemが機能しないので、一人一人のurlを指定して書くことにした。
# avatar以外を9回繰り返し、avatarは9回書く

  User.create!(
  name: Faker::FunnyName.two_word_name,
  email: Faker::Internet.email,
  avatar: File.open(Rails.root.join('app', 'assets', 'images', 'faker-img-2.png')),
  year: "3年",
  bio: "hello!私はfakerです。",
  password:              "password",
  password_confirmation: "password",
  admin: false,
  activated: true,
  activated_at: Time.zone.now)

    User.create!(
      name: Faker::FunnyName.two_word_name,
      email: Faker::Internet.email,
      avatar: File.open(Rails.root.join('app', 'assets', 'images', 'faker-img-3.png')),
      year: "3年",
      bio: "hello!私はfakerです。",
      password:              "password",
      password_confirmation: "password",
      admin: false,
      activated: true,
      activated_at: Time.zone.now)

      User.create!(
        name: Faker::FunnyName.two_word_name,
        email: Faker::Internet.email,
        avatar: File.open(Rails.root.join('app', 'assets', 'images', 'faker-img-4.png')),
        year: "3年",
        bio: "hello!私はfakerです。",
        password:              "password",
        password_confirmation: "password",
        admin: false,
        activated: true,
        activated_at: Time.zone.now)

  
     User.create!(
      name: Faker::FunnyName.two_word_name,
      email: Faker::Internet.email,
      avatar: File.open(Rails.root.join('app', 'assets', 'images', 'faker-img-5.png')),
      year: "3年",
      bio: "hello!私はfakerです。",
      password:              "password",
      password_confirmation: "password",
      admin: false,
      activated: true,
      activated_at: Time.zone.now)

    User.create!(
      name: Faker::FunnyName.two_word_name,
      email: Faker::Internet.email,
      avatar: File.open(Rails.root.join('app', 'assets', 'images', 'faker-img-6.png')),
      year: "3年",
      bio: "hello!私はfakerです。",
      password:              "password",
      password_confirmation: "password",
      admin: false,
      activated: true,
      activated_at: Time.zone.now)

  User.create!(
    name: Faker::FunnyName.two_word_name,
    email: Faker::Internet.email,
    avatar: File.open(Rails.root.join('app', 'assets', 'images', 'faker-img-7.png')),
    year: "3年",
    bio: "hello!私はfakerです。",
    password:              "password",
    password_confirmation: "password",
    admin: false,
    activated: true,
    activated_at: Time.zone.now)
     
    #   User.create!(
    #     name: Faker::FunnyName.two_word_name,
    #     email: Faker::Internet.email,
    #     avatar: File.open(Rails.root.join('app', 'assets', 'images', 'faker-img-8.png')),
    #     year: "3年",
    #     bio: "hello!私はfakerです。",
    #     password:              "password",
    #     password_confirmation: "password",
    #     admin: false,
    #     activated: true,
    #     activated_at: Time.zone.now)

    # User.create!(
    #   name: Faker::FunnyName.two_word_name,
    #   email: Faker::Internet.email,
    #   avatar: File.open(Rails.root.join('app', 'assets', 'images', 'faker-img-9.png')),
    #   year: "3年",
    #   bio: "hello!私はfakerです。",
    #   password:              "password",
    #   password_confirmation: "password",
    #   admin: false,
    #   activated: true,
    #   activated_at: Time.zone.now)
  
  # User.create!(
  #   name: Faker::FunnyName.two_word_name,
  #   email: Faker::Internet.email,
  #   avatar: File.open(Rails.root.join('app', 'assets', 'images', 'faker-img-10.png')),
  #   year: "3年",
  #   bio: "hello!私はfakerです。",
  #   password:              "password",
  #   password_confirmation: "password",
  #   admin: false,
  #   activated: true,
  #   activated_at: Time.zone.now) 

# 1.times do |n|
User.all.each do |user|
  user.posts.create!(
    title: Faker::Lorem.word,
    content: '#街並み udin iLorem ipsum dolor sit amet, consectetur adipiscing elit. #生活　Phasellus magna enim, tempus tristique dignissim sit amet, iaculis in nibh. Vestibulum sed neque nibh. Morbi augue nunc, interdum quis nunc sit amet, auctor dignissim neque. Nunc mi eros, vehicula molestie mollis in, porta vitae nulla. Sed in lobortis arcu. Nullam ante purus, tincidunt sit amet eros ut, dignissim pellentesque lectus. Proin semper vestibulum lacus, quis hendrerit turpis venenatis in. Vivamus vel porta augue. Integer quis ullamcorper ex. Nunc lacinia arcu et justo pretium, ut porttitor neque feugiat. Maecenas facilisis consectetur metus sit amet imperdiet. Nullam vel felis dapibus, accumsan purus sed, pretium massa. Nullam condimentum augue eget lectus blandit, sit amet elementum elit tincidunt. Aliquam ac tellus diam. Nullam dignissim tempus est, non vulputate nisi egestas ultricies.allis.',
    covid: 'コロナ後',
    image: File.open(Rails.root.join('app', 'assets', 'images', 'post-img03.jpg'))
  )
end
# end

# 1.times do |n|
  User.all.each do |user|
    user.posts.create!(
      title: Faker::Lorem.word,
      content: '#移住 udin id Lorem ipsum dolor sit amet, #転職　consectetur adipiscing elit. Phasellus magna enim, tempus tristique dignissim sit amet, iaculis in nibh. Vestibulum sed neque nibh. Morbi augue nunc, interdum quis nunc sit amet, auctor dignissim neque. Nunc mi eros, vehicula molestie mollis in, porta vitae nulla. Sed in lobortis arcu. Nullam ante purus, tincidunt sit amet eros ut, dignissim pellentesque lectus. Proin semper vestibulum lacus, quis hendrerit turpis venenatis in. Vivamus vel porta augue. Integer quis ullamcorper ex. Nunc lacinia arcu et justo pretium, ut porttitor neque feugiat. Maecenas facilisis consectetur metus sit amet imperdiet. Nullam vel felis dapibus, accumsan purus sed, pretium massa. Nullam condimentum augue eget lectus blandit, sit amet elementum elit tincidunt. Aliquam ac tellus diam. Nullam dignissim tempus est, non vulputate nisi egestas ultricies. efficitur sem sed sagittis convallis.',
      covid: 'コロナ後',
      image: File.open(Rails.root.join('app', 'assets', 'images', 'post-img01.jpg'))
    )
  end
  # end

  # 1.times do |n|
    User.all.each do |user|
      user.posts.create!(
        title: Faker::Lorem.word,
        content: '#転職 udin id mrisLorem #ワーキングホリデー ipsum dolor sit amet, consectetur adipiscing elit. Phasellus magna enim, tempus tristique dignissim sit amet, iaculis in nibh. Vestibulum sed neque nibh. Morbi augue nunc, interdum quis nunc sit amet, auctor dignissim neque. Nunc mi eros, vehicula molestie mollis in, porta vitae nulla. Sed in lobortis arcu. Nullam ante purus, tincidunt sit amet eros ut, dignissim pellentesque lectus. Proin semper vestibulum lacus, quis hendrerit turpis venenatis in. Vivamus vel porta augue. Integer quis ullamcorper ex. Nunc lacinia arcu et justo pretium, ut porttitor neque feugiat. Maecenas facilisis consectetur metus sit amet imperdiet. Nullam vel felis dapibus, accumsan purus sed, pretium massa. Nullam condimentum augue eget lectus blandit, sit amet elementum elit tincidunt. Aliquam ac tellus diam. Nullam dignissim tempus est, non vulputate nisi egestas ultricies.da. Duis efficitur sem sed sagittis convallis.',
        covid: 'コロナ後',
        image: File.open(Rails.root.join('app', 'assets', 'images', 'post-img02.jpg'))
      )
    end
    # end

# user.posts.create!(

# )



# Comment.create([
#   {
#     message: "こんにちは！今度ご一緒にどうですか？",
#     user_id: 1,
#     post_id: 4
#   },
#   {
#     message: "halhalさん久しぶり！是非是非！今週の日曜でどう？",
#     user_id: 13,
#     post_id: 4
#   },
#   {
#     message: "ちょっと日程確認してきます！",
#     user_id: 1,
#     post_id: 4
#   },
# ])




 


# 追加のユーザーをまとめて生成する

# 99.times do 
# name = Faker::Games::Pokemon.name
# email = Faker::Internet.email
# avatar = Faker::Avatar.image(slug: "my-own-slug", size: "50x50", format: "jpg") 
# password = "password"
# User.create!(
#       avatar: avatar,
#       name:  name,
#       email: email,
#       year: "5年",
#       bio: "hello!hello!hello!hello!",
#       password:              password,
#       password_confirmation: password,
#       activated: true,
#       activated_at: Time.zone.now)


#適当にrelationshipを作る。
# users = User.all
# user  = users.first
# following = users[2..50]
# followers = users[3..40]
# following.each { |followed| user.follow(followed) }
# followers.each { |follower| follower.follow(user) }

# endこのエンドは、必ずあとでコメントアウトする。

# 10.times do
#   content = Faker::Lorem.sentence(word_count: 1000)
#   tag = "移住"
#   users.each { |user| user.posts.create!(content: content) }
#   users.each { |user| user.posts.create!(tag: tag) }
# end