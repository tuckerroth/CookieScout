require 'test_helper'

class ProductDeliveryTest < ActiveSupport::TestCase
  test "Is invalid without count" do
    p_delivery = ProductDelivery.new({:product => valid_product, :count => nil})
    assert !p_delivery.valid?
  end

  test "Is invalid without a product" do
    p_delivery = ProductDelivery.new({:product => nil, :count => 6})
  end

  def valid_product
    Product.new({:title => "Thin Mints", :price => 3.5})
  end
end
