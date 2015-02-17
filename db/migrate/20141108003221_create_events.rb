class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
    	t.date :date
    	t.string :location
    	t.string :boothlist
    	
    	t.timestamps
    end
  end
end
