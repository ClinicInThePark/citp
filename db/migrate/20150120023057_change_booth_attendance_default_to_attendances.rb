class ChangeBoothAttendanceDefaultToAttendances < ActiveRecord::Migration
  def change
  	change_column :attendances, :booth_attendance, :integer, :default => 0
  end
end
