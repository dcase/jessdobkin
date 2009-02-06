class AddClassNameToMedia < ActiveRecord::Migration
  def self.up
    add_column :medias, :class_name, :string
  end

  def self.down
    remove_column :medias, :class_name
  end
end
