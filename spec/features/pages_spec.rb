require 'rails_helper'
require 'capybara/rspec'

RSpec.feature "Pages", type: :feature do

  #  describe 'Home page' do
  #   specify 'display Home contents,title properly' do
  #     visit root_path
  #     #紛らわしいけど、cssってついていても、h1要素がベルリンなうへようこそ!なのか探している。cssは出てこない。
  #     # have_css('h1', text: 'Help') で HTMLのh1要素の内容が Help かどうかを検証している
  #     expect(page).to have_css('h1', text: 'ベルリンなうへようこそ')
  #     expect(page).to have_title 'ベルリンなう'
  #   end
  # end

  # describe 'About page' do
  #   specify 'display About contents,title properly' do
  #     visit about_path
  #     expect(page).to have_css('h1', text: "このサイトを作った経緯")
  #     expect(page).to have_title 'About ベルリンなう'
  #   end
  # end

end


