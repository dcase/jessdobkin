class AddUrlToArticleListItems < ActiveRecord::Migration
  def self.up
    add_column :article_list_items, :url, :string
  end

  def self.down
    remove_column :article_list_items, :url
  end
end
