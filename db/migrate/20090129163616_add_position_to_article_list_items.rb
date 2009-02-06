class AddPositionToArticleListItems < ActiveRecord::Migration
  def self.up
    add_column :article_list_items, :position, :integer
  end

  def self.down
    remove_column :article_list_items, :position
  end
end
