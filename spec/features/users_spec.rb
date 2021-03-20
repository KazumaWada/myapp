require 'rails_helper'
require 'capybara/rspec'

RSpec.feature "Users", type: :feature do

  describe "Signup page" do
    before do
      visit signup_path
    end
    #２つに分けて書いた方が、どこがエラーになったのかわかりやすい。
    #これは簡単なテストだから、そのままにするけど、次から2つに分けて書く。
    it "display Signup contents, title properly" do
      expect(page).to have_css('h1', text: 'ユーザー登録')
      expect(page).to have_title 'Signup ベルリンなう'
    end
  end
  
end