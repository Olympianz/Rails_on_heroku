class AddTitleColumnToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :title, :string
  end
end
