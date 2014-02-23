class User < ActiveRecord::Base
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email ,presence: true, format: { with: VALID_EMAIL_REGEX}
	validates :name  ,presence: true, length: { maximum:50,minimum:4},
								    uniqueness: true
	has_secure_password
	validates :password, length: {minimum: 6 }
end

