class AddLayoutToSiteSections < ActiveRecord::Migration
  def self.up
    add_column :site_sections, :layout_name, :string
  end

  def self.down
    remove_column :site_sections, :layout_name
  end
end
