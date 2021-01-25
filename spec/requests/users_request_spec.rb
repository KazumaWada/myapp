require 'rails_helper'

RSpec.describe "User http prorerly", type: :request do
  let(:user) { FactoryBot.create(:user) }

  # new
  describe "GET users#new" do
    # 正常なレスポンスを返すこと
    it "is returns http 200 success" do
      get signup_path
    #   expect(response).to be_success
      expect(response).to have_http_status "200"
    end
  end

  describe "Get users#show" do

   #ログインしていないユーザー
   context "as a stranger try to edit" do
    it "is redirects to login_url" do
        get edit_user_path(user) 
        expect(response).to redirect_to login_path
    end
   end

end

 describe "GET #new" do
  it "return http success" do
    get signup_path
    # expect(response).to be_success
    expect(response).to have_http_status "200"
  end#  return
 end#  get new

 describe "GET #show" do

  # context "as logged_in user" do
  #   it "response successfully" do
  #     sign_in_as(user)
  #     get user_path(user)
  #     expect(response).to have_http_status "200"
  #   end
  # end
  
 end#  get show



end