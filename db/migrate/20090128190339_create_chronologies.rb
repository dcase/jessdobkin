class CreateChronologies < ActiveRecord::Migration
  def self.up
    create_table :chronologies do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :chronologies
  end
end
