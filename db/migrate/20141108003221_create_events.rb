class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
    	t.integer :date
    	t.string :location
    	
    	t.timestamps
    end
  end
end
