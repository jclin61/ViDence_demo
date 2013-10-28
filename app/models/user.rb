class User < ActiveRecord::Base
	has_many :videos
	has_many :reviews
	has_many :comments, as: :association

	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	validates :username, presence: true, length: {in: 2..20}
	validates :first_name, presence: true, length: { in: 2..20 }
	validates :last_name, presence: true, length: { in: 2..20 }
	validates :email, presence: true, 
					  format: { with: EMAIL_REGEX },
					  uniqueness: { case_sensitive: false }
	validates :password, presence: true,
						 length: {in: 6..40}

	validates :location, presence: true

	before_save{ self.email.downcase! }
	
	has_secure_password
end
