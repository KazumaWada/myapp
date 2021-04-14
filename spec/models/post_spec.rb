require 'rails_helper'
require 'capybara/rspec'

RSpec.feature "Posts", type: :feature do
    let!(:user) { create(:user) }

    context 'when filled it up everything propely in post#new sections' do
        let!(:post) { build(:post, user: user) }
    
        it 'can saved' do
          expect(post).to be_valid
        end
      end

      context 'when it doesn`t filled up everything propely in post#new sections' do
        let!(:post) { build(:post, title: '', user: user) }
    
        before do
          post.save
        end
    
        it 'can not save' do
            expect(post).to_not be_valid
        end
      end

    #   context 'it doesn`t filled it up everything propely in post#new sections' do
    #     let!(:post) { build(:post, title: '', user: user) }
    
    #     before do
    #       post.save
    #     end
    
    #     it 'can not save' do
    #       expect(post.errors.messages[:title][0]).to eq('を入力してください。')
    #     end
    #   end

   

 
  
end