class EventsController < ApplicationController
	def index
		@events = Event.all
	end 

	def show
		@events = Event.all
		@event = Event.find(params[:id])
	end

	def new
		@event = Event.new
		@booths = Booth.all

	end 

	#creates a new event,initializes an array in boothlist column, and
	#puts every checked item from the :booth_ids checkboxes into the array intialized
	#in the Booth db table. 
	def create
		@event = Event.new(event_params)
		@booths = Booth.all
		@event.boothlist = []
			params[:booth_ids].each do |booth|
				@event.boothlist.push(booth)
			end
		if @event.save
			flash[:now]= "Event created!"
			redirect_to @event 	
		else
			render 'new'
		end
	end 	
	
	private
	#params to avoid cross side scripting loopholes
  	  def event_params
  	  	params.require(:event).permit(:date,:location,boothlist:[])
  	  end
end
