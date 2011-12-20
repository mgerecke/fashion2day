class Category < ActiveRecord::Base
	has_many :subcategories
  has_many :addresses
  validates :name, :presence => true,
  								 :uniqueness => true

end