class EventsController < ApplicationController
	def index
	end 

	def show
	end

	def new
		@event = Event.new
		@booths = Booth.all
	end 

	def create

	end 	
end
