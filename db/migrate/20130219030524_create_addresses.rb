class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
    
      t.integer :address_type_id 
      t.text :street
      t.string :city
      t.string :state, :limit => 2
      t.integer :zip
      t.references :entry

      t.timestamps
    end
    add_index :addresses, :entry_id
  end
  def self.down
     drop_table :addresses
  end
end
