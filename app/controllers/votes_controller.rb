class VotesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

  def create
    @post = Post.find params[:post_id]
    @vote = @post.votes.new direction: params[:direction]
    @vote.user = current_user
    if @vote.save
      WebsocketRails[:votes].trigger 'new', { id: @post.id, new_vote_count: @post.vote_count }
      render json: { vote_count: @post.vote_count }
    end
  end
end
