require 'bcrypt'

class User < ActiveRecord::Base
	include BCrypt
	has_secure_password
	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	validates :first_name, :last_name, :user_name, :password, :email, presence:true
	validates :email, uniqueness:{case_sensitive: false }, format:{with:EMAIL_REGEX}
	validates :password, length:{ minimum: 5}
	has_many :groups
	has_many :notes
	has_many :collections
	has_many :papers
	has_many :saves
	has_many :your_tags

end