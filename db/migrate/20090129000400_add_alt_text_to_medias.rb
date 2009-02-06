class AddAltTextToMedias < ActiveRecord::Migration
  def self.up
    add_column :medias, :alt_text, :string
  end

  def self.down
    remove_column :medias, :alt_text
  end
end
