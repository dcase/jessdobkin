class AddQuoteListIdToQuotes < ActiveRecord::Migration
  def self.up
    add_column :quotes, :quote_list_id, :integer
  end

  def self.down
    remove_column :quotes, :quote_list_id
  end
end
