class CreateVideos < ActiveRecord::Migration
  def self.up
    create_table :videos do |t|
      t.string :title
      t.datetime :date_filmed
      t.text :description
      t.string :credit
      t.integer :position
      t.references :video_file

      t.timestamps
    end
  end

  def self.down
    drop_table :videos
  end
end
