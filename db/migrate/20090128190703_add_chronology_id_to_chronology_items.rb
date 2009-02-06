class AddChronologyIdToChronologyItems < ActiveRecord::Migration
  def self.up
    add_column :chronology_items, :chronology_id, :integer
  end

  def self.down
    remove_column :chronology_items, :chronology_id
  end
end
