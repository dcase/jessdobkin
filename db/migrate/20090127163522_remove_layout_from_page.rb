class RemoveLayoutFromPage < ActiveRecord::Migration
  def self.up
    remove_column :pages, :layout_name
  end

  def self.down
    add_column :pages, :layout_name, :string
  end
end
