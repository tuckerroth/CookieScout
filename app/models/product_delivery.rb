class ProductDelivery < ActiveRecord::Base
  belongs_to :product
  validates_presence_of :count, :product

  def self.summary
    Product.joins(:product_deliveries).group("title").sum("count")
  end

  def self.total
    Product.joins(:product_deliveries).sum("count")
  end
end

