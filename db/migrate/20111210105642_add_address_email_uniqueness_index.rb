class AddAddressEmailUniquenessIndex < ActiveRecord::Migration
  def self.up
  	add_index :addresses, :email, :unique => true
		add_index :addresses, :firma
		add_index :addresses, :nachname
  end

  def self.down
  	remove_index :addresses, :email
	  remove_index :addresses, :firma
  	remove_index :addresses, :nachname
  end
end