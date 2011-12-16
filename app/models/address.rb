class Address < ActiveRecord::Base
  attr_accessor :update_user
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_save :get_user

  #------ Validations -------------------------------------

  validates :firma, :presence => true
  validates :briefkontakt, :presence => true
	validates :position, :presence => true
	validates :strasse, :presence => true
  validates :plz, :presence => true
  validates :ort, :presence => true
  validates :land, :presence => true
	validates :fon, :presence => true
	validates :user, :presence => true, :on => [:create]
	validates :category, :presence => true
	validates :subcategory, :presence => true

	validates :email, :presence => true,
  					:format => { :with => email_regex },
            :uniqueness => { :case_sensitive => false },
            :on => [:create]

	validates :email, :presence => true,
  					:format => { :with => email_regex },
            :uniqueness => { :case_sensitive => false },
            :on => :update

	def self.search(search, spalte)
  	if search
      if spalte
      	case spalte
      		when "1" #email
      			find(:all, :conditions => ['email LIKE ?', "%#{search}%"])
      		when "2" #position
      			find(:all, :conditions => ['position LIKE ?', "%#{search}%"])
      		when "3" #name
      			find(:all, :conditions => ['nachname LIKE ?', "%#{search}%"])
      		when "4" #firma
      			find(:all, :conditions => ['firma LIKE ?', "%#{search}%"])
				end
      end
    else
  		find(:all, :order => :firma)
  	end
  end

  # bei updates den aktuellen User als User festhalten
  def get_user
  	self.user = update_user
  end

end