class CreateWorkPhotos < ActiveRecord::Migration
  def self.up
    create_table :work_photos do |t|
      t.references :work
      t.references :photo

      t.timestamps
    end
  end

  def self.down
    drop_table :work_photos
  end
end
