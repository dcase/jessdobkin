class CreateChronologyItems < ActiveRecord::Migration
  def self.up
    create_table :chronology_items do |t|
      t.text :output
      t.datetime :year
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :chronology_items
  end
end
