require 'test_helper'

class OrderTest < ActiveSupport::TestCase

  test "Is invalid without count" do
    new_order = Order.new({:product => valid_order, :name => "Arthur", :count => nil})
    assert !new_order.valid?
  end

  test "Is invalid without name" do
    new_order = Order.new({:product => valid_order, :name => nil, :count => 3})
    assert !new_order.valid?
  end

  test "Is invalid without a product" do
    new_order = Order.new({:product => nil, :name => nil, :count => 6})
    assert !new_order.valid?
  end

  def valid_order
    Product.new({:title => "Thin Mints", :price => 3.5})
  end
end
