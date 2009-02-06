class CreateSiteSections < ActiveRecord::Migration
  def self.up
    create_table :site_sections do |t|
      t.string :name
      t.boolean :in_menu
      t.string :url
      t.string :controller
      t.string :action
      t.boolean :is_external
      t.references :site
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :site_sections
  end
end
