class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def show
		find_post
	end

	def new
		@post = Post.new
	end

	def create
	  @post = Post.new(post_params)
	  @post.save
	  redirect_to post_path(@post)
	end

	def update
	  find_post
	  @post.update(post_params)
	  redirect_to post_path(@post)
	end

	def edit
		find_post
	end

	private

	def find_post
		@post = Post.find_by_id(params[:id])
	end
	   
	def post_params
	params.require(:post).permit(:title, :description)
	end


end
