class Address < ActiveRecord::Base

  belongs_to :category
  belongs_to :subcategory

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
	#validates :user, :presence => true, :on => [:create]
	validates :category_id, :presence => true
	validates :subcategory_id, :presence => true

	validates :email, :presence => true,
  					:format => { :with => email_regex },
            :uniqueness => { :case_sensitive => false },
            :on => [:create]

	validates :email, :presence => true,
  					:format => { :with => email_regex },
            :uniqueness => { :case_sensitive => false },
            :on => :update

	def self.search(search, spalte, sort)
  	if search
      if spalte
      	case spalte
      		when "1" #email
      			find(:all, :conditions => ['email LIKE ?', "%#{search}%"], :order => sort )
      		when "2" #position
      			find(:all, :conditions => ['position LIKE ?', "%#{search}%"], :order => sort )
      		when "3" #name
      			find(:all, :conditions => ['nachname LIKE ?', "%#{search}%"], :order => sort )
      		when "4" #firma
      			find(:all, :conditions => ['firma LIKE ?', "%#{search}%"], :order => sort)
      		when "5" #subcategory
            find(:all, :conditions => ['subcategory_id in (select id from subcategories where name like ?)', "%#{search}%"] , :order => sort)
				end
      end
    else
  		find(:all, :order => 'firma')
  	end
  end

  # bei updates den aktuellen User als User festhalten
  def get_user
  	self.user = update_user
  end

end