class AddPositionToWorks < ActiveRecord::Migration
  def self.up
    add_column :works, :position, :integer
  end

  def self.down
    remove_column :works, :position
  end
end
