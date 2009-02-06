class AddScrollHeightToPageSections < ActiveRecord::Migration
  def self.up
    add_column :page_sections, :scroll_height, :integer
  end

  def self.down
    remove_column :page_sections, :scroll_height
  end
end
