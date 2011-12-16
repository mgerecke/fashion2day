class CreateLettercontacts < ActiveRecord::Migration
  def self.up
    	create_table :lettercontacts do |t|
      	t.string :description, :null => false
      	t.timestamps
      end
  end

  def self.down
		drop_table :lettercontacts
  end
end