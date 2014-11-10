class BoothsController < ApplicationController
	def index 
	end 

	def show 
	end 

	def new 
		@booth = Booth.new
	end 

	def create
		@booth = Booth.new(booth_params)
    	if @booth.save
	        #@user.posts.build(id: @user.id)  #initializes the health fields in the user profile
	        flash[:success] = "Organization added!"
	       	render 'index'
    	else
    		render 'new'
    	end
	end

	private
  	  def booth_params
  	  	params.require(:booth).permit(:name,:service,:description)
  	  end
end
