class Product < ActiveRecord::Base
  belongs_to :user
  belongs_to :buyer, class_name: 'User'
  belongs_to :seller, class_name: 'User'
  validates :name, :amount, presence:true
end
