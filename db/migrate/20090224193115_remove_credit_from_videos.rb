class RemoveCreditFromVideos < ActiveRecord::Migration
  def self.up
    remove_column :videos, :credit
  end

  def self.down
    add_column :videos, :credit, :string
  end
end
