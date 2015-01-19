class AttendancesController < ApplicationController
	def new 
		@event = Event.find_by(params[:format])
		
	end

	def create
		@event = Event.find_by(params[:format])
		params[:booth_ids].each do |b_id,b_attendance|
			@event.attendances.create(booth_id:b_id,booth_attendance:b_attendance)
		end
		render 'index'
	end

	def index
		@event = Event.find_by(params[:format])
		@attendance = @event.attendance.order(:booth_name)
		respond_to do |format|
			format.html
			format.csv {send_data @attendance.to_csv}
			format.xls {send_data @attendance.to_csv(col_sep: "\t")}
		end
	end
		
	end

	def import
		Attendance.import(params[:file])
		render 'index', notice: "File imported"
	end

end
