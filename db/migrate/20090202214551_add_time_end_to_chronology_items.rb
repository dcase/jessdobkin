class AddTimeEndToChronologyItems < ActiveRecord::Migration
  def self.up
    add_column :chronology_items, :time_end, :datetime
  end

  def self.down
    remove_column :chronology_items, :time_end
  end
end
