class CreateWorks < ActiveRecord::Migration
  def self.up
    create_table :works do |t|
      t.string :title
      t.string :venue
      t.datetime :date_start
      t.datetime :date_end
      t.boolean :is_ongoing
      t.text :description
      t.references :video
      t.references :work_thumbnail

      t.timestamps
    end
  end

  def self.down
    drop_table :works
  end
end
