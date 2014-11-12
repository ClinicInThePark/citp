class EventsController < ApplicationController
	def index
	end 

	def show
		@events = Event.all
	end

	def new
		@event = Event.new
		@booths = Booth.all
	end 

	def create
		@event = Event.new(event_params)
		@booths = Booth.all
		if @event.save
			flash[:now]= "Event created!"
			redirect_to @event 	
		else
			render 'new'
		end
	end 	


#params to avoid cross side scripting loopholes
	private

  	  def event_params
  	  	params.require(:event).permit(:date,:location,:booths)
  	  end
end
