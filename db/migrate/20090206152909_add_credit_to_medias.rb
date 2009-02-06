class AddCreditToMedias < ActiveRecord::Migration
  def self.up
    add_column :medias, :credit, :string
  end

  def self.down
    remove_column :medias, :credit
  end
end
