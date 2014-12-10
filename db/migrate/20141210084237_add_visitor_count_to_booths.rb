class AddVisitorCountToBooths < ActiveRecord::Migration
  def change
  	add_column :booths, :visitor_count , :integer, default: 0
  end
end
