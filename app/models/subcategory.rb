class Subcategory < ActiveRecord::Base
	belongs_to :categories
  validates :name, :presence => true
  validates :category_id , :presence => true
end