class RenameYearToTimeStartInChronologies < ActiveRecord::Migration
  def self.up
    rename_column :chronology_items, :year, :time_start
  end

  def self.down
    rename_column :chronology_items, :time_start, :year
  end
end
