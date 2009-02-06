class RemoveLayoutNameFromSiteSections < ActiveRecord::Migration
  def self.up
    remove_column :site_sections, :layout_name
  end

  def self.down
    add_column :site_sections, :layout_name, :string
  end
end
