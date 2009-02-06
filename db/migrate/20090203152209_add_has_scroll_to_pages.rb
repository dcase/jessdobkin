class AddHasScrollToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :has_scroll, :boolean
  end

  def self.down
    remove_column :pages, :has_scroll
  end
end
