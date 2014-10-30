class AddDentalPhysicalToPosts < ActiveRecord::Migration
  def change
  	  add_column :posts,:dental, :string 
      add_column :posts,:physical, :string 
  end
end
