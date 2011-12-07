class Category < ActiveRecord::Base
	has_many :subcategories
  validates :name, :uniqueness => true

end