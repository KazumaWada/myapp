#テストで使い回す、ユーザーの定義
require 'rails_helper'
FactoryBot.define do
  # factory :user do
  #   name "Example"
  #   sequence(:email) { |n| "tester#{n}@example.com" }
  #   password "password"
  #   password_confirmation "password"
  #   year "1年"
  #   bio "hello!"
  # end
  factory :user do
    name {"main-user"}
    # sequence(:email) { |n| "tester#{n}@example.com" }
    email {"main@gmail.com"}
    password {"password"}
    password_confirmation {"password"}
    year {"1年"}
    bio {"hello!"}
    activated {true}
  end
end
