class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
	    t.string :firma
	    t.string :vorname
	    t.string :nachname
	    t.string :position
	    t.string :briefkontakt
	    t.string :strasse
	    t.string :hausnr
	    t.string :plz
	    t.string :ort
	    t.string :land
	    t.string :fon
	    t.string :fax
	    t.string :email, :unique => true
	    t.string :web
	    t.string :subcategory
	    t.string :user
		  t.timestamps
    end
  end

  def self.down
  	drop_table :addresses 
  end
end