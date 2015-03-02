class AttendancesController < ApplicationController
	def new 
		@event = Event.find_by(params[:format])
	end

	def create
		@event = Event.find(params[:format])
		params[:booth_ids].each do |b_id,b_attendance|
			@event.attendances.create(booth_id:b_id,booth_attendance:b_attendance,service:Booth.find_by(id:b_id).service)
		end
		flash[:success] = "Successfully added attendance"
		redirect_to @event
	end

	def show 
		@event = Event.find(params[:id])
		@attendance = @event.attendances.all
		respond_to do |format|
			format.html 
			format.csv {send_data @attendance.to_csv}
			format.xls
		end
	end
	
	def edit
		@booth = Booth.find(params[:id])
	end
	

		
end
