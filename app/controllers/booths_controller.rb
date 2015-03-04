class BoothsController < ApplicationController
    helper_method :sort_column, :sort_direction
    
	def index
	    if !signed_in_user
	    	@booths = Booth.order(sort_column+" "+sort_direction).paginate(:page => params[:page], :per_page=> 10)
	    end
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
    	    flash[:danger] ="Incorrect input"
    		render 'new'
    	end
	end

    def show
         if !signed_in_user
            @booth = Booth.find(params[:id])
            @attendance = @booth.attendances.paginate(:page => params[:page], :per_page => 10)
        end
    end


	def edit
		@booth = Booth.find(params[:id])
	end

	def update
        @booth = Booth.find(params[:id])
        if @booth.update_attributes(booth_params)
            flash[:success] = "Booth update successful"
            @booths = Booth.all
            redirect_to booth_path
        else
            render 'edit'
        end
    end

    def destroy
        Booth.find(params[:id]).destroy
        flash[:success] = "Organization deleted"
        redirect_to booths_path
    end

#############################################
	private
  	  def booth_params
  	  	params.require(:booth).permit(:name,:service,:description)
  	  end
  	  
  	  def sort_column
  	  	#params[:sort] || "date"
  	  	Booth.column_names.include?(params[:sort]) ? params[:sort] : "name"
  	  end
  	  
  	  def sort_direction
  	  	#params[:direction] || "asc"
  	  	%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  	  end
end
