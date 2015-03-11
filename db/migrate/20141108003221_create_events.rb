class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
    	t.date :date
    	t.string :location
    	t.text :boothlist, array: true, default: {}
    	
    	t.timestamps
    end
  end
end
