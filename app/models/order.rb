class Order < ActiveRecord::Base
  belongs_to :product
  validates_presence_of :count, :name, :product

  def self.summary
    Product.joins(:orders).group("title").sum("count")
  end

  def self.total
    Product.joins(:orders).sum("count")
  end
end
