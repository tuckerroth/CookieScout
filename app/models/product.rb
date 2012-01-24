class Product < ActiveRecord::Base
  has_many :product_deliveries
  has_many :orders
  validates_presence_of :title, :price
end
