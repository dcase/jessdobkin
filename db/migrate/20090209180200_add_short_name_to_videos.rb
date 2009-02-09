class AddShortNameToVideos < ActiveRecord::Migration
  def self.up
    add_column :videos, :short_name, :string
  end

  def self.down
    remove_column :videos, :short_name
  end
end
