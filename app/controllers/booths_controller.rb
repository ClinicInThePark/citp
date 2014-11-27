class BoothsController < ApplicationController
	def index 
		@booths = Booth.all
	end 

	def show 
	end 

	def new 
		@booth = Booth.new
	end 

	def create
		@booth = Booth.new(booth_params)
    	if @booth.save
	        flash[:success] = "Organization added!"
	       	redirect_to new_event_path
    	else
    		render 'new'
    	end
	end

	def edit
		@booth = Booth.find(params[:id])
	end

	private
  	  def booth_params
  	  	params.require(:booth).permit(:name,:service,:description)
  	  end
end
