class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.belongs_to :event, index: true
      t.belongs_to :booth, index: true
      t.integer :booth_attendance
      t.timestamps null: false
    end
  end
end
