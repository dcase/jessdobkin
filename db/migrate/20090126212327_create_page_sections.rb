class CreatePageSections < ActiveRecord::Migration
  def self.up
    create_table :page_sections do |t|
      t.string :title
      t.integer :position
      t.boolean :has_scroll
      t.references :content, :polymorphic => true

      t.timestamps
    end
  end

  def self.down
    drop_table :page_sections
  end
end
