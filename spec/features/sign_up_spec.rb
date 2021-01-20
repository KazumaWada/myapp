require 'rails_helper'

RSpec.feature "SignUps", type: :feature do
  include ActiveJob::TestHelper

   # ユーザーはサインアップに成功する
   scenario "user successfully signs up" do
    visit root_path
    click_link "Signup"

    # click_link "login"
    # エラーここ。
    # https://hachimaki37.hatenablog.com/entry/2020/08/18/191325

    perform_enqueued_jobs do
      expect {
        # fill_in "Avatar",       　　　　　with: "the-main.jpg"
        fill_in "Name",         　　　　　with: "testman"
        fill_in "Email",        　　　　　with: "hahaha@example.com"
        fill_in "Password",     　　　　　with: "password"
        fill_in "Password確認",  　　　　　with: "password"
        fill_in "ベルリン滞在、渡航歴",  　　with: "1年"
        fill_in "あなたについて何か書こう",  with: "hello"
        click_button "アカウント作成"
      }.to change(User, :count).by(1)

      expect(page).to have_content "ベルリンなうへようこそ！さっそく右上のボタンからログインしよう！ →"
      expect(current_path).to eq root_path
    end

 
  end# user successfully signs up
  
end
