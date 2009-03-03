class RemoveArticleIdFromArticleListItems < ActiveRecord::Migration
  def self.up
    remove_column :article_list_items, :article_id
  end

  def self.down
    add_column :article_list_items, :article_id, :integer
  end
end
