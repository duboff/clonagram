class VotesController < ApplicationController

  def create
    @post = Post.find params[:post_id]
    @vote = @post.votes.create direction: params[:direction]
    if @vote.save
      render json: { vote_count: @post.vote_count }
    end
  end
end
