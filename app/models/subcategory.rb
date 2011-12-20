class Subcategory < ActiveRecord::Base
	belongs_to :categories
  has_many :addresses

	validates :name, 	:uniqueness => true,
  									:presence => true

  validates :category_id , :presence => true

end