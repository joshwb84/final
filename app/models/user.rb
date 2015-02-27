class User < ActiveRecord::Base
has_secure_password

has_many :comments
has_many :rentals

validates :name, presence: true
validates :email, presence: true
validates :password, length: { minimum: 2 } 
end
