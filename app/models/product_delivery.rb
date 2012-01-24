class ProductDelivery < ActiveRecord::Base
  belongs_to :product
  validates_presence_of :count, :product
end

