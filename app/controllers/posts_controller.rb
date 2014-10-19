class PostsController < ApplicationController
	#before_action :logged_in_user, only: [:edit]

	def show
	end

	def index
	end 

	def create
	end 
	
	def edit
		@post = Post.find(params[:id])
		
	end

	def update
		@post = Post.find(params[:id])
        if @post.update_attributes(post_params)
            flash[:successful] = "Profile update successful"
            redirect_to @post
        else
            render 'edit'
        end
	end	


	private 

		def post_params
			params.require(:post).permit(:bmi,:health)
		end
end
