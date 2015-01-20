class AttendancesController < ApplicationController
	def new 
		@event = Event.find_by(params[:format])
	end

	def create
		@event = Event.find_by(params[:id])
		params[:booth_ids].each do |b_id,b_attendance|
			@event.attendances.create(booth_id:b_id,booth_attendance:b_attendance)
		end
		flash[:success] = "Successfully added attendance"
		redirect_to events_path
	end

	def show 
		@event = Event.find_by(params[:id])
		@attendance = @event.attendances.all
		respond_to do |format|
			format.html 
			format.csv {send_data @attendance.to_csv}
			format.xls 
		end
	end
		
	
	def import
		Attendance.import(params[:file])
		render 'index', notice: "File imported"
	end

end
