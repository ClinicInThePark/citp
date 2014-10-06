class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :BMI
      t.string :Health
      t.string :Safety
      t.string :Children

      t.timestamps
    end
  end
end
