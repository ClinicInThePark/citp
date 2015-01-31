class AddColumnServicesToAttendances < ActiveRecord::Migration
  def change
    add_column :attendances, :service , :string
  end
end
