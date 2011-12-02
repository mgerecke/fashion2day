class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :email
      t.timestamp :last_visit
      t.boolean :admin , :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end