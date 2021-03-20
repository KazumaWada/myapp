require 'rails_helper'
require 'capybara/rspec'

RSpec.describe "User http prorerly", type: :request do
  let(:user) { FactoryBot.create(:user) }

  # new
  describe "GET #new" do
    # 正常なレスポンスを返すこと
    it "is returns http 200 success" do
      get signup_path
    #   expect(response).to be_success
      expect(response).to have_http_status "200"
    end
  end#new

  describe "GET #show" do

   #ログインしていないユーザー
   context "as a stranger try to edit" do
    it "is redirects to login_url" do
        get edit_user_path(user) 
        expect(response).to redirect_to login_path
    end
   end 
    # context "as logged_in user" do
  #   it "response successfully" do
  #     sign_in_as(user)
  #     get user_path(user)
  #     expect(response).to have_http_status "200"
  #   end
  # end
   end#show

  describe "#edit" do

    #妥当なユーザーかどうか。
    context "as an authorized user" do
      it "responds successully" do
        visit root_url
        click_link "ログイン"
        sign_in_as user
        # click_link "Login"
        find(".login-btn").click
        visit user_path(user)
        visit edit_user_path(user)
        expect(response).to have_http_status "200"
      end
     end

    #未ログインのユーザー
    context "as a stranger" do
      it "redirect to login_path" do
        get edit_user_path(user)
        expect(response).to have_http_status "302"
        expect(response).to redirect_to login_path
      end
    end

    #ログイン済みbut違うユーザー
    context "as other user (who already signin)" do
      it "is redirect to login_path" do
        sign_in_as other_user
        get edit_user_path(user)
        expect(response).to redirect_to login_path
      end
    end

  end#edit

  # describe "#update" do
  #   context "as an authorized user" do
  #     #ちゃんと更新できる。
  #     it "update a user" do
  #       # user_params = FactoryBot.attributes_for(:user, name: "UpdatedName")
  #       # patch user_path(user), params: {id: user.id, user: user_params }
  #       # expect(user.reload.name).to eq "UpdatedName"
  #       visit login_path
  #       sign_in_as user
  #       find(".login-btn").click
  #       visit user_path(user)
  #       find(".edit-btn").click
  #       expect {
  #         # fill_in_update_profile_form("New Name", "new@example.com")
  #         user_params = FactoryBot.attributes_for(:user, name: "New Name", email: "new@example.com", password: "password", password_confirmation: "password")
  #         # click_link "Save changes"
  #         click_on 'Save changes'
  #         # find(".save-changes-btn").click
  #       }.to change(User, :count).by(0)
  #       expect(user.reload.name).to eq "New Name"
  #       expect(user.reload.email).to eq "new@example.com"
  #       success_messages("Updateしました。")
  #     end
  #   end
  # end





   context "logout functions properly" do
    it "is only permit to logout when user login" do
      #まずログイン
      sign_in_as(user)
      # expect(response).to redirect_to root_url
      # expect(page).to have_content "ログインしました！"

      #ログアウトする
      delete logout_path
      expect(response).to redirect_to root_path
      expect(session[:user_id]).to eq nil

      #新しくwindowを開いて再びログアウト
      delete logout_path
      expect(response).to redirect_to root_path
      expect(session[:user_id]).to eq nil
    end
   end








end