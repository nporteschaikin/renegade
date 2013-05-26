class User < ActiveRecord::Base
  
	has_secure_password
  
	before_save { |user| user.email = email.downcase }
	before_save :create_remember_token
	
	has_many :rooms, dependent: :destroy
	has_many :items, dependent: :destroy
	
	validates :name, presence: true, length: { maximum: 50 }
	validates :username, presence: true, length: { minimum: 3, maximum: 20 }, uniqueness: { case_sensitive: false }
	validates :email, presence: true, email: true, uniqueness: { case_sensitive: false }
	validates :password, on: :create, presence: true, length: { minimum: 6 }
	validates :password_confirmation, on: :create, presence: true
    
	private
  
		def create_remember_token
			self.remember_token = SecureRandom.urlsafe_base64
		end
  
end
