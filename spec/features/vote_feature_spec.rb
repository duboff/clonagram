require 'spec_helper'

describe 'Voting on a post' do

  # let!(:user) { create(:user1) }
  before do
    create(:post1)
    login_as create(:user2)
  end


  describe 'upvoting' do

    it 'score increases when post is upvoted', js: true do
      visit '/posts'
      page.find('.upvote').click
      expect(page).to have_css '.vote_count', text: '1'
    end
    it 'sends email when a post is upvoted', js: true do
      visit '/posts'
      page.find('.upvote').click
      open_email('user1@example.com')
      expect(current_email).to have_content 'Your photo just got upvoted'
    end
  end

  describe 'downvoting' do

    it 'downvotes a post', js: true do
      visit '/posts'
      page.find('.downvote').click
      expect(page).to have_css '.vote_count', text: '-1'
    end
    it 'sends email when a post is upvoted', js: true do
      visit '/posts'
      page.find('.downvote').click
      open_email('user1@example.com')
      expect(current_email).to have_content 'Your photo just got downvoted'
    end
  end




end
