class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :name
      t.string :type
      t.references :entry
      t.references :address_type

      t.timestamps
    end
    add_index :urls, :entry_id
  end
end
