class CreateSorts < ActiveRecord::Migration
  def self.up
    	create_table :sorts do |t|
      	t.string :anzeige, 	:null => false
      	t.string :intern, 	:null => false
      	t.timestamps
      end
  end

  def self.down
  	drop_table :sorts
  end
end