require 'spec_helper'

describe 'Voting on a post' do

  # let!(:user) { create(:user1) }
  before { create(:post1) }

  describe 'upvoting' do
    before do
      clear_emails
      login_as create(:user2)
    end

    it 'score increases when post is upvoted', js: true do
      visit '/posts'
      page.find('.upvote').click
      expect(page).to have_css '.vote_count', text: '1'
    end
    it 'sends email when a post is upvoted', js: true do
      visit '/posts'
      page.find('.upvote').click
      open_emai('user1@example.com')
      expect(current_email).to have_content 'Your photo just got upvoted'
    end
  end
  describe 'upvoting' do

    it 'downvotes a post', js: true do
      visit '/posts'
      page.find('.downvote').click
      expect(page).to have_css '.vote_count', text: '-1'
    end
    it 'sends email when a post is upvoted', js: true do
      visit '/posts'
      page.find('.downvote').click
      open_emai('user1@example.com')
      expect(current_email).to have_content 'Your photo just got downvoted'
    end
  end




end
