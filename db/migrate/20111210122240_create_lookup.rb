class CreateLookup < ActiveRecord::Migration
  def self.up
  	create_table :lookups do |t|
      t.string :thema, 		:null => false
      t.string :anzeige, 	:null => false
      t.string :intern, 	:null => false
      t.timestamps
    end
  end

  def self.down
	  drop_table :lookups
  end

end