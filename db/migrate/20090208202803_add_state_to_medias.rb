class AddStateToMedias < ActiveRecord::Migration
  def self.up
    add_column :medias, :state, :string
  end

  def self.down
    remove_column :medias, :state
  end
end
