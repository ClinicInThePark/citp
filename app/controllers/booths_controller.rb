class BoothsController < ApplicationController
	def index 
		@booths = Booth.all
	end 

	def new 
		@booth = Booth.new
	end 

	def create
		@booth = Booth.new(booth_params)
    	if @booth.save
	        flash[:success] = "Organization added!"
	       	redirect_to new_booth_path
    	else
    		render 'new'
    	end
	end

	def edit
		@booth = Booth.find(params[:id])
	end

	def update
        @booth = Booth.find(params[:id])
        if @booth.update_attributes(booth_params)
            flash[:successful] = "Booth update successful"
            @booths = Booth.all
            render 'index'
        else
            render 'edit'
        end
    end

    def destroy
        Booth.find(params[:id]).destroy
        flash[:success] = "Booth deleted"
    end

#############################################
	private
  	  def booth_params
  	  	params.require(:booth).permit(:name,:service,:description)
  	  end
end
