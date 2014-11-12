class AddBoothlistStringColumnToEvent < ActiveRecord::Migration
  def change
    add_column :events, :boothlist, :string
  end
end
