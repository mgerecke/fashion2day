require 'digest'
class User < ActiveRecord::Base

  attr_accessor :password
  attr_accessible :name, :email, :password, :password_confirmation,
  								:last_visit, :aktiv

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	# VALIDATIONS START =========================================

  validates :name, 	:presence => true,
  					:length => { :maximum => 50 }

	validates :email, :presence => true,
  					:format => { :with => email_regex },
            :uniqueness => { :case_sensitive => false },
            :on => :create

	validates :email, :presence => true,
  					:format => { :with => email_regex },
            :uniqueness => { :case_sensitive => false },
            :on => :update

  validates	:password, :confirmation => true,
  					:presence => true,
            :length => { :within => 6..25 },
            :on => :create

	validates	:password, :confirmation => true,
  					:presence => true,
            :length => { :within => 6..25 },
            :on => :update,
				    :unless => :skip_validation_on_update

	# VALIDATIONS END ===========================================

  before_save :encrypt_password

  def has_password?(submitted_password)
		encrypted_password = encrypt(submitted_password)
  end

  def self.authenticate(email, submitted_password)
  	user = find_by_email(email)
    return nil if user.nil?
    return user if user.has_password?(submitted_password)
  end

  private

  def encrypt_password
  	self.salt = make_salt if new_record?
  	self.encrypted_password = encrypt(password)
  end

  def encrypt(string)
		secure_hash("#{salt}--#{string}")
  end

  def make_salt
     secure_hash("#{Time.now.utc}--#{password}")
  end

  def secure_hash(string)
  	Digest::SHA2.hexdigest(string)
  end

  # nur wenn beim UPDATE ein neues Passwort vergeben wird,
  # soll die on=> :update - Validierung durchgeführt werden
  def skip_validation_on_update
  	if self.password.blank?
      return true
    end
    false
  end
end