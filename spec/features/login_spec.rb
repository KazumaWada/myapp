require 'rails_helper'

RSpec.feature "Login", type: :feature do
    let(:user) { FactoryBot.create(:user) }

    #ログイン,ログアウト成功
    scenario "user successfuly login and logout" do
        #ログイン
        valid_login(user)#valid_loginですでに/loginにいる。
        expect(current_path).to eq root_path
        expect(current_path).to_not eq login_path#failした時は、session/newに戻すから。
        #ログアウト
        visit root_path
        click_link "logout"
        expect(current_path).to eq root_path
        expect(page).to have_content "ログアウトしました！"
    end

    #ログインfail
    scenario "user failed to login" do
        visit root_path
        click_link "ログイン"
        fill_in "session_email", with: "you gonna fail to login"
        fill_in "session_password", with: "you gonna fails to login"
        click_button "Login"
        expect(current_path).to eq login_path#render newだから。
        expect(page).to have_content "ログイン情報が正しくありません。"        
    end

end
  