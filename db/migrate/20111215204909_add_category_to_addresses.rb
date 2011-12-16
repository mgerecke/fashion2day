class AddCategoryToAddresses < ActiveRecord::Migration
  def self.up
    add_column :addresses, :category, :string
  end

  def self.down
    remove_column :addresses, :category
  end
end
