class Product < ActiveRecord::Base
  has_many :product_deliveries
  validates_presence_of :title, :price
end
