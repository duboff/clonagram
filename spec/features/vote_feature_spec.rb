require 'spec_helper'

describe 'Voting on a post' do

  before do
    create(:post1)
    visit '/posts'
  end

  it 'can upvote a post' do
    click_button '▲'
    expect(page).to have_css '.vote_count', text: '1'
  end

  it 'can downvote a post' do
    click_button '▼'
    expect(page).to have_css '.vote_count', text: '-1'
  end


end
