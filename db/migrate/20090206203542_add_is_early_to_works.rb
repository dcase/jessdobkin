class AddIsEarlyToWorks < ActiveRecord::Migration
  def self.up
    add_column :works, :is_early, :boolean
  end

  def self.down
    remove_column :works, :is_early
  end
end
