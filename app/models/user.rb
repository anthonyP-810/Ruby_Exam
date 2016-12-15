class User < ActiveRecord::Base
  has_secure_password
  has_many :product
  validates :first_name, :last_name, :email, :password, presence:true
end
