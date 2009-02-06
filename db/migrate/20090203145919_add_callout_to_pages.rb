class AddCalloutToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :callout, :text
  end

  def self.down
    remove_column :pages, :callout
  end
end
