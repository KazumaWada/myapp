require 'rails_helper'

RSpec.feature "SignUps", type: :feature do
  include ActiveJob::TestHelper

   # ユーザーはサインアップに成功する
   scenario "user successfully signs up" do
    visit root_path
    click_link "新規登録"

    perform_enqueued_jobs do
      expect { 
        fill_in "user_name", with: "testname"
        fill_in "user_password", with: "test_password"
        fill_in "user_password_confirmation", with: "test_password"
        select "1年", from: "user_year"
        fill_in "user_bio", with: "hello"
        click_button "アカウント作成"
      }.to change(User, :count).by(0)
  end
end
end
