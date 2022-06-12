class User < ApplicationRecord

	has_secure_password

	has_many :sessions
	has_many :posts, dependent: :destroy

	validates :first_name, presence: true
	validates :last_name, presence: true
	
end
