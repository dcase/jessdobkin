class RemoveCreditFromMedias < ActiveRecord::Migration
  def self.up
    remove_column :medias, :credit
  end

  def self.down
    add_column :medias, :credit, :string
  end
end
