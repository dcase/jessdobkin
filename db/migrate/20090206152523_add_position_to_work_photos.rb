class AddPositionToWorkPhotos < ActiveRecord::Migration
  def self.up
    add_column :work_photos, :position, :integer
  end

  def self.down
    remove_column :work_photos, :position
  end
end
