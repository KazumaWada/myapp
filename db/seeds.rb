require 'faker'

name = Faker::Name.name
email = Faker::Internet.email

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

User.create!(name:  "main-user",
    email: "main@gmail.com",
    avatar: File.open(Rails.root.join('app', 'assets', 'images', 'faker-img-1.png')),
    year: "3年",
    bio: "hello!",
    password:              "password",
    password_confirmation: "password",
    admin: true,
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




 content = 'udin id Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus magna enim, 
    tempus tristique dignissim sit amet, iaculis in nibh. Vestibulum sed neque nibh. Morbi augue nunc, 
    interdum quis nunc sit amet, auctor dignissim neque. Nunc mi eros, vehicula molestie mollis in, 
    porta vitae nulla. Sed in lobortis arcu. Nullam ante purus, tincidunt sit amet eros ut, dignissim
     pellentesque lectus. Proin semper #転職 vestibulum lacus, quis hendrerit turpis venenatis in. Vivamus 
     vel porta augue. Integer quis ullamcorper ex. Nunc lacinia arcu et justo pretium, ut porttitor 
     neque feugiat. Maecenas facilisis consectetur metus sit amet imperdiet. Nullam vel felis dapibus, 
     accumsan purus sed,　#生活 pretium massa. Nullam condimentum augue eget lectus blandit, sit amet elementum 
     elit tincidunt. Aliquam ac tellus diam. Nullam dignissim tempus est, #街並み　non vulputate nisi egestas ultricies.
      efficitur sem sed sagittis convallis.'




User.fifth.posts.create!(
  title: Faker::Lorem.word,
  content: "#食べ物 " + content,
  covid: 'コロナ後',
  image: File.open(Rails.root.join('app', 'assets', 'images', 'post-img05.jpg')),#これもrandでいけるのでは？
  created_at: (rand*10).days.ago,
  impressions_count: (rand*80)
)
 
User.second.posts.create!(
  title: Faker::Lorem.word,
  content: "#仕事 " + content,
  covid: 'コロナ後',
  image: File.open(Rails.root.join('app', 'assets', 'images', 'post-img02.jpg')),#これもrandでいけるのでは？
  created_at: (rand*10).days.ago,
  impressions_count: (rand*80)
)
User.fourth.posts.create!(
  title: Faker::Lorem.word,
  content: "#ワーキングホリデー " + content,
  covid: 'コロナ後',
  image: File.open(Rails.root.join('app', 'assets', 'images', 'post-img04.jpg')),#これもrandでいけるのでは
  created_at: (rand*10).days.ago,
  impressions_count: (rand*80)
)
User.third.posts.create!(
  title: Faker::Lorem.word,
  content: "#観光 " + content,
  covid: 'コロナ後',
  image: File.open(Rails.root.join('app', 'assets', 'images', 'post-img03.jpg')),#これもrandでいけるのでは？
  created_at: (rand*10).days.ago,
  impressions_count: (rand*80)
)

User.first.posts.create!(
  title: Faker::Lorem.word,
  content: "#移住 " + content,
  covid: 'コロナ後',
  image: File.open(Rails.root.join('app', 'assets', 'images', 'post-img01.jpg')),#これもrandでいけるのでは？
  created_at: (rand*10).days.ago,
  impressions_count: (rand*80)
)


Comment.create([
  {
    content: "いい記事です。",
    user_id: 1,
    post_id: 4
  },
  {
    content: "役に立ちました！",
    user_id: 3,
    post_id: 2
  },
  {
    content: "共感できました！",
    user_id: 4,
    post_id: 1
  },
])



#unlikeしても、ハートの色が消えない。user.likes.createとかで
# 99.times do 
# Like.create(
#   user_id: rand(1..5), post_id: rand(1..5)
# )
# end




#適当にrelationshipを作る。
users = User.all
user  = users.first
following = users[0..4]
followers = users[1..3]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
