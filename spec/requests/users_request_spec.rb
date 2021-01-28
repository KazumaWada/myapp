require 'rails_helper'
require 'capybara/rspec'

RSpec.describe "User http prorerly", type: :request do
  let(:user) { FactoryBot.create(:user) }
  # let(:other_user) { FactoryBot.create(:user) }

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

  describe "#update" do
    context "as an authorized user" do


    end
  end#update

  describe '#destroy' do
    context "as an authorized user" do
      #削除できる
      it "deletes a user" do
        sign_in_as user
        expect{
          # delete user_path(user), params: { id: user.id }
          delete :destroy, params: { id: user.id }
        }.to change(User, :count).by(-1)
      end
    end

  end





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