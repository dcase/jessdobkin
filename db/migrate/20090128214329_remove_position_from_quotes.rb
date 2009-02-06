class RemovePositionFromQuotes < ActiveRecord::Migration
  def self.up
    remove_column :quotes, :position
  end

  def self.down
    add_column :quotes, :position, :integer
  end
end
