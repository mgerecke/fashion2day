class CreateDblogs < ActiveRecord::Migration
  def self.up
		create_table :dblogs do |t|
			t.string :user,  :null => false
			t.string :function
    	t.string :data
			t.timestamps
    end
  end

  def self.down
	  drop_table :dblogs
  end
end