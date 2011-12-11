class AddAktivToUsers < ActiveRecord::Migration
	def self.up
    add_column :users, :aktiv, :boolean , :default => true
  end

  def self.down
    remove_column :users, :aktiv
  end

end