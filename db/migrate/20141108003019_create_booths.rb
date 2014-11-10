class CreateBooths < ActiveRecord::Migration
  def change
    create_table :booths do |t|
    	t.string :name
    	t.string :service
    	t.string :description 
    	
    	t.timestamps
    end
  end
end
