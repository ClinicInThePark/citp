class EventsController < ApplicationController
	respond_to :html, :js
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
		if @event.save
			render 'index'
		end

	end 

	def edit
		@event = Event.find(params[:id])
		@booths = Booth.all
	end

	def update
		@event = Event.find(params[:id])
        @booths = Booth.all
        @event.update_attributes(event_params)
		@event.boothlist = []
			params[:booth_ids].each do |booth|
				@event.boothlist.push(booth)
			end
		if @event.save
			flash[:now]= "Event updated!"
			@events = Event.all
            redirect_to events_path
        else
            render 'edit'
        end
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
	
	def destroy
        Event.find(params[:id]).destroy
        flash[:success] = "Event deleted"
        redirect_to events_path
        
    end

	private
	#params to avoid cross side scripting loopholes
  	  def event_params
  	  	params.require(:event).permit(:date,:location,boothlist:[])
  	  end
end
