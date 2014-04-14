class PostsController < ApplicationController

	def new
		@post = Post.new
	end

	def create
		@post = Post.new params[:post].permit(:description, :picture)
		if @post.save
			redirect_to '/posts'
		else
			render 'new'
		end
	end

	def index
		@posts = Post.all
	end
	
end