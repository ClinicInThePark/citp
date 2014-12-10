class AddTotalVisitorsToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :total_count , :integer, default: 0
  end
end
