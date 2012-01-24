class Order < ActiveRecord::Base
  belongs_to :product
  validates_presence_of :count, :name, :product
end
