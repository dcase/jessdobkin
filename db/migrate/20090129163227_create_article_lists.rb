class CreateArticleLists < ActiveRecord::Migration
  def self.up
    create_table :article_lists do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :article_lists
  end
end
