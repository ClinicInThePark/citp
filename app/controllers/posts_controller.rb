class PostsController < ApplicationController
	before_action :signed_in_user

	def create
		@post = Post.create(post_params)
	def edit
	end

	private

	def post_params
		params.require(:post).permit(:Health, :BMI)
end