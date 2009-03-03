class AddPositionToMedias < ActiveRecord::Migration
  def self.up
    add_column :medias, :position, :integer
  end

  def self.down
    remove_column :medias, :position
  end
end
