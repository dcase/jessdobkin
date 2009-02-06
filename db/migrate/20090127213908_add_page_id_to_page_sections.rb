class AddPageIdToPageSections < ActiveRecord::Migration
  def self.up
    add_column :page_sections, :page_id, :integer
  end

  def self.down
    remove_column :page_sections, :page_id
  end
end
