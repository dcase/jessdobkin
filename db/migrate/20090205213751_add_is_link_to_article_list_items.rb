class AddIsLinkToArticleListItems < ActiveRecord::Migration
  def self.up
    add_column :article_list_items, :is_link, :boolean
  end

  def self.down
    remove_column :article_list_items, :is_link
  end
end
