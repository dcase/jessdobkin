class AddScrollHeightToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :scroll_height, :integer
  end

  def self.down
    remove_column :pages, :scroll_height
  end
end
