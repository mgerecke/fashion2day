class CreateCountries < ActiveRecord::Migration
  def self.up
  	create_table :countries do |t|
      t.string :code, :length => 2, 	:null => false
      t.string :engl, :length => 50, 	:null => false
      t.string :de, 	:length => 50, 	:null => false
      t.timestamps
    end
  end

  def self.down
	  drop_table :countries
  end
end