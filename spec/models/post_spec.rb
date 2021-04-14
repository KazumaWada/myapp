require 'rails_helper'
require 'capybara/rspec'

RSpec.feature "Posts", type: :feature do
    let!(:user) { create(:user) }

    context 'Post is valid' do
        let!(:post) { build(:post, user: user) }
    
        it 'can saved' do
          expect(post).to be_valid
        end
      end

      context 'Post not valid without title' do
        let!(:post) { build(:post, title: '', user: user) }
    
        before do
          post.save
        end
    
        it 'can not save' do
            expect(post).to_not be_valid
        end
      end

      context 'Post failed when something is missing' do
        let!(:post) { build(:post, title: '', user: user) }

        it 'is invalid without a title' do
          post = Post.new()
          post.valid?
          expect(post.errors.messages[:title]).to include(I18n.t("activerecord.errors.models.post.attributes.title.blank"))
        end

        it 'is invalid without a content' do
          post = Post.new()
          post.valid?
          expect(post.errors.messages[:content]).to include(I18n.t("activerecord.errors.models.post.attributes.content.blank"))
        end

        it 'is invalid without a covid' do
          post = Post.new()
          post.valid?
          expect(post.errors.messages[:covid]).to include(I18n.t("activerecord.errors.models.post.attributes.covid.blank"))
        end

        it 'is invalid without a user_id' do
          post = Post.new()
          post.valid?
          expect(post.errors.messages[:user_id]).to include(I18n.t("activerecord.errors.models.post.attributes.user_id.blank"))
        end
      end

      describe 'when post is too long' do
          context 'is invalid whent the title are more than 30 characters' do
            it 'do something'
          end
          context 'is invalid when the content are more than 5000 characters' do
            it 'do something'
          end
       end
 
  
end