class CreateArticleListItems < ActiveRecord::Migration
  def self.up
    create_table :article_list_items do |t|
      t.text :output
      t.references :article

      t.timestamps
    end
  end

  def self.down
    drop_table :article_list_items
  end
end
