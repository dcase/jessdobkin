class DropPageLayouts < ActiveRecord::Migration
  def self.up
    drop_table :page_layouts
  end

  def self.down
    create_table :page_layouts do |t|
      t.string :name

      t.timestamps
    end
  end
end
