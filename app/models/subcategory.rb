class Subcategory < ActiveRecord::Base
	belongs_to :categories
  has_many :addresses

  before_destroy :check_addresses

  validates :name, 	:uniqueness => true,
  									:presence => true

  validates :category_id , :presence => true

  private

  #prüfen, ob subcategory in den adressen noch verwendet wird
  def check_addresses
  	self.addresses.find(:first, :select => 'id').nil?
  end

end