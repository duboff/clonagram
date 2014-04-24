class VotesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

  def create
    @post = Post.find params[:post_id]
    @vote = @post.votes.create direction: params[:direction]
    @vote.user = current_user
    if @vote.save
      render json: { vote_count: @post.vote_count }
    end
  end
end
