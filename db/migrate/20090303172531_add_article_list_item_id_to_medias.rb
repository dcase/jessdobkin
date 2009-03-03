class AddArticleListItemIdToMedias < ActiveRecord::Migration
  def self.up
    add_column :medias, :article_list_item_id, :integer
  end

  def self.down
    remove_column :medias, :article_list_item_id
  end
end
