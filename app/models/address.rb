class Address < ActiveRecord::Base
	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i


  #------ Validations -------------------------------------
  validate 	:firma, :briefkontakt, :position, :strasse,
  					:hausnr, :plz, :ort,
            :land, :fon, :email, :presence => true

	validates :email, :presence => true,
  					:format => { :with => email_regex },
            :uniqueness => { :case_sensitive => false },
            :on => :create
            #:message => "Bitte Email pruefen"

	validates :email, :presence => true,
  					:format => { :with => email_regex },
            :uniqueness => { :case_sensitive => false },
            :on => :update
      			#:message => "Bitte Email pruefen"


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
end