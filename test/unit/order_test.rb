require 'test_helper'

class OrderTest < ActiveSupport::TestCase

  setup do
    # Set up some products
    @product_thin_mints = Product.new({:title => "Thin Mints", :price => 3.5})
    @product_thin_mints.save

    @product_samoas = Product.new({:title => "Samoas", :price => 3.5})
    @product_samoas.save

    @product_dip_di_dos = Product.new({:title => "Dip-di-dos", :price => 3.5})
    @product_dip_di_dos.save

    @product_canibus_cookies = Product.new({:title => "Canibus-Cookies", :price => 3.5})
    @product_canibus_cookies.save

  end

  test "Is invalid without count" do
    new_order = Order.new({:product => valid_product, :name => "Arthur", :count => nil})
    assert !new_order.valid?
  end

  test "Is invalid without name" do
    new_order = Order.new({:product => valid_product, :name => nil, :count => 3})
    assert !new_order.valid?
  end

  test "Is invalid without a product" do
    new_order = Order.new({:product => nil, :name => nil, :count => 6})
    assert !new_order.valid?
  end

  test "Summary works" do
    jeff_order_1 = Order.new({:product => @product_canibus_cookies, :name => "Jeff Hyde", :count => 3})
    jeff_order_1.save
    jeff_order_2 = Order.new({:product => @product_dip_di_dos, :name => "Jeff Hyde", :count => 3})
    jeff_order_2.save

    tucker_order_1 = Order.new({:product => @product_samoas, :name => "Jeff Hyde", :count => 5})
    tucker_order_1.save

    cameron_order_1 = Order.new({:product => @product_thin_mints, :name => "Jeff Hyde", :count => 10})
    cameron_order_1.save

    cameron_order_2 = Order.new({:product => @product_dip_di_dos, :name => "Jeff Hyde", :count => 10})
    cameron_order_2.save

    summary = Order.summary
    assert summary.size == 4

    dip_di_dos_count =  summary["Dip-di-dos"]

    assert dip_di_dos_count.eql?("13")

  end

  test "No Orders In System" do
    summary = Order.summary

    assert summary.size == 0
  end

  test "valid order product total" do
    jeff_order_1 = Order.new({:product => @product_canibus_cookies, :name => "Jeff Hyde", :count => 3})
    jeff_order_1.save
    jeff_order_2 = Order.new({:product => @product_dip_di_dos, :name => "Jeff Hyde", :count => 3})
    jeff_order_2.save

    tucker_order_1 = Order.new({:product => @product_samoas, :name => "Jeff Hyde", :count => 5})
    tucker_order_1.save

    cameron_order_1 = Order.new({:product => @product_thin_mints, :name => "Jeff Hyde", :count => 10})
    cameron_order_1.save

    cameron_order_2 = Order.new({:product => @product_dip_di_dos, :name => "Jeff Hyde", :count => 10})
    cameron_order_2.save

    order_product_total = Order.total

    assert order_product_total.eql?("31")
  end

  def valid_product
    Product.new({:title => "Thin Mints", :price => 3.5})
  end
end
