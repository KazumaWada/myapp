FactoryBot.define do
    factory :post do
      title      {'testTitle'}
      content    {"testContent"}
      covid      {'前'}
    #   image      File.open(Rails.root.join('app', 'assets', 'images', 'post-img02.jpg'))),
      tag        {'観光'}
  
      association :user 
    end
    # after(:build) do |post|
    #   post.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    # end
  end