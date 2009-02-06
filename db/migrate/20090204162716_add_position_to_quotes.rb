class AddPositionToQuotes < ActiveRecord::Migration
  def self.up
    add_column :quotes, :position, :integer
  end

  def self.down
    remove_column :quotes, :position
  end
end
