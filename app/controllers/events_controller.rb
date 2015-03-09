class EventsController < ApplicationController
	helper_method :sort_column, :sort_direction
	
	def index
		if !signed_in_user
			@events = Event.order(sort_column+" "+sort_direction).paginate(:page => params[:page], :per_page=> 10)
		end
	end 

	def show
		if !signed_in_user
			@event = Event.find(params[:id])
			@attendance = @event.attendances.all
			respond_to do |format|
				format.html
				format.js
				format.csv {send_data @attendance.to_csv}
				format.xls
			end
		end
	
	end



	#creates a new event,initializes an array in boothlist column, and
	#puts every checked item from the :booth_ids checkboxes into the array intialized
	#in the Booth db table. 

	def new
		@event = Event.new
		@booths = Booth.all
		 
		
	end 

	
	def destroy
        Event.find(params[:id]).destroy
        flash[:success] = "Event deleted"
        @events = Event.all
        redirect_to events_path
    end

	private
	  #params to avoid cross side scripting loopholes
  	  def event_params
  	  	params.require(:event).permit(:date,:location,:boothlist)
  	  end
  	  
  	  def sort_column
  	  	#params[:sort] || "date"
  	  	Event.column_names.include?(params[:sort]) ? params[:sort] : "date"
  	  end
  	  
  	  def sort_direction
  	  	#params[:direction] || "asc"
  	  	%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  	  end
end

