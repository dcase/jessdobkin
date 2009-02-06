class AddToPresentToChronologyItems < ActiveRecord::Migration
  def self.up
    add_column :chronology_items, :to_present, :boolean
  end

  def self.down
    remove_column :chronology_items, :to_present
  end
end
